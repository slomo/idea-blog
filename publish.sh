#! /bin/sh

# get origin url
ORIGIN=$(git config --get remote.origin.url)

# remove old output folder
if [ -d output ]; then
    rm -rf output
    mkdir output
fi

# clone gh-pages
git clone -b gh-pages ${ORIGIN} output

# build
pelican content -s pelican.conf.py

# commit
cd output
git commit -a -m "published new version $(date)"
git push orign gh-pages
cd ..

