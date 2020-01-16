


app_dir=$( cd $( dirname $BASH_SOURCE ) && pwd )

if [[ $# < 1 ]]; then
  echo -e "\n\tusage: $0 <number-of-files>"
  exit 0
fi

output_dir=$app_dir/out
number_of_days=$1

if [[ ! -e $output_dir ]]; then
  mkdir  $output_dir || exit 1
fi

for i in `seq ${number_of_days}`; do
  date_string=`date -v+${i}d +'%Y%m%d'`
  touch $output_dir/$date_string.txt
done
