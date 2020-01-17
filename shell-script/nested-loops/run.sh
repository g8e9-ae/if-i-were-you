


if [[ $# < 1 ]]; then
  echo "
    usage: $0 <number-of-creation>
  "
  exit 0
fi

approot=` cd $( dirname $BASH_SOURCE ) && pwd `
outputdir="${approot}/out"

if [[ ! -e $outputdir ]]; then
  mkdir $outputdir || exit 1
fi

cd $outputdir

for i in `seq 1 $1`
do
  eachdir="dir-$i"
  mkdir $eachdir

  for j in `seq 1 $i`
  do
    touch "./$eachdir/file-$j.txt"
  done
done
