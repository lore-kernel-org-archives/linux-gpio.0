From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 3/3] gpio: em: drop ->irq_{request,release}_resources hooks
Date: Fri,  8 Feb 2019 12:52:01 +0100
Message-ID: <20190208115201.7518-4-thomas.petazzoni@bootlin.com>
References: <20190208115201.7518-1-thomas.petazzoni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208115201.7518-1-thomas.petazzoni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: linux-gpio@vger.kernel.org

Those hooks implement the exact same behavior as the default hooks by
gpiolib, so there is no point in having a duplicated definition in
gpio-dwapb.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Note: this commit was only build tested.
---
 drivers/gpio/gpio-em.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 982e699a5b81..e27c56854ee7 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -98,29 +98,6 @@ static void em_gio_irq_enable(struct irq_data *d)
 	em_gio_write(p, GIO_IEN, BIT(irqd_to_hwirq(d)));
 }
 
-static int em_gio_irq_reqres(struct irq_data *d)
-{
-	struct em_gio_priv *p = irq_data_get_irq_chip_data(d);
-	int ret;
-
-	ret = gpiochip_lock_as_irq(&p->gpio_chip, irqd_to_hwirq(d));
-	if (ret) {
-		dev_err(p->gpio_chip.parent,
-			"unable to lock HW IRQ %lu for IRQ\n",
-			irqd_to_hwirq(d));
-		return ret;
-	}
-	return 0;
-}
-
-static void em_gio_irq_relres(struct irq_data *d)
-{
-	struct em_gio_priv *p = irq_data_get_irq_chip_data(d);
-
-	gpiochip_unlock_as_irq(&p->gpio_chip, irqd_to_hwirq(d));
-}
-
-
 #define GIO_ASYNC(x) (x + 8)
 
 static unsigned char em_gio_sense_table[IRQ_TYPE_SENSE_MASK + 1] = {
@@ -344,8 +321,6 @@ static int em_gio_probe(struct platform_device *pdev)
 	irq_chip->irq_mask = em_gio_irq_disable;
 	irq_chip->irq_unmask = em_gio_irq_enable;
 	irq_chip->irq_set_type = em_gio_irq_set_type;
-	irq_chip->irq_request_resources = em_gio_irq_reqres;
-	irq_chip->irq_release_resources = em_gio_irq_relres;
 	irq_chip->flags	= IRQCHIP_SKIP_SET_WAKE | IRQCHIP_MASK_ON_SUSPEND;
 
 	p->irq_domain = irq_domain_add_simple(pdev->dev.of_node, ngpios, 0,
-- 
2.20.1
