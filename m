From: Axel Haslam <ahaslam@baylibre.com>
Subject: [PATCH] gpio: davinci: Use unique labels for each gpio chip
Date: Thu,  3 Nov 2016 12:34:10 +0100
Message-ID: <20161103113410.2163-1-ahaslam@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:35998 "EHLO
        mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753030AbcKCLeP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Nov 2016 07:34:15 -0400
Received: by mail-wm0-f42.google.com with SMTP id p190so326859026wmp.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Nov 2016 04:34:14 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, nsekhar@ti.com, khilman@baylibre.com, david@lechnology.com, grygorii.strashko@ti.com, keerthy@ti.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Axel Haslam <ahaslam@baylibre.com>

The gpiod framework uses the chip label to match a specific chip.
The davinci gpio driver, creates several chips using always the same
label, which is not compatible with gpiod.

To allow platform data to declare gpio lookup tables, and for drivers
to use the gpiod framework, allocate unique label per registered chip.

Signed-off-by: Axel Haslam <ahaslam@baylibre.com>
---
 drivers/gpio/gpio-davinci.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index dd262f0..9191056 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -40,6 +40,7 @@ struct davinci_gpio_regs {
 typedef struct irq_chip *(*gpio_get_irq_chip_cb_t)(unsigned int irq);
 
 #define BINTEN	0x8 /* GPIO Interrupt Per-Bank Enable Register */
+#define MAX_LABEL_SIZE 20
 
 static void __iomem *gpio_base;
 
@@ -201,6 +202,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	struct davinci_gpio_regs __iomem *regs;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
+	char label[MAX_LABEL_SIZE];
 
 	pdata = davinci_gpio_get_pdata(pdev);
 	if (!pdata) {
@@ -237,7 +239,10 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(gpio_base);
 
 	for (i = 0, base = 0; base < ngpio; i++, base += 32) {
-		chips[i].chip.label = "DaVinci";
+		snprintf(label, MAX_LABEL_SIZE, "davinci_gpio.%d", i);
+		chips[i].chip.label = devm_kstrdup(dev, label, GFP_KERNEL);
+		if (!chips[i].chip.label)
+			return -ENOMEM;
 
 		chips[i].chip.direction_input = davinci_direction_in;
 		chips[i].chip.get = davinci_gpio_get;
-- 
2.10.1

