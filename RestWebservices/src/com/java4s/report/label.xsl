<?xml version="1.0" encoding="utf-8"?>
	
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/TR/xhtml1/strict"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:barcode="org.krysalis.barcode4j.xalan.BarcodeExt" 
  extension-element-prefixes="barcode"
  xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java">


	<xsl:template name="pageDefinitions">
		<xsl:attribute name="language"></xsl:attribute>
		<fo:layout-master-set>
			<fo:simple-page-master master-name="simple"
				page-width="21cm" page-height="29.7cm" margin-top="0cm"
				margin-bottom="0cm" margin-left="1cm" margin-right="1cm">
				<fo:region-body margin-top="0cm" margin-bottom="0cm" />
				<fo:region-before extent="3cm" />
				<fo:region-after extent="1.5cm" />
			</fo:simple-page-master>
		</fo:layout-master-set>
	</xsl:template>
	
	<xsl:template name="staticPacketData">
		
		<fo:block font-size="30pt" font-family="sans-serif" text-align="left">
			<xsl:value-of select="../txt-auftrag-no"/>:
			<xsl:value-of select="../process-no" />
		</fo:block>
 
		<fo:block font-size="30pt" font-family="sans-serif" text-align="left">
			<xsl:value-of select="../txt-lieferant"/>:
			<xsl:value-of select="../supplier-no" />
		</fo:block>
		
		<fo:block font-size="22pt" font-family="sans-serif" text-align="left" padding-top="0.8cm">
			<xsl:value-of select="../supplier" />
		</fo:block>
							
		<fo:block font-size="22pt" font-family="sans-serif" text-align="left">
			<xsl:value-of select="../strasse" />
		</fo:block>
		
		<fo:block font-size="22pt" font-family="sans-serif" text-align="left">
			<xsl:value-of select="../plz-ort" />
		</fo:block>
		
		<fo:block font-size="20pt" font-family="sans-serif" text-align="left" padding-top="0.8cm">
			<xsl:value-of select="../txt-packer"/>:
			<xsl:value-of select="../packer" />
		</fo:block>		
		
	</xsl:template>
			
	<xsl:template match="label-tO">
		<fo:root hyphenate="true">
		
			<xsl:call-template name="pageDefinitions" />
			
			<fo:page-sequence master-reference="simple">
			
				<fo:flow flow-name="xsl-region-body">
			
					<xsl:for-each select="packet-pos-list">
					
						<xsl:call-template name="staticPacketData" />
						
						<fo:block font-size="30pt" padding-top="1cm" text-align="center">
						<!-- BFT 257884, Arun, 21.04.10 -->
						<xsl:value-of select="../txt-paket"/> <xsl:text> </xsl:text> <xsl:value-of select="packet-pos" /> 
						<xsl:text> </xsl:text> <xsl:value-of select="../txt-von"/> <xsl:text> </xsl:text> <xsl:value-of select="../packet-count" />						
						<!-- EOC, 257884, Arun, 21.04.10 -->										
						</fo:block>
						
						<fo:block padding-top="1cm" padding-bottom="1cm" text-align="center">
							<fo:instream-foreign-object>
						      <xsl:variable name="barcode-cfg">
						        <barcode>
						          <intl2of5>
						            <height>20mm</height>
						            <module-width>0.5mm</module-width>
						            <quiet-zone enabled="true">5mm</quiet-zone>
						            <human-readable>
						            	<font-size>18pt</font-size>
						            </human-readable>
						          </intl2of5>
						        </barcode>
						      </xsl:variable>
						      <xsl:copy-of select="barcode:generate($barcode-cfg, packet-iD)"/>
						    </fo:instream-foreign-object>
						</fo:block>
						 
						<xsl:if test="(position() mod 2)=1">
							<fo:block text-align="center" padding-bottom="0.5cm">
								<fo:leader leader-pattern="rule" leader-length="100%" rule-thickness="1pt"/>
							</fo:block>
						</xsl:if>
				
					</xsl:for-each>
				
				</fo:flow>
			
			</fo:page-sequence>
		
		</fo:root>
	</xsl:template>


</xsl:stylesheet>