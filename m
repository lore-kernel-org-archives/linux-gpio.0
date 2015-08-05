From: Eduardo Valentin <edubezval@gmail.com>
Subject: [PATCH 2/2] gpio/mxc: implement reading output gpio value
Date: Wed,  5 Aug 2015 10:23:08 -0700
Message-ID: <1438795388-22743-3-git-send-email-edubezval@gmail.com>
References: <1438795388-22743-1-git-send-email-edubezval@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438795388-22743-1-git-send-email-edubezval@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: ubrindis56@gmail.com, Fabio Estevam <fabio.estevam@freescale.com>, festevam@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>
List-Id: linux-gpio@vger.kernel.org

In current implementation, reading the value of an output gpio
always return 0. The reason is because when a gpio is configured
as output, its output status can be read from the GPIO_DR register,
and when it is configure as input, its value can be read from
GPIO_PSR. With current implementation of basic mmio gpio driver,
we can only read the value from one single register.

Therefore, to workaround the basic mmio gpio driver limitation,
this patch changes the gpio-mxc driver to provide its own .get
callback. In the callback, we check the current status of the
gpio direction, and read the correct register based on its
current gpio direction status.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ulises Brindis <ubrindis56@gmail.com>
Signed-off-by: Eduardo Valentin <edubezval@gmail.com>
---
 drivers/gpio/gpio-mxc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 9e5bdbd..8822823 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -401,6 +401,18 @@ static int mxc_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 	return irq_find_mapping(port->domain, offset);
 }
 
+static int mxc_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct bgpio_chip *bgc = to_bgpio_chip(gc);
+
+	if (!!(bgc->read_reg(bgc->reg_dir) & bgc->pin2mask(bgc, gpio)))
+		return !!(bgc->read_reg(bgc->reg_set) &
+						bgc->pin2mask(bgc, gpio));
+	else
+		return !!(bgc->read_reg(bgc->reg_dat) &
+						bgc->pin2mask(bgc, gpio));
+}
+
 static int mxc_gpio_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -455,6 +467,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (err)
 		goto out_bgio;
 
+	port->bgc.gc.get = mxc_gpio_get;
 	port->bgc.gc.to_irq = mxc_gpio_to_irq;
 	port->bgc.gc.base = (pdev->id < 0) ? of_alias_get_id(np, "gpio") * 32 :
 					     pdev->id * 32;
-- 
2.5.0
