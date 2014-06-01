#! /bin/sh

set -e

#find . -type 'd' | grep '^./' | cut -d '/' -f 2- | xargs echo

outputFile="tweets.xml"
echo '<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="tweets.xsl"?>' > "$outputFile"
echo "<tweets>" >> "$outputFile"
cat */tweets.xml >> "$outputFile"
echo "</tweets>" >> "$outputFile"