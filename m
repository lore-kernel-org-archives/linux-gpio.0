From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH] pinctrl: bcm2835: Fix support for threaded level triggered IRQs
Date: Tue,  7 Apr 2015 11:43:45 +0100
Message-ID: <1428403425-12058-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:57175 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750983AbbDGKtC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2015 06:49:02 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, swarren@wwwdotorg.org, lee@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Currently, the driver uses handle_simple_irq for all IRQ types and hard
codes the acknowledge for different IRQ types into the handler. It is
better to use the IRQ core as intended and let it handle the differences
between the various types of IRQ. For example the current system does
not work for threaded level triggered IRQs as these need to be masked
until the threaded handler has run.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c |   26 +++++++++++++++++---------
 1 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 9aa8a3f..f0e5903 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -403,15 +403,7 @@ static irqreturn_t bcm2835_gpio_irq_handler(int irq, void *dev_id)
 		gpio = (32 * bank) + offset;
 		type = pc->irq_type[gpio];
 
-		/* ack edge triggered IRQs immediately */
-		if (!(type & IRQ_TYPE_LEVEL_MASK))
-			bcm2835_gpio_set_bit(pc, GPEDS0, gpio);
-
 		generic_handle_irq(irq_linear_revmap(pc->irq_domain, gpio));
-
-		/* ack level triggered IRQ after handling them */
-		if (type & IRQ_TYPE_LEVEL_MASK)
-			bcm2835_gpio_set_bit(pc, GPEDS0, gpio);
 	}
 	return events ? IRQ_HANDLED : IRQ_NONE;
 }
@@ -591,16 +583,32 @@ static int bcm2835_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 	else
 		ret = __bcm2835_gpio_irq_set_type_disabled(pc, gpio, type);
 
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		__irq_set_handler_locked(data->irq, handle_edge_irq);
+	else
+		__irq_set_handler_locked(data->irq, handle_level_irq);
+
 	spin_unlock_irqrestore(&pc->irq_lock[bank], flags);
 
 	return ret;
 }
 
+static void bcm2835_gpio_irq_ack(struct irq_data *data)
+{
+	struct bcm2835_pinctrl *pc = irq_data_get_irq_chip_data(data);
+	unsigned gpio = irqd_to_hwirq(data);
+
+	bcm2835_gpio_set_bit(pc, GPEDS0, gpio);
+}
+
 static struct irq_chip bcm2835_gpio_irq_chip = {
 	.name = MODULE_NAME,
 	.irq_enable = bcm2835_gpio_irq_enable,
 	.irq_disable = bcm2835_gpio_irq_disable,
 	.irq_set_type = bcm2835_gpio_irq_set_type,
+	.irq_ack = bcm2835_gpio_irq_ack,
+	.irq_mask = bcm2835_gpio_irq_disable,
+	.irq_unmask = bcm2835_gpio_irq_enable,
 };
 
 static int bcm2835_pctl_get_groups_count(struct pinctrl_dev *pctldev)
@@ -977,7 +985,7 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 		int irq = irq_create_mapping(pc->irq_domain, i);
 		irq_set_lockdep_class(irq, &gpio_lock_class);
 		irq_set_chip_and_handler(irq, &bcm2835_gpio_irq_chip,
-				handle_simple_irq);
+				handle_level_irq);
 		irq_set_chip_data(irq, pc);
 		set_irq_flags(irq, IRQF_VALID);
 	}
-- 
1.7.2.5

