#! /bin/sh

set -e

tweetsFile="lastTweets.html"

xsltproc ../extractTweets.xsl "$tweetsFile" > "tweets.xml"