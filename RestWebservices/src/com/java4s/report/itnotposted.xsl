<?xml version="1.0" encoding="ISO-8859-1"?>

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
			<fo:simple-page-master master-name="A4-portrait"
				page-width="21cm" page-height="29.7cm" margin-top="1cm"
				margin-bottom="1cm" margin-left="2cm" margin-right="1cm">				
				<fo:region-before extent="10cm"/>				
				<fo:region-body margin-top="10.5cm" margin-bottom="2cm"/>
				<fo:region-after extent="2cm"/>
			</fo:simple-page-master>
		</fo:layout-master-set>
	</xsl:template>
	
	<xsl:template name="headerAndFooter">
		<!-- Header -->
		<fo:static-content flow-name="xsl-region-before">
			<fo:table width="100%" table-layout="fixed">			
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="2"/>				
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1">
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="header-and-footer-data/current-outlet-details/outlet-name" />
							</fo:block>
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="header-and-footer-data/header-address/name2" />
							</fo:block>
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="header-and-footer-data/header-address/street" />
							</fo:block>	
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="header-and-footer-data/header-address/street2" />
							</fo:block>	
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="header-and-footer-data/header-address/city" />
							</fo:block>
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="header-and-footer-data/header-address/telefon" />
							</fo:block>
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="header-and-footer-data/header-address/telefax" />
							</fo:block>
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="header-and-footer-data/header-address/reg-reason-code" />
							</fo:block>
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="header-and-footer-data/header-address/reg-no" />
							</fo:block>
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="header-and-footer-data/header-address/classification-code" />
							</fo:block>
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="header-and-footer-data/header-address/tax-office" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="2">
							<fo:block text-align="right" font-size="10pt">
								<xsl:value-of select="curr-date" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>			
			</fo:table>
			
			<fo:table width="100%" table-layout="fixed" padding-before="0.25cm">
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1">
							<!-- Barcode -->
							<fo:block padding-top="0.25cm" text-align="center">
								<fo:instream-foreign-object>
							      <xsl:variable name="barcode-cfg">
							        <barcode>
							          <intl2of5>
							            <height>8mm</height>
							            <module-width>0.5mm</module-width>
							            <quiet-zone enabled="true">1mm</quiet-zone>
							            <human-readable>
							            	<font-size>8pt</font-size>
							            </human-readable>
							          </intl2of5>
							        </barcode>
							      </xsl:variable>
							      <xsl:copy-of select="barcode:generate($barcode-cfg, barcode-for-iT)"/>
							    </fo:instream-foreign-object>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
			<fo:table width="100%" table-layout="fixed" padding-before="0.25cm">
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="2"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="3"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="4"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1">
							<!-- Headline -->
							<fo:block text-align="left" font-weight="bold" font-size="12pt">
								<xsl:value-of select="it-print-labels/txt-transfer" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="2">
							<!-- Shipment number -->
							<fo:block text-align="left" font-weight="bold" font-size="12pt">
								<xsl:value-of select="it-head-tO/process-no" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="3">
							<!-- Label for status -->
							<fo:block text-align="left" font-weight="bold" font-size="12pt">
								<xsl:value-of select="it-print-labels/txt-status" />:
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="4">
							<!-- Status -->
							<fo:block text-align="left" font-weight="bold" font-size="12pt">
								<xsl:value-of select="it-head-tO/status" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
			<fo:table width="100%" table-layout="fixed" padding-before="0.25cm">			
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="2"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="3"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="4"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1">
							<fo:block font-weight="bold" font-size="10pt" padding-top="0.15cm">
								<xsl:value-of select="it-print-labels/txt-from" />:
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="2">
							<fo:block font-size="10pt" padding-top="0.15cm">
								<xsl:value-of select="it-print-labels/txt-outlet"/><xsl:text>&#160;</xsl:text>
								<xsl:value-of select="it-head-tO/from-outlet"/><xsl:text>&#160;&#160;</xsl:text>
								<xsl:value-of select="it-print-labels/txt-stock"/><xsl:text>&#160;</xsl:text>
								<xsl:value-of select="it-head-tO/from-stock"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="3">
							<fo:block font-weight="bold" font-size="10pt" padding-top="0.15cm">
								<xsl:value-of select="it-print-labels/txt-print"/>:
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="4">
							<fo:block font-size="10pt" padding-top="0.15cm">
								<xsl:value-of select="curr-time" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell column-number="1">
							<fo:block font-weight="bold" font-size="10pt" padding-top="0.15cm">
								<xsl:value-of select="it-print-labels/txt-to"/>:
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="2">
							<fo:block font-size="10pt" padding-top="0.15cm">
								<xsl:value-of select="it-print-labels/txt-outlet"/><xsl:text>&#160;</xsl:text>
								<xsl:value-of select="it-head-tO/to-outlet"/><xsl:text>&#160;&#160;</xsl:text>
								<xsl:value-of select="it-print-labels/txt-stock"/><xsl:text>&#160;</xsl:text>
								<xsl:value-of select="it-head-tO/to-stock"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell column-number="1">
							<fo:block font-weight="bold" font-size="10pt" padding-top="0.15cm">
								<xsl:value-of select="it-print-labels/txt-created-by"/>:
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="2">
							<fo:block font-size="10pt" padding-top="0.15cm">
								<xsl:value-of select="it-head-tO/creation-user"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="3">
							<fo:block font-weight="bold" font-size="10pt" padding-top="0.15cm">
								<xsl:value-of select="it-print-labels/txt-changed-by" />:
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="4">
							<fo:block font-size="10pt" padding-top="0.15cm">
								<xsl:value-of select="it-head-tO/created-user" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
			<fo:table width="100%" table-layout="fixed" padding-before="0.5cm">
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1">
							<!-- Headline -->
							<fo:block text-align="center" font-weight="bold" font-size="12pt" text-decoration="underline">
								<xsl:value-of select="it-print-labels/txt-not-posted"/> 
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:static-content>
		
		<!-- Footer -->
        <fo:static-content flow-name="xsl-region-after">
        
        	<fo:table width="100%" table-layout="fixed" padding-before="0.5cm">
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1">
							<!-- Headline -->
							<fo:block text-align="center" font-size="6pt"
							border-bottom-style="solid" border-width="1pt" border-color="black">
								<xsl:value-of select="it-print-labels/txt-page"/> 
								<xsl:text>&#160;</xsl:text>
								<fo:page-number/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
			<fo:table width="100%" table-layout="fixed" padding-before="0.10cm">
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="2"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="3"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="4"/>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell column-number="1">
								<fo:block text-align="left" font-size="6pt" padding-top="0.08cm">
									<xsl:value-of select="header-and-footer-data/current-outlet-details/location-name"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell column-number="2">
								<fo:block text-align="left" font-size="6pt" padding-top="0.08cm">
									<xsl:value-of select="it-print-labels/txt-bank-account"/>:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell column-number="3">
								<fo:block text-align="left" font-size="6pt" padding-top="0.08cm">
									<xsl:value-of select="it-print-labels/txt-bank-name"/>:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell column-number="4">
								<fo:block text-align="left" font-size="6pt" padding-top="0.08cm">
									<xsl:value-of select="header-and-footer-data/bank-details/bank-name"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>	
						<fo:table-row>
							<fo:table-cell column-number="1">
								<fo:block text-align="left" font-size="6pt" padding-top="0.08cm">
									<xsl:value-of select="header-and-footer-data/header-address/city"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell column-number="3">
								<fo:block text-align="left" font-size="6pt" padding-top="0.08cm">
									<xsl:value-of select="it-print-labels/txt-acc-no"/>:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell column-number="4">
								<fo:block text-align="left" font-size="6pt" padding-top="0.08cm">
									<xsl:value-of select="header-and-footer-data/bank-details/bank-acc-no"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell column-number="1">
								<fo:block text-align="left" font-size="6pt" padding-top="0.08cm">
									<xsl:value-of select="it-print-labels/txt-trade-reg-no"/>: 
									<xsl:value-of select="header-and-footer-data/current-outlet-details/trade-reg-no"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell column-number="3">
								<fo:block text-align="left" font-size="6pt" padding-top="0.08cm">
									<xsl:value-of select="it-print-labels/txt-bank-no"/>:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell column-number="4">
								<fo:block text-align="left" font-size="6pt" padding-top="0.08cm">
									<xsl:value-of select="header-and-footer-data/bank-details/bank-no"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell column-number="1">
								<fo:block text-align="left" font-size="6pt" padding-top="0.08cm">
									<xsl:value-of select="it-print-labels/txt-reg-court"/>: 
									<xsl:value-of select="header-and-footer-data/current-outlet-details/reg-court"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell column-number="3">
								<fo:block text-align="left" font-size="6pt" padding-top="0.08cm">
									<xsl:value-of select="it-print-labels/txt-iBAN"/>:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell column-number="4">
								<fo:block text-align="left" font-size="6pt" padding-top="0.08cm">
									<xsl:value-of select="header-and-footer-data/bank-details/iban"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell column-number="3">
								<fo:block text-align="left" font-size="6pt" padding-top="0.08cm">
									<xsl:value-of select="it-print-labels/txt-bank-ident-code"/>:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell column-number="4">
								<fo:block text-align="left" font-size="6pt" padding-top="0.08cm">
									<xsl:value-of select="header-and-footer-data/bank-details/bank-ident-code"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
			</fo:table>
			<fo:table width="100%" table-layout="fixed" padding-before="0.2cm">
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1">
							<!-- Headline -->
							<fo:block text-align="center" font-size="6pt">
								<xsl:value-of select="it-print-labels/txt-managing-directors"/>: 
								<xsl:text>  </xsl:text>
								<xsl:value-of select="header-and-footer-data/concatenated-chairman-names"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
        </fo:static-content>
	</xsl:template>	
	
	<xsl:template match="it-print-head-dOM">
		<fo:root hyphenate="true">
			<xsl:call-template name="pageDefinitions" />
			<fo:page-sequence master-reference="A4-portrait">
				<xsl:call-template name="headerAndFooter" />
					<fo:flow flow-name="xsl-region-body">
						<fo:table width="100%" table-layout="fixed" padding-before="0.15cm">
				            <fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
            				<fo:table-column column-width="proportional-column-width(2.5)" column-number="2"/>
				            <fo:table-column column-width="proportional-column-width(2.5)" column-number="3"/>
				            <fo:table-column column-width="proportional-column-width(3.5)" column-number="4"/> 
				            <fo:table-column column-width="proportional-column-width(1.5)" column-number="5"/>
				            <fo:table-column column-width="proportional-column-width(1.5)" column-number="6"/>
				            <fo:table-column column-width="proportional-column-width(1)" column-number="7"/>
				            <fo:table-header>
				              <fo:table-row text-align="center" font-size="9pt" font-weight="bold">
				                <fo:table-cell column-number="1">
				                   <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  padding-before="0.15cm" border-top-style="solid" 
				                  border-width="1pt" border-color="black">
				               		<xsl:value-of select="it-print-labels/txt-set-iD" />
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="2">
				                   <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  padding-before="0.15cm" border-top-style="solid" 
				                  border-width="1pt" border-color="black">
				               		<xsl:value-of select="it-print-labels/txt-goods-group" />
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="3">
				                   <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  padding-before="0.15cm" border-top-style="solid" 
				                  border-width="1pt" border-color="black">
				               		<xsl:value-of select="it-print-labels/txt-prod-iD" />
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="4">
				                   <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  padding-before="0.15cm" border-top-style="solid" 
				                  border-width="1pt" border-color="black">
				               		<xsl:value-of select="it-print-labels/txt-prod-desc" />
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="5">
				                   <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  padding-before="0.15cm" border-top-style="solid" 
				                  border-width="1pt" border-color="black">
				               		<xsl:value-of select="it-print-labels/txt-quantity" />
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="6">
				                   <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  padding-before="0.15cm" border-top-style="solid" 
				                  border-width="1pt" border-color="black">
				               		<xsl:value-of select="it-print-labels/txt-open" />
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="7">
				                   <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  padding-before="0.15cm" border-top-style="solid" 
				                  border-width="1pt" border-color="black">
				               	  </fo:block>	
				                </fo:table-cell>
				              </fo:table-row>
				              <fo:table-row text-align="center" font-size="9pt" font-weight="bold">
				                <fo:table-cell column-number="1">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  padding-before="0.15cm" border-top-style="solid" 
				                 border-width="1pt" border-color="black">
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="2">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  padding-before="0.15cm" border-top-style="solid" 
				                  border-width="1pt" border-color="black">
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="3">
				                   <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  padding-before="0.15cm" border-top-style="solid" 
				                  border-width="1pt" border-color="black">
				               	  </fo:block>		
				                </fo:table-cell>
				                <fo:table-cell column-number="4">
				                   <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  padding-before="0.15cm" border-top-style="solid" 
				                  border-width="1pt" border-color="black">
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="5">
				                   <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  padding-before="0.15cm" border-top-style="solid" 
				                  border-width="1pt" border-color="black">
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="6">
				                   <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  padding-before="0.15cm" border-top-style="solid" 
				                  border-width="1pt" border-color="black">
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="7">
				                   <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  padding-before="0.15cm" border-top-style="solid" 
				                  border-width="1pt" border-color="black">
				               	  </fo:block>	
				                </fo:table-cell>
				              </fo:table-row>
				          	</fo:table-header>
				          	<fo:table-body>				          	
				          		<xsl:for-each select="it-print-positions">				          		
				          			<fo:table-row font-size="9pt" keep-together="always">
					                 <fo:table-cell column-number="1" text-align="left" padding-before="0.15cm">
					                    <fo:block>
					                      <xsl:value-of select="set-iD" />
					                    </fo:block>
					                  </fo:table-cell>
					                  <fo:table-cell column-number="2" text-align="left" padding-before="0.15cm">
					                    <fo:block>
					                      <xsl:value-of select="goods-group" />
					                    </fo:block>
					                  </fo:table-cell>
					                  <fo:table-cell column-number="3" text-align="left" padding-before="0.15cm">
					                    <fo:block>
					                      <xsl:value-of select="prod-iD" />
					                    </fo:block>
					                  </fo:table-cell>	
					                  <fo:table-cell column-number="4" text-align="left" padding-before="0.15cm">
					                    <fo:block>
					                      <xsl:value-of select="prod-name" />
					                    </fo:block>
					                  </fo:table-cell>	
					                  <fo:table-cell column-number="5" text-align="left" padding-before="0.15cm">
					                    <fo:block>
					                      <xsl:value-of select="qty-total" />
					                    </fo:block>
					                  </fo:table-cell>	
					                  <fo:table-cell column-number="6" text-align="left" padding-before="0.15cm">
					                    <fo:block>
					                      <xsl:value-of select="qty-open" />
					                    </fo:block>
					                  </fo:table-cell>
					                  <fo:table-cell column-number="7">
				                  		<fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  			padding-before="0.18cm" border-color="black" border-style="solid" border-width="1pt">
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
										<!-- Headline -->
										<fo:block text-align="center" font-size="10pt">
											<xsl:text>***</xsl:text><xsl:value-of select="it-print-labels/txt-end"/><xsl:text>***</xsl:text>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
						<fo:block id="lastpage"/>
				</fo:flow>					
			</fo:page-sequence> 
		</fo:root>
	</xsl:template>
</xsl:stylesheet>