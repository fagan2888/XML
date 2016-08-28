<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns="http://www.w3.org/1999/xhtml">

 
    <xsl:template match="departments">
        <div class="thumbnail">
            <div class="caption">
                <h6>Departments</h6>
                    <ul>
                        <xsl:for-each-group select="//department" group-by="@code">
                            <xsl:sort select="@code"/>
                            <li >
                                <a href="search_results.html">
                                    <xsl:value-of select="./dept_short_name" />
                                </a>    
                            </li>
                        </xsl:for-each-group>
                    </ul>
            </div>
        </div>
         <xsl:apply-templates />
       
    </xsl:template>

    <xsl:template match="text()" />
</xsl:stylesheet>