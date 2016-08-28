<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
  
  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="/current_observation/location"/></title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
        <style type="text/css">
          body{
           font-family:calibri, verdana, arial, helvetica, sans-serif;
           font-size: .85em;
          }
          p{
            margin:0px;
            padding:0px;
          }
          img{
           border:none;
           margin-right: 5px;
          }
          a,
          a:link,
          a:visited{
            background-color:white;
            color:blue;
            text-decoration:none;
          }
          a:hover{
            text-decoration:underline;
            color:white;
            background-color:blue;
          }
          .weather {
            margin-bottom: 5px;
          }
          .summary {
            padding-left: .85em;
          }
          .temp{
            font-size:250%;
            font-weight:bold;
          }
          .conditions  {
            margin: 10px 0px;
          }
          .conditions table th{
            text-align:right;
          }
          .conditions table td{
            text-align:left;
            padding-left: 1em;
           
          }
          .lastupdated{
            font-size:0.80em;
            margin-top:0.25em;
          }
          .links{
            margin-top:0.25em;
          }
          .credit{
            font-size:0.75em;
            margin-top:1em;
            padding-top:1em;
          }</style>
      </head>
      <body>
        <xsl:apply-templates />
      </body>
    </html>
  </xsl:template>
  
  
  <xsl:template match="current_observation">
    <h1>
      <xsl:value-of select="location"/>
    </h1>
   <div class="weather">
     <img src="{icon_url_base}/{icon_url_name}" alt="Conditions"/>
     <strong><span class="temp"><xsl:value-of select="temp_f"/>&#176; F</span></strong>
     <p class="summary"><xsl:value-of select="weather"/></p>     
   </div> 
  <div class="conditions">
    <table>
      <tr><th><strong>Wind</strong></th><td><xsl:value-of select="wind_dir"/> at <xsl:value-of select="wind_mph"/> mph </td></tr>
      <tr><th><strong>Humidity</strong></th><td><xsl:value-of select="relative_humidity"/>%</td></tr>
      <tr><th><strong>Pressure</strong></th><td><xsl:value-of select="pressure_in"/>"</td></tr>
      <tr><th><strong>Dewpoint</strong></th><td><xsl:value-of select="dewpoint_f"/>&#176; F </td></tr>
      <tr><th><strong>Visibility</strong></th><td><xsl:value-of select="visibility_mi"/> mi</td></tr>
    </table>
  </div>
    <div>
      <p class="lastupdated"><xsl:value-of select="observation_time"/></p>
      <p class="links"><a href="{two_day_history_url}">Recent Observation History</a></p>
    </div>
    <div><p class="credit"><a href="{credit_URL}">NOAA's National Weather Service</a></p></div>
  </xsl:template>


</xsl:stylesheet>
