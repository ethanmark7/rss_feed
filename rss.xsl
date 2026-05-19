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
                        color: #2c3e50;
                        background: #f5f7fa;
                        min-height: 100vh;
                        padding: 20px;
                    }
                    
                    .container {
                        max-width: 1000px;
                        margin: 0 auto;
                        background: white;
                        border-radius: 8px;
                        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
                        overflow: hidden;
                    }
                    
                    .header {
                        background: #2c3e50;
                        color: white;
                        padding: 50px 40px;
                        border-bottom: 4px solid #3498db;
                    }
                    
                    .header h1 {
                        font-size: 2.2em;
                        margin-bottom: 12px;
                        font-weight: 600;
                        letter-spacing: -0.5px;
                    }
                    
                    .header p {
                        font-size: 1.05em;
                        opacity: 0.9;
                        margin-bottom: 20px;
                        max-width: 800px;
                        margin-left: auto;
                        margin-right: auto;
                    }
                    
                    .rss-info {
                        background: rgba(52, 152, 219, 0.15);
                        padding: 12px 20px;
                        border-radius: 6px;
                        margin-top: 20px;
                        font-size: 0.9em;
                        border-left: 3px solid #3498db;
                    }
                    
                    .rss-info strong {
                        display: block;
                        margin-bottom: 5px;
                    }
                    
                    .content {
                        padding: 30px;
                    }
                    
                    .item {
                        border-bottom: 1px solid #e8ecef;
                        padding: 35px 0;
                        transition: background-color 0.2s;
                    }
                    
                    .item:hover {
                        background-color: #fafbfc;
                    }
                    
                    .item:last-child {
                        border-bottom: none;
                    }
                    
                    .item h2 {
                        font-size: 1.4em;
                        margin-bottom: 12px;
                        color: #2c3e50;
                        font-weight: 600;
                        line-height: 1.4;
                    }
                    
                    .item h2 a {
                        color: #2c3e50;
                        text-decoration: none;
                        transition: color 0.2s;
                    }
                    
                    .item h2 a:hover {
                        color: #3498db;
                    }
                    
                    .meta {
                        display: flex;
                        flex-wrap: wrap;
                        gap: 20px;
                        margin-bottom: 16px;
                        font-size: 0.88em;
                        color: #7f8c8d;
                    }
                    
                    .meta-item {
                        display: flex;
                        align-items: center;
                        gap: 6px;
                    }
                    
                    .category {
                        display: inline-block;
                        background: #ecf0f1;
                        padding: 5px 14px;
                        border-radius: 4px;
                        font-size: 0.82em;
                        color: #34495e;
                        margin-right: 6px;
                        margin-bottom: 6px;
                        font-weight: 500;
                        border: 1px solid #dfe6e9;
                    }
                    
                    .description {
                        color: #5a6c7d;
                        line-height: 1.7;
                        font-size: 0.95em;
                    }
                    
                    .description p {
                        margin-bottom: 14px;
                    }
                    
                    .description strong {
                        color: #2c3e50;
                        font-weight: 600;
                    }
                    
                    .description img {
                        width: 100%;
                        max-width: 700px;
                        height: auto;
                        object-fit: cover;
                        border-radius: 6px;
                        margin: 20px 0;
                        box-shadow: 0 2px 8px rgba(0,0,0,0.08);
                        border: 1px solid #e8ecef;
                        display: block;
                    }
                    
                    .description ul {
                        list-style: none;
                        padding: 0;
                    }
                    
                    .description li {
                        margin-bottom: 18px;
                    }
                    
                    .description em {
                        color: #7f8c8d;
                        font-size: 0.9em;
                        display: block;
                        margin-top: 8px;
                    }
                    
                    .footer {
                        background: #f8f9fa;
                        padding: 25px 40px;
                        text-align: center;
                        color: #7f8c8d;
                        font-size: 0.88em;
                        border-top: 1px solid #e8ecef;
                    }
                    
                    .footer p {
                        margin: 5px 0;
                    }
                    
                    @media (max-width: 768px) {
                        body {
                            padding: 10px;
                        }
                        
                        .header {
                            padding: 30px 20px;
                        }
                        
                        .header h1 {
                            font-size: 1.6em;
                        }
                        
                        .header p {
                            font-size: 0.95em;
                        }
                        
                        .content {
                            padding: 20px;
                        }
                        
                        .item {
                            padding: 25px 0;
                        }
                        
                        .item h2 {
                            font-size: 1.2em;
                        }
                        
                        .description img {
                            max-width: 100%;
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
