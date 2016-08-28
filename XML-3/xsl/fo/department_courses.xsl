<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">
    <xsl:import href="../common.xsl"/>
    <xsl:import href="../attribute-styles.xsl"/>
    <xsl:output method="xml"/>

    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>  
            <!--  layout information  -->
                <fo:simple-page-master master-name="simple" page-height="11in" page-width="8.5in"
                    margin-top=".5in" margin-bottom=".5in" margin-left=".5in" margin-right=".5in">
                    <fo:region-before extent="0.25in"/>
                    <fo:region-body margin-top="0.25in" margin-bottom=".5in"/>
                    <fo:region-after extent=".15in"/>
                </fo:simple-page-master>
                
            </fo:layout-master-set>
            
            <!--  end: defines page layout  -->
           
            <fo:page-sequence master-reference="simple">
                <!-- fo:static-content for header -->
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block font-size="8pt" text-align="end"> Courses, Page
                        <fo:page-number/>
                        <xsl:text> of </xsl:text>
                        <fo:page-number-citation ref-id="theEnd"/> </fo:block>
                </fo:static-content>
                
                <!-- fo:static-content for footer -->
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block font-size="8pt" text-align="end"> 
                        Department of <xsl:value-of select="distinct-values(//course/department[@code eq $code]/dept_short_name)"/> 
                        </fo:block>
                </fo:static-content>
                
                <fo:flow flow-name="xsl-region-body">
                   
                    <fo:block xsl:use-attribute-sets="dept_title" >     
                        Department of <xsl:value-of select="distinct-values(//course/department[@code eq $code]/dept_short_name)"/> 
                       </fo:block>
                        <!--  generate table of contents  -->
                        <fo:block>
                            <xsl:apply-templates select="courses" mode="toc"/>
                        </fo:block>
                        <!--  main content  -->
                        <fo:block>
                        <xsl:apply-templates select="courses" mode="main"/>
                        </fo:block>
                    
                    <!--  last block for "theEnd" id  -->
                    <fo:block id="theEnd"></fo:block>
                </fo:flow>
                <!--  closes the flow element -->
            </fo:page-sequence>
            <!--  closes the page-sequence  -->
        </fo:root>
    </xsl:template>
    
    <xsl:template match="courses" mode="main">
        <xsl:for-each-group select="course/department[@code eq $code]" group-by="../course_group">
            <xsl:sort select="../course_number/num_int" data-type="number"/>
            <xsl:sort select="../course_number/num_char"/>
            <xsl:sort select="../title"/>
            
            <fo:block break-before="page" xsl:use-attribute-sets="group">
                <xsl:value-of select="current-grouping-key()"/> 
            </fo:block>
            
            <xsl:for-each select="current-group()">
                <xsl:sort select="../course_number/num_int" data-type="number"/>
                <xsl:sort select="../course_number/num_char"/>
                <xsl:sort select="../title"/>
                <fo:block id="{generate-id()}" xsl:use-attribute-sets="course bold">
                    <xsl:value-of select="../course_group"/><xsl:text> </xsl:text>
                    <xsl:value-of select="../course_number/num_int"/><xsl:text> </xsl:text>
                    <xsl:value-of select="../course_number/num_char"/><xsl:text> </xsl:text>
                    <xsl:value-of select="../title"/>
                </fo:block>
                <fo:block  xsl:use-attribute-sets="course">
                    Catalog Number: <xsl:value-of select="../@cat_num"/>
                </fo:block>
                
                <fo:block xsl:use-attribute-sets="course italic">
                    <xsl:value-of select="../faculty_text"/>
                </fo:block>
                
                <fo:block xsl:use-attribute-sets="course italic">
                    <xsl:value-of select="../credit"/><xsl:text> </xsl:text>
                  ( <xsl:value-of select="../term"/> )<xsl:text> </xsl:text>
                    <xsl:value-of select="../meeting_text"/>
                </fo:block>
                
                <fo:block  xsl:use-attribute-sets="course padding-bottom">
                <xsl:value-of select="../course_level"/><xsl:text> / </xsl:text><xsl:value-of select="../course_type"/>
                </fo:block>
                
                <fo:block  xsl:use-attribute-sets="course padding-bottom">
                     <xsl:value-of select="../description"/>
                </fo:block>
                
                <fo:block  xsl:use-attribute-sets="course padding-bottom">
                    <xsl:value-of select="../notes"/>
                 </fo:block>
                
                <fo:block  xsl:use-attribute-sets="course padding-bottom">
                <xsl:value-of select="../prerequisites"/>
                </fo:block>
                <fo:block  xsl:use-attribute-sets="extra-padding-bottom"/>         
            </xsl:for-each>
        </xsl:for-each-group>
    </xsl:template>
      
    <xsl:template match="courses" mode="toc">
        <xsl:for-each-group select="course/department[@code eq $code]" group-by="../course_group">
            <xsl:sort select="../course_group"/>
            <fo:block xsl:use-attribute-sets="group">
                <xsl:value-of select="current-grouping-key()"/> 
            </fo:block>

           <xsl:for-each select="current-group()">

               <fo:block text-align-last="justify" xsl:use-attribute-sets="course">
                <fo:basic-link>
                   <xsl:attribute name="internal-destination">
                       <xsl:value-of select="generate-id()"/>
                   </xsl:attribute>
                     <xsl:value-of select="../course_group"/><xsl:text> </xsl:text>
                     <xsl:value-of select="../course_number/num_int"/><xsl:text> </xsl:text>
                     <xsl:value-of select="../course_number/num_char"/><xsl:text> </xsl:text>
                     <xsl:value-of select="../title"/>
                </fo:basic-link>
                <fo:leader leader-pattern="dots"/>
                <fo:page-number-citation>
                    <xsl:attribute name="ref-id">
                        <xsl:value-of select="generate-id()"/>
                    </xsl:attribute>
                </fo:page-number-citation>
                
            </fo:block>
           </xsl:for-each> 
        </xsl:for-each-group> 
    </xsl:template>
    
    <xsl:template match="text()" />
</xsl:stylesheet>