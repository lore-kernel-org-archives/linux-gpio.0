From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 064/182] gpio: syscon: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:23:22 +0100
Message-ID: <1449667402-349-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:35932 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751585AbbLINX1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:23:27 -0500
Received: by lfs39 with SMTP id 39so34275712lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:23:25 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexander Shiyan <shc_work@mail.ru>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Alexander Shiyan <shc_work@mail.ru>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-syscon.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index cd6afee11f84..15efe7119efb 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -59,14 +59,9 @@ struct syscon_gpio_priv {
 	u32				dir_reg_offset;
 };
 
-static inline struct syscon_gpio_priv *to_syscon_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct syscon_gpio_priv, chip);
-}
-
 static int syscon_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct syscon_gpio_priv *priv = to_syscon_gpio(chip);
+	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 	unsigned int val, offs;
 	int ret;
 
@@ -82,7 +77,7 @@ static int syscon_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 static void syscon_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 {
-	struct syscon_gpio_priv *priv = to_syscon_gpio(chip);
+	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 	unsigned int offs;
 
 	offs = priv->dreg_offset + priv->data->dat_bit_offset + offset;
@@ -95,7 +90,7 @@ static void syscon_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 
 static int syscon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
 {
-	struct syscon_gpio_priv *priv = to_syscon_gpio(chip);
+	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 
 	if (priv->data->flags & GPIO_SYSCON_FEAT_DIR) {
 		unsigned int offs;
@@ -113,7 +108,7 @@ static int syscon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
 
 static int syscon_gpio_dir_out(struct gpio_chip *chip, unsigned offset, int val)
 {
-	struct syscon_gpio_priv *priv = to_syscon_gpio(chip);
+	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 
 	if (priv->data->flags & GPIO_SYSCON_FEAT_DIR) {
 		unsigned int offs;
@@ -144,7 +139,7 @@ static const struct syscon_gpio_data clps711x_mctrl_gpio = {
 
 static void keystone_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 {
-	struct syscon_gpio_priv *priv = to_syscon_gpio(chip);
+	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 	unsigned int offs;
 	int ret;
 
@@ -239,7 +234,7 @@ static int syscon_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	return gpiochip_add(&priv->chip);
+	return gpiochip_add_data(&priv->chip, priv);
 }
 
 static int syscon_gpio_remove(struct platform_device *pdev)
-- 
2.4.3

