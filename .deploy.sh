#!/bin/bash

set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

cd ../dist

git init
git config user.name "Matt Brendzel"
git config user.email "matt.brendzel@generalassemb.ly"

git remote add upstream "https://$GH_TOKEN@github.com/ga-wdi/fundamentals.git"
git fetch upstream
git reset upstream/gh-pages

echo "kapploneon.github.io/Kapploneon-js-fundamentals" > CNAME

touch .

git add -A .
git commit -m "Rebuild fundamentals at ${rev}"
git push -q upstream HEAD:gh-pages
