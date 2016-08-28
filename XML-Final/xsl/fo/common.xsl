<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns="http://www.w3.org/1999/xhtml">

    <xsl:param name="baselink"/>
    <xsl:param name="querystring" />
    <xsl:param name="cat_num" />
    <xsl:param name="dept"/>
    <xsl:param name="course_group" />
    <xsl:param name="day" />
    <xsl:param name="faculty" />
    <xsl:param name="term_patt" />
    <xsl:param name="keyword" />

    <xsl:variable name="title" select="'Faculty of Arts &amp; Sciences Course Catalog'"/>

    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="$title"></xsl:value-of></title>
                <meta charset="UTF-8" ></meta>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
                <link rel="stylesheet" href="{$baselink}css/bootstrap/bootstrap.min.css" type="text/css"></link>
               <link type="text/css" rel="stylesheet" href="{$baselink}css/custom.css"></link>
           </head>
            
            <body>
                <div class="container">
                    <!-- header -->
                    <div class="row" id="header">
                        <a href="index.html">
                            <xsl:text> . </xsl:text>
                        </a> 
                    </div>

                    <div class="row " id="Top_Nav">
                        <div class="navbar navbar-default hidden-lg hidden-md " role="navigation" id="nav">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#collapse">
                                  <span class="sr-only">Toggle navigation</span>
                                  <span class="icon-bar"></span>
                                  <span class="icon-bar"></span>
                                  <span class="icon-bar"></span>
                                </button>
                            </div>

                            <!-- Selection of Search Facets-->
                            <div class="collapse navbar-collapse" id="collapse">
                                    <ul class="nav navbar-nav">
                                        <li><a href="" class="">Departments</a></li>
                                        <li><a href="" class="">Term Pattern</a></li>
                                        <li><a href="" class="">Faculty</a></li>
                                        <li><a href="" class="">Days</a></li>
                                        <li><a href="" class="">Times</a></li>  
                                    </ul>
                            </div>
                        </div>
                    </div>

                    <!-- primary -->
                    <div class="row" id="Main">
                        <xsl:apply-templates />
                    </div>
                    
                    <div class="row" id="footer">
                        <!-- footer -->
                            <p id="address">
                              Harvard University |
                              Faculty of Arts and Sciences | 
                              Cambridge, MA 02138  | 
                              (617) 495-1000
                            </p> 
                            <p id="copy">
                            Copyright © 2014 President and Fellows of Harvard College
                        </p>
                    </div>
                    
                </div>


                <script src="{$baselink}js/jquery-2.0.3.min.js"> <xsl:text> </xsl:text></script>
                <script src="{$baselink}js/jquery-ui-1.10.3.custom.min.js"> <xsl:text> </xsl:text></script>
                <script src="{$baselink}js/bootstrap.min.js"> <xsl:text> </xsl:text></script>
                <script src="{$baselink}js/script.js"> <xsl:text> </xsl:text></script>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>