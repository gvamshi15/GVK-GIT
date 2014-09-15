<?xml version="1.0" encoding="utf-8"?>
	
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
				<fo:region-before extent="10cm"/>
				<fo:region-body margin-top="7.5cm" margin-bottom="2.5cm"/>
				<fo:region-after extent="2cm"/>
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
							<!-- Marktadresse -->
							<fo:block text-align="left" font-weight="bold" font-size="12pt">
								<xsl:value-of select="document-header/market" />
							</fo:block>
							<fo:block text-align="left" font-weight="bold" font-size="12pt">
								<xsl:value-of select="document-header/adress" />
							</fo:block>
							<fo:block text-align="left" font-weight="bold" font-size="12pt">
								<xsl:value-of select="document-header/street" />
							</fo:block>						
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

			<fo:table width="100%" table-layout="fixed" padding-before="1cm">
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
							<!-- Lieferant -->
							<fo:block text-align="left" font-size="12pt">
								<xsl:value-of select="txt-lief-no" /> <xsl:value-of select="lief-no" />
							</fo:block>
							<fo:block text-align="left" font-weight="bold" font-size="12pt">
								<xsl:value-of select="lief-name" />
							</fo:block>
							<fo:block text-align="left" font-size="12pt" font-weight="bold" padding-top="0.4cm">
								<xsl:value-of select="lief-street" />
							</fo:block>
							<fo:block text-align="left" font-size="12pt" font-weight="bold">
								<xsl:value-of select="lief-pLZCity" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="2">
							<!-- Auftrag -->
							<fo:block text-align="left" font-size="12pt" border-top-style="solid" border-bottom-style="solid" border-left-style="solid" border-right-style="solid">
								<xsl:value-of select="txt-auftrags-no" />: 
								<fo:block font-weight="bold">
									<xsl:value-of select="document-header/process-no" />
								</fo:block>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>			
			</fo:table>
			
			<fo:table width="100%" table-layout="fixed" padding-before="0.6cm">			
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1" width="10cm">
							<fo:block text-align="left" font-size="10pt" font-weight="bold">
								<xsl:value-of select="txt-erfasser-mDE" />: <xsl:value-of select="erfasser-name-mDE" />
							</fo:block>
							<fo:block text-align="left" font-size="10pt" font-weight="bold">
								<xsl:value-of select="txt-retoure-erstellt"/> <xsl:value-of select="retoure-erstellt-von" />
							</fo:block>
							<fo:block text-align="left" font-size="10pt" font-weight="bold">
								<xsl:value-of select="txt-letzter-bearbeiter" /> <xsl:value-of select="letzter-bearbeiter" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
	
		</fo:static-content>	
	
	</xsl:template>
	
			
	<xsl:template match="failure-tO">
		<fo:root hyphenate="true">
		
			<xsl:call-template name="pageDefinitions" />
			
			<fo:page-sequence master-reference="A4-portrait">
			
				<!-- header -->
				<xsl:call-template name="header"/>
				
				<fo:flow flow-name="xsl-region-body">
				
					<fo:table width="100%" table-layout="fixed" padding-before="2cm">
					
			            <fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
			            <fo:table-column column-width="proportional-column-width(2)" column-number="2"/>
			            <fo:table-column column-width="proportional-column-width(3)" column-number="3"/>
			            <fo:table-column column-width="proportional-column-width(1.5)" column-number="4"/>
			            <fo:table-column column-width="proportional-column-width(1.5)" column-number="5"/>
			            <fo:table-column column-width="proportional-column-width(3)" column-number="6"/>
			            
			            <fo:table-header>
			              <fo:table-row text-align="center" font-size="9pt" font-weight="bold">
			                <fo:table-cell column-number="1">
			                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid" border-width="1pt" border-color="black">
			               		<xsl:value-of select="txt-position" />
			               	  </fo:block>	
			                </fo:table-cell>
			                <fo:table-cell column-number="2">
			                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid" border-width="1pt" border-color="black">
			               		<xsl:value-of select="txt-art-no" />
			               	  </fo:block>	
			                </fo:table-cell>
			                <fo:table-cell column-number="3">
			                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid" border-width="1pt" border-color="black">
			               		<xsl:value-of select="txt-art-descr" />
			               	  </fo:block>	
			               	</fo:table-cell>
			                <fo:table-cell column-number="4">
			                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid" border-width="1pt" border-color="black">
			              		<xsl:value-of select="txt-qty-soll" />
			               	  </fo:block>	
			               	</fo:table-cell>
			                <fo:table-cell column-number="5">
			                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid" border-width="1pt" border-color="black">
			              		<xsl:value-of select="txt-qty-ist" />
				              </fo:block>	
			                </fo:table-cell>
			                <fo:table-cell column-number="6">
			                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid" border-width="1pt" border-color="black">
			              		<xsl:value-of select="txt-serial-available" />
				              </fo:block>	
			                </fo:table-cell>
			              </fo:table-row>
			              <fo:table-row text-align="center" font-size="9pt" font-weight="bold">
			                <fo:table-cell column-number="1">
			                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid" border-width="1pt" border-color="black">
			               	  </fo:block>	
			                </fo:table-cell>
			                <fo:table-cell column-number="2">
			                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid" border-width="1pt" border-color="black">
			               	  </fo:block>	
			                </fo:table-cell>
			                <fo:table-cell column-number="3">
			                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid" border-width="1pt" border-color="black">
			               	  </fo:block>	
			               	</fo:table-cell>
			                <fo:table-cell column-number="4">
			                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid" border-width="1pt" border-color="black">
			               	  </fo:block>	
			               	</fo:table-cell>
			                <fo:table-cell column-number="5">
			                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid" border-width="1pt" border-color="black">
				              </fo:block>	
			                </fo:table-cell>
			                <fo:table-cell column-number="6">
			                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid" border-width="1pt" border-color="black">
				              </fo:block>	
			                </fo:table-cell>
			              </fo:table-row>
			          	</fo:table-header>
			          	
			          	<fo:table-body>
			          	
			          		<xsl:for-each select="failures">
			          	
				          		<fo:table-row font-size="9pt" keep-together="always" border-bottom-style="dashed" border-width="1pt" border-color="black">
				                  <xsl:attribute name="background-color">#E0E0E0</xsl:attribute>
				                  <xsl:if test="position() mod 2 = 1">
				        		   	<xsl:attribute name="background-color">#FFFFFF</xsl:attribute>
						          </xsl:if>
				               
				                  <fo:table-cell column-number="1" text-align="left" padding-before="2pt">
				                    <fo:block>
				                      <xsl:value-of select="position()" />
				                    </fo:block>
				                  </fo:table-cell>
				                  <fo:table-cell column-number="2" text-align="left" padding-before="2pt">
				                    <fo:block>
				                      <xsl:value-of select="art-no" />
				                    </fo:block>
				                  </fo:table-cell>
				                  <fo:table-cell column-number="3" text-align="left" padding-before="2pt">
				                    <fo:block>
				                      <xsl:value-of select="art-desc" />
				                    </fo:block>
				                  </fo:table-cell>
				                  <fo:table-cell column-number="4" text-align="left" padding-before="2pt">
				                    <fo:block>
				                      <xsl:value-of select="menge-soll" />
				                    </fo:block>
				                  </fo:table-cell>
				                  <fo:table-cell column-number="5" text-align="left" padding-before="2pt">
				                    <fo:block>
				                      <xsl:value-of select="menge-ist" />
				                    </fo:block>
				                  </fo:table-cell>
				                  <fo:table-cell column-number="6" text-align="left" padding-before="2pt">
				                    <fo:block>
				                      <xsl:value-of select="exists-serial-no" />
				                    </fo:block>
				                  </fo:table-cell>
				                </fo:table-row>
			                
			                </xsl:for-each>
			          	
			          	</fo:table-body>
			            
			        </fo:table>
				
				</fo:flow>
			
			</fo:page-sequence>
		
		</fo:root>
	</xsl:template>


</xsl:stylesheet>