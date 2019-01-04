#!/bin/bash

echo building
rm -rf build
mkdir -p build/TinyMeleeHelper
cp src/* build/TinyMeleeHelper
cd build/TinyMeleeHelper
cat TinyMeleeHelper.toc | grep lua | xargs cat > TinyMeleeHelper.lua
find *.lua ! -name 'TinyMeleeHelper.lua' -type f -exec rm -f {} +
sed --version > /dev/null 2>&1 && sed -i '/.*lua/d' TinyMeleeHelper.toc || sed -i '' '/.*lua/d' TinyMeleeHelper.toc
echo TinyMeleeHelper.lua >> TinyMeleeHelper.toc
cd ..
zip -r TinyMeleeHelper.zip TinyMeleeHelper
#cd .. && open build
echo done
