From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] gpio: thunderx: remove unused .map() hook from irq_domain_ops
Date: Thu, 14 Sep 2017 11:37:25 +0900
Message-ID: <1505356645-19765-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, David Daney <david.daney@cavium.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This driver implements .alloc() hook, so .map() is not used.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/gpio-thunderx.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index 57efb25..b5adb79 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -417,18 +417,6 @@ static struct irq_chip thunderx_gpio_irq_chip = {
 	.flags			= IRQCHIP_SET_TYPE_MASKED
 };
 
-static int thunderx_gpio_irq_map(struct irq_domain *d, unsigned int irq,
-				 irq_hw_number_t hwirq)
-{
-	struct thunderx_gpio *txgpio = d->host_data;
-
-	if (hwirq >= txgpio->chip.ngpio)
-		return -EINVAL;
-	if (!thunderx_gpio_is_gpio_nowarn(txgpio, hwirq))
-		return -EPERM;
-	return 0;
-}
-
 static int thunderx_gpio_irq_translate(struct irq_domain *d,
 				       struct irq_fwspec *fwspec,
 				       irq_hw_number_t *hwirq,
@@ -455,7 +443,6 @@ static int thunderx_gpio_irq_alloc(struct irq_domain *d, unsigned int virq,
 }
 
 static const struct irq_domain_ops thunderx_gpio_irqd_ops = {
-	.map		= thunderx_gpio_irq_map,
 	.alloc		= thunderx_gpio_irq_alloc,
 	.translate	= thunderx_gpio_irq_translate
 };
-- 
2.7.4
