From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 148/182] powerpc: qe_lib-gpio: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:41:47 +0100
Message-ID: <1449668507-5118-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:36654 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751585AbbLINlw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:41:52 -0500
Received: by lbblt2 with SMTP id lt2so30310419lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:41:51 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Anatolij Gustschin <agust@denx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Anatolij Gustschin <agust@denx.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Power maintainers: please ACK this. I cannot really say if this
should ideally be broken out as a separate driver in drivers/gpio
or if it is better to keep it here. For now just refactoring...
---
 arch/powerpc/sysdev/qe_lib/gpio.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/sysdev/qe_lib/gpio.c b/arch/powerpc/sysdev/qe_lib/gpio.c
index 521e67a49dc4..90caaad7889f 100644
--- a/arch/powerpc/sysdev/qe_lib/gpio.c
+++ b/arch/powerpc/sysdev/qe_lib/gpio.c
@@ -18,6 +18,8 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
+#include <linux/gpio/driver.h>
+/* FIXME: needed for gpio_to_chip() get rid of this */
 #include <linux/gpio.h>
 #include <linux/slab.h>
 #include <linux/export.h>
@@ -37,15 +39,9 @@ struct qe_gpio_chip {
 	struct qe_pio_regs saved_regs;
 };
 
-static inline struct qe_gpio_chip *
-to_qe_gpio_chip(struct of_mm_gpio_chip *mm_gc)
-{
-	return container_of(mm_gc, struct qe_gpio_chip, mm_gc);
-}
-
 static void qe_gpio_save_regs(struct of_mm_gpio_chip *mm_gc)
 {
-	struct qe_gpio_chip *qe_gc = to_qe_gpio_chip(mm_gc);
+	struct qe_gpio_chip *qe_gc = gpiochip_get_data(&mm_gc->gc);
 	struct qe_pio_regs __iomem *regs = mm_gc->regs;
 
 	qe_gc->cpdata = in_be32(&regs->cpdata);
@@ -69,7 +65,7 @@ static int qe_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 static void qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct qe_gpio_chip *qe_gc = to_qe_gpio_chip(mm_gc);
+	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
 	struct qe_pio_regs __iomem *regs = mm_gc->regs;
 	unsigned long flags;
 	u32 pin_mask = 1 << (QE_PIO_PINS - 1 - gpio);
@@ -89,7 +85,7 @@ static void qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 static int qe_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct qe_gpio_chip *qe_gc = to_qe_gpio_chip(mm_gc);
+	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&qe_gc->lock, flags);
@@ -104,7 +100,7 @@ static int qe_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 static int qe_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct qe_gpio_chip *qe_gc = to_qe_gpio_chip(mm_gc);
+	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	qe_gpio_set(gc, gpio, val);
@@ -165,7 +161,7 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
 	}
 
 	mm_gc = to_of_mm_gpio_chip(gc);
-	qe_gc = to_qe_gpio_chip(mm_gc);
+	qe_gc = gpiochip_get_data(gc);
 
 	spin_lock_irqsave(&qe_gc->lock, flags);
 
@@ -302,7 +298,7 @@ static int __init qe_add_gpiochips(void)
 		gc->get = qe_gpio_get;
 		gc->set = qe_gpio_set;
 
-		ret = of_mm_gpiochip_add(np, mm_gc);
+		ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
 		if (ret)
 			goto err;
 		continue;
-- 
2.4.3

