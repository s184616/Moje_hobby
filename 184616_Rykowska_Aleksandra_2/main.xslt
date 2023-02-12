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
				<header>
				<center>
					<h1>Moje hobby - Aktywność!</h1>
				</center>
				</header>
				
				<xsl:call-template name="nav"/>
				
				<div id="content">
					<h2>Strony</h2>
					<xsl:apply-templates select="Aktywnosc/strony/strona[@o='Moje hobby']"/>
					<xsl:apply-templates select="Aktywnosc/strony/strona[@o='Sport']"/>
					<xsl:apply-templates select="Aktywnosc/strony/strona[@o='Muzyka']"/>
					<xsl:apply-templates select="Aktywnosc/strony/strona[@o='Wolontariat']"/>
					<h2>Zdjęcia</h2>
					<xsl:apply-templates select="Aktywnosc/zdjecia"/>
					<h2>Linki</h2>
					<xsl:apply-templates select="Aktywnosc/linki"/>
					<h2>Ciekawostki</h2>
					<xsl:apply-templates select="Aktywnosc/ciekawostki"/>
				</div>
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

<xsl:template name="nav">
	<nav>
		<ul>
			<li> <a href="#Narty">Narty</a> </li>
			<li> <a href="#Snowboard">Snowboard</a> </li>
			<li> <a href="#Łyżwy">Łyżwy</a> </li>
			<li> <a href="#Rolki">Rolki</a> </li>
			<li> <a href="#Rower">Rower</a> </li>
			<li> <a href="#Ćwiczenia_i_rozciąganie">Ćwiczenia i rozciąganie</a> </li>
			<li> <a href="#Inne">I inne</a> </li>
		</ul>
	</nav>	
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
	<xsl:copy-of select="$linijka" />
	<xsl:copy-of select="$linijka2"/>
</xsl:template>


<xsl:template match="tytul">
</xsl:template>

<xsl:template match="strona[@o='Sport']/tekst">
	<xsl:choose>
		<xsl:when test="@na_temat='Narty'">
			<h4 id="Narty">Narty</h4>
			<xsl:value-of select="."/>
			<br />
		</xsl:when>
		<xsl:when test="@na_temat='Snowboard'">
			<h4 id="Snowboard">Snowboard</h4>
			<xsl:value-of select="."/>
			<br />
		</xsl:when>
		<xsl:when test="@na_temat='Łyżwy'">
			<h4 id="Łyżwy">Łyżwy</h4>
			<xsl:value-of select="."/>
			<br />
		</xsl:when>
		<xsl:when test="@na_temat='Rolki'">
			<h4 id="Rolki">Rolki</h4>
			<xsl:value-of select="."/>
			<br />
		</xsl:when>
		<xsl:when test="@na_temat='Rower'">
			<h4 id="Rower">Rower</h4>
			<xsl:value-of select="."/>
			<br />
		</xsl:when>
		<xsl:when test="@na_temat='Ćwiczenia_i_rozciąganie'">
			<h4 id="Ćwiczenia_i_rozciąganie">Ćwiczenia i rozciąganie</h4>
			<xsl:value-of select="."/>
			<br />
		</xsl:when>
		<xsl:when test="@na_temat='Inne'">
			<h4 id="Inne">I inne ...</h4>
			<xsl:value-of select="."/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="."/>
		</xsl:otherwise>
	</xsl:choose>
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

<xsl:template match="strona[@o='Wolontariat']/tekst">
	<xsl:choose>
		<xsl:when test="@na_temat='Ogólne'">
			<xsl:value-of select="."/>
			<br />
		</xsl:when>
		<xsl:when test="@na_temat='Dziewczynka_z_zapałkami'">
			<h4 id="Dziewczynka_z_zapałkami">Dziewczynka z zapałkami</h4>
			<xsl:value-of select="."/>
			<br />
		</xsl:when>
		<xsl:when test="@na_temat='Run_Toruń'">
			<h4 id="Run_Toruń">Run Toruń</h4>
			<xsl:value-of select="."/>
			<br />
		</xsl:when>
		<xsl:when test="@na_temat='Szukanie_dawcy_szpiku'">
			<h4 id="Szukanie_dawcy_szpiku">Szukanie dawcy szpiku</h4>
			<xsl:value-of select="."/>
			<br />
		</xsl:when>
		<xsl:when test="@na_temat='Wyprowadzanie_psów_ze_schroniska'">
			<h4 id="Wyprowadzanie_psów_ze_schroniska">Wyprowadzanie psów ze schroniska</h4>
			<xsl:value-of select="."/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="."/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:variable name="linijka">
	--------------------
</xsl:variable>

<xsl:variable name="linijka2">
	<br>
	--------------
	</br>
	<br /> <br />
</xsl:variable>

<xsl:template match="zdjecia/obraz">
	<img>
		<xsl:attribute name="src">
			<xsl:value-of select="@src" />
		</xsl:attribute>
		<xsl:attribute name="class">
			obraz2
		</xsl:attribute>
		<xsl:attribute name="title">
			<xsl:value-of select="." />
		</xsl:attribute>
	</img>
	<br />
</xsl:template>

<xsl:template match="linki">
	<xsl:for-each select ="link">
		<xsl:sort select="." order="descending"/>
		<xsl:number value="position()" format="1."/> <xsl:text> </xsl:text>
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:value-of select="@src"/>
			</xsl:attribute>
			<xsl:value-of select="."/>
		</xsl:element>
		<br />
	</xsl:for-each>
</xsl:template>

<xsl:template match="ciekawostki">
	<xsl:for-each select="ciekawostka">
		<xsl:number format="01." /> <xsl:text> </xsl:text>
		<xsl:value-of select="pytanie" />
		<br />
		<xsl:value-of select="dane" />
		<br />
	</xsl:for-each>
</xsl:template>


</xsl:stylesheet>