#!/bin/bash
echo "Scrivi il nome del file/directory che stai cercando"
while true
do
    read a

    if test "$a" = fine
        then 
        echo /Terminazione del comando./
        exit 0
    elif test -f "$a"
        then echo ~File trovato
    elif test -d "$a"
        then echo ~Directory trovata
    else echo ~File/Directory inesistente in questa directory
    fi
done