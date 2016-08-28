<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:param name="description" select="'false'" />
    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="/xbel/title"/></title>
                <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
                <style type="text/css">
                    body {
                    font-family: Calibri, Candara, Segoe, "Segoe UI", Optima, Arial, sans-serif;
                    line-height:1.5em;
                    }
                    h1 {
                    text-align:center;
                    }
                   
                    .folder {
                    font-weight:bold;
                    font-size: 1.25em;
                    }
                    .desc {
                    list-style-type:none; 
                    padding-left:.75em;
                    }
                   
                </style>
            </head>
            <body>
                <h1><xsl:value-of select="/xbel/title"/></h1> 
                <xsl:apply-templates select="/xbel/folder" />
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="folder">
        <ul>
            <li><span class="folder"><xsl:value-of select="title"/></span>
            <xsl:for-each select="folder">
                <ul>
                    <li><span class="folder"><xsl:value-of select="title"/></span></li>
                    <li class="desc"><xsl:apply-templates select="bookmark" /></li>
                </ul>
            </xsl:for-each>
                    <xsl:apply-templates select="bookmark" />
            </li>
        </ul>         
    </xsl:template>
  
    <xsl:template match="bookmark">
        <ul>
            <li>
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="@href" />
                    </xsl:attribute>
                    <xsl:value-of select="title"/>
                </a>
                <xsl:if test="$description eq 'true'">
                    <ul class="desc"><li ><xsl:value-of select="desc"/></li></ul>
                </xsl:if>
            </li>
        </ul>
    </xsl:template>
 <xsl:template match="text()"/>
</xsl:stylesheet>