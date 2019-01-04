#!/bin/bash

rm -rf build &&
mkdir -p build/TinyMeleeHelper &&
cp src/* build/TinyMeleeHelper &&
cd build &&
zip -r TinyMeleeHelper.zip TinyMeleeHelper &&
cd .. &&
open build &&
echo done
