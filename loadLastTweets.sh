#! /bin/sh

set -e

if [ ! $1 ]
then
	echo "Usage $0 accountName"
	exit
fi

accountName="$1"
url="https://twitter.com/$accountName"
lastTweetsFile="lastTweets.html"

echo loading $accountName at $url

cd "$accountName"

wget -nv "$url" -O "$accountName.html"

echo extracting ...

echo "<tweets>" > "$lastTweetsFile"
cat "$accountName.html" | ../pyxpath.py '//div[@class="Grid"]' >> "$lastTweetsFile"
echo "</tweets>" >> "$lastTweetsFile"

#cat "$lastTweetsFile" | hxnormalize -x -l 1024 > "norm.$lastTweetsFile"

../extractTweets.sh