num=$1
dirSorgente=$2
dirDestinazione=$3

shift
shift
shift


cd $dirSorgente

for ext in $*
do
    for file in *$ext "$(ls *$ext 2>/dev/null)"
    do
        if test -f "$file" -a -r "$file" -a $(wc -l < "$file") -gt $num
        then
            echo "$file" >> /tmp/.counter.tmp
            cp $file "$dirDestinazione/$file"
        fi
    done
done
 for dir in *
 do 
    if test -d "$dir" -a -x "$dir"
        then
            ricerca.sh $num $dir $dirDestinazione $*
        fi
done