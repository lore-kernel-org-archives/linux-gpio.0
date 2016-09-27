From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH] pinctrl: freescale: avoid overwriting pin config when freeing GPIO
Date: Mon, 26 Sep 2016 17:26:50 -0700
Message-ID: <20160927002650.4316-1-stefan@agner.ch>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:39838 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750741AbcI0A1O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2016 20:27:14 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: shawnguo@kernel.org, vladimir_zapolskiy@mentor.com, aalonso@freescale.com, b38343@freescale.com, ldewangan@nvidia.com, van.freenix@gmail.com, p.zabel@pengutronix.de, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>

If a GPIO gets freed after selecting a new pinctrl configuration
the driver should not change pinctrl anymore. Otherwise this will
likely lead to a unusable pin configuration for the newly selected
pinctrl.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
This turned out to be problematic when using the I2C GPIO bus recovery
functionality. After muxing back to I2C, the GPIO is being freed, which
cased I2C to stop working completely.

--
Stefan

 drivers/pinctrl/freescale/pinctrl-imx.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 4761320..61cfa95 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -361,8 +361,13 @@ static void imx_pmx_gpio_disable_free(struct pinctrl_dev *pctldev,
 	if (pin_reg->mux_reg == -1)
 		return;
 
-	/* Clear IBE/OBE/PUE to disable the pin (Hi-Z) */
 	reg = readl(ipctl->base + pin_reg->mux_reg);
+
+	/* Only change pad configuration if pad is still a GPIO */
+	if (reg & (0x7 << 20))
+		return;
+
+	/* Clear IBE/OBE/PUE to disable the pin (Hi-Z) */
 	reg &= ~0x7;
 	writel(reg, ipctl->base + pin_reg->mux_reg);
 }
-- 
2.10.0

