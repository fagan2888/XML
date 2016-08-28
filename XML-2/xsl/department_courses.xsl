<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0" xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:import href="common.xsl"/>
    <xsl:variable name="groupCount" select="count(distinct-values(//courses/course/course_group[../department/@code = $code]))" />
    <xsl:variable name="breadcrumbs">
        <div>
            <ul class="nav">
                <xsl:for-each-group select="//courses/course/course_group[../department/@code =$code]" group-by=".">
                    <xsl:sort select="."/>
                    <li class="nav"><a href="#{../course_group/@code}"><xsl:value-of select="." /> </a> 
                        <xsl:if test="position() !=last()">
                            | 
                        </xsl:if>
                    </li>
                </xsl:for-each-group>
            </ul>
        </div>    
    </xsl:variable>
    
    <xsl:template match="courses">
        <xsl:for-each-group select="course/department[@code eq $code]" group-by="../course_group">
            <xsl:sort select="../course_group"/>
            <xsl:choose>
                <xsl:when test="$groupCount &gt; 1">
                    <xsl:copy-of select="$breadcrumbs"/>
                </xsl:when>
             </xsl:choose>

            <h2 class="clearLeft">
                <a class="group" name="{../course_group/@code}">
                    <xsl:value-of select="current-grouping-key()"/>
                </a>
            </h2>
            
            <table>
                <tr><th>Number</th><th>Term</th><th>Title</th></tr>
                <xsl:apply-templates select="current-group()">
                    <xsl:sort select="num_int" data-type="number"/>
                    <xsl:sort select="num_char"/>
                    <xsl:sort select="title"/>
                </xsl:apply-templates>
            </table>
            
        </xsl:for-each-group>
    </xsl:template>
 
    <xsl:template match="course/department[@code eq $code]">
        <tr>
            <td>
                <a href="{$baselink}courses/{../@cat_num}.html">
                 <xsl:value-of select="../course_group"/><xsl:text> </xsl:text>
                 <xsl:value-of select="../course_number/num_int"/>
                 <xsl:value-of select="../course_number/num_char"/>
                </a>
            </td>
            <td><xsl:value-of select="../term"/></td>
            <td>
                <xsl:if test="../instructor_approval_required = 'Y' ">*</xsl:if>
                <xsl:if test="../@offered = 'N' "> [ </xsl:if><a href="{$baselink}courses/{../@cat_num}.html"><xsl:value-of select="../title"/></a> <xsl:if test="../@offered = 'N' "> ]</xsl:if>
            </td> 
        </tr>
    </xsl:template>
    
    <xsl:template name="topNav">
        <div id="breadcrumbs">
            <a href="{$baselink}">Departments</a><img src="../images/arrow.gif" alt="arrow"/> 
            <xsl:value-of select="distinct-values(//course/department[@code eq $code]/dept_short_name)"/> 
        </div>
    </xsl:template>

<xsl:template match="text()" />
    
</xsl:stylesheet>
