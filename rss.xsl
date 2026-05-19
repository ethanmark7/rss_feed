<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:content="http://purl.org/rss/1.0/modules/content/"
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:media="http://search.yahoo.com/mrss/"
                xmlns:atom="http://www.w3.org/2005/Atom">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title><xsl:value-of select="/rss/channel/title"/> - RSS Feed</title>
                <style>
                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                    }
                    
                    body {
                        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
                        line-height: 1.6;
                        color: #333;
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        min-height: 100vh;
                        padding: 20px;
                    }
                    
                    .container {
                        max-width: 900px;
                        margin: 0 auto;
                        background: white;
                        border-radius: 12px;
                        box-shadow: 0 20px 60px rgba(0,0,0,0.3);
                        overflow: hidden;
                    }
                    
                    .header {
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        color: white;
                        padding: 40px 30px;
                        text-align: center;
                    }
                    
                    .header h1 {
                        font-size: 2.5em;
                        margin-bottom: 10px;
                        font-weight: 700;
                    }
                    
                    .header p {
                        font-size: 1.1em;
                        opacity: 0.95;
                        margin-bottom: 20px;
                    }
                    
                    .rss-info {
                        background: rgba(255,255,255,0.2);
                        padding: 15px;
                        border-radius: 8px;
                        margin-top: 20px;
                        font-size: 0.9em;
                    }
                    
                    .rss-info strong {
                        display: block;
                        margin-bottom: 5px;
                    }
                    
                    .content {
                        padding: 30px;
                    }
                    
                    .item {
                        border-bottom: 1px solid #e0e0e0;
                        padding: 30px 0;
                        transition: transform 0.2s;
                    }
                    
                    .item:hover {
                        transform: translateX(5px);
                    }
                    
                    .item:last-child {
                        border-bottom: none;
                    }
                    
                    .item h2 {
                        font-size: 1.5em;
                        margin-bottom: 10px;
                        color: #667eea;
                    }
                    
                    .item h2 a {
                        color: #667eea;
                        text-decoration: none;
                        transition: color 0.2s;
                    }
                    
                    .item h2 a:hover {
                        color: #764ba2;
                        text-decoration: underline;
                    }
                    
                    .meta {
                        display: flex;
                        flex-wrap: wrap;
                        gap: 15px;
                        margin-bottom: 15px;
                        font-size: 0.9em;
                        color: #666;
                    }
                    
                    .meta-item {
                        display: flex;
                        align-items: center;
                        gap: 5px;
                    }
                    
                    .category {
                        display: inline-block;
                        background: #f0f0f0;
                        padding: 4px 12px;
                        border-radius: 20px;
                        font-size: 0.85em;
                        color: #555;
                        margin-right: 5px;
                        margin-bottom: 5px;
                    }
                    
                    .description {
                        color: #555;
                        line-height: 1.8;
                    }
                    
                    .description p {
                        margin-bottom: 15px;
                    }
                    
                    .description img {
                        max-width: 100%;
                        height: auto;
                        border-radius: 8px;
                        margin: 15px 0;
                        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
                    }
                    
                    .description ul {
                        list-style: none;
                        padding: 0;
                    }
                    
                    .description li {
                        margin-bottom: 15px;
                    }
                    
                    .footer {
                        background: #f8f9fa;
                        padding: 20px 30px;
                        text-align: center;
                        color: #666;
                        font-size: 0.9em;
                    }
                    
                    @media (max-width: 768px) {
                        body {
                            padding: 10px;
                        }
                        
                        .header h1 {
                            font-size: 1.8em;
                        }
                        
                        .content {
                            padding: 20px;
                        }
                        
                        .item {
                            padding: 20px 0;
                        }
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <div class="header">
                        <h1><xsl:value-of select="/rss/channel/title"/></h1>
                        <p><xsl:value-of select="/rss/channel/description"/></p>
                        <div class="rss-info">
                            <strong>📡 This is an RSS Feed</strong>
                            Copy the URL to subscribe in your favorite RSS reader
                        </div>
                    </div>
                    
                    <div class="content">
                        <xsl:for-each select="/rss/channel/item">
                            <div class="item">
                                <h2>
                                    <a href="{link}" target="_blank">
                                        <xsl:value-of select="title"/>
                                    </a>
                                </h2>
                                
                                <div class="meta">
                                    <div class="meta-item">
                                        📅 <xsl:value-of select="substring(pubDate, 1, 16)"/>
                                    </div>
                                    <xsl:if test="dc:creator">
                                        <div class="meta-item">
                                            ✍️ <xsl:value-of select="dc:creator"/>
                                        </div>
                                    </xsl:if>
                                </div>
                                
                                <div>
                                    <xsl:for-each select="category">
                                        <span class="category"><xsl:value-of select="."/></span>
                                    </xsl:for-each>
                                </div>
                                
                                <div class="description">
                                    <xsl:value-of select="description" disable-output-escaping="yes"/>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                    
                    <div class="footer">
                        <p>Last updated: <xsl:value-of select="/rss/channel/lastBuildDate"/></p>
                        <p>Generated by <xsl:value-of select="/rss/channel/generator"/></p>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>

<!-- Made with Bob -->
