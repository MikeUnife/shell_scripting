#CONTROLLLO DEGLI ARGOMENTI
if test $# -ne 2
then
    echo "Utilizzo: cercaMessaggio <dir> <messaggio>"
    exit 1
fi

dir=$1
messaggio=$2

case $1 in
    /*) echo "La directory indicata deve essere una directory relativa"
       exit 2 ;;
    *) ;;
esac

if test ! -d $1
then
    echo "La directory indicata è inesistente"
    exit 3
fi

PATH=$PATH:$(pwd)
export PATH

> $(pwd)/$1/Trovati.txt
> $(pwd)/$1/Max.txt
0 > /tmp/counterMax.tmp

MAX=$(pwd)/$1/Trovati.txt
TROVATI=$(pwd)/$1/Max.txt
export MAX
export TROVATI  


sh explorerMessaggio.sh $1 $2

echo "I 5 file con più ricorrenze sono: $(sort -r -n $(pwd)/$1/Trovati.txt | head -n 5)"

rm /tmp/counterMax.tmp

