#!/bin/bash

mkdir -p organizador
mkdir -p organizador/textos
mkdir -p organizador/imagens
mkdir -p organizador/codigos
mkdir -p organizador/outros

movidos=0

for arquivo in *; do
    if [ "$arquivo" = "organizador" ] || [ "$arquivo" = "$(basename "$0")" ]; then
        continue
    fi 

    if [ -f "$arquivo" ]; then
        case "$arquivo" in
            *.txt|*.pdf)
                mv "$arquivo" organizador/textos/
                movidos=$((movidos+1))
                ;;
            *.jpg|*.png)
                mv "$arquivo" organizador/imagens/
                movidos=$((movidos+1))
                ;;
            *.c|*.sh)
                mv "$arquivo" organizador/codigos/
                movidos=$((movidos+1))
                ;;
            *)
                mv "$arquivo" organizador/outros/
                movidos=$((movidos+1))
                ;;
        esac
    fi
done

echo "Organização concluída com sucesso!"
echo "Total de arquivos movidos: $movidos"