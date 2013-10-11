From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: intel-mid: drop references to "virtual" IRQ
Date: Fri, 11 Oct 2013 19:28:15 +0200
Message-ID: <1381512495-6917-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:42340 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752310Ab3JKR21 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 13:28:27 -0400
Received: by mail-we0-f172.google.com with SMTP id q58so4576313wes.31
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 10:28:26 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, David Cohen <david.a.cohen@linux.intel.com>

Rename the argument "virq" to just "irq", this IRQ isn't any
more "virtual" than any other Linux IRQ number, we use "hwirq"
for the actual hw-numbers, "virq" is just bogus.

Cc: David Cohen <david.a.cohen@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-intel-mid.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index 612b54d..be803af 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -353,15 +353,15 @@ static void intel_mid_irq_init_hw(struct intel_mid_gpio *priv)
 	}
 }
 
-static int intel_gpio_irq_map(struct irq_domain *d, unsigned int virq,
-			    irq_hw_number_t hw)
+static int intel_gpio_irq_map(struct irq_domain *d, unsigned int irq,
+			    irq_hw_number_t hwirq)
 {
 	struct intel_mid_gpio *priv = d->host_data;
 
-	irq_set_chip_and_handler_name(virq, &intel_mid_irqchip,
+	irq_set_chip_and_handler_name(irq, &intel_mid_irqchip,
 				      handle_simple_irq, "demux");
-	irq_set_chip_data(virq, priv);
-	irq_set_irq_type(virq, IRQ_TYPE_NONE);
+	irq_set_chip_data(irq, priv);
+	irq_set_irq_type(irq, IRQ_TYPE_NONE);
 
 	return 0;
 }
-- 
1.8.3.1

