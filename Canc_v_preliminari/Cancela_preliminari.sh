#!/bin/sh

#CONTROLLO ARGOMENTI

if $# -ne 1
then
    echo "Utilizzo: cancella_versioni_preliminari <dir_articoli>"
    exit 1
fi

case "$1" in
    /*) echo "Il percorso non è relativo"
        exit 2 ;;
    *) ;;
esac

if test ! -f "$1" -o -x "$1"
then 
    echo "Errore: "$1" non è una directory o non ho i diritti di accesso"
    exit 3
fi

PATH=$PATH:$(pwd)
export PATH

> /tmp/.max_counter.tmp
> /tmp/.max_dir.tmp

ricerca_v.sh "$(pwd)"/"$1"

echo "La directory con il maggior numero di file cancellati e' $(cat /tmp/.max_dir.tmp) con $(wc -l < /tmp/.max_counter.tmp) file cancellati"

rm -f /tmp/.max_counter.tmp
rm -f /tmp/.max_dir.tmp
