From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 143/182] powerpc: mpc52xx_gpt: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:41:06 +0100
Message-ID: <1449668466-4882-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:33300 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753927AbbLINlN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:41:13 -0500
Received: by lfaz4 with SMTP id z4so34468997lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:41:11 -0800 (PST)
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
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index 3048e34db6d8..f112e96ab8a3 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -278,14 +278,9 @@ mpc52xx_gpt_irq_setup(struct mpc52xx_gpt_priv *gpt, struct device_node *node)
  * GPIOLIB hooks
  */
 #if defined(CONFIG_GPIOLIB)
-static inline struct mpc52xx_gpt_priv *gc_to_mpc52xx_gpt(struct gpio_chip *gc)
-{
-	return container_of(gc, struct mpc52xx_gpt_priv, gc);
-}
-
 static int mpc52xx_gpt_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct mpc52xx_gpt_priv *gpt = gc_to_mpc52xx_gpt(gc);
+	struct mpc52xx_gpt_priv *gpt = gpiochip_get_data(gc);
 
 	return (in_be32(&gpt->regs->status) >> 8) & 1;
 }
@@ -293,7 +288,7 @@ static int mpc52xx_gpt_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 static void
 mpc52xx_gpt_gpio_set(struct gpio_chip *gc, unsigned int gpio, int v)
 {
-	struct mpc52xx_gpt_priv *gpt = gc_to_mpc52xx_gpt(gc);
+	struct mpc52xx_gpt_priv *gpt = gpiochip_get_data(gc);
 	unsigned long flags;
 	u32 r;
 
@@ -307,7 +302,7 @@ mpc52xx_gpt_gpio_set(struct gpio_chip *gc, unsigned int gpio, int v)
 
 static int mpc52xx_gpt_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct mpc52xx_gpt_priv *gpt = gc_to_mpc52xx_gpt(gc);
+	struct mpc52xx_gpt_priv *gpt = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	dev_dbg(gpt->dev, "%s: gpio:%d\n", __func__, gpio);
@@ -354,7 +349,7 @@ mpc52xx_gpt_gpio_setup(struct mpc52xx_gpt_priv *gpt, struct device_node *node)
 	clrsetbits_be32(&gpt->regs->mode, MPC52xx_GPT_MODE_MS_MASK,
 			MPC52xx_GPT_MODE_MS_GPIO);
 
-	rc = gpiochip_add(&gpt->gc);
+	rc = gpiochip_add_data(&gpt->gc, gpt);
 	if (rc)
 		dev_err(gpt->dev, "gpiochip_add() failed; rc=%i\n", rc);
 
-- 
2.4.3

