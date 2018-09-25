From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 1/3] pinctrl: mcp23s08: fix debugfs entry for mcp23s18 device
Date: Tue, 25 Sep 2018 16:56:14 +0200
Message-ID: <20180925145616.12610-2-m.felsch@pengutronix.de>
References: <20180925145616.12610-1-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180925145616.12610-1-m.felsch@pengutronix.de>
Sender: stable-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, kernel@pengutronix.de, stable@vger.kernel.org, =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
List-Id: linux-gpio@vger.kernel.org

This patch fixes 'commit 9b3e4207661e ("pinctrl: mcp23s08: spi: Fix regmap
debugfs entries")'. For sure the MCP23S18 device has only 1 address pin
but this will get decoded into three internally ([1], section 1.4).

[1] http://ww1.microchip.com/downloads/en/DeviceDoc/22103a.pdf

Cc: stable@vger.kernel.org
Cc: Jan Kundrát <jan.kundrat@cesnet.cz>
Fixes: 9b3e4207661e ('pinctrl: mcp23s08: spi: Fix regmap debugfs entries')
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 49 ++++++++++++++----------------
 1 file changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 4a8a8efadefa..472746931ea8 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -794,41 +794,38 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	switch (type) {
 #ifdef CONFIG_SPI_MASTER
 	case MCP_TYPE_S08:
-	case MCP_TYPE_S17:
-		switch (type) {
-		case MCP_TYPE_S08:
-			one_regmap_config =
-				devm_kmemdup(dev, &mcp23x08_regmap,
-					sizeof(struct regmap_config), GFP_KERNEL);
-			mcp->reg_shift = 0;
-			mcp->chip.ngpio = 8;
-			mcp->chip.label = devm_kasprintf(dev, GFP_KERNEL,
-					"mcp23s08.%d", raw_chip_address);
-			break;
-		case MCP_TYPE_S17:
-			one_regmap_config =
-				devm_kmemdup(dev, &mcp23x17_regmap,
-					sizeof(struct regmap_config), GFP_KERNEL);
-			mcp->reg_shift = 1;
-			mcp->chip.ngpio = 16;
-			mcp->chip.label = devm_kasprintf(dev, GFP_KERNEL,
-					"mcp23s17.%d", raw_chip_address);
-			break;
-		}
+		one_regmap_config = devm_kmemdup(dev, &mcp23x08_regmap,
+						 sizeof(struct regmap_config),
+						 GFP_KERNEL);
 		if (!one_regmap_config)
 			return -ENOMEM;
 
-		one_regmap_config->name = devm_kasprintf(dev, GFP_KERNEL, "%d", raw_chip_address);
+		mcp->reg_shift = 0;
+		mcp->chip.ngpio = 8;
+		mcp->chip.label = devm_kasprintf(dev, GFP_KERNEL, "mcp23s08.%d",
+						 raw_chip_address);
+		one_regmap_config->name = devm_kasprintf(dev, GFP_KERNEL, "%d",
+							 raw_chip_address);
 		mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp,
 					       one_regmap_config);
 		break;
-
+	case MCP_TYPE_S17:
 	case MCP_TYPE_S18:
-		mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp,
-					       &mcp23x17_regmap);
+		one_regmap_config = devm_kmemdup(dev, &mcp23x17_regmap,
+						 sizeof(struct regmap_config),
+						 GFP_KERNEL);
+		if (!one_regmap_config)
+			return -ENOMEM;
+
 		mcp->reg_shift = 1;
 		mcp->chip.ngpio = 16;
-		mcp->chip.label = "mcp23s18";
+		mcp->chip.label = devm_kasprintf(dev, GFP_KERNEL, "mcp23s%s.%d",
+						 type == MCP_TYPE_S17 ?
+						 "17" : "18", raw_chip_address);
+		one_regmap_config->name = devm_kasprintf(dev, GFP_KERNEL, "%d",
+							 raw_chip_address);
+		mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp,
+					       one_regmap_config);
 		break;
 #endif /* CONFIG_SPI_MASTER */
 
-- 
2.19.0
