From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv3 06/14] pinctrl: mcp23s08: irq mapping is already done
Date: Mon, 15 May 2017 11:24:30 +0200
Message-ID: <20170515092438.13076-7-sebastian.reichel@collabora.co.uk>
References: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Steven Miao <realmz6@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: linux-gpio@vger.kernel.org

i2c-core and spi-core already assign the irq, so we
can drop the additional call from the mcp driver.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index be7ec7ddbce0..94d2c19a6989 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -21,7 +21,6 @@
 #include <linux/slab.h>
 #include <asm/byteorder.h>
 #include <linux/interrupt.h>
-#include <linux/of_irq.h>
 #include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -1008,7 +1007,6 @@ static int mcp230xx_probe(struct i2c_client *client,
 					"interrupt-controller");
 		pdata->mirror = of_property_read_bool(client->dev.of_node,
 						      "microchip,irq-mirror");
-		client->irq = irq_of_parse_and_map(client->dev.of_node, 0);
 	} else {
 		pdata = dev_get_platdata(&client->dev);
 		if (!pdata) {
@@ -1164,8 +1162,6 @@ static int mcp23s08_probe(struct spi_device *spi)
 
 	spi_set_drvdata(spi, data);
 
-	spi->irq = irq_of_parse_and_map(spi->dev.of_node, 0);
-
 	for (addr = 0; addr < ARRAY_SIZE(pdata->chip); addr++) {
 		if (!(spi_present_mask & (1 << addr)))
 			continue;
-- 
2.11.0
