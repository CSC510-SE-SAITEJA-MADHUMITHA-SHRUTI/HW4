grep -rl "sample" dataset1/ | while read file; do

  # count of "CSC510"

  count=$(grep -o "CSC510" "$file" | wc -l)
  if [ "$count" -ge 3 ]; then

    # result of file and its count

    echo "$count $file"
  fi
done | sort -k1,1nr -k2,2 | while read count file; do

  # Sort by  count and by size

  filesize=$(stat -c%s "$file")

  echo "$count $filesize $file"
done | sort -k1,1nr -k2,2nr | while read count filesize file; do

  # Replace "file_" with "filtered_" 

  echo "$count $filesize $(echo "$file" | sed 's/file_/filtered_/')"
done