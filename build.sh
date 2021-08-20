#!/bin/sh

git clone https://github.com/keyspot/keyspot.git

rm -rf keyspot_*

cd keyspot

./bin/build.py $1

mv build/dist/keyspot_windows* ../

cd ../
rm -rf keyspot/