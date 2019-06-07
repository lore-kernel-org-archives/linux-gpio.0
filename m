From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] irqchip/renesas-intc-irqpin: Use proper irq_chip name and parent
Date: Fri,  7 Jun 2019 11:58:55 +0200
Message-ID: <20190607095858.10028-2-geert+renesas@glider.be>
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
 drivers/irqchip/irq-renesas-intc-irqpin.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-intc-irqpin.c b/drivers/irqchip/irq-renesas-intc-irqpin.c
index 04c05a18600cf71f..f82bc60a67931cd7 100644
--- a/drivers/irqchip/irq-renesas-intc-irqpin.c
+++ b/drivers/irqchip/irq-renesas-intc-irqpin.c
@@ -508,7 +508,8 @@ static int intc_irqpin_probe(struct platform_device *pdev)
 	}
 
 	irq_chip = &p->irq_chip;
-	irq_chip->name = name;
+	irq_chip->name = "intc-irqpin";
+	irq_chip->parent_device = dev;
 	irq_chip->irq_mask = disable_fn;
 	irq_chip->irq_unmask = enable_fn;
 	irq_chip->irq_set_type = intc_irqpin_irq_set_type;
-- 
2.17.1
