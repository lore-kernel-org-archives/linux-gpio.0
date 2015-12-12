From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH v2 2/2] gpio: pxa: add pin control gpio direction and request
Date: Sat, 12 Dec 2015 23:55:21 +0100
Message-ID: <1449960921-19002-2-git-send-email-robert.jarzmik@free.fr>
References: <1449960921-19002-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:59399 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751308AbbLLWzq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Dec 2015 17:55:46 -0500
In-Reply-To: <1449960921-19002-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>

If a pin control driver is available, use it to change the gpio
direction. If not fallback to directly manipulating the gpio direction
register.

The reason to use the pin control driver first is that pin control in
pxa2xx architecture implies changing the gpio direction, even for non
gpio functions. In order to do it atomically, only one driver should
control the gpio direction, and if a pin controller is available, it has
to be him.

There is a small catch : if CONFIG_PINCTRL is selected, then a pinctrl
driver has to be probed. If not, gpio_request() will return
-EPROBE_DEFER as pinctrl_request_gpio() returns it in that case.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
Since v1: expand commit message to state the gpio possible breakage if
          CONFIG_PINCTRL is selected and no pinctrl driver is built.
---
 drivers/gpio/gpio-pxa.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index c6b572be68c0..2bb09c0d8752 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -24,6 +24,7 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/syscore_ops.h>
 #include <linux/slab.h>
@@ -251,6 +252,11 @@ static int pxa_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	void __iomem *base = gpio_bank_base(chip, offset);
 	uint32_t value, mask = GPIO_bit(offset);
 	unsigned long flags;
+	int ret;
+
+	ret = pinctrl_gpio_direction_input(chip->base + offset);
+	if (!ret)
+		return 0;
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
@@ -271,9 +277,14 @@ static int pxa_gpio_direction_output(struct gpio_chip *chip,
 	void __iomem *base = gpio_bank_base(chip, offset);
 	uint32_t tmp, mask = GPIO_bit(offset);
 	unsigned long flags;
+	int ret;
 
 	writel_relaxed(mask, base + (value ? GPSR_OFFSET : GPCR_OFFSET));
 
+	ret = pinctrl_gpio_direction_output(chip->base + offset);
+	if (!ret)
+		return 0;
+
 	spin_lock_irqsave(&gpio_lock, flags);
 
 	tmp = readl_relaxed(base + GPDR_OFFSET);
@@ -318,6 +329,16 @@ static int pxa_gpio_of_xlate(struct gpio_chip *gc,
 }
 #endif
 
+static int pxa_gpio_request(struct gpio_chip *chip, unsigned int offset)
+{
+	return pinctrl_request_gpio(chip->base + offset);
+}
+
+static void pxa_gpio_free(struct gpio_chip *chip, unsigned int offset)
+{
+	pinctrl_free_gpio(chip->base + offset);
+}
+
 static int pxa_init_gpio_chip(struct pxa_gpio_chip *pchip, int ngpio,
 			      struct device_node *np, void __iomem *regbase)
 {
@@ -336,6 +357,8 @@ static int pxa_init_gpio_chip(struct pxa_gpio_chip *pchip, int ngpio,
 	pchip->chip.set = pxa_gpio_set;
 	pchip->chip.to_irq = pxa_gpio_to_irq;
 	pchip->chip.ngpio = ngpio;
+	pchip->chip.request = pxa_gpio_request;
+	pchip->chip.free = pxa_gpio_free;
 #ifdef CONFIG_OF_GPIO
 	pchip->chip.of_node = np;
 	pchip->chip.of_xlate = pxa_gpio_of_xlate;
-- 
2.1.4

