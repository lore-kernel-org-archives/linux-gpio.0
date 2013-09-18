From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: pcf857x: only use set_irq_flags() on ARM
Date: Wed, 18 Sep 2013 13:17:31 +0200
Message-ID: <1379503051-27310-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f42.google.com ([209.85.215.42]:41700 "EHLO
	mail-la0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751819Ab3IRLRw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Sep 2013 07:17:52 -0400
Received: by mail-la0-f42.google.com with SMTP id ep20so5607032lab.29
        for <linux-gpio@vger.kernel.org>; Wed, 18 Sep 2013 04:17:51 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, George Cherian <george.cherian@ti.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Felipe Balbi <balbi@ti.com>

As per the pattern from other GPIO drivers, use set_irq_flags()
on ARM only, use irq_set_noprobe() on other archs.

Also rename the argument "virq" to just "irq", this IRQ isn't
any more "virtual" than any other Linux IRQ number, we use
"hwirq" for the actual hw-numbers, "virq" is just bogus.

Cc: George Cherian <george.cherian@ti.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Felipe Balbi <balbi@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pcf857x.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 815944d..54725a6 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -195,15 +195,19 @@ static irqreturn_t pcf857x_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int pcf857x_irq_domain_map(struct irq_domain *domain, unsigned int virq,
+static int pcf857x_irq_domain_map(struct irq_domain *domain, unsigned int irq,
 				 irq_hw_number_t hw)
 {
 	struct pcf857x *gpio = domain->host_data;
 
-	irq_set_chip_and_handler(virq,
+	irq_set_chip_and_handler(irq,
 				 &dummy_irq_chip,
 				 handle_level_irq);
-	set_irq_flags(virq, IRQF_VALID);
+#ifdef CONFIG_ARM
+	set_irq_flags(irq, IRQF_VALID);
+#else
+	irq_set_noprobe(irq);
+#endif
 	gpio->irq_mapped |= (1 << hw);
 
 	return 0;
-- 
1.8.3.1

