From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 145/182] powerpc: sysdev: cpm1: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:41:23 +0100
Message-ID: <1449668483-4976-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:36460 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753925AbbLINl2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:41:28 -0500
Received: by lbblt2 with SMTP id lt2so30303787lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:41:27 -0800 (PST)
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
 arch/powerpc/sysdev/cpm1.c | 36 ++++++++++++------------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/sysdev/cpm1.c b/arch/powerpc/sysdev/cpm1.c
index 5e6ff38ea69f..937ba5444ffe 100644
--- a/arch/powerpc/sysdev/cpm1.c
+++ b/arch/powerpc/sysdev/cpm1.c
@@ -529,15 +529,9 @@ struct cpm1_gpio16_chip {
 	u16 cpdata;
 };
 
-static inline struct cpm1_gpio16_chip *
-to_cpm1_gpio16_chip(struct of_mm_gpio_chip *mm_gc)
-{
-	return container_of(mm_gc, struct cpm1_gpio16_chip, mm_gc);
-}
-
 static void cpm1_gpio16_save_regs(struct of_mm_gpio_chip *mm_gc)
 {
-	struct cpm1_gpio16_chip *cpm1_gc = to_cpm1_gpio16_chip(mm_gc);
+	struct cpm1_gpio16_chip *cpm1_gc = gpiochip_get_data(&mm_gc->gc);
 	struct cpm_ioport16 __iomem *iop = mm_gc->regs;
 
 	cpm1_gc->cpdata = in_be16(&iop->dat);
@@ -557,7 +551,7 @@ static int cpm1_gpio16_get(struct gpio_chip *gc, unsigned int gpio)
 static void __cpm1_gpio16_set(struct of_mm_gpio_chip *mm_gc, u16 pin_mask,
 	int value)
 {
-	struct cpm1_gpio16_chip *cpm1_gc = to_cpm1_gpio16_chip(mm_gc);
+	struct cpm1_gpio16_chip *cpm1_gc = gpiochip_get_data(&mm_gc->gc);
 	struct cpm_ioport16 __iomem *iop = mm_gc->regs;
 
 	if (value)
@@ -571,7 +565,7 @@ static void __cpm1_gpio16_set(struct of_mm_gpio_chip *mm_gc, u16 pin_mask,
 static void cpm1_gpio16_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct cpm1_gpio16_chip *cpm1_gc = to_cpm1_gpio16_chip(mm_gc);
+	struct cpm1_gpio16_chip *cpm1_gc = gpiochip_get_data(&mm_gc->gc);
 	unsigned long flags;
 	u16 pin_mask = 1 << (15 - gpio);
 
@@ -585,7 +579,7 @@ static void cpm1_gpio16_set(struct gpio_chip *gc, unsigned int gpio, int value)
 static int cpm1_gpio16_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct cpm1_gpio16_chip *cpm1_gc = to_cpm1_gpio16_chip(mm_gc);
+	struct cpm1_gpio16_chip *cpm1_gc = gpiochip_get_data(&mm_gc->gc);
 	struct cpm_ioport16 __iomem *iop = mm_gc->regs;
 	unsigned long flags;
 	u16 pin_mask = 1 << (15 - gpio);
@@ -603,7 +597,7 @@ static int cpm1_gpio16_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 static int cpm1_gpio16_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct cpm1_gpio16_chip *cpm1_gc = to_cpm1_gpio16_chip(mm_gc);
+	struct cpm1_gpio16_chip *cpm1_gc = gpiochip_get_data(&mm_gc->gc);
 	struct cpm_ioport16 __iomem *iop = mm_gc->regs;
 	unsigned long flags;
 	u16 pin_mask = 1 << (15 - gpio);
@@ -639,7 +633,7 @@ int cpm1_gpiochip_add16(struct device_node *np)
 	gc->get = cpm1_gpio16_get;
 	gc->set = cpm1_gpio16_set;
 
-	return of_mm_gpiochip_add(np, mm_gc);
+	return of_mm_gpiochip_add_data(np, mm_gc, cpm1_gc);
 }
 
 struct cpm1_gpio32_chip {
@@ -650,15 +644,9 @@ struct cpm1_gpio32_chip {
 	u32 cpdata;
 };
 
-static inline struct cpm1_gpio32_chip *
-to_cpm1_gpio32_chip(struct of_mm_gpio_chip *mm_gc)
-{
-	return container_of(mm_gc, struct cpm1_gpio32_chip, mm_gc);
-}
-
 static void cpm1_gpio32_save_regs(struct of_mm_gpio_chip *mm_gc)
 {
-	struct cpm1_gpio32_chip *cpm1_gc = to_cpm1_gpio32_chip(mm_gc);
+	struct cpm1_gpio32_chip *cpm1_gc = gpiochip_get_data(&mm_gc->gc);
 	struct cpm_ioport32b __iomem *iop = mm_gc->regs;
 
 	cpm1_gc->cpdata = in_be32(&iop->dat);
@@ -678,7 +666,7 @@ static int cpm1_gpio32_get(struct gpio_chip *gc, unsigned int gpio)
 static void __cpm1_gpio32_set(struct of_mm_gpio_chip *mm_gc, u32 pin_mask,
 	int value)
 {
-	struct cpm1_gpio32_chip *cpm1_gc = to_cpm1_gpio32_chip(mm_gc);
+	struct cpm1_gpio32_chip *cpm1_gc = gpiochip_get_data(&mm_gc->gc);
 	struct cpm_ioport32b __iomem *iop = mm_gc->regs;
 
 	if (value)
@@ -692,7 +680,7 @@ static void __cpm1_gpio32_set(struct of_mm_gpio_chip *mm_gc, u32 pin_mask,
 static void cpm1_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct cpm1_gpio32_chip *cpm1_gc = to_cpm1_gpio32_chip(mm_gc);
+	struct cpm1_gpio32_chip *cpm1_gc = gpiochip_get_data(&mm_gc->gc);
 	unsigned long flags;
 	u32 pin_mask = 1 << (31 - gpio);
 
@@ -706,7 +694,7 @@ static void cpm1_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
 static int cpm1_gpio32_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct cpm1_gpio32_chip *cpm1_gc = to_cpm1_gpio32_chip(mm_gc);
+	struct cpm1_gpio32_chip *cpm1_gc = gpiochip_get_data(&mm_gc->gc);
 	struct cpm_ioport32b __iomem *iop = mm_gc->regs;
 	unsigned long flags;
 	u32 pin_mask = 1 << (31 - gpio);
@@ -724,7 +712,7 @@ static int cpm1_gpio32_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 static int cpm1_gpio32_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct cpm1_gpio32_chip *cpm1_gc = to_cpm1_gpio32_chip(mm_gc);
+	struct cpm1_gpio32_chip *cpm1_gc = gpiochip_get_data(&mm_gc->gc);
 	struct cpm_ioport32b __iomem *iop = mm_gc->regs;
 	unsigned long flags;
 	u32 pin_mask = 1 << (31 - gpio);
@@ -760,7 +748,7 @@ int cpm1_gpiochip_add32(struct device_node *np)
 	gc->get = cpm1_gpio32_get;
 	gc->set = cpm1_gpio32_set;
 
-	return of_mm_gpiochip_add(np, mm_gc);
+	return of_mm_gpiochip_add_data(np, mm_gc, cpm1_gc);
 }
 
 static int cpm_init_par_io(void)
-- 
2.4.3

