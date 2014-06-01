<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:date="http://exslt.org/dates-and-times"
    extension-element-prefixes="date">
 
    <xsl:import href=".date/date.xsl" />

    <xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="yes" />

    <xsl:template match="/">
        <xsl:apply-templates select="//div[@class='Grid']"></xsl:apply-templates>
    </xsl:template>

    <xsl:template match="div[@class='Grid']">
        <xsl:variable name="profile" select=".//div[contains(@class, 'ProfileTweet')]" />
        <xsl:variable name="authorDetails" select=".//div[@class='ProfileTweet-authorDetails']" />
        <xsl:variable name="context" select=".//div[contains(@class, 'ProfileTweet-context')]" />
        <xsl:variable name="content" select=".//div[contains(@class, 'ProfileTweet-contents')]" />

<tweet>
    <id><xsl:value-of select="$profile/@data-tweet-id" /></id>
    <pinned><xsl:if test="contains($context/@class, 'ProfileTweet-context--pinned')">pinned</xsl:if></pinned>
    <fullName><xsl:value-of select="$authorDetails//b" /></fullName>
    <screenName><xsl:value-of select="translate(normalize-space($authorDetails//span[contains(@class, 'ProfileTweet-screenname')]/text()[2]), ' ', '')" /></screenName>
    <downloadDate><xsl:value-of select="date:date-time()" /></downloadDate>
    <timestamp><xsl:value-of select="$authorDetails//a[contains(@class, 'ProfileTweet-timestamp')]/span/@data-time" /></timestamp>
    <date><xsl:value-of select="$authorDetails//a[contains(@class, 'ProfileTweet-timestamp')]/@title" />
    </date>
    <profilePictureURL><xsl:value-of select="$authorDetails//img[contains(@class, 'ProfileTweet-avatar')]/@src" /></profilePictureURL>
    <retweet>
        <fullName><xsl:value-of select="$context//span[contains(@class, 'js-retweet-text')]/a/text()" /></fullName>
        <screenName><xsl:value-of select="substring-after($context//span[contains(@class, 'js-retweet-text')]/a/@href, '/')" /></screenName>
    </retweet>
    <content><xsl:value-of select="$content/p[contains(@class, 'ProfileTweet-text')]" /></content>
</tweet>
<xsl:text>
</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>
