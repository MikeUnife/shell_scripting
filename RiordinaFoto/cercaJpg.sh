shift
dir_sorgente=$0
dir_destinazione=$1

cd $dir_sorgente

for i in *.jpg
do
    if test -f $i -a -r $i
    then
            if test $i -e $dir_destinazione/$i
            then
            count=1
                #file: esistente lo sposto nella dir $dir_destinazione/duplicati
                while test -e "$dir_destinazione/duplicati/$i-$count"
                do
                    count=$(expr $count + 1)
                done
                mv $i "$dir_destinazione/duplicati/$i-$count"
            else
                mv $i $dir_destinazione/$i
                echo $dir_destinazione/$i >> /tmp/spostati
            fi
    fi
done

#ricorsione
for d in *
do
    if test -d $d
    then
        cercaJpg.sh $d $(pwd)/$dir_destinazione
    fi
done


        

    
    
        





