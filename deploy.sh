#!/bin/sh

echo "\\033[0;32mDeploying updates to GitHub...\\033[0m"

# Push source and build repos.
git push origin master

# Go to Hugo Folder
cd DavskDotNet

# Build the project.
hugo -t hugo-tranquilpeak-theme

# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back
cd ../..