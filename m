From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/4] irqchip/renesas-irqc: Use proper irq_chip name and parent
Date: Fri,  7 Jun 2019 11:58:56 +0200
Message-ID: <20190607095858.10028-3-geert+renesas@glider.be>
References: <20190607095858.10028-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190607095858.10028-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

The irq_chip .name field should contain the device's class (not
instance) name, while .parent_device should point to the device itself.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/irqchip/irq-renesas-irqc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-renesas-irqc.c
index cde9f9c0687e94a4..11abc09ef76c62b5 100644
--- a/drivers/irqchip/irq-renesas-irqc.c
+++ b/drivers/irqchip/irq-renesas-irqc.c
@@ -176,7 +176,7 @@ static int irqc_probe(struct platform_device *pdev)
 	}
 
 	ret = irq_alloc_domain_generic_chips(p->irq_domain, p->number_of_irqs,
-					     1, name, handle_level_irq,
+					     1, "irqc", handle_level_irq,
 					     0, 0, IRQ_GC_INIT_NESTED_LOCK);
 	if (ret) {
 		dev_err(dev, "cannot allocate generic chip\n");
@@ -187,6 +187,7 @@ static int irqc_probe(struct platform_device *pdev)
 	p->gc->reg_base = p->cpu_int_base;
 	p->gc->chip_types[0].regs.enable = IRQC_EN_SET;
 	p->gc->chip_types[0].regs.disable = IRQC_EN_STS;
+	p->gc->chip_types[0].chip.parent_device = dev;
 	p->gc->chip_types[0].chip.irq_mask = irq_gc_mask_disable_reg;
 	p->gc->chip_types[0].chip.irq_unmask = irq_gc_unmask_enable_reg;
 	p->gc->chip_types[0].chip.irq_set_type	= irqc_irq_set_type;
-- 
2.17.1
