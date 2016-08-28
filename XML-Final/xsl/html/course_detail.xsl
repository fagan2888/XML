<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:import href="../../xsl/includes/common.xsl"/>

    <xsl:template match="courses">
    	<div class="logo hidden-sm hidden-xs"><xsl:text> </xsl:text></div>
    	<div class="logo_text hidden-lg hidden-md">
    		<h2>Harvard University Course Catalog</h2>
    	</div>

    	<div class="link_back">
        	<a href="search_results.html">Back to Search Results</a>
          <a href="course_detail.pdf?cat_num={$cat_num}">PDF</a>
    	</div>

    	<xsl:apply-templates select="/courses/course[@cat_num eq $cat_num]" />
  	</xsl:template>
      
      <xsl:template match="/courses/course[@cat_num eq $cat_num]">
    	<div>
    		<div class="detail">
             <h2><xsl:value-of select="/courses/course[@cat_num eq $cat_num]/title"/></h2>
             <h3><xsl:value-of select="/courses/course[@cat_num eq $cat_num]/course_group"/><xsl:text> </xsl:text>
                 <xsl:value-of select="/courses/course[@cat_num eq $cat_num]/course_number/num_int"/><xsl:value-of select="/courses/course[@cat_num eq $cat_num]/course_number/num_char"/>.
                 <xsl:value-of select="/courses/course[@cat_num eq $cat_num]/title"/>
             </h3>
             <h4>Catalog Number: <xsl:value-of select="/courses/course[@cat_num eq $cat_num]/@cat_num"/></h4>
             <h5 class="strong"><xsl:value-of select="/courses/course[@cat_num eq $cat_num]/faculty_text"/></h5>
                  <h5 class="em"><xsl:value-of select="/courses/course[@cat_num eq $cat_num]/credit"/><xsl:text> </xsl:text>
                       <xsl:value-of select="/courses/course[@cat_num eq $cat_num]/term"/> <xsl:text> </xsl:text>
                      <xsl:value-of select="/courses/course[@cat_num eq $cat_num]/meeting_text"/>
                  </h5>
                 <h5 class="em"><xsl:value-of select="/courses/course[@cat_num eq $cat_num]/course_level"/><xsl:text> / </xsl:text><xsl:value-of select="/courses/course[@cat_num eq $cat_num]/course_type"/></h5>
                  <p><xsl:value-of select="/courses/course[@cat_num eq $cat_num]/description"/></p>
                  <p><xsl:value-of select="/courses/course[@cat_num eq $cat_num]/notes"/></p>
                  <p><xsl:value-of select="/courses/course[@cat_num eq $cat_num]/prerequisites"/></p> 
            </div>
    	</div>

    </xsl:template>
    <xsl:template match="text()" />
</xsl:stylesheet>