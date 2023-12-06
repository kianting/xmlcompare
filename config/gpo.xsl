<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="utf-8" />
  
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="UserResults">
    <xsl:for-each select="GPO">
      <xsl:value-of select="./Name"/>
      <xsl:value-of select="Path/Identifier"/>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>