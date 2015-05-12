From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] pinctrl: cherryview: Read triggering type from HW if not set when requested
Date: Tue, 12 May 2015 13:35:37 +0300
Message-ID: <1431426937-225742-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:2693 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752810AbbELKfm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 12 May 2015 06:35:42 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jagadish Krishnamoorthy <jagadish.krishnamoorthy@intel.com>, Freddy Paul <freddy.paul@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

If a driver does not set interrupt triggering type when it calls
request_irq(), it means use the pin as the hardware/firmware has
configured it. There are some drivers doing this. One example is
drivers/input/serio/i8042.c that requests the interrupt like:

	error = request_irq(I8042_KBD_IRQ, i8042_interrupt, IRQF_SHARED,
			    "i8042", i8042_platform_device);

It assumes the interrupt is already properly configured. This is true in
case of interrupts connected to the IO-APIC. However, some Intel
Braswell/Cherryview based machines use a GPIO here instead for the internal
keyboard controller.

This is a problem because even if the pin/interrupt is properly configured,
the irqchip ->irq_set_type() will never be called as the triggering flags
are 0. Because of that we do not have correct interrupt flow handler set
for the interrupt.

Fix this by adding a custom ->irq_startup() that checks if the interrupt
has no triggering type set and in that case read the type directly from the
hardware and install correct flow handler along with the mapping.

Reported-by: Jagadish Krishnamoorthy <jagadish.krishnamoorthy@intel.com>
Reported-by: Freddy Paul <freddy.paul@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 44 ++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 82f691eeeec4..732ff757a95f 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1292,6 +1292,49 @@ static void chv_gpio_irq_unmask(struct irq_data *d)
 	chv_gpio_irq_mask_unmask(d, false);
 }
 
+static unsigned chv_gpio_irq_startup(struct irq_data *d)
+{
+	/*
+	 * Check if the interrupt has been requested with 0 as triggering
+	 * type. In that case it is assumed that the current values
+	 * programmed to the hardware are used (e.g BIOS configured
+	 * defaults).
+	 *
+	 * In that case ->irq_set_type() will never be called so we need to
+	 * read back the values from hardware now, set correct flow handler
+	 * and update mappings before the interrupt is being used.
+	 */
+	if (irqd_get_trigger_type(d) == IRQ_TYPE_NONE) {
+		struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+		struct chv_pinctrl *pctrl = gpiochip_to_pinctrl(gc);
+		unsigned offset = irqd_to_hwirq(d);
+		int pin = chv_gpio_offset_to_pin(pctrl, offset);
+		irq_flow_handler_t handler;
+		unsigned long flags;
+		u32 intsel, value;
+
+		intsel = readl(chv_padreg(pctrl, pin, CHV_PADCTRL0));
+		intsel &= CHV_PADCTRL0_INTSEL_MASK;
+		intsel >>= CHV_PADCTRL0_INTSEL_SHIFT;
+
+		value = readl(chv_padreg(pctrl, pin, CHV_PADCTRL1));
+		if (value & CHV_PADCTRL1_INTWAKECFG_LEVEL)
+			handler = handle_level_irq;
+		else
+			handler = handle_edge_irq;
+
+		spin_lock_irqsave(&pctrl->lock, flags);
+		if (!pctrl->intr_lines[intsel]) {
+			__irq_set_handler_locked(d->irq, handler);
+			pctrl->intr_lines[intsel] = offset;
+		}
+		spin_unlock_irqrestore(&pctrl->lock, flags);
+	}
+
+	chv_gpio_irq_unmask(d);
+	return 0;
+}
+
 static int chv_gpio_irq_type(struct irq_data *d, unsigned type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -1357,6 +1400,7 @@ static int chv_gpio_irq_type(struct irq_data *d, unsigned type)
 
 static struct irq_chip chv_gpio_irqchip = {
 	.name = "chv-gpio",
+	.irq_startup = chv_gpio_irq_startup,
 	.irq_ack = chv_gpio_irq_ack,
 	.irq_mask = chv_gpio_irq_mask,
 	.irq_unmask = chv_gpio_irq_unmask,
-- 
2.1.4

