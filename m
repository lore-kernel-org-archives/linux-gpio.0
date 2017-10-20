From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: mpc8xxx: Do not reverse bits using bgpio
Date: Fri, 20 Oct 2017 16:14:13 +0200
Message-ID: <20171020141413.29459-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:50345 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751750AbdJTOQV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Oct 2017 10:16:21 -0400
Received: by mail-lf0-f65.google.com with SMTP id a132so13366628lfa.7
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2017 07:16:20 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Liu Gang <Gang.Liu@nxp.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>

The MPC8xxx driver is always instantiating its generic GPIO functions
with the flag BGPIOF_BIG_ENDIAN. This means "big-endian bit order"
and means the bits representing the GPIO lines in the registers are
reversed around 31 bits so line 0 is at bit 31 and so forth down to
line 31 in bit 0.

Instead of looping into the generic MMIO gpio to do the simple
calculation of a bitmask, through a vtable call with two parameters
likely using stack frames etc (unless the compiler optimize it)
and obscuring the view for the programmer, let's just open-code
what the call does. This likely executes faster, saves space and
makes the code easier to read.

Cc: Liu Gang <Gang.Liu@nxp.com>
Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mpc8xxx.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 8c93dec498fa..ff5bf9c5dcec 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -21,6 +21,7 @@
 #include <linux/slab.h>
 #include <linux/irq.h>
 #include <linux/gpio/driver.h>
+#include <linux/bitops.h>
 
 #define MPC8XXX_GPIO_PINS	32
 
@@ -44,6 +45,16 @@ struct mpc8xxx_gpio_chip {
 	unsigned int irqn;
 };
 
+/*
+ * This hardware has a big endian bit assignment such that GPIO line 0 is
+ * connected to bit 31, line 1 to bit 30 ... line 31 to bit 0.
+ * This inline helper give the right bitmask for a certain line.
+ */
+static inline u32 mpc_pin2mask(unsigned int offset)
+{
+	return BIT(31 - offset);
+}
+
 /* Workaround GPIO 1 errata on MPC8572/MPC8536. The status of GPIOs
  * defined as output cannot be determined by reading GPDAT register,
  * so we use shadow data register instead. The status of input pins
@@ -59,7 +70,7 @@ static int mpc8572_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	val = gc->read_reg(mpc8xxx_gc->regs + GPIO_DAT) & ~out_mask;
 	out_shadow = gc->bgpio_data & out_mask;
 
-	return !!((val | out_shadow) & gc->pin2mask(gc, gpio));
+	return !!((val | out_shadow) & mpc_pin2mask(offset));
 }
 
 static int mpc5121_gpio_dir_out(struct gpio_chip *gc,
@@ -120,7 +131,7 @@ static void mpc8xxx_irq_unmask(struct irq_data *d)
 
 	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR,
 		gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR)
-		| gc->pin2mask(gc, irqd_to_hwirq(d)));
+		| mpc_pin2mask(irqd_to_hwirq(d)));
 
 	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 }
@@ -135,7 +146,7 @@ static void mpc8xxx_irq_mask(struct irq_data *d)
 
 	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR,
 		gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR)
-		& ~(gc->pin2mask(gc, irqd_to_hwirq(d))));
+		& ~mpc_pin2mask(irqd_to_hwirq(d)));
 
 	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 }
@@ -146,7 +157,7 @@ static void mpc8xxx_irq_ack(struct irq_data *d)
 	struct gpio_chip *gc = &mpc8xxx_gc->gc;
 
 	gc->write_reg(mpc8xxx_gc->regs + GPIO_IER,
-		      gc->pin2mask(gc, irqd_to_hwirq(d)));
+		      mpc_pin2mask(irqd_to_hwirq(d)));
 }
 
 static int mpc8xxx_irq_set_type(struct irq_data *d, unsigned int flow_type)
@@ -160,7 +171,7 @@ static int mpc8xxx_irq_set_type(struct irq_data *d, unsigned int flow_type)
 		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 		gc->write_reg(mpc8xxx_gc->regs + GPIO_ICR,
 			gc->read_reg(mpc8xxx_gc->regs + GPIO_ICR)
-			| gc->pin2mask(gc, irqd_to_hwirq(d)));
+			| mpc_pin2mask(irqd_to_hwirq(d)));
 		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
 
@@ -168,7 +179,7 @@ static int mpc8xxx_irq_set_type(struct irq_data *d, unsigned int flow_type)
 		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 		gc->write_reg(mpc8xxx_gc->regs + GPIO_ICR,
 			gc->read_reg(mpc8xxx_gc->regs + GPIO_ICR)
-			& ~(gc->pin2mask(gc, irqd_to_hwirq(d))));
+			& ~mpc_pin2mask(irqd_to_hwirq(d)));
 		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
 
-- 
2.13.6

