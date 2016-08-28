<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns="http://www.w3.org/1999/xhtml">
   
    <xsl:param name="baselink"/>
    <xsl:param name="cat_num" />
    <xsl:param name="code" />
    <xsl:variable name="title" select="'Faculty of Arts &amp; Sciences'"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="$title"></xsl:value-of></title>
                <link rel="stylesheet" href="{$baselink}css/blueprint/screen.css" type="text/css" media="screen, projection" />
                <link rel="stylesheet" href="{$baselink}css/blueprint/print.css" type="text/css" media="print" />
                <xsl:comment>[if lt IE 8]&gt;&lt;link rel="stylesheet" href="{$baselink}css/blueprint/ie.css" type="text/css" media="screen, projection" /&gt;&lt;[endif]</xsl:comment>        
                <link type="text/css" rel="stylesheet" href="{$baselink}css/site.css"/>
            </head>
            
            <body>
                <div class="container">
                    <div id="header" class="span-24">
                        <!-- header -->
                        
                            <xsl:call-template name="header"/>
                        
                    </div>
                    <div id="subTiitle" class="span-24">
                        <h2>Course Catalog</h2>
                    </div>
                    
                    <div class="span-24">
                        <!-- primary -->
                        <div id="main">
                            
                            <xsl:call-template name="topNav"/>
                            
                            <xsl:apply-templates />
                        </div>
                    </div>
                    <div id="footer" class="span-24" >
                        <!-- footer -->
                        
                            <xsl:call-template name="footer"/>
                        
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template name="header">
        <a href="{$baselink}">
            <xsl:value-of select="$title"/>   </a> 
    </xsl:template>  
    
    <xsl:template name="footer">
      
            <p id="address">
              Harvard University |
              Faculty of Arts and Sciences | 
              Cambridge, MA 02138  | 
              (617)495-1000
            </p> 
            
            <p id="copy">
                Copyright © 2014 President and Fellows of Harvard College
            </p>
       
    </xsl:template>
    
   
 
</xsl:stylesheet>
