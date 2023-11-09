cd $1

for i in *
do
    if test -f $i -a -r $i
    then
        ricorrenze= grep -c $2 < $i
    fi
    if test $ricorrenze -gt 0
    then
        if $ricorrenze -gt $(cat /tmp/counterMax.tmp)
        then
            echo "$(pwd)/$i" > $MAX
        fi
        echo "$ricorrenze,$(pwd)/$i," >> $TROVATI
    fi
done

for d in *
do
    if test -d $d -a -x $d
        sh $0 $(pwd)/$d $2
    fi
done

