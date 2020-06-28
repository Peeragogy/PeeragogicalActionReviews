<?xml version="1.0" encoding="UTF-8"?>
<!--
Layout by Charlie Danoff.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:par="htx-scheme-id://org.peeragogy.20120221/patterns/peeragogical-action-review.20200511T003600Z" xmlns:html="http://www.w3.org/1999/xhtml" exclude-result-prefixes="par">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" doctype-public="-//W3C//DTD XHTML 1.1//EN" doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"/>

  <xsl:template match="/">
    <html version="-//W3C//DTD XHTML 1.1//EN" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.w3.org/1999/xhtml http://www.w3.org/MarkUp/SCHEMA/xhtml11.xsd" xml:lang="en" lang="en">
      <head>
        <meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8"/>
        <xsl:text>&#x0A;</xsl:text>
        <xsl:comment> This file was created by par_to_xhtml_1.xsl </xsl:comment>
        <xsl:text>&#x0A;</xsl:text>
        <title>
          <xsl:value-of select="./par:peeragogical-action-review/@title"/>
        </title>
        <style type="text/css">
          body
          {
              font-family: sans-serif;
          }

          h1
          {
              text-align: center;
          }

          .par-box
          {
              display: inline-block;
              border: 1px solid #000000;
          }
        </style>
      </head>
      <body>
        <div>
          <h1>
            <!-- TODO: A pre-transformation could add the readable display names from the PAR template pattern. -->
            <xsl:value-of select="./par:peeragogical-action-review/@title"/>
          </h1>
          <div class="par-box">
            <xsl:apply-templates select="./par:peeragogical-action-review/par:intention-review"/>
            <xsl:apply-templates select="./par:peeragogical-action-review/par:what-happened"/>
            <xsl:apply-templates select="./par:peeragogical-action-review/par:what-happened-perspectives"/>
            <xsl:apply-templates select="./par:peeragogical-action-review/par:learnings-changes"/>
            <xsl:apply-templates select="./par:peeragogical-action-review/par:what-else-should-change-going-forward"/>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="//par:intention-review | //par:what-happened | //par:what-happened-perspectives | //par:learnings-changes | //par:what-else-should-change-going-forward">
    <div>
      <h2>
        <xsl:value-of select="local-name(.)"/>
      </h2>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="//par:intention-review//text() | //par:what-happened//text() | //par:what-happened-perspectives//text() | //par:learnings-changes//text() | //par:what-else-should-change-going-forward//text()">
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="//html:ul | //html:ol | //html:li | //html:a">
    <!--
      @copy-namespaces is XSLT 2.0, which then would also allow the "html" prefix of the source
      document to be added to @exclude-result-prefixes for the result/output document. Another
      option for XSLT 1.0 would be to copy everything manually via local-name() etc., but because
      of lazyness, it's quite fine to have the XHTML namespace with explicit prefix in a document
      that's under the XHTML namespace as the default namespace.
    -->
    <!--xsl:copy-of select="." copy-namespaces="no"/-->

    <xsl:copy-of select="."/>
  </xsl:template>

  <xsl:template match="text()|node()|@*"/>

</xsl:stylesheet>
