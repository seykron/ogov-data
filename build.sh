#!/bin/bash

for dir in "./"*; do
  if [ -d "$dir" ]; then
    dataType="${dir:2}"

    if [ "$dataType" != "cache" ]; then
      file=$dataType.tar.gz

      tar cfz $file $dataType
      sha=`sha1sum $file`
      size=`du -hcs $dataType | grep -v total`
      size_compressed=`du -h $file`
      count=`find $dataType -type f | wc -l`
      echo "$dataType:"
      echo
      echo "* SHA: ${sha%$file}"
      echo "* Items: ${count#$dataType}"
      echo "* Size (uncompressed): ${size%$dataType}"
      echo "* Size (compressed): ${size_compressed%$file}"
      echo
    fi
  fi
done
