package main

import (
	"encoding/json"
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
)

type PaneEnv struct {
	PaneID string            `json:"pane_id"`
	Vars   map[string]string `json:"vars"`
}

type EnvStore struct {
	Panes map[string]PaneEnv `json:"panes"`
}

const ENV_STORE_FILE = "/tmp/tmux_env_store.json"

func getCurrentPaneID() (string, error) {
	cmd := exec.Command("tmux", "display-message", "-p", "#{pane_id}")
	output, err := cmd.Output()
	if err != nil {
		return "", fmt.Errorf("impossible de récupérer le pane ID: %v", err)
	}
	return strings.TrimSpace(string(output)), nil
}

func loadEnvStore() (*EnvStore, error) {
	store := &EnvStore{
		Panes: make(map[string]PaneEnv),
	}

	if _, err := os.Stat(ENV_STORE_FILE); os.IsNotExist(err) {
		return store, nil
	}

	data, err := os.ReadFile(ENV_STORE_FILE)
	if err != nil {
		return store, nil
	}

	json.Unmarshal(data, store)
	return store, nil
}

func saveEnvStore(store *EnvStore) error {
	data, err := json.MarshalIndent(store, "", "  ")
	if err != nil {
		return err
	}
	return os.WriteFile(ENV_STORE_FILE, data, 0644)
}

func exportVar(key, value string) {
	paneID, err := getCurrentPaneID()
	if err != nil {
		fmt.Printf("Erreur: %v\n", err)
		return
	}

	// Charger le store existant
	store, err := loadEnvStore()
	if err != nil {
		fmt.Printf("Erreur lors du chargement: %v\n", err)
		return
	}

	// Initialiser le pane s'il n'existe pas
	paneEnv, exists := store.Panes[paneID]
	if !exists {
		paneEnv = PaneEnv{
			PaneID: paneID,
			Vars:   make(map[string]string),
		}
	}

	// Ajouter/modifier la variable
	paneEnv.Vars[key] = value
	store.Panes[paneID] = paneEnv

	// Sauvegarder
	if err := saveEnvStore(store); err != nil {
		fmt.Printf("Erreur lors de la sauvegarde: %v\n", err)
		return
	}

	// Exporter dans l'environnement actuel
	os.Setenv(key, value)
	fmt.Printf("export %s='%s'\n", key, value)
}

func listVars() {
	paneID, err := getCurrentPaneID()
	if err != nil {
		fmt.Printf("Erreur: %v\n", err)
		return
	}

	store, err := loadEnvStore()
	if err != nil {
		fmt.Printf("Erreur lors du chargement: %v\n", err)
		return
	}

	paneEnv, exists := store.Panes[paneID]
	if !exists || len(paneEnv.Vars) == 0 {
		fmt.Printf("Aucune variable exportée pour le pane %s\n", paneID)
		return
	}

	fmt.Printf("Variables exportées pour le pane %s:\n", paneID)
	for k, v := range paneEnv.Vars {
		fmt.Printf("  %s='%s'\n", k, v)
	}
}

func getVar(key string) {
	paneID, err := getCurrentPaneID()
	if err != nil {
		fmt.Printf("Erreur: %v\n", err)
		return
	}

	store, err := loadEnvStore()
	if err != nil {
		fmt.Printf("Erreur lors du chargement: %v\n", err)
		return
	}

	paneEnv, exists := store.Panes[paneID]
	if !exists {
		fmt.Printf("Variable %s non trouvée\n", key)
		return
	}

	value, exists := paneEnv.Vars[key]
	if !exists {
		fmt.Printf("Variable %s non trouvée\n", key)
		return
	}

	fmt.Printf("%s\n", value)
}

func showAllPanes() {
	store, err := loadEnvStore()
	if err != nil {
		fmt.Printf("Erreur lors du chargement: %v\n", err)
		return
	}

	if len(store.Panes) == 0 {
		fmt.Println("Aucun pane avec des variables exportées")
		return
	}

	fmt.Println("Toutes les variables par pane:")
	for paneID, paneEnv := range store.Panes {
		fmt.Printf("\nPane %s:\n", paneID)
		for k, v := range paneEnv.Vars {
			fmt.Printf("  %s='%s'\n", k, v)
		}
	}
}

func printUsage() {
	fmt.Printf("Usage:\n")
	fmt.Printf("  %s VAR=value          # Exporter une variable\n", filepath.Base(os.Args[0]))
	fmt.Printf("  %s -l                 # Lister les variables du pane actuel\n", filepath.Base(os.Args[0]))
	fmt.Printf("  %s -g VAR             # Récupérer une variable spécifique\n", filepath.Base(os.Args[0]))
	fmt.Printf("  %s -a                 # Afficher toutes les variables de tous les panes\n", filepath.Base(os.Args[0]))
	fmt.Printf("  %s -h                 # Afficher cette aide\n", filepath.Base(os.Args[0]))
}

func main() {
	if len(os.Args) < 2 {
		printUsage()
		return
	}

	switch os.Args[1] {
	case "-l", "--list":
		listVars()
	case "-g", "--get":
		if len(os.Args) < 3 {
			fmt.Println("Usage: -g VAR")
			return
		}
		getVar(os.Args[2])
	case "-a", "--all":
		showAllPanes()
	case "-h", "--help":
		printUsage()
	default:
		// Parser VAR=value
		arg := os.Args[1]
		if strings.Contains(arg, "=") {
			parts := strings.SplitN(arg, "=", 2)
			if len(parts) == 2 {
				exportVar(parts[0], parts[1])
			} else {
				fmt.Println("Format invalide. Utilisez VAR=value")
			}
		} else {
			fmt.Println("Format invalide. Utilisez VAR=value")
			printUsage()
		}
	}
}
