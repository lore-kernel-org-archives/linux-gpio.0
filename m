From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 2/3] gpio: dwapb: drop ->irq_{request,release}_resources hooks
Date: Fri,  8 Feb 2019 12:52:00 +0100
Message-ID: <20190208115201.7518-3-thomas.petazzoni@bootlin.com>
References: <20190208115201.7518-1-thomas.petazzoni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208115201.7518-1-thomas.petazzoni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Hoan Tran <hotran@apm.com>
List-Id: linux-gpio@vger.kernel.org

Those hooks implement the exact same behavior as the default hooks by
gpiolib, so there is no point in having a duplicated definition in
gpio-dwapb.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Hoan Tran <hotran@apm.com>
---
Note: this commit was only build tested.
---
 drivers/gpio/gpio-dwapb.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 044888fd96a1..93eba2c6f328 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -250,31 +250,6 @@ static void dwapb_irq_disable(struct irq_data *d)
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
-static int dwapb_irq_reqres(struct irq_data *d)
-{
-	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
-	struct dwapb_gpio *gpio = igc->private;
-	struct gpio_chip *gc = &gpio->ports[0].gc;
-	int ret;
-
-	ret = gpiochip_lock_as_irq(gc, irqd_to_hwirq(d));
-	if (ret) {
-		dev_err(gpio->dev, "unable to lock HW IRQ %lu for IRQ\n",
-			irqd_to_hwirq(d));
-		return ret;
-	}
-	return 0;
-}
-
-static void dwapb_irq_relres(struct irq_data *d)
-{
-	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
-	struct dwapb_gpio *gpio = igc->private;
-	struct gpio_chip *gc = &gpio->ports[0].gc;
-
-	gpiochip_unlock_as_irq(gc, irqd_to_hwirq(d));
-}
-
 static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 {
 	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
@@ -428,8 +403,6 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 		ct->chip.irq_set_type = dwapb_irq_set_type;
 		ct->chip.irq_enable = dwapb_irq_enable;
 		ct->chip.irq_disable = dwapb_irq_disable;
-		ct->chip.irq_request_resources = dwapb_irq_reqres;
-		ct->chip.irq_release_resources = dwapb_irq_relres;
 #ifdef CONFIG_PM_SLEEP
 		ct->chip.irq_set_wake = dwapb_irq_set_wake;
 #endif
-- 
2.20.1
