<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/TR/xhtml1/strict"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java">

	<xsl:template name="pageDefinitions">
		<xsl:attribute name="language"></xsl:attribute>
		<fo:layout-master-set>
			<fo:simple-page-master master-name="A4-portrait"
				page-width="21cm" page-height="29.7cm" margin-top="1cm"
				margin-bottom="1cm" margin-left="2cm" margin-right="1cm">				
				<fo:region-before extent="13cm"/>				
				<fo:region-body margin-top="5.5cm" margin-bottom="2.5cm"/>
				<fo:region-after extent="8cm"/>
			</fo:simple-page-master>
		</fo:layout-master-set>
	</xsl:template>
	
	<xsl:template name="header">
		
		<!-- Header -->
		<fo:static-content flow-name="xsl-region-before">
		
			<fo:table width="100%" table-layout="fixed">			
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="2"/>				
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1">
							<!-- Market Address -->
							<fo:block text-align="left" font-weight="bold" font-size="12pt">
								<xsl:value-of select="document-header/market" />
							</fo:block>
							 
							<fo:block text-align="left" font-weight="bold" font-size="12pt">
								<xsl:value-of select="document-header/street" />
							</fo:block>	
							<fo:block text-align="left" font-weight="bold" font-size="12pt">
								<xsl:value-of select="document-header/adress" />
							</fo:block>							
							<fo:block>&#xA0;</fo:block>							
											
						</fo:table-cell>
						<fo:table-cell column-number="2">
							<fo:block text-align="right" font-weight="bold" font-size="12pt">
								<xsl:value-of select="now" />
							</fo:block>
							<fo:block text-align="right" font-weight="bold" font-size="12pt">
								<xsl:value-of select="txt-seite" />: <fo:page-number />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>			
			</fo:table>
			
			<fo:table width="100%" table-layout="fixed" padding-before="2cm">
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1">
							<!-- Headline -->
							<fo:block text-align="center" font-weight="bold" font-size="18pt">
								<xsl:value-of select="txt-headline" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
			
			<fo:table width="100%" table-layout="fixed" padding-before="1cm">			
				<fo:table-column column-width="12cm" column-number="1"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="2"/>				
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1" width="12cm">
							<!-- Edited by -->
							<fo:block text-align="left" font-size="12pt">
								<xsl:value-of select="txt-bearbeitet-von" />: <xsl:value-of select="bearbeitet-von" />
							</fo:block>
						</fo:table-cell>						
					</fo:table-row>
				</fo:table-body>			
			</fo:table>
			
			<fo:table width="100%" table-layout="fixed" padding-before="1cm">			
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="2"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="3"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="4"/>
				<!--  <fo:table-column column-width="proportional-column-width(1)" column-number="5"/>-->
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1">
							<fo:block font-weight="bold">
								<xsl:value-of select="txt-spedition" />:
							</fo:block>
						</fo:table-cell>
						
						<fo:table-cell column-number="2">
							<fo:block>
								<xsl:value-of select="spedition" />
							</fo:block>
						</fo:table-cell>

						<fo:table-cell column-number="3">
							<fo:block font-weight="bold">
								<xsl:value-of select="txt-nIF" />
							</fo:block>
						</fo:table-cell>
						
						<fo:table-cell column-number="4">
							<fo:block>
								<xsl:value-of select="nif" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					
					<fo:table-row>
						<fo:table-cell column-number="1">
							<fo:block font-weight="bold">
								<xsl:value-of select="txt-abholer" />:
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="2">
							<fo:block>
								<xsl:value-of select="abholer" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="3">
							<fo:block font-weight="bold">
								<xsl:value-of select="txt-vehicle" />:
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="4">
							<fo:block>
								<xsl:value-of select="vehicle" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell column-number="1">
							<fo:block></fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="2">
							<fo:block></fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="3">
							<fo:block font-weight="bold">
								<xsl:value-of select="txt-rMA" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="4">
							<fo:block font-weight="bold">
								<xsl:value-of select="rma-no" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		
		</fo:static-content>
	
	</xsl:template>	
	
	<xsl:template match="goods-issue-tO">
	
		<fo:root hyphenate="true">
		
			<xsl:call-template name="pageDefinitions" />
						
			<fo:page-sequence master-reference="A4-portrait">
				
				<xsl:call-template name="header" />
				
					<fo:flow flow-name="xsl-region-body">
				
						<fo:table width="100%" table-layout="fixed" padding-before="5cm">
						
				            <fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				            <fo:table-column column-width="proportional-column-width(5)" column-number="2"/>
				            
				            <fo:table-header>
				              <fo:table-row text-align="center" font-size="9pt" font-weight="bold">
				                <fo:table-cell column-number="1">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid" border-bottom-style="solid" border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-position" />
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="2">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid" border-bottom-style="solid" border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-packet-number" />
				               	  </fo:block>	
				                </fo:table-cell>
				              </fo:table-row>
				          	</fo:table-header>
				          	
				          	<fo:table-body>				          	
				          		<xsl:for-each select="goods-issue-positions">				          		
				          			<fo:table-row font-size="9pt" keep-together="always" border-bottom-style="dashed" border-width="1pt" border-color="black">
					                  <xsl:attribute name="background-color">#E0E0E0</xsl:attribute>
					                  <xsl:if test="position() mod 2 = 1">
					        		   	<xsl:attribute name="background-color">#FFFFFF</xsl:attribute>
							          </xsl:if>					               
					                  <fo:table-cell column-number="1" text-align="left" padding-before="2pt">
					                    <fo:block>
					                      <xsl:value-of select="position" />
					                    </fo:block>
					                  </fo:table-cell>
					                  <fo:table-cell column-number="2" text-align="left" padding-before="2pt">
					                    <fo:block>
					                      <xsl:value-of select="packet-number" />
					                    </fo:block>
					                  </fo:table-cell>					                  
					                </fo:table-row>				          		
				          		</xsl:for-each>				          		
				          	</fo:table-body>				        
				        </fo:table>
				
						<fo:table width="100%" table-layout="fixed" padding-before="1cm">			
							<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell column-number="1">
										<fo:block font-weight="bold">
											<xsl:value-of select="txt-packet-count" />: <xsl:value-of select="packet-count" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell column-number="1" padding-before="0.5cm">
										<fo:block font-weight="bold">
											<xsl:value-of select="txt-sign-abholer" />:
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell column-number="1">
										<fo:block>																						
											<xsl:variable name="signatureFile">
												<xsl:value-of select="full-path-of-signature-file" />
											</xsl:variable>											
											<fo:external-graphic src="{$signatureFile}" />											
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>						
				</fo:flow>					
			</fo:page-sequence> 
		
		</fo:root>
	
	</xsl:template>

</xsl:stylesheet>