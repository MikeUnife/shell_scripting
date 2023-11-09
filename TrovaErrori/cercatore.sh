cd $1


count=0
for log in $(ls *.log 2> /dev/null)
do
    if test -f $log -a -r $log
    then
        errori=$(grep -c "error" $log)
        count=$(expr $count + $errori)
        grep "error" | cut -d ',' -f 1,2,6  >> $HOME/errori.txt
        grep "warning" | cut -d ',' -f 1,2,6  >> $HOME/warning.txt
    fi
done

if test $errori -gt $(cat /tmp/max_err.tmp)
then 
    echo $count > /tmp/max_err.tmp
    echo $(pwd) > /tmp/max_dir.tmp
fi

for d in *
do
    if test -f $d -a -x $de
    then 
        cercatore.sh $d
    fi
done


