#!/bin/bash

SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname "$SCRIPT")
cd $BASEDIR

if [ ! -d CodeCraft-2019 ]
then
    echo "ERROR: $BASEDIR is not a valid directory of SDK_C++ for CodeCraft-2019."
    echo "  Please run this script in a regular directory of SDK_C++."
    exit -1
fi
cmake --version 2>&1
tmp=$?
if [ ${tmp} -ne 0 ]
then
    echo "ERROR: You should install cmake(2.8 or later) first."
    echo "  Please goto https://cmake.org to download and install it."
    exit
fi

rm -fr bin
mkdir bin
rm -fr build
mkdir build
cd build

cmake ../CodeCraft-2019
tmp=$?
echo "cmake return:" ${tmp}
if [ ${tmp} -ne 0 ]
then
 echo "cmake <>return:" ${tmp}
 exit -1
fi

make
tmp=$?
 echo "make return:" ${tmp}
if [ ${tmp} -ne 0 ]
then
echo "make <>return:" ${tmp}
 exit -1
fi

cd ../
cd bin

map_index=2

./CodeCraft-2019 ../map/3-map-exam-${map_index}/car.txt ../map/3-map-exam-${map_index}/road.txt ../map/3-map-exam-${map_index}/cross.txt ../map/3-map-exam-${map_index}/presetAnswer.txt ../map/3-map-exam-${map_index}/answer.txt

echo  "exam_map" ${map_index} "done"