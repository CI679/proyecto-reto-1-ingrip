#!/bin/bash

# Verificar el parámetro
if [ "$1" = "-a" ]; then
    METHODOLOGY="agil"
elif [ "$1" = "-t" ]; then
    METHODOLOGY="tradicional"
elif [ -z "$1" ]; then
    echo "Error: Debe proporcionar un parámetro: '-a' para metodologías ágiles o '-t' para metodologías tradicionales"
    echo "Uso: $0 [-a|-t]"
    exit 1
else
    echo "Error: Parámetro inválido. Use '-a' para metodologías ágiles o '-t' para metodologías tradicionales"
    echo "Uso: $0 [-a|-t]"
    exit 1
fi
