<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
   
   <xsl:template match="/">
       
       <xsl:result-document href="site/arqindex.html">
           <html>
               <head>
                   <title>Arqueositios do Norte de Portugal</title>
               </head>
               <body>
                   <h2>Arqueositios do Norte de Portugal</h2>
                   <h3>Indice de Arqueositios</h3>
                   
                   <ol>
                       <xsl:apply-templates select="//ARQELEM" mode="indice">
                           <xsl:sort select="IDENTI"/>
                       </xsl:apply-templates>
                   </ol>
               </body>
           </html>   
       </xsl:result-document>
       
       <xsl:apply-templates/>
   </xsl:template>
    
    <xsl:template match="ARQELEM" mode="indice">
        <li>
            <a name="i{generate-id()}"/>
            <a href="{generate-id()}.html">
                <xsl:value-of select="IDENTI"/>
            </a>
        </li>
    </xsl:template>
    
    <xsl:template match="ARQELEM">
        <xsl:result-document href="site/{generate-id()}.html">
            <html>
                <head>
                    <title>
                        <xsl:value-of select="IDENTI"/>
                    </title>
                </head>
                <body>
                    <p>
                        <b>Identificacao: </b>
                        <xsl:value-of select="IDENTI"/>
                    </p>
                    <p>
                        <b>Descricao: </b>
                        <xsl:value-of select="DESCRI"/>
                    </p>
                    <p>
                        <b>Lugar: </b>
                        <xsl:value-of select="LUGAR"/>
                    </p>
                    <p>
                        <b>Freguesia: </b>
                        <xsl:value-of select="FREGUE"/>
                    </p>
                    <p>
                        <b>Concelho: </b>
                        <xsl:value-of select="CONCEL"/>
                    </p>
                    <p>
                        <b>Descricao Arqueologica: </b>
                        <xsl:value-of select="DESARQ"/>
                    </p>
                    <p>
                        <b>Autor: </b>
                        <xsl:value-of select="AUTOR"/>
                    </p>
                    <p>
                        <b>Data: </b>
                        <xsl:value-of select="DATA"/>
                    </p>
                    <xsl:apply-templates mode="opt"/>
                    <p>
                        <b>Bibliografia: </b>
                    </p>
                    <il>
                    <xsl:apply-templates select="BIBLIO" mode="biblio"/>
                    </il>
                    <address> [<a href="arqindex.html#i{generate-id()}">Página Principal</a>]</address>
                </body>
            </html>
            
        </xsl:result-document>
    </xsl:template>
    
    <!-- -->
    <xsl:template match="CRONO" mode="opt">
        <p>
            <b>Cronologia: </b>
            <xsl:value-of select="."/>
        </p>
    </xsl:template>
    <xsl:template match="LATITU" mode="opt">
        <p>
            <b>Latitude: </b>
            <xsl:value-of select="."/>
        </p>
    </xsl:template>
    <xsl:template match="ALTITU" mode="opt">
        <p>
            <b>Altitude: </b>
            <xsl:value-of select="."/>
        </p>
    </xsl:template>
    <xsl:template match="LONGIT" mode="opt">
        <p>
            <b>Longitude: </b>
            <xsl:value-of select="."/>
        </p>
    </xsl:template>
    <xsl:template match="ACESSO" mode="opt">
        <p>
            <b>Modo de acesso: </b>
            <xsl:value-of select="."/>
        </p>
    </xsl:template>
    <xsl:template match="QUADRO" mode="opt">
        <p>
            <b>Quadro: </b>
            <xsl:value-of select="."/>
        </p>
    </xsl:template>
    <xsl:template match="TRAARQ" mode="opt">
        <p>
            <b>Trabalhos Arquelogicos: </b>
            <xsl:value-of select="."/>
        </p>
    </xsl:template>
    <xsl:template match="INTERP" mode="opt">
        <p>
            <b>Interpretacao: </b>
            <xsl:value-of select="."/>
        </p>
    </xsl:template>
    <xsl:template match="INTERE" mode="opt">
        <p>
            <b>Notas de Ineresse: </b>
            <xsl:value-of select="."/>
        </p>
    </xsl:template>
    <xsl:template match="DEPOSI" mode="opt">
        <p>
            <b>Depositorio de interesse: </b>
            <xsl:value-of select="."/>
        </p>
    </xsl:template>
    <xsl:template match="CODADM" mode="opt">
        <p>
            <b>Codigo de Administrador:</b>
            <xsl:value-of select="."/>
        </p>
    </xsl:template>
    <xsl:template match="IDENTI" mode="opt"/>
    <xsl:template match="DESCRI" mode="opt"/>
    <xsl:template match="LUGAR" mode="opt"/>
    <xsl:template match="FREGUE" mode="opt"/>
    <xsl:template match="CONCEL" mode="opt"/>
    <xsl:template match="DESARQ" mode="opt"/>
    <xsl:template match="AUTOR" mode="opt"/>
    <xsl:template match="DATA" mode="opt"/>
    <xsl:template match="BIBLIO" mode="opt"/>
    
    <xsl:template match="BIBLIO" mode="biblio">
        <li>
            <xsl:value-of select="."/>
        </li>
    </xsl:template>
   
</xsl:stylesheet>
