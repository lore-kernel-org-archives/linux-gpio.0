From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH] gpio: zynq: properly support runtime PM for GPIO used as interrupts
Date: Fri,  8 Feb 2019 11:40:46 +0100
Message-ID: <20190208104046.21817-1-thomas.petazzoni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Michal Simek <michal.simek@xilinx.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: linux-gpio@vger.kernel.org

The Zynq GPIO driver currently implements runtime PM by:

 - Enabling runtime PM support in ->probe() and letting the runtime PM
   reference counter drop to zero at the end of ->probe().

 - Increasing the runtime PM reference counter in ->request() and
   decreasing it in ->free().

However, the latter is not sufficient: when a GPIO is used as an
interrupt, ->request() and ->free() are not called. Due to this, the
runtime PM counter remains to zero when the only GPIOs in use are used
as interrupts, causing them to simply not work.

To address this problem, this commit implement the
->irq_request_resources() and ->irq_release_resources() hooks,
ensuring that the runtime PM counter is properly
incremented/decremented. Since we override the default hooks, we keep
the existing behavior by making sure they call gpiochip_reqres_irq() /
gpiochip_relres_irq() respectively.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 drivers/gpio/gpio-zynq.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 3f5fcdd5a429..65c0c29ce851 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -533,6 +533,26 @@ static int zynq_gpio_set_wake(struct irq_data *data, unsigned int on)
 	return 0;
 }
 
+static int zynq_gpio_irq_reqres(struct irq_data *d)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	int ret;
+
+	ret = pm_runtime_get_sync(chip->parent);
+	if (ret < 0)
+		return ret;
+
+	return gpiochip_reqres_irq(chip, d->hwirq);
+}
+
+static void zynq_gpio_irq_relres(struct irq_data *d)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+
+	gpiochip_relres_irq(chip, d->hwirq);
+	pm_runtime_put(chip->parent);
+}
+
 /* irq chip descriptor */
 static struct irq_chip zynq_gpio_level_irqchip = {
 	.name		= DRIVER_NAME,
@@ -542,6 +562,8 @@ static struct irq_chip zynq_gpio_level_irqchip = {
 	.irq_unmask	= zynq_gpio_irq_unmask,
 	.irq_set_type	= zynq_gpio_set_irq_type,
 	.irq_set_wake	= zynq_gpio_set_wake,
+	.irq_request_resources = zynq_gpio_irq_reqres,
+	.irq_release_resources = zynq_gpio_irq_relres,
 	.flags		= IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF_HANDLED |
 			  IRQCHIP_MASK_ON_SUSPEND,
 };
@@ -554,6 +576,8 @@ static struct irq_chip zynq_gpio_edge_irqchip = {
 	.irq_unmask	= zynq_gpio_irq_unmask,
 	.irq_set_type	= zynq_gpio_set_irq_type,
 	.irq_set_wake	= zynq_gpio_set_wake,
+	.irq_request_resources = zynq_gpio_irq_reqres,
+	.irq_release_resources = zynq_gpio_irq_relres,
 	.flags		= IRQCHIP_MASK_ON_SUSPEND,
 };
 
-- 
2.20.1
