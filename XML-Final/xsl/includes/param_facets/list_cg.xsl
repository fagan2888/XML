<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns="http://www.w3.org/1999/xhtml">

 <xsl:import href="../../../xsl/includes/common.xsl"/>

    <xsl:template match="course_groups">
        <h3><strong>Course Groups</strong></h3>
         <xsl:apply-templates />
         <ul>
                <xsl:for-each-group select="//course_group" group-by="@code">
                    <xsl:sort select="."/>
                    <li >
                        <a href="search_results.html">

                            <xsl:value-of select="./@name" />

                         </a> 
                        
                    </li>
                </xsl:for-each-group>
            </ul>
    </xsl:template>
    
</xsl:stylesheet>