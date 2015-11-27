From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 1/2] pinctrl: single: Use a separate lockdep class
Date: Fri, 27 Nov 2015 17:20:59 +0000
Message-ID: <1448644860-29323-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:50589 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754984AbbK0RVN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 27 Nov 2015 12:21:13 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org

The single pinmux controller can be cascaded to the other interrupt
controllers. Hence when propagating wake-up settings to its parent
interrupt controller, there's possiblity of detecting possible recursive
locking and getting lockdep warning.

This patch avoids this false positive by using a separate lockdep class
for this single pinctrl interrupts.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/pinctrl/pinctrl-single.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index ef04b962c3d5..945a7d0f0704 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -255,6 +255,13 @@ static enum pin_config_param pcs_bias[] = {
 };
 
 /*
+ * This lock class tells lockdep that irqchip core that this single
+ * pinctrl can be in a different category than its parents, so it won't
+ * report false recursion.
+ */
+static struct lock_class_key pcs_lock_class;
+
+/*
  * REVISIT: Reads and writes could eventually use regmap or something
  * generic. But at least on omaps, some mux registers are performance
  * critical as they may need to be remuxed every time before and after
@@ -1716,6 +1723,7 @@ static int pcs_irqdomain_map(struct irq_domain *d, unsigned int irq,
 	irq_set_chip_data(irq, pcs_soc);
 	irq_set_chip_and_handler(irq, &pcs->chip,
 				 handle_level_irq);
+	irq_set_lockdep_class(irq, &pcs_lock_class);
 	irq_set_noprobe(irq);
 
 	return 0;
-- 
1.9.1

