From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv3 03/14] pinctrl: mcp23s08: drop pullup config from pdata
Date: Mon, 15 May 2017 11:24:27 +0200
Message-ID: <20170515092438.13076-4-sebastian.reichel@collabora.co.uk>
References: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Steven Miao <realmz6@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: linux-gpio@vger.kernel.org

mcp23s08 support configuration of the pullups using the
pinconf framework. This removes the custom pullup configuration
from platform data, which has no upstream users.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 7 -------
 include/linux/spi/mcp23s08.h       | 1 -
 2 files changed, 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index d957c4bbc8c1..8c684d179e29 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -782,11 +782,6 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 			goto fail;
 	}
 
-	/* configure ~100K pullups */
-	ret = mcp_write(mcp, MCP_GPPU, pdata->chip[cs].pullups);
-	if (ret < 0)
-		goto fail;
-
 	ret = mcp_update_cache(mcp);
 	if (ret < 0)
 		goto fail;
@@ -911,7 +906,6 @@ static int mcp230xx_probe(struct i2c_client *client,
 	if (match) {
 		pdata = &local_pdata;
 		pdata->base = -1;
-		pdata->chip[0].pullups = 0;
 		pdata->irq_controller =	of_property_read_bool(
 					client->dev.of_node,
 					"interrupt-controller");
@@ -1031,7 +1025,6 @@ static int mcp23s08_probe(struct spi_device *spi)
 		pdata = &local_pdata;
 		pdata->base = -1;
 		for (addr = 0; addr < ARRAY_SIZE(pdata->chip); addr++) {
-			pdata->chip[addr].pullups = 0;
 			if (spi_present_mask & (1 << addr))
 				chips++;
 		}
diff --git a/include/linux/spi/mcp23s08.h b/include/linux/spi/mcp23s08.h
index aa07d7b32568..080ecc6bb270 100644
--- a/include/linux/spi/mcp23s08.h
+++ b/include/linux/spi/mcp23s08.h
@@ -3,7 +3,6 @@
 
 struct mcp23s08_chip_info {
 	bool		is_present;	/* true if populated */
-	unsigned	pullups;	/* BIT(x) means enable pullup x */
 };
 
 struct mcp23s08_platform_data {
-- 
2.11.0
