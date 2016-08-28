<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns="http://www.w3.org/1999/xhtml">
   
    <xsl:attribute-set name="course">
        <xsl:attribute name="font-size">12pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="bold">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="italic">
        <xsl:attribute name="font-style">italic</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="dept_title">
        <xsl:attribute name="font-size">20pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute> 
        <xsl:attribute name="padding-top">.75em</xsl:attribute>
        <xsl:attribute name="padding-bottom">.25em</xsl:attribute>
        
    </xsl:attribute-set>
    <xsl:attribute-set name="group">
        <xsl:attribute name="font-size">16pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="padding-top">.75em</xsl:attribute>
        <xsl:attribute name="padding-bottom">.25em</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="padding-bottom">
        <xsl:attribute name="padding-bottom">.5em</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="extra-padding-bottom">
        <xsl:attribute name="padding-bottom">1em</xsl:attribute>
    </xsl:attribute-set>
</xsl:stylesheet>
