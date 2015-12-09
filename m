From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 146/182] powerpc: cpm_common: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:41:31 +0100
Message-ID: <1449668491-5023-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:33511 "EHLO
	mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751585AbbLINlg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:41:36 -0500
Received: by lfaz4 with SMTP id z4so34476607lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:41:34 -0800 (PST)
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
 arch/powerpc/sysdev/cpm_common.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/sysdev/cpm_common.c b/arch/powerpc/sysdev/cpm_common.c
index e00a5ee58fd7..bc304269edc1 100644
--- a/arch/powerpc/sysdev/cpm_common.c
+++ b/arch/powerpc/sysdev/cpm_common.c
@@ -236,15 +236,9 @@ struct cpm2_gpio32_chip {
 	u32 cpdata;
 };
 
-static inline struct cpm2_gpio32_chip *
-to_cpm2_gpio32_chip(struct of_mm_gpio_chip *mm_gc)
-{
-	return container_of(mm_gc, struct cpm2_gpio32_chip, mm_gc);
-}
-
 static void cpm2_gpio32_save_regs(struct of_mm_gpio_chip *mm_gc)
 {
-	struct cpm2_gpio32_chip *cpm2_gc = to_cpm2_gpio32_chip(mm_gc);
+	struct cpm2_gpio32_chip *cpm2_gc = gpiochip_get_data(&mm_gc->gc);
 	struct cpm2_ioports __iomem *iop = mm_gc->regs;
 
 	cpm2_gc->cpdata = in_be32(&iop->dat);
@@ -264,7 +258,7 @@ static int cpm2_gpio32_get(struct gpio_chip *gc, unsigned int gpio)
 static void __cpm2_gpio32_set(struct of_mm_gpio_chip *mm_gc, u32 pin_mask,
 	int value)
 {
-	struct cpm2_gpio32_chip *cpm2_gc = to_cpm2_gpio32_chip(mm_gc);
+	struct cpm2_gpio32_chip *cpm2_gc = gpiochip_get_data(&mm_gc->gc);
 	struct cpm2_ioports __iomem *iop = mm_gc->regs;
 
 	if (value)
@@ -278,7 +272,7 @@ static void __cpm2_gpio32_set(struct of_mm_gpio_chip *mm_gc, u32 pin_mask,
 static void cpm2_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct cpm2_gpio32_chip *cpm2_gc = to_cpm2_gpio32_chip(mm_gc);
+	struct cpm2_gpio32_chip *cpm2_gc = gpiochip_get_data(gc);
 	unsigned long flags;
 	u32 pin_mask = 1 << (31 - gpio);
 
@@ -292,7 +286,7 @@ static void cpm2_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
 static int cpm2_gpio32_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct cpm2_gpio32_chip *cpm2_gc = to_cpm2_gpio32_chip(mm_gc);
+	struct cpm2_gpio32_chip *cpm2_gc = gpiochip_get_data(gc);
 	struct cpm2_ioports __iomem *iop = mm_gc->regs;
 	unsigned long flags;
 	u32 pin_mask = 1 << (31 - gpio);
@@ -310,7 +304,7 @@ static int cpm2_gpio32_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 static int cpm2_gpio32_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct cpm2_gpio32_chip *cpm2_gc = to_cpm2_gpio32_chip(mm_gc);
+	struct cpm2_gpio32_chip *cpm2_gc = gpiochip_get_data(gc);
 	struct cpm2_ioports __iomem *iop = mm_gc->regs;
 	unsigned long flags;
 	u32 pin_mask = 1 << (31 - gpio);
@@ -346,6 +340,6 @@ int cpm2_gpiochip_add32(struct device_node *np)
 	gc->get = cpm2_gpio32_get;
 	gc->set = cpm2_gpio32_set;
 
-	return of_mm_gpiochip_add(np, mm_gc);
+	return of_mm_gpiochip_add_data(np, mm_gc, cpm2_gc);
 }
 #endif /* CONFIG_CPM2 || CONFIG_8xx_GPIO */
-- 
2.4.3

