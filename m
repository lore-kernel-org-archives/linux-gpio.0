From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] gpio-tz1090: Replace commas with semi-colons
Date: Tue, 4 Mar 2014 11:28:48 +0000
Message-ID: <1393932528-25207-1-git-send-email-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Replace commas with semicolons between irqchip callback initialisation
statements in tz1090_gpio_bank_probe. The commas appear to be a subtle
remnant of when the irqchips were statically initialised.

Thanks to Thomas Gleixner for spotting it while whipping up a coccinelle
script.

Reported-by: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Signed-off-by: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/gpio/gpio-tz1090.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-tz1090.c b/drivers/gpio/gpio-tz1090.c
index 23e061392411..5246a60eff6d 100644
--- a/drivers/gpio/gpio-tz1090.c
+++ b/drivers/gpio/gpio-tz1090.c
@@ -488,26 +488,26 @@ static int tz1090_gpio_bank_probe(struct tz1090_gpio_bank_info *info)
 	gc->chip_types[0].handler		= handle_level_irq;
 	gc->chip_types[0].regs.ack		= REG_GPIO_IRQ_STS;
 	gc->chip_types[0].regs.mask		= REG_GPIO_IRQ_EN;
-	gc->chip_types[0].chip.irq_startup	= gpio_startup_irq,
-	gc->chip_types[0].chip.irq_ack		= irq_gc_ack_clr_bit,
-	gc->chip_types[0].chip.irq_mask		= irq_gc_mask_clr_bit,
-	gc->chip_types[0].chip.irq_unmask	= irq_gc_mask_set_bit,
-	gc->chip_types[0].chip.irq_set_type	= gpio_set_irq_type,
-	gc->chip_types[0].chip.irq_set_wake	= gpio_set_irq_wake,
-	gc->chip_types[0].chip.flags		= IRQCHIP_MASK_ON_SUSPEND,
+	gc->chip_types[0].chip.irq_startup	= gpio_startup_irq;
+	gc->chip_types[0].chip.irq_ack		= irq_gc_ack_clr_bit;
+	gc->chip_types[0].chip.irq_mask		= irq_gc_mask_clr_bit;
+	gc->chip_types[0].chip.irq_unmask	= irq_gc_mask_set_bit;
+	gc->chip_types[0].chip.irq_set_type	= gpio_set_irq_type;
+	gc->chip_types[0].chip.irq_set_wake	= gpio_set_irq_wake;
+	gc->chip_types[0].chip.flags		= IRQCHIP_MASK_ON_SUSPEND;
 
 	/* edge chip type */
 	gc->chip_types[1].type			= IRQ_TYPE_EDGE_BOTH;
 	gc->chip_types[1].handler		= handle_edge_irq;
 	gc->chip_types[1].regs.ack		= REG_GPIO_IRQ_STS;
 	gc->chip_types[1].regs.mask		= REG_GPIO_IRQ_EN;
-	gc->chip_types[1].chip.irq_startup	= gpio_startup_irq,
-	gc->chip_types[1].chip.irq_ack		= irq_gc_ack_clr_bit,
-	gc->chip_types[1].chip.irq_mask		= irq_gc_mask_clr_bit,
-	gc->chip_types[1].chip.irq_unmask	= irq_gc_mask_set_bit,
-	gc->chip_types[1].chip.irq_set_type	= gpio_set_irq_type,
-	gc->chip_types[1].chip.irq_set_wake	= gpio_set_irq_wake,
-	gc->chip_types[1].chip.flags		= IRQCHIP_MASK_ON_SUSPEND,
+	gc->chip_types[1].chip.irq_startup	= gpio_startup_irq;
+	gc->chip_types[1].chip.irq_ack		= irq_gc_ack_clr_bit;
+	gc->chip_types[1].chip.irq_mask		= irq_gc_mask_clr_bit;
+	gc->chip_types[1].chip.irq_unmask	= irq_gc_mask_set_bit;
+	gc->chip_types[1].chip.irq_set_type	= gpio_set_irq_type;
+	gc->chip_types[1].chip.irq_set_wake	= gpio_set_irq_wake;
+	gc->chip_types[1].chip.flags		= IRQCHIP_MASK_ON_SUSPEND;
 
 	/* Setup chained handler for this GPIO bank */
 	irq_set_handler_data(bank->irq, bank);
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe linux-metag" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
