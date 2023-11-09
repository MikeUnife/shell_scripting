#!/bin/sh
stringa=$1
dir=$2
num=$3

#Entro in dir
cd "$dir"
> /tmp/.counter.tmp

#echo $stringa

#controllo i file 
for i in $(ls *.txt 2>/dev/null)
do
    if test -f "$i" -a -r "$i" -a $(grep -c "$stringa" "$i") -ge $num
    then
        echo "$i" >> /tmp/.counter.tmp
        #echo "Scrivo dentro counter"
    fi
done

#controllo se le righe in counter sono maggiori
#di quelle in counter_max e aggiorno nome_dir
if test $(wc -l < /tmp/.counter.tmp) -gt $(wc -l < /tmp/.max_counter.tmp)
then 
    mv /tmp/.counter.tmp /tmp/.max_counter.tmp
    echo $(pwd) > /tmp/.nome_dir.tmp
fi

rm -f /tmp/.counter.tmp

#guardo nelle altre di
for directory in *
do
    if test -d "$directory" -a -x "$directory"
    then 
        #echo "Nuova dir"
        cercaStringa.sh "$stringa" "$directory" "$num"
    fi
done

