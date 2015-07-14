From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 19/19] gpio/davinci: Avoid redundant lookup of irq_data
Date: Tue, 14 Jul 2015 12:16:40 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1507141215020.20072@nanos>
References: <20150712232317.244138485@linutronix.de> <20150712232406.341044190@linutronix.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150712232406.341044190@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, 13 Jul 2015, Thomas Gleixner wrote:
> -	g = (__force struct davinci_gpio_regs __iomem *)irq_get_chip_data(irq);
> +	g = (__force struct davinci_gpio_regs __iomem *)irq_data_get_chip_data(d);

Too tired to use the proper function AND enable the Kconfig switch to
compile it actually. Updated patch below. git branch irq/gpio is
updated as well.

Thanks,

	tglx

--------------->
Subject: gpio/davinci: Avoid redundant lookup of irq_data
From: Thomas Gleixner <tglx@linutronix.de>
Date: Mon, 13 Jul 2015 01:18:56 +0200

It's pretty silly to do

     void *cd = irq_get_chip_data(irq_data->irq);

because that results in cd = irq_data->chip_data, but goes through a
redundant lookup of the irq_data. Use irq_data directly.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Jiang Liu <jiang.liu@linux.intel.com>
Cc: linux-gpio@vger.kernel.org
---
 drivers/gpio/gpio-davinci.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)



Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/gpio/gpio-davinci.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

Index: tip/drivers/gpio/gpio-davinci.c
===================================================================
--- tip.orig/drivers/gpio/gpio-davinci.c
+++ tip/drivers/gpio/gpio-davinci.c
@@ -65,11 +65,11 @@ static struct davinci_gpio_regs __iomem
 	return ptr;
 }
 
-static inline struct davinci_gpio_regs __iomem *irq2regs(int irq)
+static inline struct davinci_gpio_regs __iomem *irq2regs(struct irq_data *d)
 {
 	struct davinci_gpio_regs __iomem *g;
 
-	g = (__force struct davinci_gpio_regs __iomem *)irq_get_chip_data(irq);
+	g = (__force struct davinci_gpio_regs __iomem *)irq_data_get_irq_chip_data(d);
 
 	return g;
 }
@@ -287,7 +287,7 @@ static int davinci_gpio_probe(struct pla
 
 static void gpio_irq_disable(struct irq_data *d)
 {
-	struct davinci_gpio_regs __iomem *g = irq2regs(d->irq);
+	struct davinci_gpio_regs __iomem *g = irq2regs(d);
 	u32 mask = (u32) irq_data_get_irq_handler_data(d);
 
 	writel_relaxed(mask, &g->clr_falling);
@@ -296,7 +296,7 @@ static void gpio_irq_disable(struct irq_
 
 static void gpio_irq_enable(struct irq_data *d)
 {
-	struct davinci_gpio_regs __iomem *g = irq2regs(d->irq);
+	struct davinci_gpio_regs __iomem *g = irq2regs(d);
 	u32 mask = (u32) irq_data_get_irq_handler_data(d);
 	unsigned status = irqd_get_trigger_type(d);
 
