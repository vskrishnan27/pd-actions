#!/bin/bash

# Check if the input file exists
input_file="../../input/domains.txt"
if [ ! -f "$input_file" ]; then
  echo "Input file '$input_file' not found."
  ./discordNotify.sh "input file not found on ::: $input_file"
  exit 1
fi

# Initialize a variable to store all the domains
all_domains=""

while IFS= read -r domain; do
  if [ -z "$domain" ]; then
    continue 
  fi

  all_domains="$all_domains$domain\n"
done < "$input_file"


./discordNotify.sh "$all_domains"
