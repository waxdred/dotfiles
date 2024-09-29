function k8s_namespace
  set -l namespace $argv[1]
  if test -z $namespace
    kubectl config set-context --current --namespace=default
    echo "Namespace set to default"
    return 1
  end

  kubectl config set-context --current --namespace=$namespace
  if test $status -eq 0
    echo "Namespace set to $namespace"
  else
    echo "Failed to set namespace to $namespace"
  end
end

function k8s_cluster 
  set -l cluster $argv[1]
  kubectl config use-context $cluster
  if test $status -eq 0
    echo "Switch to $cluster"
  else
    echo "Failed to set context to $cluster"
  end
end
