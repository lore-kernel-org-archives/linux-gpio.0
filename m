From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH] gpio: Add IRQ support to ACCES 104-IDIO-16 driver
Date: Thu, 29 Oct 2015 20:04:26 -0400
Message-ID: <20151030000406.GA8699@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f172.google.com ([209.85.160.172]:34949 "EHLO
	mail-yk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751770AbbJ3AEf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2015 20:04:35 -0400
Received: by ykek133 with SMTP id k133so60443571yke.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2015 17:04:34 -0700 (PDT)
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org

The ACCES 104-IDIO-16 series offers Change-of-State detection interrupt
functionality; if Change-of-State detection is enabled, an interrupt is
fired off if any input line changes state (i.e. goes from low to high,
or from high to low). This patch adds support to handle these interrupts
and allows the user to mask which GPIO lines are affected. The interrupt
line number for the device may be set via the idio_16_irq module
parameter.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/Kconfig            |   6 ++-
 drivers/gpio/gpio-104-idio-16.c | 104 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 108 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index dbb171d..8635f1a 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -694,8 +694,12 @@ menu "ISA GPIO drivers"
 config GPIO_104_IDIO_16
 	tristate "ACCES 104-IDIO-16 GPIO support"
 	depends on X86
+	select GPIOLIB_IRQCHIP
 	help
-	  Enables GPIO support for the ACCES 104-IDIO-16 family.
+	  Enables GPIO support for the ACCES 104-IDIO-16 family. The base port
+	  address for the device may be set via the idio_16_base module
+	  parameter. The interrupt line number for the device may be set via the
+	  idio_16_irq module parameter.
 
 endmenu
 
diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 5400d7d..d1298dc 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -11,11 +11,16 @@
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  * General Public License for more details.
  */
+#include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdesc.h>
+#include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -25,20 +30,27 @@
 static unsigned idio_16_base;
 module_param(idio_16_base, uint, 0);
 MODULE_PARM_DESC(idio_16_base, "ACCES 104-IDIO-16 base address");
+static unsigned idio_16_irq;
+module_param(idio_16_irq, uint, 0);
+MODULE_PARM_DESC(idio_16_irq, "ACCES 104-IDIO-16 interrupt line number");
 
 /**
  * struct idio_16_gpio - GPIO device private data structure
  * @chip:	instance of the gpio_chip
- * @lock:	synchronization lock to prevent gpio_set race conditions
+ * @lock:	synchronization lock to prevent I/O race conditions
+ * @irq_mask:	I/O bits affected by interrupts
  * @base:	base port address of the GPIO device
  * @extent:	extent of port address region of the GPIO device
+ * @irq:	Interrupt line number
  * @out_state:	output bits state
  */
 struct idio_16_gpio {
 	struct gpio_chip chip;
 	spinlock_t lock;
+	unsigned long irq_mask;
 	unsigned base;
 	unsigned extent;
+	unsigned irq;
 	unsigned out_state;
 };
 
@@ -105,6 +117,77 @@ static void idio_16_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	spin_unlock_irqrestore(&idio16gpio->lock, flags);
 }
 
+static void idio_16_irq_mask(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct idio_16_gpio *const idio16gpio = to_idio16gpio(chip);
+	const unsigned long GPIO_MASK = 1UL << irqd_to_hwirq(data);
+	unsigned long flags;
+
+	idio16gpio->irq_mask &= ~GPIO_MASK;
+
+	if (!idio16gpio->irq_mask) {
+		spin_lock_irqsave(&idio16gpio->lock, flags);
+
+		outb(0, idio16gpio->base + 2);
+
+		spin_unlock_irqrestore(&idio16gpio->lock, flags);
+	}
+}
+
+static void idio_16_irq_unmask(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct idio_16_gpio *const idio16gpio = to_idio16gpio(chip);
+	const unsigned long GPIO_MASK = 1UL << irqd_to_hwirq(data);
+	const unsigned long PREV_IRQ_MASK = idio16gpio->irq_mask;
+	unsigned long flags;
+
+	idio16gpio->irq_mask |= GPIO_MASK;
+
+	if (!PREV_IRQ_MASK) {
+		spin_lock_irqsave(&idio16gpio->lock, flags);
+
+		outb(0, idio16gpio->base + 1);
+		inb(idio16gpio->base + 2);
+
+		spin_unlock_irqrestore(&idio16gpio->lock, flags);
+	}
+}
+
+static int idio_16_irq_set_type(struct irq_data *data, unsigned flow_type)
+{
+	if (flow_type && (flow_type & IRQ_TYPE_EDGE_BOTH) != IRQ_TYPE_EDGE_BOTH)
+		return -EINVAL;
+
+	return 0;
+}
+
+static struct irq_chip idio_16_irqchip = {
+	.name = "104-idio-16",
+	.irq_mask = idio_16_irq_mask,
+	.irq_unmask = idio_16_irq_unmask,
+	.irq_set_type = idio_16_irq_set_type
+};
+
+static irqreturn_t idio_16_irq_handler(int irq, void *dev_id)
+{
+	struct idio_16_gpio *const idio16gpio = dev_id;
+	struct gpio_chip *const chip = &idio16gpio->chip;
+	int gpio;
+
+	for_each_set_bit(gpio, &idio16gpio->irq_mask, chip->ngpio)
+		generic_handle_irq(irq_find_mapping(chip->irqdomain, gpio));
+
+	spin_lock(&idio16gpio->lock);
+
+	outb(0, idio16gpio->base + 1);
+
+	spin_unlock(&idio16gpio->lock);
+
+	return IRQ_HANDLED;
+}
+
 static int __init idio_16_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -113,6 +196,7 @@ static int __init idio_16_probe(struct platform_device *pdev)
 
 	const unsigned BASE = idio_16_base;
 	const unsigned EXTENT = 8;
+	const unsigned IRQ = idio_16_irq;
 	const char *const NAME = dev_name(dev);
 
 	idio16gpio = devm_kzalloc(dev, sizeof(*idio16gpio), GFP_KERNEL);
@@ -138,6 +222,7 @@ static int __init idio_16_probe(struct platform_device *pdev)
 	idio16gpio->chip.set = idio_16_gpio_set;
 	idio16gpio->base = BASE;
 	idio16gpio->extent = EXTENT;
+	idio16gpio->irq = IRQ;
 	idio16gpio->out_state = 0xFFFF;
 
 	spin_lock_init(&idio16gpio->lock);
@@ -150,8 +235,24 @@ static int __init idio_16_probe(struct platform_device *pdev)
 		goto err_gpio_register;
 	}
 
+	err = gpiochip_irqchip_add(&idio16gpio->chip, &idio_16_irqchip, 0,
+		handle_simple_irq, IRQ_TYPE_NONE);
+	if (err) {
+		dev_err(dev, "Could not add irqchip (%d)\n", err);
+		goto err_gpiochip_irqchip_add;
+	}
+
+	err = request_irq(IRQ, idio_16_irq_handler, 0, NAME, idio16gpio);
+	if (err) {
+		dev_err(dev, "IRQ handler registering failed (%d)\n", err);
+		goto err_request_irq;
+	}
+
 	return 0;
 
+err_request_irq:
+err_gpiochip_irqchip_add:
+	gpiochip_remove(&idio16gpio->chip);
 err_gpio_register:
 	release_region(BASE, EXTENT);
 err_lock_io_port:
@@ -162,6 +263,7 @@ static int idio_16_remove(struct platform_device *pdev)
 {
 	struct idio_16_gpio *const idio16gpio = platform_get_drvdata(pdev);
 
+	free_irq(idio16gpio->irq, idio16gpio);
 	gpiochip_remove(&idio16gpio->chip);
 	release_region(idio16gpio->base, idio16gpio->extent);
 
-- 
2.4.10

