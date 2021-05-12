#!/bin/sh

## Config
cssPath=libs/github.css
filterPath=libs/diagram-generator.lua
plantumlPath="C:\\pandoc\\plantuml.jar"
javaPath="C:\\Program Files\\Java\\jre1.8.0_291\\bin\\java.exe"

## Arguments
srcArg=$1
dstArg=$2
inputDirPath=$(echo `dirname $0`)/$(echo $1 | perl -lpe 's/^(.+?\/)[^\/]+\.md$/$1/')
inputFileNameNoExt=$(echo $1 | perl -lpe 's/^.+?\/([^\/]+)\.md$/$1/')

if [ -z $srcArg ]; then
    cat <<'EOF'
Usage: ./ppml.sh <input-md-file-path> <output-html-file-path>'
Example:
    ./ppml.sh foo.md foo.html
    ./ppml.sh doc/foo.md
        In the above, output file to the doc/foo.html
EOF
    exit 1
fi

## Set output path
if [ -z $dstArg ]; then
    outputFilePath=$inputDirPath$inputFileNameNoExt".html"
else
    outputFilePath=$dstArg
fi

## Delete old file
rm -f $outputFilePath

## Put new file
pandoc $srcArg -t HTML5 --self-contained -s -c $cssPath -H libs/img-to-svg.js --lua-filter=$filterPath --metadata=plantumlPath:"$plantumlPath" --metadata=javaPath:"$javaPath" -o $outputFilePath
