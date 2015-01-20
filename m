From: Sonic Zhang <sonic.adi@gmail.com>
Subject: [PATCH] gpio: mcp23s08: create default gpio base if neither device node nor platform data is defined
Date: Tue, 20 Jan 2015 17:00:08 +0800
Message-ID: <1421744408-8837-1-git-send-email-sonic.adi@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1on0084.outbound.protection.outlook.com ([157.56.110.84]:15969
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751248AbbATJSK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 20 Jan 2015 04:18:10 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, antonio@fiol.es, gnurou@gmail.com, linus.walleij@linaro.org, grant.likely@linaro.org, robh+dt@kernel.org
Cc: adi-buildroot-devel@lists.sourceforge.net, Sonic Zhang <sonic.zhang@analog.com>

From: Sonic Zhang <sonic.zhang@analog.com>

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 drivers/gpio/gpio-mcp23s08.c |   17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index da9c316..eea5d7e 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -801,9 +801,11 @@ static int mcp230xx_probe(struct i2c_client *client,
 		client->irq = irq_of_parse_and_map(client->dev.of_node, 0);
 	} else {
 		pdata = dev_get_platdata(&client->dev);
-		if (!pdata || !gpio_is_valid(pdata->base)) {
-			dev_dbg(&client->dev, "invalid platform data\n");
-			return -EINVAL;
+		if (!pdata) {
+			pdata = devm_kzalloc(&client->dev,
+					sizeof(struct mcp23s08_platform_data),
+					GFP_KERNEL);
+			pdata->base = -1;
 		}
 	}
 
@@ -924,10 +926,11 @@ static int mcp23s08_probe(struct spi_device *spi)
 	} else {
 		type = spi_get_device_id(spi)->driver_data;
 		pdata = dev_get_platdata(&spi->dev);
-		if (!pdata || !gpio_is_valid(pdata->base)) {
-			dev_dbg(&spi->dev,
-					"invalid or missing platform data\n");
-			return -EINVAL;
+		if (!pdata) {
+			pdata = devm_kzalloc(&spi->dev,
+					sizeof(struct mcp23s08_platform_data),
+					GFP_KERNEL);
+			pdata->base = -1;
 		}
 
 		for (addr = 0; addr < ARRAY_SIZE(pdata->chip); addr++) {
-- 
1.7.9.5

