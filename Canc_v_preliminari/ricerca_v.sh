cd "$1"
> /tmp/.counter.tmp

for i in *.txt
do 
    if test -f "$i" -a -w "$i"
    then
        if test $(head -n 1 "$i" | cut -f 3 -d ',' ) = preliminare
        then 
            echo "$(pwd/$i) è preliminare"
            echo "$i" >> /tmp/.counter.tmp
            rm -f "$i"
        else
            echo "$(pwd/$i) è definitivo"
        fi
    fi
done

if test $(wc -l /tmp/.counter.tmp) -gt $(wc -l /tmp/.max_counter.tmp)
then
    cp /tmp/.counter.tmp /tmp/.max_counter.tmp
    echo $(pwd) > /tmp/.max_dir.tmp
fi

rm -f /tmp/.counter.tmp

for i in *
do
    if test -d "$d" -a -x "$d"
    then 
        ricerca_v.sh $d
    fi
done

