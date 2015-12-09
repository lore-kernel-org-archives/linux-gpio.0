From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 016/182] gpio: bcm-kona: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:14:53 +0100
Message-ID: <1449666893-30498-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:35536 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753592AbbLINPA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:15:00 -0500
Received: by lfdl133 with SMTP id l133so33783587lfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:14:58 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Markus Mayer <markus.mayer@linaro.org>, Tim Kryger <tim.kryger@linaro.org>, Matt Porter <matt.porter@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Markus Mayer <markus.mayer@linaro.org>
Cc: Tim Kryger <tim.kryger@linaro.org>
Cc: Matt Porter <matt.porter@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-bcm-kona.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 21c3280d66e1..b6c5abe85daf 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -78,11 +78,6 @@ struct bcm_kona_gpio_bank {
 	struct bcm_kona_gpio *kona_gpio;
 };
 
-static inline struct bcm_kona_gpio *to_kona_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct bcm_kona_gpio, gpio_chip);
-}
-
 static inline void bcm_kona_gpio_write_lock_regs(void __iomem *reg_base,
 						int bank_id, u32 lockcode)
 {
@@ -124,7 +119,7 @@ static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
 
 static int bcm_kona_gpio_get_dir(struct gpio_chip *chip, unsigned gpio)
 {
-	struct bcm_kona_gpio *kona_gpio = to_kona_gpio(chip);
+	struct bcm_kona_gpio *kona_gpio = gpiochip_get_data(chip);
 	void __iomem *reg_base = kona_gpio->reg_base;
 	u32 val;
 
@@ -141,7 +136,7 @@ static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 	u32 val, reg_offset;
 	unsigned long flags;
 
-	kona_gpio = to_kona_gpio(chip);
+	kona_gpio = gpiochip_get_data(chip);
 	reg_base = kona_gpio->reg_base;
 	spin_lock_irqsave(&kona_gpio->lock, flags);
 
@@ -168,7 +163,7 @@ static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	u32 val, reg_offset;
 	unsigned long flags;
 
-	kona_gpio = to_kona_gpio(chip);
+	kona_gpio = gpiochip_get_data(chip);
 	reg_base = kona_gpio->reg_base;
 	spin_lock_irqsave(&kona_gpio->lock, flags);
 
@@ -188,7 +183,7 @@ static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
 
 static int bcm_kona_gpio_request(struct gpio_chip *chip, unsigned gpio)
 {
-	struct bcm_kona_gpio *kona_gpio = to_kona_gpio(chip);
+	struct bcm_kona_gpio *kona_gpio = gpiochip_get_data(chip);
 
 	bcm_kona_gpio_unlock_gpio(kona_gpio, gpio);
 	return 0;
@@ -196,7 +191,7 @@ static int bcm_kona_gpio_request(struct gpio_chip *chip, unsigned gpio)
 
 static void bcm_kona_gpio_free(struct gpio_chip *chip, unsigned gpio)
 {
-	struct bcm_kona_gpio *kona_gpio = to_kona_gpio(chip);
+	struct bcm_kona_gpio *kona_gpio = gpiochip_get_data(chip);
 
 	bcm_kona_gpio_lock_gpio(kona_gpio, gpio);
 }
@@ -208,7 +203,7 @@ static int bcm_kona_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 	u32 val;
 	unsigned long flags;
 
-	kona_gpio = to_kona_gpio(chip);
+	kona_gpio = gpiochip_get_data(chip);
 	reg_base = kona_gpio->reg_base;
 	spin_lock_irqsave(&kona_gpio->lock, flags);
 
@@ -232,7 +227,7 @@ static int bcm_kona_gpio_direction_output(struct gpio_chip *chip,
 	u32 val, reg_offset;
 	unsigned long flags;
 
-	kona_gpio = to_kona_gpio(chip);
+	kona_gpio = gpiochip_get_data(chip);
 	reg_base = kona_gpio->reg_base;
 	spin_lock_irqsave(&kona_gpio->lock, flags);
 
@@ -255,7 +250,7 @@ static int bcm_kona_gpio_to_irq(struct gpio_chip *chip, unsigned gpio)
 {
 	struct bcm_kona_gpio *kona_gpio;
 
-	kona_gpio = to_kona_gpio(chip);
+	kona_gpio = gpiochip_get_data(chip);
 	if (gpio >= kona_gpio->gpio_chip.ngpio)
 		return -ENXIO;
 	return irq_create_mapping(kona_gpio->irq_domain, gpio);
@@ -269,7 +264,7 @@ static int bcm_kona_gpio_set_debounce(struct gpio_chip *chip, unsigned gpio,
 	u32 val, res;
 	unsigned long flags;
 
-	kona_gpio = to_kona_gpio(chip);
+	kona_gpio = gpiochip_get_data(chip);
 	reg_base = kona_gpio->reg_base;
 	/* debounce must be 1-128ms (or 0) */
 	if ((debounce > 0 && debounce < 1000) || debounce > 128000) {
@@ -635,7 +630,7 @@ static int bcm_kona_gpio_probe(struct platform_device *pdev)
 
 	bcm_kona_gpio_reset(kona_gpio);
 
-	ret = gpiochip_add(chip);
+	ret = gpiochip_add_data(chip, kona_gpio);
 	if (ret < 0) {
 		dev_err(dev, "Couldn't add GPIO chip -- %d\n", ret);
 		goto err_irq_domain;
-- 
2.4.3

