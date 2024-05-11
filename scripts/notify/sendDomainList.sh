#!/bin/bash

# Check if the GITHUB_WORKSPACE variable is available
if [ -z "$GITHUB_WORKSPACE" ]; then
  echo "GITHUB_WORKSPACE is not set."
  exit 1
fi

# Set the input file path relative to the GITHUB_WORKSPACE
input_file="$GITHUB_WORKSPACE/input/domains.txt"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
  echo "Input file '$input_file' not found."
  "$GITHUB_WORKSPACE/scripts/notify/discordNotify.sh" "Input file not found on ::: $input_file"
  exit 1
fi

# Initialize a variable to store all the domains
all_domains="List of Domains : \n"

# Loop through each line in the input file
while IFS= read -r domain || [ -n "$domain" ]; do
  # Trim leading and trailing whitespace
  domain="${domain#"${domain%%[![:space:]]*}"}"
  domain="${domain%"${domain##*[![:space:]]}"}"

  if [ -z "$domain" ]; then
    continue
  fi

  all_domains="$all_domains$domain\n"
done < "$input_file"

# Call discordNotify.sh script with all_domains as an argument
# "$GITHUB_WORKSPACE/scripts/notify/discordNotify.sh" "$all_domains"
