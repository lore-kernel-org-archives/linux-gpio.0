From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv3 12/14] pinctrl: mcp23s08: simplify spi_present_mask handling
Date: Mon, 15 May 2017 11:24:36 +0200
Message-ID: <20170515092438.13076-13-sebastian.reichel@collabora.co.uk>
References: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59881 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760622AbdEOJZ0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 May 2017 05:25:26 -0400
In-Reply-To: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Steven Miao <realmz6@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 arch/blackfin/mach-bf527/boards/tll6527m.c |  4 ++--
 drivers/pinctrl/pinctrl-mcp23s08.c         | 29 ++++++++++-------------------
 include/linux/spi/mcp23s08.h               |  6 +-----
 3 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/arch/blackfin/mach-bf527/boards/tll6527m.c b/arch/blackfin/mach-bf527/boards/tll6527m.c
index be61477826f3..ce5488e8226b 100644
--- a/arch/blackfin/mach-bf527/boards/tll6527m.c
+++ b/arch/blackfin/mach-bf527/boards/tll6527m.c
@@ -351,11 +351,11 @@ static struct platform_device bfin_i2s = {
 #if IS_ENABLED(CONFIG_PINCTRL_MCP23S08)
 #include <linux/spi/mcp23s08.h>
 static const struct mcp23s08_platform_data bfin_mcp23s08_sys_gpio_info = {
-	.chip[0].is_present = true,
+	.spi_present_mask = BIT(0),
 	.base = 0x30,
 };
 static const struct mcp23s08_platform_data bfin_mcp23s08_usr_gpio_info = {
-	.chip[2].is_present = true,
+	.spi_present_mask = BIT(2),
 	.base = 0x38,
 };
 #endif
diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index b39da587f2fa..29d9c1fd4309 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -36,6 +36,8 @@
 #define MCP_TYPE_017	3
 #define MCP_TYPE_S18    4
 
+#define MCP_MAX_DEV_PER_CS	8
+
 /* Registers are all 8 bits wide.
  *
  * The mcp23s17 has twice as many bits, and can be configured to work
@@ -1064,7 +1066,6 @@ static int mcp23s08_probe(struct spi_device *spi)
 	int				status, type;
 	unsigned			ngpio = 0;
 	const struct			of_device_id *match;
-	u32				spi_present_mask = 0;
 
 	match = of_match_device(of_match_ptr(mcp23s08_spi_of_match), &spi->dev);
 	if (match)
@@ -1078,36 +1079,26 @@ static int mcp23s08_probe(struct spi_device *spi)
 		pdata->base = -1;
 
 		status = device_property_read_u32(&spi->dev,
-			"microchip,spi-present-mask", &spi_present_mask);
+			"microchip,spi-present-mask", &pdata->spi_present_mask);
 		if (status) {
 			status = device_property_read_u32(&spi->dev,
-				"mcp,spi-present-mask", &spi_present_mask);
+				"mcp,spi-present-mask",
+				&pdata->spi_present_mask);
 
 			if (status) {
 				dev_err(&spi->dev, "missing spi-present-mask");
 				return -ENODEV;
 			}
 		}
-	} else {
-		for (addr = 0; addr < ARRAY_SIZE(pdata->chip); addr++) {
-			if (!pdata->chip[addr].is_present)
-				continue;
-			if ((type == MCP_TYPE_S08) && (addr > 3)) {
-				dev_err(&spi->dev,
-					"mcp23s08 only supports address 0..3");
-				return -EINVAL;
-			}
-			spi_present_mask |= BIT(addr);
-		}
 	}
 
-	if (!spi_present_mask || spi_present_mask >= 256) {
+	if (!pdata->spi_present_mask || pdata->spi_present_mask > 0xff) {
 		dev_err(&spi->dev, "invalid spi-present-mask");
 		return -ENODEV;
 	}
 
-	for (addr = 0; addr < ARRAY_SIZE(pdata->chip); addr++) {
-		if (spi_present_mask & BIT(addr))
+	for (addr = 0; addr < MCP_MAX_DEV_PER_CS; addr++) {
+		if (pdata->spi_present_mask & BIT(addr))
 			chips++;
 	}
 
@@ -1122,8 +1113,8 @@ static int mcp23s08_probe(struct spi_device *spi)
 
 	spi_set_drvdata(spi, data);
 
-	for (addr = 0; addr < ARRAY_SIZE(pdata->chip); addr++) {
-		if (!(spi_present_mask & (1 << addr)))
+	for (addr = 0; addr < MCP_MAX_DEV_PER_CS; addr++) {
+		if (!(pdata->spi_present_mask & BIT(addr)))
 			continue;
 		chips--;
 		data->mcp[addr] = &data->chip[chips];
diff --git a/include/linux/spi/mcp23s08.h b/include/linux/spi/mcp23s08.h
index 4af82ee63329..211f3c0ef49c 100644
--- a/include/linux/spi/mcp23s08.h
+++ b/include/linux/spi/mcp23s08.h
@@ -1,10 +1,6 @@
 
 /* FIXME driver should be able to handle IRQs...  */
 
-struct mcp23s08_chip_info {
-	bool		is_present;	/* true if populated */
-};
-
 struct mcp23s08_platform_data {
 	/* For mcp23s08, up to 4 slaves (numbered 0..3) can share one SPI
 	 * chipselect, each providing 1 gpio_chip instance with 8 gpios.
@@ -12,7 +8,7 @@ struct mcp23s08_platform_data {
 	 * chipselect, each providing 1 gpio_chip (port A + port B) with
 	 * 16 gpios.
 	 */
-	struct mcp23s08_chip_info	chip[8];
+	u32 spi_present_mask;
 
 	/* "base" is the number of the first GPIO.  Dynamic assignment is
 	 * not currently supported, and even if there are gaps in chip
-- 
2.11.0

