<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">
   
   <xsl:import href="common.xsl"/>
    <xsl:import href="attribute-styles.xsl"/>
  

    <xsl:template match="courses">
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
                
                
                
                <fo:flow flow-name="xsl-region-body">
                
                        
                        <!--  main content  -->
                        <fo:block>
                        <xsl:apply-templates/>
                        </fo:block>
                    
                    <!--  last block for "theEnd" id  -->
                    <fo:block id="theEnd"></fo:block>
                </fo:flow>
                <!--  closes the flow element -->
            </fo:page-sequence>
            <!--  closes the page-sequence  -->
        </fo:root>
        <xsl:for-each-group select="course[@cat_num eq $cat_num]" group-by="./@cat_num">
            <xsl:sort select="./course_number/num_int" data-type="number"/>
            <xsl:sort select="./course_number/num_char"/>
            <xsl:sort select="./title"/>
            
            <fo:block break-before="page" xsl:use-attribute-sets="group">
                <xsl:value-of select="current-grouping-key()"/> 
            </fo:block>
            
            <xsl:for-each select="current-group()">
                <xsl:sort select="./course_number/num_int" data-type="number"/>
                <xsl:sort select="./course_number/num_char"/>
                <xsl:sort select="./title"/>
                <fo:block id="{generate-id()}" xsl:use-attribute-sets="course bold">
                    <xsl:value-of select="./course_group"/><xsl:text> </xsl:text>
                    <xsl:value-of select="./course_number/num_int"/><xsl:text> </xsl:text>
                    <xsl:value-of select="./course_number/num_char"/><xsl:text> </xsl:text>
                    <xsl:value-of select="./title"/>
                </fo:block>
                <fo:block  xsl:use-attribute-sets="course">
                    Catalog Number: <xsl:value-of select="./@cat_num"/>
                </fo:block>
                
                <fo:block xsl:use-attribute-sets="course italic">
                    <xsl:value-of select="../faculty_text"/>
                </fo:block>
                
                <fo:block xsl:use-attribute-sets="course italic">
                    <xsl:value-of select="./credit"/><xsl:text> </xsl:text>
                  ( <xsl:value-of select="./term"/> )<xsl:text> </xsl:text>
                    <xsl:value-of select="./meeting_text"/>
                </fo:block>
                
                <fo:block  xsl:use-attribute-sets="course padding-bottom">
                <xsl:value-of select="./course_level"/><xsl:text> / </xsl:text><xsl:value-of select="./course_type"/>
                </fo:block>
                
                <fo:block  xsl:use-attribute-sets="course padding-bottom">
                     <xsl:value-of select="./description"/>
                </fo:block>
                
                <fo:block  xsl:use-attribute-sets="course padding-bottom">
                    <xsl:value-of select="./notes"/>
                 </fo:block>
                
                <fo:block  xsl:use-attribute-sets="course padding-bottom">
                <xsl:value-of select="./prerequisites"/>
                </fo:block>
                <fo:block  xsl:use-attribute-sets="extra-padding-bottom"/>         
            </xsl:for-each>
        </xsl:for-each-group>
    </xsl:template>
      
   
    
    <xsl:template match="text()" />
</xsl:stylesheet>