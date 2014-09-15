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
				<fo:region-before extent="7cm"/>
				<fo:region-body margin-top="7.5cm" margin-bottom="2.5cm"/>
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
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="street"/>
							</fo:block>
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="adress"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="2">
							<fo:block/>
							<fo:block text-align="right" font-size="14pt">
								<xsl:value-of select="txt-seite"/>
								<xsl:text> </xsl:text>
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
				<fo:table-column column-width="proportional-column-width(2)" column-number="4"/>
				
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1">
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="txt-ls-nr"/>
								<xsl:text>:  </xsl:text>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="2">
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="delivery-no"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="3">
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="txt-lief-nr"/>
								<xsl:text>:  </xsl:text>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="4">
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="supplier-no"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					
					<fo:table-row>
						<fo:table-cell column-number="1">
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="txt-we-datum"/>
								<xsl:text>:  </xsl:text>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="2">
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="start-date"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="3">
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="txt-lief-name"/>
								<xsl:text>:  </xsl:text>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="4">
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="supplier-name"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					
					<fo:table-row>
						<fo:table-cell column-number="1">
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="txt-bestell-nr"/>
								<xsl:text>:  </xsl:text>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="2">
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="order-no"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="3">
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="txt-web-nr"/>
								<xsl:text>:  </xsl:text>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="4">
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="web-no"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					
					<fo:table-row>
						<fo:table-cell column-number="1">
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="txt-buchungstyp"/>
								<xsl:text>:  </xsl:text>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="2">
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="order-type"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="3">
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="txt-lager-nr"/>
								<xsl:text>:  </xsl:text>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="4">
							<fo:block text-align="left" font-size="10pt">
								<xsl:value-of select="stock-no"/>
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
							<!-- BFT 257884, Arun, 28.04.10, Replacing the special character 'ü' by 'u' -->
							   <!--   <xsl:value-of select="txt-wareneingangsübersicht"/> -->
								<xsl:value-of select="txt-wareneingangsubersicht"/>
								<!-- EOC, BFT 257884, Arun -->
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="2">
							<fo:block text-align="right" font-weight="bold" font-size="12pt">
								<xsl:value-of select="now"/>
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

  <xsl:template match="print-delivery-overview-tO">
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
            <fo:table-column column-width="proportional-column-width(0.5)" column-number="1"/>
            <fo:table-column column-width="proportional-column-width(1)" column-number="2"/>
            <fo:table-column column-width="proportional-column-width(4)" column-number="3"/>
            <fo:table-column column-width="proportional-column-width(4)" column-number="4"/> 
            <fo:table-column column-width="proportional-column-width(1)" column-number="5"/>
            
            <fo:table-header>
              <fo:table-row text-align="center" font-size="9pt" font-weight="bold">
                <fo:table-cell column-number="1">
                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid"  border-width="1pt" border-color="black">
                  			<xsl:value-of select="txt-position"/>
               	  </fo:block>	
                </fo:table-cell>
                <fo:table-cell column-number="2">
                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid"  border-width="1pt" border-color="black">
               	   		<xsl:value-of select="txt-art-nr"/>
               	  </fo:block>	
                </fo:table-cell>
                <fo:table-cell column-number="3">
                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid"  border-width="1pt" border-color="black">
               	  		<xsl:value-of select="txt-artikel-bez"/>
               	  </fo:block>	
               	</fo:table-cell>
                <fo:table-cell column-number="4">
                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid"  border-width="1pt" border-color="black">
              	  		<xsl:value-of select="txt-hersteller"/>
               	  </fo:block>	
               	</fo:table-cell>
                <fo:table-cell column-number="5">
                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid"  border-width="1pt" border-color="black">
              	  		<xsl:value-of select="txt-menge"/>
	              </fo:block>	
                </fo:table-cell>
              </fo:table-row>
                                     
          	</fo:table-header>
          	
          	<fo:table-body>
              <xsl:for-each select="print-delivery-overview-positions">
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
                      <xsl:apply-templates select="art-no"/>
  				  </fo:block>
                  </fo:table-cell>
                  <fo:table-cell column-number="3" text-align="left" padding-before="2pt">
                    <fo:block>
                      <xsl:apply-templates select="art-descr"/>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell column-number="4" text-align="left" padding-before="2pt">
                    <fo:block>
                      <xsl:apply-templates select="manufacturer"/>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell column-number="5" text-align="left" padding-before="2pt">
                    <fo:block>
                      <xsl:apply-templates select="qty"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:for-each>
            </fo:table-body>

          </fo:table>
          
		  <fo:block>
		  	<fo:leader leader-length="21cm" leader-pattern="rule" rule-style="double" rule-thickness="2pt" color="black"/>
		  </fo:block>
  			
          <fo:block id="lastpage"/>
		</fo:flow>    
		

      </fo:page-sequence>

    </fo:root>
  </xsl:template>
</xsl:stylesheet>
