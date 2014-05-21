From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: [RFC PATCH 2/2] gpio-mpc8xxx: add mpc8xxx_gpio_set_multiple function
Date: Wed, 21 May 2014 15:00:14 +0200
Message-ID: <3728352.HA8JhAoUDB@pcimr>
References: <1883250.Le7v5oGnod@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:47034 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750877AbaEUNAR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 21 May 2014 09:00:17 -0400
In-Reply-To: <1883250.Le7v5oGnod@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Gerhard Sittig <gsi@denx.de>

This patch adds a set_multiple function to the MPC8xxx GPIO chip driver.
It depends on my previous patch "gpiolib: allow simultaneous setting of
multiple GPIO outputs" and allows for actual performance improvements when
setting multiple outputs simultaneously. In my case the time needed to
configure an FPGA goes down from 48 s to 19 s.

Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
---
 drivers/gpio/gpio-mpc8xxx.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index d7d6d72..d226f5c 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -105,6 +105,33 @@ static void mpc8xxx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
        spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 }
 
+static void mpc8xxx_gpio_set_multiple(struct gpio_chip *gc,
+                                     u32 *mask, u32 *bits)
+{
+       struct of_mm_gpio_chip *mm = to_of_mm_gpio_chip(gc);
+       struct mpc8xxx_gpio_chip *mpc8xxx_gc = to_mpc8xxx_gpio_chip(mm);
+       unsigned long flags;
+       int i;
+
+       spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
+
+       for (i = 0; i < gc->ngpio; i++) {
+               if (*mask == 0)
+                       break;
+               if (*mask & (1 << i)) {
+                       if ((*bits >> i) & 1)
+                               mpc8xxx_gc->data |= mpc8xxx_gpio2mask(i);
+                       else
+                               mpc8xxx_gc->data &= ~mpc8xxx_gpio2mask(i);
+                       *mask &= ~(1 << i);
+               }
+       }
+
+       out_be32(mm->regs + GPIO_DAT, mpc8xxx_gc->data);
+
+       spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
+}
+
 static int mpc8xxx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
        struct of_mm_gpio_chip *mm = to_of_mm_gpio_chip(gc);
@@ -344,6 +371,7 @@ static void __init mpc8xxx_add_controller(struct device_node *np)
        gc->get = of_device_is_compatible(np, "fsl,mpc8572-gpio") ?
                mpc8572_gpio_get : mpc8xxx_gpio_get;
        gc->set = mpc8xxx_gpio_set;
+       gc->set_multiple = mpc8xxx_gpio_set_multiple;
        gc->to_irq = mpc8xxx_gpio_to_irq;
 
        ret = of_mm_gpiochip_add(np, mm_gc);

--
1.8.5.5
