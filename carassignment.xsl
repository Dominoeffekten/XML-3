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
			</head>
			<body>
			<h1 style="text-align: center;">Nice cars</h1>
				<tabel>
					<tr style="outline: 1px solid;">
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
						<tr style="outline: 1px solid;">
							<td><xsl:value-of select="@manufacturer"/></td>
							<td><xsl:value-of select="@model"/></td>
							<td><xsl:value-of select="@year"/></td>
							<td><xsl:value-of select="meter"/></td>
							<td> 
								<xsl:attribute name="bgcolor"><xsl:value-of select="color"/> </xsl:attribute>
							</td>
							<td><xsl:value-of select="price"/></td>
							<td>
								<xsl:for-each select="car/dealersecurity">
									
								</xsl:for-each>
							</td>
						</tr>

					</xsl:for-each>
				</tabel>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="car/dealersecurity">
    <xsl:choose>
      <xsl:when test="@buyback='yes'">&#10004;</xsl:when>
    </xsl:choose>
  </xsl:template>


</xsl:stylesheet>