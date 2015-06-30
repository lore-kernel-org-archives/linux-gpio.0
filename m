From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/7] pinctrl: sh-pfc: Move sh_pfc_add_gpiochip() up
Date: Tue, 30 Jun 2015 09:45:26 +0200
Message-ID: <1435650327-2542-7-git-send-email-geert+renesas@glider.be>
References: <1435650327-2542-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:36497 "EHLO
	laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752171AbbF3HqD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2015 03:46:03 -0400
In-Reply-To: <1435650327-2542-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Benoit Parrot <bparrot@ti.com>, linux-gpio@vger.kernel.org, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>

Move sh_pfc_add_gpiochip() to the generic helper section at the top of
the file, so it can be called from the "Function GPIOs" section later.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/gpio.c | 58 +++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/gpio.c b/drivers/pinctrl/sh-pfc/gpio.c
index b8929b5e2fa26c53..30654e800580524d 100644
--- a/drivers/pinctrl/sh-pfc/gpio.c
+++ b/drivers/pinctrl/sh-pfc/gpio.c
@@ -131,6 +131,35 @@ static int gpio_setup_data_regs(struct sh_pfc_chip *chip)
 	return 0;
 }
 
+static struct sh_pfc_chip *
+sh_pfc_add_gpiochip(struct sh_pfc *pfc, int(*setup)(struct sh_pfc_chip *),
+		    struct sh_pfc_window *mem)
+{
+	struct sh_pfc_chip *chip;
+	int ret;
+
+	chip = devm_kzalloc(pfc->dev, sizeof(*chip), GFP_KERNEL);
+	if (unlikely(!chip))
+		return ERR_PTR(-ENOMEM);
+
+	chip->mem = mem;
+	chip->pfc = pfc;
+
+	ret = setup(chip);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	ret = gpiochip_add(&chip->gpio_chip);
+	if (unlikely(ret < 0))
+		return ERR_PTR(ret);
+
+	dev_info(pfc->dev, "%s handling gpio %u -> %u\n",
+		 chip->gpio_chip.label, chip->gpio_chip.base,
+		 chip->gpio_chip.base + chip->gpio_chip.ngpio - 1);
+
+	return chip;
+}
+
 /* -----------------------------------------------------------------------------
  * Pin GPIOs
  */
@@ -305,35 +334,6 @@ static int gpio_function_setup(struct sh_pfc_chip *chip)
  * Register/unregister
  */
 
-static struct sh_pfc_chip *
-sh_pfc_add_gpiochip(struct sh_pfc *pfc, int(*setup)(struct sh_pfc_chip *),
-		    struct sh_pfc_window *mem)
-{
-	struct sh_pfc_chip *chip;
-	int ret;
-
-	chip = devm_kzalloc(pfc->dev, sizeof(*chip), GFP_KERNEL);
-	if (unlikely(!chip))
-		return ERR_PTR(-ENOMEM);
-
-	chip->mem = mem;
-	chip->pfc = pfc;
-
-	ret = setup(chip);
-	if (ret < 0)
-		return ERR_PTR(ret);
-
-	ret = gpiochip_add(&chip->gpio_chip);
-	if (unlikely(ret < 0))
-		return ERR_PTR(ret);
-
-	dev_info(pfc->dev, "%s handling gpio %u -> %u\n",
-		 chip->gpio_chip.label, chip->gpio_chip.base,
-		 chip->gpio_chip.base + chip->gpio_chip.ngpio - 1);
-
-	return chip;
-}
-
 int sh_pfc_register_gpiochip(struct sh_pfc *pfc)
 {
 	struct sh_pfc_chip *chip;
-- 
1.9.1

