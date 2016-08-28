<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns="http://www.w3.org/1999/xhtml">

 <xsl:import href="../../../xsl/includes/common.xsl"/>

    <xsl:template match="faculty_list">
        <h3><strong>Faculty</strong></h3>
         
         <ul>
                <xsl:for-each-group select="//faculty" group-by="@id">
                    <xsl:sort select="./name/last"/>
                    <li >
                        <a href="search_results.html">
                            <xsl:value-of select="./name/last" /><xsl:text> , </xsl:text><xsl:value-of select="./name/first" />
                         </a> 
                            
                    </li>
                </xsl:for-each-group>

            </ul>
    </xsl:template>
    <xsl:apply-templates />
       <xsl:template match="text()" />
</xsl:stylesheet>