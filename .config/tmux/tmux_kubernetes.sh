#!/bin/bash
CLUSTER=$(kubectl config view --minify --output 'jsonpath={.contexts[0].context.cluster}')
NAMESPACE=$(kubectl config view --minify -o 'jsonpath={..namespace}')
echo "${CLUSTER}: ${NAMESPACE}"
