#!/bin/sh

TARGET_DIR=$1
echo "TARGET_DIR:" $TARGET_DIR

# Exit if target dir does not exist
{
if [ ! -d $TARGET_DIR ]; then
    echo "Target dir not found!"
        exit 0
    fi
}

files=`find $TARGET_DIR -name "*.py" `

#echo $files

echo "Replacing debug"
sed -i 's/logging\.debug/logging\.getLogger(__name__).debug/g' $files
echo "Replacing info"
sed -i 's/logging\.info/logging\.getLogger(__name__).info/g' $files
echo "Replacing warn"
sed -i 's/logging\.warn/logging\.getLogger(__name__).warn/g' $files
echo "Replacing error"
sed -i 's/logging\.error/logging\.getLogger(__name__).error/g' $files
echo "Replacing critical"
sed -i 's/logging\.critical/logging\.getLogger(__name__).critical/g' $files
echo "Replacing exception"
sed -i 's/logging\.exception/logging\.getLogger(__name__).exception/g' $files
