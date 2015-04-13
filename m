From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH v2] gpio: bcm-kona: Implement get_direction callback
Date: Mon, 13 Apr 2015 15:56:00 +0800
Message-ID: <1428911760.25188.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:36116 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753455AbbDMH4F (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Apr 2015 03:56:05 -0400
Received: by pdea3 with SMTP id a3so98927976pde.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2015 00:56:04 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list@broadcom.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Implement gpio_chip's get_direction() callback, that lets other drivers get
particular GPIOs direction using gpiod_get_direction().

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
v2: Make bcm_kona_gpio_get_dir explicitly return GPIOF_DIR_IN or GPIOF_DIR_OUT.

 drivers/gpio/gpio-bcm-kona.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index b164ce8..a6e7922 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -122,6 +122,16 @@ static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
 	spin_unlock_irqrestore(&kona_gpio->lock, flags);
 }
 
+static int bcm_kona_gpio_get_dir(struct gpio_chip *chip, unsigned gpio)
+{
+	struct bcm_kona_gpio *kona_gpio = to_kona_gpio(chip);
+	void __iomem *reg_base = kona_gpio->reg_base;
+	u32 val;
+
+	val = readl(reg_base + GPIO_CONTROL(gpio)) & GPIO_GPCTR0_IOTR_MASK;
+	return val ? GPIOF_DIR_IN : GPIOF_DIR_OUT;
+}
+
 static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 {
 	struct bcm_kona_gpio *kona_gpio;
@@ -135,12 +145,8 @@ static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 	reg_base = kona_gpio->reg_base;
 	spin_lock_irqsave(&kona_gpio->lock, flags);
 
-	/* determine the GPIO pin direction */
-	val = readl(reg_base + GPIO_CONTROL(gpio));
-	val &= GPIO_GPCTR0_IOTR_MASK;
-
 	/* this function only applies to output pin */
-	if (GPIO_GPCTR0_IOTR_CMD_INPUT == val)
+	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIOF_DIR_IN)
 		goto out;
 
 	reg_offset = value ? GPIO_OUT_SET(bank_id) : GPIO_OUT_CLEAR(bank_id);
@@ -166,13 +172,12 @@ static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	reg_base = kona_gpio->reg_base;
 	spin_lock_irqsave(&kona_gpio->lock, flags);
 
-	/* determine the GPIO pin direction */
-	val = readl(reg_base + GPIO_CONTROL(gpio));
-	val &= GPIO_GPCTR0_IOTR_MASK;
+	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIOF_DIR_IN)
+		reg_offset = GPIO_IN_STATUS(bank_id);
+	else
+		reg_offset = GPIO_OUT_STATUS(bank_id);
 
 	/* read the GPIO bank status */
-	reg_offset = (GPIO_GPCTR0_IOTR_CMD_INPUT == val) ?
-	    GPIO_IN_STATUS(bank_id) : GPIO_OUT_STATUS(bank_id);
 	val = readl(reg_base + reg_offset);
 
 	spin_unlock_irqrestore(&kona_gpio->lock, flags);
@@ -310,6 +315,7 @@ static struct gpio_chip template_chip = {
 	.owner = THIS_MODULE,
 	.request = bcm_kona_gpio_request,
 	.free = bcm_kona_gpio_free,
+	.get_direction = bcm_kona_gpio_get_dir,
 	.direction_input = bcm_kona_gpio_direction_input,
 	.get = bcm_kona_gpio_get,
 	.direction_output = bcm_kona_gpio_direction_output,
-- 
1.9.1



