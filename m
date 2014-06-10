From: Michael Welling <mwelling@ieee.org>
Subject: [PATCH] gpio: mcp23s08: Eliminates redundant checking.
Date: Tue, 10 Jun 2014 13:46:34 -0500
Message-ID: <1402425994-2983-1-git-send-email-mwelling@ieee.org>
References: <20140606033755.GA13605@deathray>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f177.google.com ([209.85.213.177]:51471 "EHLO
	mail-ig0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751758AbaFJSq4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Jun 2014 14:46:56 -0400
Received: by mail-ig0-f177.google.com with SMTP id l13so5498753iga.10
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2014 11:46:55 -0700 (PDT)
In-Reply-To: <20140606033755.GA13605@deathray>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gregkh@linuxfoundation.org, peter@korsgaard.com, Stephen Rothwell <sfr@canb.auug.org.au>, Michael Stickel <ms@mycable.de>, linux-gpio@vger.kernel.org
Cc: Michael Welling <mwelling@ieee.org>

Unnecessary checking was added during the merge of the gpio branch.
This patch removes the extra unnecessary checking.

Signed-off-by: Michael Welling <mwelling@ieee.org>
---
 drivers/gpio/gpio-mcp23s08.c |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index fe7c0e2..57adbc9 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -900,8 +900,6 @@ static int mcp23s08_probe(struct spi_device *spi)
 			if (spi_present_mask & (1 << addr))
 				chips++;
 		}
-		if (!chips)
-			return -ENODEV;
 	} else {
 		type = spi_get_device_id(spi)->driver_data;
 		pdata = dev_get_platdata(&spi->dev);
@@ -940,10 +938,6 @@ static int mcp23s08_probe(struct spi_device *spi)
 		if (!(spi_present_mask & (1 << addr)))
 			continue;
 		chips--;
-		if (chips < 0) {
-			dev_err(&spi->dev, "FATAL: invalid negative chip id\n");
-			goto fail;
-		}
 		data->mcp[addr] = &data->chip[chips];
 		status = mcp23s08_probe_one(data->mcp[addr], &spi->dev, spi,
 					    0x40 | (addr << 1), type, base,
-- 
1.7.9.5

