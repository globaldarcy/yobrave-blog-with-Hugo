#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

echo "after hugo"

# upload source
git add . && git commit -m "$msg" && git push

echo "go to public task"

# Go To Public folder
cd public
git pull
# Add changes to git.
git add .
git commit -m "$msg"

# Push source and build repos.
git push origin master
git push coding master -f


# Come Back up to the Project Root
cd ..