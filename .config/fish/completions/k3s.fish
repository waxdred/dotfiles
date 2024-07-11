set -l namespaces (kubectl get namespaces -o jsonpath='{.items[*].metadata.name}' 2>/dev/null)

complete -c k8s_namespace -e
complete -f -c k8s_namespace
complete -f -c k8s_namespace -a "$namespaces"
