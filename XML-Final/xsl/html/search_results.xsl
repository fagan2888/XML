<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns="http://www.w3.org/1999/xhtml">

 <xsl:import href="../../xsl/includes/common.xsl"/>

    <xsl:template match="courses">
    	<div  id="logo">
	       	<div class="logo hidden-sm hidden-xs"><xsl:text> </xsl:text></div>
	    	<div class="logo_text hidden-lg hidden-md">
	    		<h2>Harvard University Course Catalog</h2></div>
	    		<form id="searchForm" name="searchForm" action="search_results.html" method="GET">     
				        <p>
			                <input type="hidden" name="dept" id="dept" value='{$dept}' />
			                <input type="hidden" name="day" id="day" value='{$day}' />
			                <input type="hidden" name="course_group" id="course_group" value='{$course_group}' />
			                <input type="hidden" name="faculty" id="faculty" value='{$faculty}' />
			                <input type="hidden" name="term_patt" id="term_patt" value='{$term_patt}' />
			                
				            <input type="text" name="keyword" id="keyword" />
				            <xsl:text> </xsl:text><xsl:text> </xsl:text>
				            <input type="submit" name="submitBtn" id="submitBtn" value="Search" />
				        </p>     
	       			</form>
	    	
	    </div>
	    <div id="two_col_row">
	        <div class="col-lg-9 col-md-9 col-sm-9" id="section">	
	        <h4>Your Search Results</h4>	
					<ul>
			        	<xsl:for-each-group select="course" group-by="./title">
			            <xsl:sort select="./title"/>
			            <li>
			                <a href="course_detail.html?cat_num={./@cat_num}"><xsl:value-of select="current-grouping-key()"/></a>
			            </li>
			        	</xsl:for-each-group>
			        </ul>

			</div> <!-- End Left Column-->
		
			<!-- Right Column Side Bar -->
			<div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-sm-2 col-sm-offset-1 hidden-sm hidden-xs" id="aside">
			    		<h4 class="gray">Narrow Your Search</h4>
			    		 <div class="thumbnail">
				            <div class="caption">
				                <h6>Departments</h6>
							    <xsl:template match="//course/department">
				                    <ul>
				                        <xsl:for-each-group select="." group-by="@code">
				                            <xsl:sort select="@code"/>
				                            <li >
				                                <a href="search_results.html">
				                                    <xsl:value-of select="./dept_short_name" />
				                                </a>    
				                            </li>
				                        </xsl:for-each-group>
				                    </ul>
				                     <xsl:apply-templates />
       
    							</xsl:template>
				            </div>
        				</div>
        
					    			 
 							
			    		<div class="article">
			    			<div class="thumbnail">
		                        <div class="caption">
					    			<h5>Course Groups</h5>
					    			
			    				</div>
			    			</div>
			    		</div>
			    		<div class="article">
			    			<div class="thumbnail">
		                        <div class="caption">
					    			<h5>Terms</h5>
					    			
			    				</div>
			    			</div>
			    		</div>
			    		<div class="article">
			    			<div class="thumbnail">
		                        <div class="caption">
					    			<h5>Days</h5>
					    			
			    				</div>
			    			</div>
			    		</div>
			    		<div class="article">
			    			<div class="thumbnail">
		                        <div class="caption">
					    			<h5>Times</h5>
					    			
			    				</div>
			    			</div>
			    		</div>
			    		<div class="article">
			    			<div class="thumbnail">
		                        <div class="caption">
					    			<h5>Faculty</h5>
					    			
			    				</div>
			    			</div>
			    		</div>
			</div> <!-- end right column -->
		</div>
		
    </xsl:template>

    

       <xsl:template match="text()" />

</xsl:stylesheet>