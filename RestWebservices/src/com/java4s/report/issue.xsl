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
				<!-- BFT 248437, Thirumalesh, 20.5.08, Increased extent from 7 to 13 -->
				<fo:region-before extent="13cm"/>
				<!-- EOC, BFT 248437, Thirumalesh, 20.5.08 -->
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
							<!-- Marktadresse -->
							<fo:block text-align="left" font-weight="bold" font-size="12pt">
								<xsl:value-of select="document-header/market" />
							</fo:block>
							<!-- BFT 248437, Thirumalesh, 20.5.08, changing the order of occurrence of street and city details  --> 
							<fo:block text-align="left" font-weight="bold" font-size="12pt">
								<xsl:value-of select="document-header/street" />
							</fo:block>	
							<fo:block text-align="left" font-weight="bold" font-size="12pt">
								<xsl:value-of select="document-header/adress" />
							</fo:block>
							<!-- EOC, BFT 248437, Thirumalesh, 20.5.08-->
							
								<fo:block>&#xA0;</fo:block>
								
							
							<!-- BFT 248437, Thirumalesh, 20.5.08 -->
							<fo:block text-align="left" font-weight="bold" font-size="12pt">
								<xsl:value-of select="document-header/destination-company" />
								</fo:block>
							<fo:block text-align="left" font-weight="bold" font-size="12pt">
								<xsl:value-of select="document-header/destination-street" />
								
							</fo:block>
							<fo:block text-align="left" font-weight="bold" font-size="12pt">
								<xsl:value-of select="document-header/destination-city" />
							
							</fo:block>	
							<!-- EOC, BFT 248437, Thirumalesh, 20.5.08 -->					
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
							<!-- Bearbeiter -->
							<fo:block text-align="left" font-size="12pt">
								<xsl:value-of select="txt-bearbeitet-von" />: <xsl:value-of select="bearbeitet-von" />
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
			
			<fo:table width="100%" table-layout="fixed" padding-before="1cm">			
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="2"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="3"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="4"/>
				<!--  <fo:table-column column-width="proportional-column-width(1)" column-number="5"/>-->
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1">
							
							<fo:block></fo:block>
						
							<fo:block font-weight="bold">
								<xsl:value-of select="txt-spedition" />:
							</fo:block>
							<fo:block font-weight="bold">
								<xsl:value-of select="txt-abholer" />:
							</fo:block>
						</fo:table-cell>


						<fo:table-cell column-number="2">
							<fo:block>
								<xsl:value-of select="spedition" />
							</fo:block>
							<fo:block>
								<xsl:value-of select="abholer" />
							</fo:block>
						</fo:table-cell>


						<fo:table-cell column-number="3">
							<fo:block font-weight="bold">
								<xsl:value-of select="txt-nIF" />
							</fo:block>
							<fo:block font-weight="bold">
								<xsl:value-of select="txt-vehicle" />:
							</fo:block>
							<fo:block font-weight="bold">
								<xsl:value-of select="txt-rMA" />
							</fo:block>
						</fo:table-cell>


						<fo:table-cell column-number="4">
							<fo:block>
								<xsl:value-of select="nif" />
							</fo:block>
							<fo:block>
								<xsl:value-of select="vehicle" />
							</fo:block>
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
				            <!-- BFT 251406, Pari,17.02.10, Added new column for External parcel Id -->
				            <fo:table-column column-width="proportional-column-width(5)" column-number="3"/>
				            <!-- EOC, BFT 251406, Pari,17.02.10 -->
				            
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
				                <!-- BFT 251406, Pari,17.02.10, Added new label for External parcel Id -->
				                <fo:table-cell column-number="3">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" padding-before="0.5cm" border-top-style="solid" border-bottom-style="solid" border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-external-parcel-id" />
				               	  </fo:block>				               	  	
				                </fo:table-cell>
				                <!-- EOC, BFT 251406, Pari,17.02.10 -->				                
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
					                  <!-- BFT 251406, Pari,17.02.10, Added new display field for External parcel Id -->
					                  <fo:table-cell column-number="3" text-align="left" padding-before="2pt">
					                    <fo:block>
					                      <xsl:value-of select="external-parcel-id" />
					                    </fo:block>
					                  </fo:table-cell>	
					                 <!-- EOC, BFT 251406, Pari,17.02.10 -->				                  
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
											<!-- hier Bild mit Ueberschrift einfuegen -->
											<!-- MD DM 16/08/2007 Unterschrift ausgeblendet -->
											<!-- <xsl:value-of select="sign" /> -->
																						
											<xsl:variable name="signatureFile">
												<xsl:value-of select="full-path-of-signature-file" />
											</xsl:variable>
											
											<fo:external-graphic src="{$signatureFile}" />
											
											<!-- 
											<fo:block font-weight="bold">
												<xsl:value-of select="{$signFileLoc}" />:
											</fo:block>
											 -->
											 
											 <!-- 
											<fo:external-graphic>
												<xsl:attribute name="src">
													<xsl:value-of select="c:/test.png"/>
												</xsl:attribute>
											</fo:external-graphic>
											 -->
											
											<!-- Funzt so nicht! -->
											<!-- <fo:external-graphic src="{$signFileLoc}" /> -->
											
											<!-- Das funzt so: -->
											<!-- <fo:external-graphic src="c:/test.png" /> -->
											
											
											<!-- Lsg 1: funktioniert so nicht, mit Image-File gibt es keine Probleme 
											<fo:external-graphic src="data:image/gif;base64,R0lGODdhMAAwAPAAAAAAAP///ywAAAAAMAAwAAAC8IyPqcvt3wCcDkiLc7C0qwyGHhSWpjQu5yqmCYsapyuvUUlvONmOZtfzgFzByTB10QgxOR0TqBQejhRNzOfkVJ+5YiUqrXF5Y5lKh/DeuNcP5yLWGsEbtLiOSpa/TPg7JpJHxyendzWTBfX0cxOnKPjgBzi4diinWGdkF8kjdfnycQZXZeYGejmJlZeGl9i2icVqaNVailT6F5iJ90m6mvuTS4OK05M0vDk0Q4XUtwvKOzrcd3iq9uisF81M1OIcR7lEewwcLp7tuNNkM3uNna3F2JQFo97Vriy/Xl4/f1cf5VWzXyym7PHhhx4dbgYKAAA7" />
											 -->
											 
											<!-- Lsg 2: ueber SVG, funktioniert auch nicht, es wird ein Dummy-Bild generiert -->
											<!-- 
											<fo:instream-foreign-object content-height="1em">
											     <svg:svg xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" height="100px" width="200px">
											    	 <svg:image width="100px" height="100px" xlink:href="c:/Dokumente und Einstellungen/mittmann/Desktop/test.png" />
											     </svg:svg>
											</fo:instream-foreign-object>
											-->
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