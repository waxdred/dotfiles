#!/bin/bash

NAMESPACE=$(kubectl config view --minify -o 'jsonpath={..namespace}')
echo "${NAMESPACE}"
