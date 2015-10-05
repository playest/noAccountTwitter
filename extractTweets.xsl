<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:date="http://exslt.org/dates-and-times"
    extension-element-prefixes="date">
 
    <xsl:import href=".date/date.xsl" />

    <xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="yes" />

    <xsl:template match="/">
        <xsl:apply-templates select="tweets/li[@data-item-type='tweet']"></xsl:apply-templates>
    </xsl:template>

    <xsl:template match="li[@data-item-type='tweet']">
        <xsl:variable name="profile" select=".//div[contains(@class, 'ProfileTweet')]" />
        <xsl:variable name="authorDetails" select=".//div[@class='username']" />
        <xsl:variable name="context" select=".//div[contains(@class, 'tweet-context')]" />
        <xsl:variable name="content" select=".//p[contains(@class, 'tweet-text')]" />

<tweet>
    <id><xsl:value-of select="@data-item-id" /></id>
    <pinned><xsl:if test=".//div[@class='context']/div[contains(@class, 'pinned')]">pinned</xsl:if></pinned>
    <fullName><xsl:value-of select=".//div[@class='content']//span[contains(@class, 'username')]/b/text()" /></fullName>
    <screenName><xsl:value-of select=".//div[@class='content']//strong[contains(@class, 'fullname')]/text()" /></screenName>
    <downloadDate><xsl:value-of select="date:date-time()" /></downloadDate>
    <timestamp><xsl:value-of select=".//div[@class='content']//span[contains(@class, '_timestamp')]/@data-time" /></timestamp>
    <date><xsl:value-of select=".//div[@class='content']//span[contains(@class, '_timestamp')]/text()" />
    </date>
    <profilePictureURL><xsl:value-of select=".//div[@class='content']//img[contains(@class, 'avatar')]/@src" /></profilePictureURL>
    <retweet>
        <fullName><xsl:value-of select="$context//span[contains(@class, 'js-retweet-text')]/a/b/text()" /></fullName>
        <screenName><xsl:value-of select="substring-after($context//span[contains(@class, 'js-retweet-text')]/a/@href, '/')" /></screenName>
    </retweet>
    <content><xsl:value-of select=".//div[@class='content']//p[contains(@class, 'tweet-text')]" /></content>
</tweet>
<xsl:text>
</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>
