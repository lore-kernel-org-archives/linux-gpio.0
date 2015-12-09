From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 147/182] powerpc: ppc4xx: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:41:39 +0100
Message-ID: <1449668499-5071-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:36599 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751585AbbLINln (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:41:43 -0500
Received: by lfs39 with SMTP id 39so34630400lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:41:42 -0800 (PST)
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
Power maintainers: please ACK this. This looks like a pretty clean
GPIO driver that should ideally move to drivers/gpio. It should be
fine to change the include from <linux/gpio.h> to
<linux/gpio/driver.h> on this as it does not appear to use the
consumer API.
---
 arch/powerpc/sysdev/ppc4xx_gpio.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/sysdev/ppc4xx_gpio.c b/arch/powerpc/sysdev/ppc4xx_gpio.c
index fc65ad1b3293..96145ea09835 100644
--- a/arch/powerpc/sysdev/ppc4xx_gpio.c
+++ b/arch/powerpc/sysdev/ppc4xx_gpio.c
@@ -27,7 +27,7 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/types.h>
 #include <linux/slab.h>
 
@@ -67,12 +67,6 @@ struct ppc4xx_gpio_chip {
  * There are a maximum of 32 gpios in each gpio controller.
  */
 
-static inline struct ppc4xx_gpio_chip *
-to_ppc4xx_gpiochip(struct of_mm_gpio_chip *mm_gc)
-{
-	return container_of(mm_gc, struct ppc4xx_gpio_chip, mm_gc);
-}
-
 static int ppc4xx_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
@@ -97,7 +91,7 @@ static void
 ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct ppc4xx_gpio_chip *chip = to_ppc4xx_gpiochip(mm_gc);
+	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->lock, flags);
@@ -112,7 +106,7 @@ ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct ppc4xx_gpio_chip *chip = to_ppc4xx_gpiochip(mm_gc);
+	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
 	struct ppc4xx_gpio __iomem *regs = mm_gc->regs;
 	unsigned long flags;
 
@@ -142,7 +136,7 @@ static int
 ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct ppc4xx_gpio_chip *chip = to_ppc4xx_gpiochip(mm_gc);
+	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
 	struct ppc4xx_gpio __iomem *regs = mm_gc->regs;
 	unsigned long flags;
 
@@ -200,7 +194,7 @@ static int __init ppc4xx_add_gpiochips(void)
 		gc->get = ppc4xx_gpio_get;
 		gc->set = ppc4xx_gpio_set;
 
-		ret = of_mm_gpiochip_add(np, mm_gc);
+		ret = of_mm_gpiochip_add_data(np, mm_gc, ppc4xx_gc);
 		if (ret)
 			goto err;
 		continue;
-- 
2.4.3

