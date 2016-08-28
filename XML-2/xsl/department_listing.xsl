<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0" xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:import href="common.xsl"/>

    <xsl:template match="courses">
        <h3><strong>Departments</strong></h3>
        <ul>
        <xsl:for-each-group select="course/department" group-by="dept_short_name">
            <xsl:sort select="dept_short_name"/>
            <li>
                <a href="departments/{./@code}.html"><xsl:value-of select="current-grouping-key()"/></a>
            </li>
        </xsl:for-each-group>
        </ul>
    </xsl:template>
    

    <xsl:template match="text()" />
</xsl:stylesheet>
