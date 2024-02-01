#!/bin/bash

# File names
file_with_many_domains="$GITHUB_WORKSPACE/input/nextDomain.txt"
file_with_single_domain="$GITHUB_WORKSPACE/input/domains.txt"
# file_with_many_domains="../input/nextDomain.txt"
# file_with_single_domain="../input/domains.txt"

# Read the first domain from many domains file and trim it
first_domain=$(head -n 1 $file_with_many_domains | xargs)

# Update single domain file
echo $first_domain > $file_with_single_domain
echo "Updated single_domain.txt with: $first_domain"

# Read the last domain from single domain file and trim it
last_domain=$(tail -n 1 $file_with_single_domain | xargs)

# Append the old last single domain to the end of many domains file
echo $last_domain >> $file_with_many_domains
echo "Appended $last_domain to $file_with_many_domains"

# Remove the first domain from many domains file
tail -n +2 $file_with_many_domains > temp_file && mv temp_file $file_with_many_domains

# Debugging: Count the number of lines
echo "The number of lines in $file_with_many_domains is: $(wc -l < "$file_with_many_domains")"
