#!/bin/bash

# シンボリックリンクを張りなおす
pushd ./web
rm -rf ./root
ln -s ../fronend ./root
popd