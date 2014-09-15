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
			<fo:simple-page-master master-name="A4-landscape" 
									page-width="29.7cm" 
									page-height="21cm"
									margin-top="1cm" 
									margin-bottom="1cm" 
									margin-left="2cm" 
									margin-right="1cm">
				<fo:region-before extent="2cm"/>
				<fo:region-body margin-top="2cm" margin-bottom="0.5cm"/>
				<fo:region-after extent="1cm"/>
			</fo:simple-page-master>
		</fo:layout-master-set>
	</xsl:template>

	<xsl:template name="header">

		<!-- Header -->
		<fo:static-content flow-name="xsl-region-before">

			<fo:table width="100%" table-layout="fixed">
				<fo:table-column column-width="proportional-column-width(1)" column-number="1" />
				
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="1">
							<fo:block text-align="left" font-weight="bold" font-size="18pt">
								<xsl:value-of select="txt-customer-orders" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
				
			</fo:table>			
		</fo:static-content>		
	</xsl:template>	
	
	<xsl:template match="print-customer-order-head-tO">
		<fo:root font-family = "Cyrillic" hyphenate="true">
			<xsl:call-template name="pageDefinitions" />
			<fo:page-sequence master-reference="A4-landscape">
				<xsl:call-template name="header" />
				<fo:flow flow-name="xsl-region-body">
					<fo:table width="100%" table-layout="fixed"
						padding-before="1cm">

						<fo:table-column
							column-width="proportional-column-width(4)" column-number="1" />
						<fo:table-column
							column-width="proportional-column-width(4)" column-number="2" />
						<fo:table-column
							column-width="proportional-column-width(5)" column-number="3" />
						<fo:table-column
							column-width="proportional-column-width(5)" column-number="4" />
						<fo:table-column
							column-width="proportional-column-width(3)" column-number="5" />
						<fo:table-column
							column-width="proportional-column-width(3)" column-number="6" />
						<fo:table-column
							column-width="proportional-column-width(5)" column-number="7" />
						<fo:table-column
							column-width="proportional-column-width(3)" column-number="8" />
						<fo:table-column
							column-width="proportional-column-width(5)" column-number="9" />
						<fo:table-column
							column-width="proportional-column-width(4)" column-number="10" />

						<fo:table-header>
							<fo:table-row text-align="center"
								font-size="8pt" font-weight="bold">
								<fo:table-cell column-number="1">
									<fo:block text-align="left"
										font-size="8pt" font-weight="bold" padding-before="0.5cm"
										border-top-style="solid" border-bottom-style="solid"
										border-width="1pt" border-color="black">
										<xsl:value-of
											select="txt-request-no" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="2">
									<fo:block text-align="left"
										font-size="8pt" font-weight="bold" padding-before="0.5cm"
										border-top-style="solid" border-bottom-style="solid"
										border-width="1pt" border-color="black">
										<xsl:value-of
											select="txt-pos-no" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="3">
									<fo:block text-align="left"
										font-size="8pt" font-weight="bold" padding-before="0.5cm"
										border-top-style="solid" border-bottom-style="solid"
										border-width="1pt" border-color="black">
										<xsl:value-of
											select="txt-processing-date" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="4">
									<fo:block text-align="left"
										font-size="8pt" font-weight="bold" padding-before="0.5cm"
										border-top-style="solid" border-bottom-style="solid"
										border-width="1pt" border-color="black">
										<xsl:value-of
											select="txt-product-name" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="5">
									<fo:block text-align="left"
										font-size="8pt" font-weight="bold" padding-before="0.5cm"
										border-top-style="solid" border-bottom-style="solid"
										border-width="1pt" border-color="black">
										<xsl:value-of
											select="txt-prod-no" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="6">
									<fo:block text-align="left"
										font-size="8pt" font-weight="bold" padding-before="0.5cm"
										border-top-style="solid" border-bottom-style="solid"
										border-width="1pt" border-color="black">
										<xsl:value-of
											select="txt-quantity" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="7">
									<fo:block text-align="left"
										font-size="8pt" font-weight="bold" padding-before="0.5cm"
										border-top-style="solid" border-bottom-style="solid"
										border-width="1pt" border-color="black">
										<xsl:value-of
											select="txt-customer-name" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="8">
									<fo:block text-align="left"
										font-size="8pt" font-weight="bold" padding-before="0.5cm"
										border-top-style="solid" border-bottom-style="solid"
										border-width="1pt" border-color="black">
										<xsl:value-of
											select="txt-supplier-no" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="9">
									<fo:block text-align="left"
										font-size="8pt" font-weight="bold" padding-before="0.5cm"
										border-top-style="solid" border-bottom-style="solid"
										border-width="1pt" border-color="black">
										<xsl:value-of
											select="txt-supplier-name" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="10">
									<fo:block text-align="left"
										font-size="8pt" font-weight="bold" padding-before="0.5cm"
										border-top-style="solid" border-bottom-style="solid"
										border-width="1pt" border-color="black">
										<xsl:value-of
											select="txt-supplier-city" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>

						
						<fo:table-body>
							<xsl:for-each
								select="print-customer-order-positons">
								<fo:table-row font-size="8pt" keep-together="always" border-bottom-style="dashed" border-width="1pt" border-color="black">									
									<fo:table-cell column-number="1"
										text-align="left" padding-before="2pt">
										<fo:block>
											<xsl:value-of
												select="order-no" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell column-number="2"
										text-align="left" padding-before="2pt">
										<fo:block>
											<xsl:value-of
												select="pos-no" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell column-number="3"
										text-align="left" padding-before="2pt">
										<fo:block>
											<xsl:value-of
												select="processing-date" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell column-number="4"
										text-align="left" padding-before="2pt">
										<fo:block>
											<xsl:value-of
												select="art-name"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell column-number="5"
										text-align="left" padding-before="2pt">
										<fo:block>
											<xsl:value-of
												select="art-no" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell column-number="6"
										text-align="left" padding-before="2pt">
										<fo:block>
											<xsl:value-of
												select="quantity" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell column-number="7"
										text-align="left" padding-before="2pt">
										<fo:block>
											<xsl:value-of
												select="customer-name" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell column-number="8"
										text-align="left" padding-before="2pt">
										<fo:block>
											<xsl:value-of
												select="supplier-no" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell column-number="9"
										text-align="left" padding-before="2pt">
										<fo:block>
											<xsl:value-of
												select="supplier-name" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell column-number="10"
										text-align="left" padding-before="2pt">
										<fo:block>
											<xsl:value-of
												select="supplier-city" />
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