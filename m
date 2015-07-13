From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 12/19] gpio/davinci: Use accessor function
 irq_data_get_irq_handler_data()
Date: Mon, 13 Jul 2015 20:41:34 -0000
Message-ID: <20150712232405.731695368@linutronix.de>
References: <20150712232317.244138485@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=gpio-davinci-Use-helper-irq_data_get_irq_handler_dat.patch
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

From: Jiang Liu <jiang.liu@linux.intel.com>

This is a preparatory patch for moving irq_data struct members.

Signed-off-by: Jiang Liu <jiang.liu@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/gpio/gpio-davinci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index c5e05c82d67c..477d5b8616ab 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -396,7 +396,7 @@ static int gpio_irq_type_unbanked(struct irq_data *data, unsigned trigger)
 	struct davinci_gpio_regs __iomem *g;
 	u32 mask;
 
-	d = (struct davinci_gpio_controller *)data->handler_data;
+	d = (struct davinci_gpio_controller *)irq_data_get_irq_handler_data(data);
 	g = (struct davinci_gpio_regs __iomem *)d->regs;
 	mask = __gpio_mask(data->irq - d->gpio_irq);
 
-- 
2.1.4
