#!/bin/bash

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    echo "󰄙" 
else
    echo ""
fi

