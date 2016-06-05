From: kamlakant.patel@broadcom.com
Subject: [PATCH 1/2] gpio: xlp: Fix vulcan IRQ descriptor allocation
Date: Sun,  5 Jun 2016 14:00:43 +0530
Message-ID: <1465115444-25068-1-git-send-email-kamlakant.patel@broadcom.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:61414 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751081AbcFEIkr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Jun 2016 04:40:47 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Jayachandran C <jchandra@broadcom.com>

From: Kamlakant Patel <kamlakant.patel@broadcom.com>

irq_alloc_descs need not be called in case of Vulcan, where we use
a dynamic IRQ range for GPIO interrupt numbers.

Update code not to call irq_alloc_descs and pass 0 as irq_base in
case of Vulcan.

Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>
---
 drivers/gpio/gpio-xlp.c |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index 1a33a19..6acf8aa 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -388,14 +388,16 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 	gc->get = xlp_gpio_get;
 
 	spin_lock_init(&priv->lock);
-	/* XLP has fixed IRQ range for GPIO interrupts */
-	if (soc_type == GPIO_VARIANT_VULCAN)
-		irq_base = irq_alloc_descs(-1, 0, gc->ngpio, 0);
-	else
+
+	/* XLP(MIPS) has fixed range for GPIO IRQs, Vulcan(ARM64) does not */
+	if (soc_type != GPIO_VARIANT_VULCAN) {
 		irq_base = irq_alloc_descs(-1, XLP_GPIO_IRQ_BASE, gc->ngpio, 0);
-	if (irq_base < 0) {
-		dev_err(&pdev->dev, "Failed to allocate IRQ numbers\n");
-		return irq_base;
+		if (irq_base < 0) {
+			dev_err(&pdev->dev, "Failed to allocate IRQ numbers\n");
+			return irq_base;
+		}
+	} else {
+		irq_base = 0;
 	}
 
 	err = gpiochip_add_data(gc, priv);
-- 
1.7.1

