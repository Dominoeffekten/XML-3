<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml"
				indent="yes"
				omit-xml-declaration="no"
	            doctype-system="about:legacy-compat"/>

	<!-- The following rule matches the root element,
		 irrespective of name,
	     and creates an html outline with an apply templates somewhere
	-->
	<xsl:template match="cars">
		<html>
			<head>
				<title>Cars</title>
				<meta charset="utf-8"/>
				<style>
					h1 {
						text-align: center;
					}
					td, th { 
						padding: 16px; 
						outline: 1px solid;
						text-align: center;
					}
				</style>
			</head>
			<body>
			<h1>Nice cars</h1>
				<tabel>
					<tr>
						<th>Maker</th>
						<th>Model</th>
						<th>Year</th>
						<th>KMs</th>
						<th>Color</th>
						<th>Price</th>
						<th>Warranty</th>
					</tr>
					<xsl:for-each select="car">
					<xsl:sort select="@manufacturer"/>
						<tr>
							<td><xsl:value-of select="@manufacturer"/></td>
							<td><xsl:value-of select="@model"/></td>
							<td><xsl:value-of select="@year"/></td>
							<td><xsl:value-of select="meter"/></td>
							<td> 
								<xsl:attribute name="bgcolor"><xsl:value-of select="color"/> </xsl:attribute>
							</td>
							<td><xsl:value-of select="price"/></td>
							<td style="text-align: center;">
								<xsl:choose>
									<xsl:when test="dealersecurity[@buyback='yes']">&#10004;</xsl:when>
								</xsl:choose>
							</td>
						</tr>
					</xsl:for-each>
					<tr>
						<td colspan="4">Average price</td>
						<td>DKR</td>
						<td><xsl:value-of select="sum(car/price)"/></td>
					</tr>
				</tabel>
				
			</body>
		</html>
	</xsl:template>


</xsl:stylesheet>