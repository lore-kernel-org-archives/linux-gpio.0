From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv3 08/14] pinctrl: mcp23s08: switch to devm_gpiochip_add_data
Date: Mon, 15 May 2017 11:24:32 +0200
Message-ID: <20170515092438.13076-9-sebastian.reichel@collabora.co.uk>
References: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59859 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760571AbdEOJZO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 May 2017 05:25:14 -0400
In-Reply-To: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Steven Miao <realmz6@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>

Switching to devm_gpiochip_add_data simplifies the driver's
cleanup routine and safes a few loc.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 40 ++------------------------------------
 1 file changed, 2 insertions(+), 38 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 4d2e1c3c0e87..3fc4195ad415 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -898,7 +898,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 			goto fail;
 	}
 
-	ret = gpiochip_add_data(&mcp->chip, mcp);
+	ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
 	if (ret < 0)
 		goto fail;
 
@@ -1034,15 +1034,6 @@ static int mcp230xx_probe(struct i2c_client *client,
 	return 0;
 }
 
-static int mcp230xx_remove(struct i2c_client *client)
-{
-	struct mcp23s08 *mcp = i2c_get_clientdata(client);
-
-	gpiochip_remove(&mcp->chip);
-
-	return 0;
-}
-
 static const struct i2c_device_id mcp230xx_id[] = {
 	{ "mcp23008", MCP_TYPE_008 },
 	{ "mcp23017", MCP_TYPE_017 },
@@ -1056,7 +1047,6 @@ static struct i2c_driver mcp230xx_driver = {
 		.of_match_table = of_match_ptr(mcp23s08_i2c_of_match),
 	},
 	.probe		= mcp230xx_probe,
-	.remove		= mcp230xx_remove,
 	.id_table	= mcp230xx_id,
 };
 
@@ -1166,7 +1156,7 @@ static int mcp23s08_probe(struct spi_device *spi)
 					    0x40 | (addr << 1), type, pdata,
 					    addr);
 		if (status < 0)
-			goto fail;
+			return status;
 
 		if (pdata->base != -1)
 			pdata->base += data->mcp[addr]->chip.ngpio;
@@ -1180,31 +1170,6 @@ static int mcp23s08_probe(struct spi_device *spi)
 	 */
 
 	return 0;
-
-fail:
-	for (addr = 0; addr < ARRAY_SIZE(data->mcp); addr++) {
-
-		if (!data->mcp[addr])
-			continue;
-		gpiochip_remove(&data->mcp[addr]->chip);
-	}
-	return status;
-}
-
-static int mcp23s08_remove(struct spi_device *spi)
-{
-	struct mcp23s08_driver_data	*data = spi_get_drvdata(spi);
-	unsigned			addr;
-
-	for (addr = 0; addr < ARRAY_SIZE(data->mcp); addr++) {
-
-		if (!data->mcp[addr])
-			continue;
-
-		gpiochip_remove(&data->mcp[addr]->chip);
-	}
-
-	return 0;
 }
 
 static const struct spi_device_id mcp23s08_ids[] = {
@@ -1217,7 +1182,6 @@ MODULE_DEVICE_TABLE(spi, mcp23s08_ids);
 
 static struct spi_driver mcp23s08_driver = {
 	.probe		= mcp23s08_probe,
-	.remove		= mcp23s08_remove,
 	.id_table	= mcp23s08_ids,
 	.driver = {
 		.name	= "mcp23s08",
-- 
2.11.0

