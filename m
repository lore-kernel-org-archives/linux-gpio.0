From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/3] gpio: pl061: lock IRQs when starting them
Date: Tue, 26 Nov 2013 14:23:47 +0100
Message-ID: <1385472227-25956-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:34606 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752859Ab3KZNXy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Nov 2013 08:23:54 -0500
Received: by mail-lb0-f169.google.com with SMTP id y6so4520619lbh.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 Nov 2013 05:23:53 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Baruch Siach <baruch@tkos.co.il>, Deepak Sikri <deepak.sikri@st.com>

This uses the new API for tagging GPIO lines as in use by
IRQs. This enforces a few semantic checks on how the underlying
GPIO line is used.

Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Deepak Sikri <deepak.sikri@st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pl061.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index f22f7f3e2e53..1c37c97acc76 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -231,11 +231,33 @@ static void pl061_irq_unmask(struct irq_data *d)
 	spin_unlock(&chip->lock);
 }
 
+static unsigned int pl061_irq_startup(struct irq_data *d)
+{
+	struct pl061_gpio *chip = irq_data_get_irq_chip_data(d);
+
+	if (gpio_lock_as_irq(&chip->gc, irqd_to_hwirq(d)))
+		dev_err(chip->gc.dev,
+			"unable to lock HW IRQ %lu for IRQ\n",
+			irqd_to_hwirq(d));
+	pl061_irq_unmask(d);
+	return 0;
+}
+
+static void pl061_irq_shutdown(struct irq_data *d)
+{
+	struct pl061_gpio *chip = irq_data_get_irq_chip_data(d);
+
+	pl061_irq_mask(d);
+	gpio_unlock_as_irq(&chip->gc, irqd_to_hwirq(d));
+}
+
 static struct irq_chip pl061_irqchip = {
 	.name		= "pl061 gpio",
 	.irq_mask	= pl061_irq_mask,
 	.irq_unmask	= pl061_irq_unmask,
 	.irq_set_type	= pl061_irq_type,
+	.irq_startup	= pl061_irq_startup,
+	.irq_shutdown	= pl061_irq_shutdown,
 };
 
 static int pl061_irq_map(struct irq_domain *d, unsigned int irq,
-- 
1.8.3.1

