From: Michael Welling <mwelling@ieee.org>
Subject: [PATCH] gpio: mcp23s08: Bug fix of SPI device tree registration.
Date: Wed, 16 Apr 2014 20:00:24 -0500
Message-ID: <1397696424-3394-1-git-send-email-mwelling@ieee.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f179.google.com ([209.85.213.179]:52163 "EHLO
	mail-ig0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751107AbaDQBAw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Apr 2014 21:00:52 -0400
Received: by mail-ig0-f179.google.com with SMTP id hl10so123841igb.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2014 18:00:52 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
Cc: Michael Welling <mwelling@ieee.org>

The chips variable needs to be incremented for each chip that is found in the
spi_present_mask when register via device tree. Without this and the checking
a negative index is passed to the data->chip array in a subsequent loop.

Signed-off-by: Michael Welling <mwelling@ieee.org>
---
 drivers/gpio/gpio-mcp23s08.c |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index 99a6831..3d53fd6 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -894,9 +894,11 @@ static int mcp23s08_probe(struct spi_device *spi)
 			dev_err(&spi->dev, "invalid spi-present-mask\n");
 			return -ENODEV;
 		}
-
-		for (addr = 0; addr < ARRAY_SIZE(pdata->chip); addr++)
+		for (addr = 0; addr < ARRAY_SIZE(pdata->chip); addr++) {
+			if ((spi_present_mask & (1 << addr)))
+				chips++;
 			pullups[addr] = 0;
+		}
 	} else {
 		type = spi_get_device_id(spi)->driver_data;
 		pdata = dev_get_platdata(&spi->dev);
@@ -919,12 +921,12 @@ static int mcp23s08_probe(struct spi_device *spi)
 			pullups[addr] = pdata->chip[addr].pullups;
 		}
 
-		if (!chips)
-			return -ENODEV;
-
 		base = pdata->base;
 	}
 
+	if (!chips)
+		return -ENODEV;
+
 	data = kzalloc(sizeof(*data) + chips * sizeof(struct mcp23s08),
 			GFP_KERNEL);
 	if (!data)
-- 
1.7.9.5

