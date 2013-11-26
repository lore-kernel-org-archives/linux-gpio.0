From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: drop users of irq_set_chip_and_handler_name()
Date: Tue, 26 Nov 2013 14:32:51 +0100
Message-ID: <1385472771-26681-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f51.google.com ([209.85.215.51]:53255 "EHLO
	mail-la0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751115Ab3KZNc6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Nov 2013 08:32:58 -0500
Received: by mail-la0-f51.google.com with SMTP id ec20so4217458lab.38
        for <linux-gpio@vger.kernel.org>; Tue, 26 Nov 2013 05:32:56 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, David Cohen <david.a.cohen@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>

Switch all users of irq_set_chip_and_handler_name() to simply
use irq_set_chip_and_handler(), all just provide a boilerplate
name like "demux" or "mux" - a fact which is anyway obvious
from the hwirq number from the irqdomain now present in e.g.
/proc/interrupts.

Cc: David Cohen <david.a.cohen@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
I'm challenging all users of this function to make an argument
for it to stay in, and suspecting that this is mostly a copy
and paste artifact...
---
 drivers/gpio/gpio-intel-mid.c  | 3 +--
 drivers/gpio/gpio-lynxpoint.c  | 3 +--
 drivers/gpio/gpio-msic.c       | 7 +++----
 drivers/gpio/gpio-timberdale.c | 4 ++--
 4 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index be803af658ac..17f135046c7f 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -358,8 +358,7 @@ static int intel_gpio_irq_map(struct irq_domain *d, unsigned int irq,
 {
 	struct intel_mid_gpio *priv = d->host_data;
 
-	irq_set_chip_and_handler_name(irq, &intel_mid_irqchip,
-				      handle_simple_irq, "demux");
+	irq_set_chip_and_handler(irq, &intel_mid_irqchip, handle_simple_irq);
 	irq_set_chip_data(irq, priv);
 	irq_set_irq_type(irq, IRQ_TYPE_NONE);
 
diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
index f1ca9d5880b6..89867ed7bd50 100644
--- a/drivers/gpio/gpio-lynxpoint.c
+++ b/drivers/gpio/gpio-lynxpoint.c
@@ -331,8 +331,7 @@ static int lp_gpio_irq_map(struct irq_domain *d, unsigned int irq,
 {
 	struct lp_gpio *lg = d->host_data;
 
-	irq_set_chip_and_handler_name(irq, &lp_irqchip, handle_simple_irq,
-				      "demux");
+	irq_set_chip_and_handler(irq, &lp_irqchip, handle_simple_irq);
 	irq_set_chip_data(irq, lg);
 	irq_set_irq_type(irq, IRQ_TYPE_NONE);
 
diff --git a/drivers/gpio/gpio-msic.c b/drivers/gpio/gpio-msic.c
index d75eaa3a1dcc..69d60ab1d698 100644
--- a/drivers/gpio/gpio-msic.c
+++ b/drivers/gpio/gpio-msic.c
@@ -305,10 +305,9 @@ static int platform_msic_gpio_probe(struct platform_device *pdev)
 
 	for (i = 0; i < mg->chip.ngpio; i++) {
 		irq_set_chip_data(i + mg->irq_base, mg);
-		irq_set_chip_and_handler_name(i + mg->irq_base,
-					      &msic_irqchip,
-					      handle_simple_irq,
-					      "demux");
+		irq_set_chip_and_handler(i + mg->irq_base,
+					 &msic_irqchip,
+					 handle_simple_irq);
 	}
 	irq_set_chained_handler(mg->irq, msic_gpio_irq_handler);
 	irq_set_handler_data(mg->irq, mg);
diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index 7a0e956ef1ed..521971e6a9f5 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -290,8 +290,8 @@ static int timbgpio_probe(struct platform_device *pdev)
 		return 0;
 
 	for (i = 0; i < pdata->nr_pins; i++) {
-		irq_set_chip_and_handler_name(tgpio->irq_base + i,
-			&timbgpio_irqchip, handle_simple_irq, "mux");
+		irq_set_chip_and_handler(tgpio->irq_base + i,
+			&timbgpio_irqchip, handle_simple_irq);
 		irq_set_chip_data(tgpio->irq_base + i, tgpio);
 #ifdef CONFIG_ARM
 		set_irq_flags(tgpio->irq_base + i, IRQF_VALID | IRQF_PROBE);
-- 
1.8.3.1

