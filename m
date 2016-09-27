From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: stmpe: forbid unused lines to be mapped as IRQs
Date: Tue, 27 Sep 2016 16:07:04 -0700
Message-ID: <1475017624-29686-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f173.google.com ([209.85.192.173]:34339 "EHLO
        mail-pf0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755989AbcI0XHP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2016 19:07:15 -0400
Received: by mail-pf0-f173.google.com with SMTP id l25so10391589pfb.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2016 16:07:15 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Patrice Chotard <patrice.chotard@st.com>, Mika Westerberg <mika.westerberg@linux.intel.com>

Exploit the new mechanism for masking off disallowed IRQs
added by Mika Westerberg to properly manage the STMPE
"norequest mask" to disallow also mapping said lines as
IRQs.

Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-stmpe.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index b51c5be55c3a..432b2ee173c7 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/mfd/stmpe.h>
 #include <linux/seq_file.h>
+#include <linux/bitops.h>
 
 /*
  * These registers are modified under the irq bus lock and cached to avoid
@@ -449,6 +450,8 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 
 	of_property_read_u32(np, "st,norequest-mask",
 			&stmpe_gpio->norequest_mask);
+	if (stmpe_gpio->norequest_mask)
+		stmpe_gpio->chip.irq_need_valid_mask = true;
 
 	if (irq < 0)
 		dev_info(&pdev->dev,
@@ -473,6 +476,14 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "unable to get irq: %d\n", ret);
 			goto out_disable;
 		}
+		if (stmpe_gpio->norequest_mask) {
+			int i;
+
+			/* Forbid unused lines to be mapped as IRQs */
+			for (i = 0; i < sizeof(u32); i++)
+				if (stmpe_gpio->norequest_mask & BIT(i))
+					clear_bit(i, stmpe_gpio->chip.irq_valid_mask);
+		}
 		ret =  gpiochip_irqchip_add(&stmpe_gpio->chip,
 					    &stmpe_gpio_irq_chip,
 					    0,
-- 
2.7.4

