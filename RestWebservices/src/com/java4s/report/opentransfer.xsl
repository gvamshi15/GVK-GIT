<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/TR/xhtml1/strict"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java">

	<xsl:template name="pageDefinitions">
		<xsl:attribute name="language"></xsl:attribute>
		<fo:layout-master-set>
			<fo:simple-page-master master-name="A4-portrait" 
									page-width="29.7cm" 
									page-height="21cm" 
									margin-top="1cm" 
									margin-bottom="1cm" 
									margin-left="0.5cm" 
									margin-right="0.5cm">
				<fo:region-before extent="2cm"/>
				<fo:region-body margin-top="1cm" margin-bottom="2cm"/>
				<fo:region-after extent="2cm"/>
			</fo:simple-page-master>
		</fo:layout-master-set>
	</xsl:template>

	<xsl:template name="headerAndFooter">
		<fo:static-content flow-name="xsl-region-before">	
			<fo:table width="100%" table-layout="fixed">			
			    <fo:table-column column-width="proportional-column-width(0.5)" column-number="1"/>
				<fo:table-column column-width="proportional-column-width(15)" column-number="2"/>
							
				<fo:table-body>
					<fo:table-row>
					    <fo:table-cell column-number="1" text-align="left" padding-before="0.15cm">
					       <fo:block>
					       </fo:block>
					    </fo:table-cell>
						<fo:table-cell column-number="2">
							<fo:block text-align="left" font-weight="bold" font-size="20pt">
								<xsl:value-of select="txt-open-transfers"/>
							</fo:block>
						</fo:table-cell>						
					</fo:table-row>
				</fo:table-body>			
			</fo:table>
    	</fo:static-content>  	
	</xsl:template>	
	
	<xsl:template match="print-transfer-dOM">
		<fo:root hyphenate="true">
			<xsl:call-template name="pageDefinitions"/>			
			<fo:page-sequence master-reference="A4-portrait">
			
					<xsl:call-template name="headerAndFooter"/>
					<fo:flow flow-name="xsl-region-body">
					
					<xsl:if test="outgoing-transfers">
						<fo:table width="100%" table-layout="fixed" padding-before="1cm">
				            <fo:table-column column-width="proportional-column-width(6)" column-number="1"/>
            				<fo:table-column column-width="proportional-column-width(6)" column-number="2"/>
				            <fo:table-column column-width="proportional-column-width(5)" column-number="3"/>
				            <fo:table-column column-width="proportional-column-width(10)" column-number="4"/>
				            <fo:table-column column-width="proportional-column-width(5)" column-number="5"/>
				            <fo:table-column column-width="proportional-column-width(3)" column-number="6"/>
				            <fo:table-column column-width="proportional-column-width(6)" column-number="7"/>
				            <fo:table-column column-width="proportional-column-width(10)" column-number="8"/>
				            <fo:table-column column-width="proportional-column-width(6)" column-number="9"/>
				            <fo:table-column column-width="proportional-column-width(6.5)" column-number="10"/>
				            <fo:table-column column-width="proportional-column-width(5)" column-number="11"/>
				            				            
				            <fo:table-header>
				              <fo:table-row text-align="center" font-size="9pt" font-weight="bold">
				                <fo:table-cell column-number="1">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-request-no"/>
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="2">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-order-date"/>
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="3">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-prod-no"/>
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="4">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-prod-name"/>
				               	  </fo:block>	
				                </fo:table-cell>	
				                <fo:table-cell column-number="5">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-quantity"/>
				               	  </fo:block>	
				                </fo:table-cell>	
				                <fo:table-cell column-number="6">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-type"/>
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="7">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-supplier-no"/>
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="8">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-supplier-name"/>
				               	  </fo:block>	
				                </fo:table-cell>	
				                <fo:table-cell column-number="9">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-delivery-date"/>
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="10">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-contact"/>
				               	  </fo:block>	
				                </fo:table-cell>	  
				                <fo:table-cell column-number="11">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               	  </fo:block>	
				                </fo:table-cell>              
				              </fo:table-row>
				              
				              <fo:table-row>
				          		  <fo:table-cell column-number="1">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="2">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="3">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="4">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="5">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="6">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="7">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="8">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="9">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="10">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="11">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								</fo:table-row>              
				          	</fo:table-header>
				          	
				          	<fo:table-body>              			          	
				          		<xsl:for-each select="outgoing-transfers">				          		
				          			<fo:table-row font-size="9pt" keep-together="always">
					                  <fo:table-cell column-number="1" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="request-no"/>
					                    </fo:block>
					                  </fo:table-cell>
					                  <fo:table-cell column-number="2" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="order-date"/>
					                    </fo:block>
					                  </fo:table-cell>	
					                  <fo:table-cell column-number="3" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="prod-no"/>
					                    </fo:block>
					                  </fo:table-cell>	
					                  <fo:table-cell column-number="4" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="prod-name"/>
					                    </fo:block>
					                  </fo:table-cell>
					                  <fo:table-cell column-number="5" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="quantity"/>
					                    </fo:block>
					                  </fo:table-cell>
					                  <fo:table-cell column-number="6" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="type"/>
					                    </fo:block>
					                  </fo:table-cell>
					                  <fo:table-cell column-number="7" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="supplier-no"/>
					                    </fo:block>
					                  </fo:table-cell>
					                  <fo:table-cell column-number="8" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="supplier-name"/>
					                    </fo:block>
					                  </fo:table-cell>	
					                  <fo:table-cell column-number="9" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="delivery-date"/>
					                    </fo:block>
					                  </fo:table-cell>
					                  <fo:table-cell column-number="10" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="contact"/>
					                    </fo:block>
					                  </fo:table-cell>
					                  <fo:table-cell column-number="11" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                    </fo:block>
					                  </fo:table-cell>					                  
					                </fo:table-row>				          		
				          		</xsl:for-each>
				          		
				          		<fo:table-row>
				          		  <fo:table-cell column-number="1">
									   <fo:block text-align="center" border-top-style="solid">										
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="2">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="3">
									   <fo:block text-align="center" border-top-style="solid">	
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="4">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="5">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="6">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="7">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="8">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="9">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="10">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="11">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								</fo:table-row>				          					          		
				          </fo:table-body>				          	
					</fo:table>
				</xsl:if>
											
				<xsl:if test="inhouse-transfers">
					<fo:table width="100%" table-layout="fixed" padding-before="1cm"> 
				            <fo:table-column column-width="proportional-column-width(6)" column-number="1"/>
            				<fo:table-column column-width="proportional-column-width(6)" column-number="2"/>
				            <fo:table-column column-width="proportional-column-width(5)" column-number="3"/>
				            <fo:table-column column-width="proportional-column-width(10)" column-number="4"/>
				            <fo:table-column column-width="proportional-column-width(5)" column-number="5"/>
				            <fo:table-column column-width="proportional-column-width(3)" column-number="6"/>
				            <fo:table-column column-width="proportional-column-width(6)" column-number="7"/>
				            <fo:table-column column-width="proportional-column-width(10)" column-number="8"/>
				            <fo:table-column column-width="proportional-column-width(6)" column-number="9"/>
				            <fo:table-column column-width="proportional-column-width(6.5)" column-number="10"/>
				            <fo:table-column column-width="proportional-column-width(5)" column-number="11"/>
				            				            
				            <fo:table-header>
				              <fo:table-row text-align="center" font-size="9pt" font-weight="bold">
				                <fo:table-cell column-number="1">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-trans-no"/>
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="2">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-create-date"/>
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="3">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-prod-no"/>
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="4">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-prod-name"/>
				               	  </fo:block>	
				                </fo:table-cell>	
				                <fo:table-cell column-number="5">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-quantity"/>
				               	  </fo:block>	
				                </fo:table-cell>	
				                <fo:table-cell column-number="6">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-type"/>
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="7">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-from-stock-no"/>
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="8">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-from-stock-name"/>
				               	  </fo:block>	
				                </fo:table-cell>	
				                <fo:table-cell column-number="9">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-after-stock-no"/>
				               	  </fo:block>	
				                </fo:table-cell>
				                <fo:table-cell column-number="10">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-after-stock-name"/>
				               	  </fo:block>	
				                </fo:table-cell>	
				                <fo:table-cell column-number="11">
				                  <fo:block text-align="left" font-size="9pt" font-weight="bold" 
				                  	padding-before="0.15cm" border-top-style="none" 
				                  	border-width="1pt" border-color="black">
				               		<xsl:value-of select="txt-created"/>
				               	  </fo:block>	
				                </fo:table-cell>	                                
				              </fo:table-row>
				              
				              <fo:table-row>
				          		  <fo:table-cell column-number="1">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="2">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="3">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="4">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="5">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="6">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="7">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="8">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="9">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="10">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="11">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								</fo:table-row>       				              
				          	</fo:table-header>				          	
				            
				            <fo:table-body>   	
				          		<xsl:for-each select="inhouse-transfers">				          		
				          			<fo:table-row font-size="9pt" keep-together="always">
					                  <fo:table-cell column-number="1" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="trans-no"/>
					                    </fo:block>
					                  </fo:table-cell>
					                  <fo:table-cell column-number="2" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="create-date"/>
					                    </fo:block>
					                  </fo:table-cell>	
					                  <fo:table-cell column-number="3" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="prod-no"/>
					                    </fo:block>
					                  </fo:table-cell>	
					                  <fo:table-cell column-number="4" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="prod-name"/>
					                    </fo:block>
					                  </fo:table-cell>
					                  <fo:table-cell column-number="5" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="quantity"/>
					                    </fo:block>
					                  </fo:table-cell>
					                  <fo:table-cell column-number="6" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="type"/>
					                    </fo:block>
					                  </fo:table-cell>
					                  <fo:table-cell column-number="7" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="from-stock-no"/>
					                    </fo:block>
					                  </fo:table-cell>
					                  <fo:table-cell column-number="8" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="from-stock-name"/>
					                    </fo:block>
					                  </fo:table-cell>	
					                  <fo:table-cell column-number="9" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="after-stock-no"/>
					                    </fo:block>
					                  </fo:table-cell>
					                  <fo:table-cell column-number="10" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="after-stock-name"/>
					                    </fo:block>
					                  </fo:table-cell>	
					                  <fo:table-cell column-number="11" text-align="left" padding-before="0.05cm">
					                    <fo:block>
					                      <xsl:value-of select="created-by"/>
					                    </fo:block>
					                  </fo:table-cell>					                  
					                </fo:table-row>				          		
				          		</xsl:for-each>
				          		
				                <fo:table-row>
				          		  <fo:table-cell column-number="1">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="2">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="3">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="4">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="5">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="6">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="7">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="8">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="9">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="10">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								  <fo:table-cell column-number="11">
									   <fo:block text-align="center" border-top-style="solid">											
									   </fo:block>
								  </fo:table-cell>
								</fo:table-row>		          		
				          	</fo:table-body>				          	
					   </fo:table>
				     </xsl:if> 
				
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>		
	
</xsl:stylesheet>