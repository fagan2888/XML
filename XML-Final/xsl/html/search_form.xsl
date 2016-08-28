<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:import href="../../xsl/includes/common.xsl"/>

    <xsl:template match="courses">
    	<div class="row" id="logo">
            <div class="logo hidden-sm hidden-xs"><xsl:text> </xsl:text></div>
            <div class="logo_text hidden-lg hidden-md">
                <h2>Harvard University Course Catalog</h2>
            </div>
        </div>
        <div class="row" id="two_col_row">
            <p>Welcome to Harvard University's Faculty of Arts &amp; Sciences Course Catalog. This searchable catalog lists over 5,000 courses offered at Harvard University from over 100 departments and includes course descriptions, faculty and meeting times, and prerequisites.</p>
                        
            <p>We invite you to explore the full breadth and depth of Harvard's academic offerings, searching by calendar period, department, faculty, and keyword.
            </p>

            <form id="searchForm" name="searchForm" action="search_results.html" method="GET">
                <p>
                    <input type="hidden" name="dept" id="dept" 
                        value="{$dept}"/>
                    <input type="hidden" name="day" id="day" value="{$day}" />
                    <input type="hidden" name="course_group" id="course_group" value="{$course_group}" />
                    <input type="hidden" name="faculty" id="faculty" value="{$faculty}" />
                    <input type="hidden" name="term_patt" id="term_patt" value= "{$term_patt}" />

                    <input type="text" name="keyword" id="keyword"  />
                    <xsl:text> </xsl:text><xsl:text> </xsl:text>
                    <input type="submit" name="submitBtn" id="submitBtn" value="Search" />
                </p>          
           	</form>
       </div>
    </xsl:template>
    <xsl:template match="text()" />
</xsl:stylesheet>