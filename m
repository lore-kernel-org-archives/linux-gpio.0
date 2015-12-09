From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 012/182] gpio: amd8111: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:14:21 +0100
Message-ID: <1449666861-30310-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:34045 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753317AbbLINO1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:14:27 -0500
Received: by lbbcs9 with SMTP id cs9so29655435lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:14:26 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-amd8111.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index 5c378e9f53a0..c7040fffc5b4 100644
--- a/drivers/gpio/gpio-amd8111.c
+++ b/drivers/gpio/gpio-amd8111.c
@@ -75,11 +75,9 @@ struct amd_gpio {
 	u8			orig[32];
 };
 
-#define to_agp(chip)	container_of(chip, struct amd_gpio, chip)
-
 static int amd_gpio_request(struct gpio_chip *chip, unsigned offset)
 {
-	struct amd_gpio *agp = to_agp(chip);
+	struct amd_gpio *agp = gpiochip_get_data(chip);
 
 	agp->orig[offset] = ioread8(agp->pm + AMD_REG_GPIO(offset)) &
 		(AMD_GPIO_DEBOUNCE | AMD_GPIO_MODE_MASK | AMD_GPIO_X_MASK);
@@ -91,7 +89,7 @@ static int amd_gpio_request(struct gpio_chip *chip, unsigned offset)
 
 static void amd_gpio_free(struct gpio_chip *chip, unsigned offset)
 {
-	struct amd_gpio *agp = to_agp(chip);
+	struct amd_gpio *agp = gpiochip_get_data(chip);
 
 	dev_dbg(&agp->pdev->dev, "Freed gpio %d, data %x\n", offset, agp->orig[offset]);
 
@@ -100,7 +98,7 @@ static void amd_gpio_free(struct gpio_chip *chip, unsigned offset)
 
 static void amd_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct amd_gpio *agp = to_agp(chip);
+	struct amd_gpio *agp = gpiochip_get_data(chip);
 	u8 temp;
 	unsigned long flags;
 
@@ -115,7 +113,7 @@ static void amd_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int amd_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct amd_gpio *agp = to_agp(chip);
+	struct amd_gpio *agp = gpiochip_get_data(chip);
 	u8 temp;
 
 	temp = ioread8(agp->pm + AMD_REG_GPIO(offset));
@@ -127,7 +125,7 @@ static int amd_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 static int amd_gpio_dirout(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct amd_gpio *agp = to_agp(chip);
+	struct amd_gpio *agp = gpiochip_get_data(chip);
 	u8 temp;
 	unsigned long flags;
 
@@ -144,7 +142,7 @@ static int amd_gpio_dirout(struct gpio_chip *chip, unsigned offset, int value)
 
 static int amd_gpio_dirin(struct gpio_chip *chip, unsigned offset)
 {
-	struct amd_gpio *agp = to_agp(chip);
+	struct amd_gpio *agp = gpiochip_get_data(chip);
 	u8 temp;
 	unsigned long flags;
 
@@ -225,7 +223,7 @@ found:
 	spin_lock_init(&gp.lock);
 
 	printk(KERN_INFO "AMD-8111 GPIO detected\n");
-	err = gpiochip_add(&gp.chip);
+	err = gpiochip_add_data(&gp.chip, &gp);
 	if (err) {
 		printk(KERN_ERR "GPIO registering failed (%d)\n",
 		       err);
-- 
2.4.3

