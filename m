From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: vr41xx: fix up errorpath on probe()
Date: Tue,  8 Jul 2014 09:23:28 +0200
Message-ID: <1404804208-16279-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:50782 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752230AbaGHHYM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Jul 2014 03:24:12 -0400
Received: by mail-wi0-f176.google.com with SMTP id n3so410135wiv.15
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2014 00:24:11 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

The driver was not checking the return value from gpiochip_add()
properly, so add a bail-out check.

Reported-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-vr41xx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-vr41xx.c b/drivers/gpio/gpio-vr41xx.c
index 66cbcc108e62..dbf28fa03f67 100644
--- a/drivers/gpio/gpio-vr41xx.c
+++ b/drivers/gpio/gpio-vr41xx.c
@@ -515,7 +515,7 @@ static int giu_probe(struct platform_device *pdev)
 	struct resource *res;
 	unsigned int trigger, i, pin;
 	struct irq_chip *chip;
-	int irq, retval;
+	int irq, ret;
 
 	switch (pdev->id) {
 	case GPIO_50PINS_PULLUPDOWN:
@@ -544,7 +544,11 @@ static int giu_probe(struct platform_device *pdev)
 
 	vr41xx_gpio_chip.dev = &pdev->dev;
 
-	retval = gpiochip_add(&vr41xx_gpio_chip);
+	ret = gpiochip_add(&vr41xx_gpio_chip);
+	if (!ret) {
+		iounmap(giu_base);
+		return -ENODEV;
+	}
 
 	giu_write(GIUINTENL, 0);
 	giu_write(GIUINTENH, 0);
-- 
1.9.3

