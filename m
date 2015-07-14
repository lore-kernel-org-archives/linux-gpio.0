From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 18/19] gpio/msm-v2: Avoid redundant lookup of irq_data
Date: Tue, 14 Jul 2015 12:14:18 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1507141212490.20072@nanos>
References: <20150712232317.244138485@linutronix.de> <20150712232406.260970428@linutronix.de> <CAKb7UviaGO2a=B7_4CbirQU=JLS5D_bNAe-PWzL-8Sp621rkYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:59297 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752619AbbGNKOa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2015 06:14:30 -0400
In-Reply-To: <CAKb7UviaGO2a=B7_4CbirQU=JLS5D_bNAe-PWzL-8Sp621rkYQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Jiang Liu <jiang.liu@linux.intel.com>, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 14 Jul 2015, Ilia Mirkin wrote:
> >  static void msm_gpio_irq_ack(struct irq_data *d)
> >  {
> > -       int gpio = msm_irq_to_gpio(&msm_gpio.gpio_chip, d->irq);
> > +       int gpio = d->hw_irq;
> 
> Does this build? It was hwirq above, not hw_irq.

Indeed. Updated patch below.

Thanks,

	tglx
---
Subject: gpio/msm-v2: Avoid redundant lookup of irq_data
From: Thomas Gleixner <tglx@linutronix.de>
Date: Mon, 13 Jul 2015 01:07:01 +0200

It's pretty silly to do

     irq_data *d = irq_get_irq_data(irq_data->irq);

because that results in d = irq_data, but goes through a lookup of the
irq_data. Use irq_data directly.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Jiang Liu <jiang.liu@linux.intel.com>
Cc: linux-gpio@vger.kernel.org
---
 drivers/gpio/gpio-msm-v2.c |   18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

Index: tip/drivers/gpio/gpio-msm-v2.c
===================================================================
--- tip.orig/drivers/gpio/gpio-msm-v2.c
+++ tip/drivers/gpio/gpio-msm-v2.c
@@ -187,14 +187,6 @@ static int msm_gpio_to_irq(struct gpio_c
 	return irq_create_mapping(domain, offset);
 }
 
-static inline int msm_irq_to_gpio(struct gpio_chip *chip, unsigned irq)
-{
-	struct irq_data *irq_data = irq_get_irq_data(irq);
-
-	return irq_data->hwirq;
-}
-
-
 /* For dual-edge interrupts in software, since the hardware has no
  * such support:
  *
@@ -238,7 +230,7 @@ static void msm_gpio_update_dual_edge_po
 
 static void msm_gpio_irq_ack(struct irq_data *d)
 {
-	int gpio = msm_irq_to_gpio(&msm_gpio.gpio_chip, d->irq);
+	int gpio = d->hwirq;
 
 	writel(BIT(INTR_STATUS), GPIO_INTR_STATUS(gpio));
 	if (test_bit(gpio, msm_gpio.dual_edge_irqs))
@@ -247,8 +239,8 @@ static void msm_gpio_irq_ack(struct irq_
 
 static void msm_gpio_irq_mask(struct irq_data *d)
 {
-	int gpio = msm_irq_to_gpio(&msm_gpio.gpio_chip, d->irq);
 	unsigned long irq_flags;
+	int gpio = d->hwirq;
 
 	spin_lock_irqsave(&tlmm_lock, irq_flags);
 	writel(TARGET_PROC_NONE, GPIO_INTR_CFG_SU(gpio));
@@ -259,8 +251,8 @@ static void msm_gpio_irq_mask(struct irq
 
 static void msm_gpio_irq_unmask(struct irq_data *d)
 {
-	int gpio = msm_irq_to_gpio(&msm_gpio.gpio_chip, d->irq);
 	unsigned long irq_flags;
+	int gpio = d->hwirq;
 
 	spin_lock_irqsave(&tlmm_lock, irq_flags);
 	__set_bit(gpio, msm_gpio.enabled_irqs);
@@ -271,8 +263,8 @@ static void msm_gpio_irq_unmask(struct i
 
 static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int flow_type)
 {
-	int gpio = msm_irq_to_gpio(&msm_gpio.gpio_chip, d->irq);
 	unsigned long irq_flags;
+	int gpio = d->hwirq;
 	uint32_t bits;
 
 	spin_lock_irqsave(&tlmm_lock, irq_flags);
@@ -331,7 +323,7 @@ static void msm_summary_irq_handler(unsi
 
 static int msm_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
 {
-	int gpio = msm_irq_to_gpio(&msm_gpio.gpio_chip, d->irq);
+	int gpio = d->hwirq;
 
 	if (on) {
 		if (bitmap_empty(msm_gpio.wake_irqs, MAX_NR_GPIO))

 
