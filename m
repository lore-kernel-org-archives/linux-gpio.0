From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 1/2] gpio: mmio: add brcm,bcm6345 support
Date: Wed,  3 Aug 2016 13:02:14 +0200
Message-ID: <1470222135-4731-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org, gnurou@gmail.com, chunkeey@googlemail.com, =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: linux-gpio@vger.kernel.org

From: Christian Lamparter <chunkeey@googlemail.com>

This patch adds support for the GPIO found in Broadcom's bcm63xx-gpio
chips.
This GPIOs is used in the following Broadcom SoCs: BCM6338, BCM6345.
It shouldn't be used in newer Broadcom SoCs since they need a proper pinctrl driver.

Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 drivers/gpio/gpio-mmio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 6ec144b..4a4830d 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -573,6 +573,7 @@ static void __iomem *bgpio_map(struct platform_device *pdev,
 
 #ifdef CONFIG_OF
 static const struct of_device_id bgpio_of_match[] = {
+	{ .compatible = "brcm,bcm6345-gpio" },
 	{ .compatible = "wd,mbl-gpio" },
 	{ }
 };
@@ -593,6 +594,9 @@ static struct bgpio_pdata *bgpio_parse_dt(struct platform_device *pdev,
 
 	pdata->base = -1;
 
+	if (of_device_is_big_endian(dev->of_node))
+		*flags |= BGPIOF_BIG_ENDIAN_BYTE_ORDER;
+
 	if (of_property_read_bool(pdev->dev.of_node, "no-output"))
 		*flags |= BGPIOF_NO_OUTPUT;
 
-- 
2.1.4
