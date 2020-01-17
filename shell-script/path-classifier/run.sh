


if [[ $# < 1 ]] ; then
  echo "
    usage: $0 <path-to-check>
  "
  exit
fi

path_to_check=$1

if [[ ${path_to_check:0:1} = '/' ]] ; then
  echo "'${path_to_check}' is absolute path."
else
  echo "'${path_to_check}' is relative path."
fi
