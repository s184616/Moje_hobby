<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html"/>

<xsl:template match="/">
	<html>
		<head>
			<meta charset="UTF-8" />
			<title>Moje hobby - Aktywność!</title>
			<meta name="viewport" content="width=device-width, initial-scale=1.0" />
			<link rel="stylesheet" type="text/css" href="main.css" />
		</head>
		<body>
			<div id="wrapper">
				<center>
					<h1>Moje hobby !</h1>
				</center>
				
				<h2>Strony</h2>
				<xsl:apply-templates select="Aktywnosc/strony/strona[@o='Moje hobby']"/>
				<xsl:apply-templates select="Aktywnosc/strony/strona[@o='Muzyka']"/>
			</div>
			
			<footer>
				<xsl:apply-templates select="Aktywnosc/autor"/>
			</footer>
		</body>
	</html>
</xsl:template>

<xsl:template match="autor">
	<xsl:variable name="moje_imie">
		<xsl:value-of select="imie"/>
	</xsl:variable>
	<xsl:variable name="moje_nazwisko">
		<xsl:value-of select="nazwisko"/>
	</xsl:variable>
	
	<xsl:if test="@jezyk='polski'">
	Copyright 2020, <xsl:copy-of select="$moje_imie"/> <xsl:text> </xsl:text>
	<xsl:copy-of select="$moje_nazwisko"/>
	</xsl:if>
</xsl:template>



<xsl:template match="strony">
	<xsl:apply-templates select="strona"/>
</xsl:template>

<xsl:template match="strona">
	<h3>
	<xsl:value-of select="@o" />
	</h3>
	<xsl:apply-templates select="tytul"/>
	<xsl:apply-templates select="tekst"/>
	<br />
</xsl:template>


<xsl:template match="tytul">
</xsl:template>


<xsl:template match="strona[@o='Muzyka']/tekst">
	<xsl:choose>
		<xsl:when test="@na_temat='Ogólne'">
			<xsl:value-of select="."/>
			<br />
		</xsl:when>
		<xsl:when test="@na_temat='Gitara'">
			<h4 id="Gitara">Gitara</h4>
			<xsl:value-of select="."/>
			<br />
		</xsl:when>
		<xsl:when test="@na_temat='Ukulele'">
			<h4 id="Ukulele">Ukulele</h4>
			<xsl:value-of select="."/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="."/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>



</xsl:stylesheet>