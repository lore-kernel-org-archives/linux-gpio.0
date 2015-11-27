From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH] gpio: pl061: add support for wakeup configuration
Date: Fri, 27 Nov 2015 17:19:15 +0000
Message-ID: <1448644755-29183-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:50584 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754306AbbK0RTm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 27 Nov 2015 12:19:42 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>

The PL061 supports interrupts and those can be wakeup interrupts. We
need to provide support for configuring those interrupts as wakeup
sources.

This patch adds irq_set_wake callback for PL061 so that GPIO interrupts
can be configured as wakeup.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/gpio/gpio-pl061.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 4d4b37676702..8b1cbd5767f9 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/bitops.h>
@@ -269,12 +270,20 @@ static void pl061_irq_ack(struct irq_data *d)
 	spin_unlock(&chip->lock);
 }
 
+static int pl061_irq_set_wake(struct irq_data *d, unsigned int state)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	return irq_set_irq_wake(gc->irq_parent, state);
+}
+
 static struct irq_chip pl061_irqchip = {
 	.name		= "pl061",
 	.irq_ack	= pl061_irq_ack,
 	.irq_mask	= pl061_irq_mask,
 	.irq_unmask	= pl061_irq_unmask,
 	.irq_set_type	= pl061_irq_type,
+	.irq_set_wake	= pl061_irq_set_wake,
 };
 
 static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
-- 
1.9.1

