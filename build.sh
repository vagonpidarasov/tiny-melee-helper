#!/bin/bash

rm -rf build &&
mkdir -p build/TinyMeleeHelper &&
cp src/* build/TinyMeleeHelper &&
cd build/TinyMeleeHelper &&
cat TinyMeleeHelper.toc | grep lua | xargs cat > tmh.lua &&
find *.lua ! -name 'tmh.lua' -type f -exec rm -f {} +
sed -i '' '/.*lua/d' TinyMeleeHelper.toc
echo tmh.lua >> TinyMeleeHelper.toc
cd ..
zip -r TinyMeleeHelper.zip TinyMeleeHelper &&
cd .. &&
open build &&
echo done
