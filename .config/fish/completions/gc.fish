function __gc_flags
    echo -Ollama=
    echo -OllamaUrl=
    echo -answer=
    echo -max_length=
    echo -model=
    echo -port=
    echo -semantic=
    echo -stage
end

complete -c gc -e
complete -f -c gc
complete -c gc -a "(__gc_flags)" -d "GitSpeak command options"
