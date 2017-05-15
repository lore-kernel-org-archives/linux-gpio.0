From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv3 10/14] pinctrl: mcp23s08: simplify spi pdata handling
Date: Mon, 15 May 2017 11:24:34 +0200
Message-ID: <20170515092438.13076-11-sebastian.reichel@collabora.co.uk>
References: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Steven Miao <realmz6@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: linux-gpio@vger.kernel.org

Simplify spi pdata handling, so that it uses pdata when available
and falls back to reading device properties otherwise.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 67 ++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 35 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index aec2dad26560..541bf80a2a13 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -1071,58 +1071,55 @@ static int mcp23s08_probe(struct spi_device *spi)
 	u32				spi_present_mask = 0;
 
 	match = of_match_device(of_match_ptr(mcp23s08_spi_of_match), &spi->dev);
-	if (match) {
+	if (match)
 		type = (int)(uintptr_t)match->data;
-		status = of_property_read_u32(spi->dev.of_node,
-			    "microchip,spi-present-mask", &spi_present_mask);
+	else
+		type = spi_get_device_id(spi)->driver_data;
+
+	pdata = dev_get_platdata(&spi->dev);
+	if (!pdata) {
+		pdata = &local_pdata;
+		pdata->base = -1;
+
+		pdata->irq_controller = device_property_read_bool(&spi->dev,
+			"interrupt-controller");
+		pdata->mirror = device_property_read_bool(&spi->dev,
+			"microchip,irq-mirror");
+
+		status = device_property_read_u32(&spi->dev,
+			"microchip,spi-present-mask", &spi_present_mask);
 		if (status) {
-			status = of_property_read_u32(spi->dev.of_node,
-				    "mcp,spi-present-mask", &spi_present_mask);
+			status = device_property_read_u32(&spi->dev,
+				"mcp,spi-present-mask", &spi_present_mask);
+
 			if (status) {
-				dev_err(&spi->dev,
-					"DT has no spi-present-mask\n");
+				dev_err(&spi->dev, "missing spi-present-mask");
 				return -ENODEV;
 			}
 		}
-		if ((spi_present_mask <= 0) || (spi_present_mask >= 256)) {
-			dev_err(&spi->dev, "invalid spi-present-mask\n");
-			return -ENODEV;
-		}
-
-		pdata = &local_pdata;
-		pdata->base = -1;
-		for (addr = 0; addr < ARRAY_SIZE(pdata->chip); addr++) {
-			if (spi_present_mask & (1 << addr))
-				chips++;
-		}
-		pdata->irq_controller =	of_property_read_bool(
-					spi->dev.of_node,
-					"interrupt-controller");
-		pdata->mirror = of_property_read_bool(spi->dev.of_node,
-						      "microchip,irq-mirror");
 	} else {
-		type = spi_get_device_id(spi)->driver_data;
-		pdata = dev_get_platdata(&spi->dev);
-		if (!pdata) {
-			pdata = devm_kzalloc(&spi->dev,
-					sizeof(struct mcp23s08_platform_data),
-					GFP_KERNEL);
-			pdata->base = -1;
-		}
-
 		for (addr = 0; addr < ARRAY_SIZE(pdata->chip); addr++) {
 			if (!pdata->chip[addr].is_present)
 				continue;
-			chips++;
 			if ((type == MCP_TYPE_S08) && (addr > 3)) {
 				dev_err(&spi->dev,
-					"mcp23s08 only supports address 0..3\n");
+					"mcp23s08 only supports address 0..3");
 				return -EINVAL;
 			}
-			spi_present_mask |= 1 << addr;
+			spi_present_mask |= BIT(addr);
 		}
 	}
 
+	if (!spi_present_mask || spi_present_mask >= 256) {
+		dev_err(&spi->dev, "invalid spi-present-mask");
+		return -ENODEV;
+	}
+
+	for (addr = 0; addr < ARRAY_SIZE(pdata->chip); addr++) {
+		if (spi_present_mask & BIT(addr))
+			chips++;
+	}
+
 	if (!chips)
 		return -ENODEV;
 
-- 
2.11.0
