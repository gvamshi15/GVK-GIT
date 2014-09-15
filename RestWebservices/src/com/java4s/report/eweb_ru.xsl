<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/TR/xhtml1/strict"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java">
  
<xsl:param name="body.font.family">Cyrillic</xsl:param>
	<xsl:template name="pageDefinitions">
		<xsl:attribute name="language"></xsl:attribute>
		<fo:layout-master-set>
			<fo:simple-page-master master-name="A4-portrait" 
									page-width="21cm" 
									page-height="29.7cm" 
									margin-top="1cm" 
									margin-bottom="1cm" 
									margin-left="2cm" 
									margin-right="1cm">
				<!-- BFT 241351 & 245382, Srivaths, 24.03.08, The length of the region-before and region-body has been increased -->
				<fo:region-before extent="10.4cm"/>
				<fo:region-body margin-top="10.5cm" margin-bottom="2.5cm"/>
				<!-- EOC - BFT 241351 & 245382, Srivaths, 24.03.08 -->
				<fo:region-after extent="2cm"/>
			</fo:simple-page-master>
		</fo:layout-master-set>
	</xsl:template>
		
	<xsl:template name="headerAndFooter">
		<xsl:param name="title"/>
		<xsl:param name="line1"/>
		<xsl:param name="line2"/>
		<xsl:param name="line3"/>
		
		<!-- Header -->
		<fo:static-content flow-name="xsl-region-before">
			<!-- common Header -->
			
			<fo:table width="100%" table-layout="fixed">
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="2"/>
				
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1">
							<fo:block text-align="left" font-weight="bold" font-size="14pt" text-decoration="underline">
								<xsl:value-of select="company"/>
							</fo:block>
							<fo:block text-align="left" font-weight="bold" font-size="10pt">
								<xsl:value-of select="adress"/>
							</fo:block>
							<fo:block text-align="left" font-weight="bold" font-size="10pt">
								<xsl:value-of select="street"/>
							</fo:block>
							<!-- BFT 252425 , 14.05.08, Srivaths, Street 2 detail added -->
							<fo:block text-align="left" font-weight="bold" font-size="10pt">
								<xsl:value-of select="street2"/>
							</fo:block>
							<!-- EOC, BFT 252425 , 14.05.08, Srivaths-->
						</fo:table-cell>
						<fo:table-cell column-number="2">
							<fo:block/>
							<fo:block text-align="right" font-weight="bold" font-size="14pt">
								<!-- BFT 252762 , 04.06.08, Srivaths, New label inserted for the text PAGE-->
								<!-- <xsl:text>Seite </xsl:text> -->
								<xsl:value-of select="txt-seite"/>
								<xsl:text> </xsl:text>
								<!-- EOC, BFT 252762 , 04.06.08, Srivaths-->
								<fo:page-number/>
							</fo:block>
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
			
			<fo:table width="100%" table-layout="fixed" padding-before="0.7cm">
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="2"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="3"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="4"/>
				
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1">
							<fo:block text-align="left" font-size="10pt">
								<!--  BFT 241351 & 245382, Srivaths, 24.03.08, Adding a colon after each heading  -->
								<xsl:value-of select="txt-bearbeiter"/>
								<xsl:text>:  </xsl:text>
								<!-- EOC, BFT 241351 & 245382, Srivaths, 24.03.08 -->
							</fo:block>
							<fo:block text-align="left" font-size="10pt">
								<!--  BFT 241351 & 245382, Srivaths, 24.03.08, Adding a colon after each heading  -->
								<xsl:value-of select="txt-annahme"/>
								<xsl:text>:  </xsl:text>
								<!-- EOC, BFT 241351 & 245382, Srivaths, 24.03.08 -->
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="2" font-weight="bold">
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="worker"/>
							</fo:block>
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="market"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="3">
							<fo:block text-align="left" font-size="10pt">
								<!--  BFT 241351 & 245382, Srivaths, 24.03.08, Adding a colon after each heading  -->
								<xsl:value-of select="txt-lieferung-nr"/>
								<xsl:text>:  </xsl:text>
								<!-- EOC, BFT 241351 & 245382, Srivaths, 24.03.08 -->
							</fo:block>
							<fo:block text-align="left" font-size="10pt">
								<!--  BFT 241351 & 245382, Srivaths, 24.03.08, Adding a colon after each heading  -->
								<xsl:value-of select="txt-sendung-nr"/>
								<xsl:text>:  </xsl:text>
								<!-- EOC, BFT 241351 & 245382, Srivaths, 24.03.08 -->
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="4" font-weight="bold">
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="fracht-no"/>
							</fo:block>
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="sendung-no"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
			
			<fo:table width="100%" table-layout="fixed" padding-before="1cm">
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="2"/>
				
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1">
							<fo:block text-align="left" font-weight="bold" font-size="14pt">
								<xsl:value-of select="txt-warenannahme"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="2">
							<fo:block text-align="right" font-weight="bold" font-size="12pt">
								<xsl:value-of select="now"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row height="8mm">
						<fo:table-cell column-number="2" padding-before="3mm">
							<!--Srivaths, BFT 252425 , 14.05.08, fix for printing the below value-->
							<fo:block text-align="right" font-weight="bold" font-size="12pt">
								<xsl:value-of select="txt-verweigert"/>
								<!--EOC, Srivaths, BFT 252425 , 14.05.08-->
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row height="5mm">
						<fo:table-cell column-number="2">
							<!--Srivaths, BFT 252425 , 14.05.08, fix for printing the below value-->
							<fo:block text-align="right" font-size="10pt">
								<xsl:value-of select="txt-grund"/>
								<xsl:value-of select="grund"/>
								<!--EOC, Srivaths, BFT 252425 , 14.05.08-->
							</fo:block>
						</fo:table-cell>

					</fo:table-row>
					
				</fo:table-body>
			</fo:table>

			<fo:table width="100%" table-layout="fixed" padding-before="3mm" font-size="10pt">
				<fo:table-column column-width="proportional-column-width(5)" column-number="1"/>
				<fo:table-column column-width="proportional-column-width(4)" column-number="2"/>
				<fo:table-column column-width="proportional-column-width(6)" column-number="3"/>
				<fo:table-column column-width="proportional-column-width(6)" column-number="4"/>
				<fo:table-column column-width="proportional-column-width(6)" column-number="5"/>
				<fo:table-column column-width="proportional-column-width(6)" column-number="6"/>
				<fo:table-column column-width="proportional-column-width(4)" column-number="7"/>
				<fo:table-column column-width="proportional-column-width(2)" column-number="8"/>
				
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1">
							<fo:block text-align="right">
								<xsl:value-of select="txt-spedition"/>
								<xsl:text>:  </xsl:text>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="2">
							<fo:block font-weight="bold">
								<xsl:value-of select="agency-name"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="3">
							<fo:block text-align="right">
								<xsl:value-of select="txt-fahrer"/>
								<xsl:text>:  </xsl:text>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="4">
							<fo:block font-weight="bold">
								<xsl:value-of select="driver-name"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="5">
							<fo:block text-align="right">
								<xsl:value-of select="txt-fahrzeug"/>
								<xsl:text>:  </xsl:text>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="6">
							<fo:block font-weight="bold">
								<xsl:value-of select="vehicle"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="7">
							<fo:block text-align="right">
								<xsl:value-of select="txt-positionen"/>
								<xsl:text>:  </xsl:text>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="8">
							<fo:block font-weight="bold">
								<xsl:value-of select="positionen"/>
							</fo:block>
						</fo:table-cell>
						
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell column-number="1" number-columns-spanned="7" padding-before="5mm">
							<fo:block>
								<xsl:value-of select="description"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
			
			
			<!-- Custom Header -->
	</fo:static-content>




		<!-- Footer -->
        <fo:static-content flow-name="xsl-region-after">
			<fo:table width="100%" table-layout="fixed" padding-before="1cm">
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1">
							<fo:block text-align="left" font-weight="bold" font-size="14pt">
								<xsl:value-of select="txt-exemplare"/>
								<xsl:text>  </xsl:text>
								<xsl:value-of select="exemplar"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
			

        </fo:static-content>
	</xsl:template>

  <xsl:template match="print-tO">
    <fo:root font-family = "Cyrillic" hyphenate="true">
      <xsl:call-template name="pageDefinitions"/>
		<fo:page-sequence master-reference="A4-portrait">	
        
		<!-- header -->
		<xsl:call-template name="headerAndFooter">
			<xsl:with-param name="title" select="reportHeader"/>
		</xsl:call-template>

        <!-- Content -->
         <fo:flow flow-name="xsl-region-body">    

          <fo:table width="100%" table-layout="fixed" padding-before="1cm">
            <fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
            <!-- BFT 276355, Increased the column width of barcode -->
            <fo:table-column column-width="proportional-column-width(3.25)" column-number="2"/>
            <fo:table-column column-width="proportional-column-width(1.5)" column-number="3"/>
            <fo:table-column column-width="proportional-column-width(3)" column-number="4"/> 
            <fo:table-column column-width="proportional-column-width(3)" column-number="5"/>
            
            <fo:table-header>
              <fo:table-row text-align="center" font-size="9pt" font-weight="bold">
                <fo:table-cell column-number="1">
                  <!-- Srivaths , BFT 241351 & 245382, Removing border-bottom-style=solid -->
                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid"  border-width="1pt" border-color="black">
                  <!-- EOC, Srivaths , BFT 241351 & 245382 -->
               		<xsl:value-of select="txt-position"/>
               	  </fo:block>	
                </fo:table-cell>
                <fo:table-cell column-number="2">
                  <!-- Srivaths , BFT 241351 & 245382, Removing border-bottom-style=solid -->
                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid"  border-width="1pt" border-color="black">
               	  <!-- EOC, Srivaths , BFT 241351 & 245382 -->
               		<xsl:value-of select="txt-barcode"/>
               	  </fo:block>	
                </fo:table-cell>
                <fo:table-cell column-number="3">
                  <!-- Srivaths , BFT 241351 & 245382, Removing border-bottom-style=solid -->
                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid"  border-width="1pt" border-color="black">
               	  <!-- EOC, Srivaths , BFT 241351 & 245382 -->
               		<xsl:value-of select="txt-beschaedigt"/>
               	  </fo:block>	
               	</fo:table-cell>
                <fo:table-cell column-number="4">
                  <!-- Srivaths , BFT 241351 & 245382, Removing border-bottom-style=solid -->
                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid"  border-width="1pt" border-color="black">
              	  <!-- EOC, Srivaths , BFT 241351 & 245382 -->
              			<xsl:value-of select="txt-beschreibung"/>
               	  </fo:block>	
               	</fo:table-cell>
                <fo:table-cell column-number="5">
                  <!-- Srivaths , BFT 241351 & 245382, Removing border-bottom-style=solid -->
                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid"  border-width="1pt" border-color="black">
              	  <!-- EOC, Srivaths , BFT 241351 & 245382 -->
              			<xsl:value-of select="txt-aVGrund"/>
	              </fo:block>	
                </fo:table-cell>
              </fo:table-row>
              
              <!-- BFT 252425 , 14.05.08, Srivaths, New row added to make the heading 'Reason for refusal of acceptance' appear in one line -->
              <!-- BFT 241351 & 245382, Srivaths, 24.03.08, New row added to make the heading 'Reason for refusal of acceptance' appear in one line -->
                <fo:table-row text-align="center" font-size="9pt" font-weight="bold">
                <fo:table-cell column-number="1">
                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm"  border-bottom-style="solid" border-width="1pt" border-color="black">
               	  </fo:block>	
                </fo:table-cell>
                <fo:table-cell column-number="2">
                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm"  border-bottom-style="solid" border-width="1pt" border-color="black">
               		
               	  </fo:block>	
                </fo:table-cell>
                <fo:table-cell column-number="3">
                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm"  border-bottom-style="solid" border-width="1pt" border-color="black">
               		
               	  </fo:block>	
               	</fo:table-cell>
                <fo:table-cell column-number="4">
                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm"  border-bottom-style="solid" border-width="1pt" border-color="black">
              			
               	  </fo:block>	
               	</fo:table-cell>
                <fo:table-cell column-number="5">
                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm"  border-bottom-style="solid" border-width="1pt" border-color="black">
              			
	              </fo:block>	
                </fo:table-cell>
              </fo:table-row>
              <!-- EOC, BFT 241351 & 245382, Srivaths, 24.03.08 -->
              <!-- EOC, BFT 252425 , 14.05.08, Srivaths -->
              
          	</fo:table-header>
          	
          	<fo:table-body>
              <xsl:for-each select="print-positions">
                <fo:table-row font-size="9pt" keep-together="always" border-bottom-style="dashed" border-width="1pt" border-color="black">
                  <xsl:attribute name="background-color">#E0E0E0</xsl:attribute>
                  <xsl:if test="position() mod 2 = 1">
        		   	<xsl:attribute name="background-color">#FFFFFF</xsl:attribute>
		          </xsl:if>
               
                  <fo:table-cell column-number="1" text-align="left" padding-before="2pt">
                    <fo:block>
                      <xsl:apply-templates select="pos-no"/>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell column-number="2" text-align="left" padding-before="2pt">
                    <fo:block>
                      <xsl:apply-templates select="barcode"/>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell column-number="3" text-align="left" padding-before="2pt">
                    <fo:block>
                      <xsl:apply-templates select="acceptance"/>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell column-number="4" text-align="left" padding-before="2pt">
                    <fo:block>
                      <xsl:apply-templates select="description"/>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell column-number="5" text-align="left" padding-before="2pt">
                    <fo:block>
                      <xsl:apply-templates select="reason"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:for-each>
            </fo:table-body>

          </fo:table>
          
  			<fo:table width="100%" table-layout="fixed">
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				<fo:table-column column-width="proportional-column-width(3)" column-number="2"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="3"/>
				<fo:table-column column-width="proportional-column-width(3)" column-number="4"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="5"/>
				
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1" border-top-style="double" border-width="1pt" border-color="black"/>
						<fo:table-cell column-number="2" border-top-style="double" border-width="1pt" border-color="black"/>
						<fo:table-cell column-number="3" border-top-style="double" border-width="1pt" border-color="black"/>
						<fo:table-cell column-number="4" border-top-style="double" border-width="1pt" border-color="black"/>
						<fo:table-cell column-number="5" border-top-style="double" border-width="1pt" border-color="black"/>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell></fo:table-cell>
						<fo:table-cell column-number="2" padding-before="1cm">
							<fo:block text-align="left" font-weight="bold" font-size="10pt">
								<xsl:value-of select="txt-unterschrift-fahrer"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell></fo:table-cell>
						<fo:table-cell column-number="4" padding-before="1cm">
							<fo:block text-align="left" font-weight="bold" font-size="10pt">
								<xsl:value-of select="txt-unterschrift-erfasser"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<!-- BFT 263633, Insert driver's signature -->
					<fo:table-row>
						<fo:table-cell></fo:table-cell>
						<fo:table-cell column-number="2" padding-before="1cm">
							<fo:block>
								<xsl:variable name="signatureFile">
									<xsl:value-of select="full-path-of-signature-file" />
								</xsl:variable>
								<fo:external-graphic src="{$signatureFile}" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell></fo:table-cell>
						<fo:table-cell></fo:table-cell>
					</fo:table-row>
					<!-- EOC, BFT 263633 -->
				</fo:table-body>
			</fo:table>

          <fo:block id="lastpage"/>
		</fo:flow>    
		

      </fo:page-sequence>

    </fo:root>
  </xsl:template>
</xsl:stylesheet>
