<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" omit-xml-declaration="yes" indent="no"/>

  <xsl:param name="word_definition"/>

  <xsl:template match="/entry_list">
    <xsl:for-each select="entry">
      <xsl:text>&#010;</xsl:text>
      <!--<xsl:if test="$word_definition=normalize-space(ew/text())">-->
        <xsl:apply-templates select="def"/>
        <xsl:text>&#010;</xsl:text>
      <!--</xsl:if>-->
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="def">
    <xsl:apply-templates select="sn|sl|dt|vt|slb|ssl"/>
  </xsl:template>

  <xsl:template match="vt">
    <xsl:text>&#10;</xsl:text>
    <xsl:value-of select="normalize-space(text())"/>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template match="sn">
    <xsl:if test="string-length(normalize-space(text())) &gt; 0">
      <xsl:text>&#010;</xsl:text>
      <xsl:text>&#042;</xsl:text>
      <xsl:value-of select="normalize-space(text())"/>
      <xsl:text>&#042;</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="snp"/>
  </xsl:template>

  <xsl:template match="sl">
    <xsl:if test="string-length(normalize-space(text())) &gt; 0">
      <xsl:text>&#010;</xsl:text>
      <xsl:value-of select="normalize-space(text())"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="snp">
    <xsl:text>&#032;</xsl:text>
    <xsl:value-of select="normalize-space(text())"/>
  </xsl:template>

  <xsl:template match="slb">
    <xsl:text>&#032;</xsl:text>
    <xsl:value-of select="normalize-space(text())"/>
  </xsl:template>

  <xsl:template match="ssl">
    <xsl:text>&#032;</xsl:text>
    <xsl:value-of select="normalize-space(text())"/>
  </xsl:template>


  <xsl:template match="dt">
    <xsl:value-of select="normalize-space(text())"/>
    <xsl:apply-templates select="sx|fw|vi|un"/>
  </xsl:template>

  <xsl:template match="sx">
    <xsl:text>&#032;</xsl:text>
    <xsl:text>&#096;</xsl:text>
    <xsl:value-of select="normalize-space(text())"/>
    <xsl:if test="following-sibling::sx">
      <xsl:text>,</xsl:text>
    </xsl:if>
    <xsl:text>&#096;</xsl:text>
    <xsl:text>&#032;</xsl:text>
  </xsl:template>

  <xsl:template match="fw">
    <xsl:text>&#032;</xsl:text>
    <xsl:value-of select="text()"/>
    <xsl:if test="following-sibling::fw">
      <xsl:text>,</xsl:text>
    </xsl:if>
    <xsl:text>&#032;</xsl:text>
  </xsl:template>


  <xsl:template match="vi">
    <xsl:text>&#032;</xsl:text>
    <xsl:text>&#149;</xsl:text>
    <xsl:text>.</xsl:text>
    <xsl:text>&#032;</xsl:text>
    <xsl:value-of select="normalize-space(text())"/>
    <xsl:text>&#032;</xsl:text>
    <xsl:apply-templates select="it"/>
  </xsl:template>

  <xsl:template match="it">
    <xsl:value-of select="normalize-space(text())"/>
  </xsl:template>

  <xsl:template match="un">
    <xsl:text>&#032;</xsl:text>
    <xsl:text>-</xsl:text>
    <xsl:text>&#032;</xsl:text>
    <xsl:value-of select="normalize-space(text())"/>
  </xsl:template>

</xsl:stylesheet>