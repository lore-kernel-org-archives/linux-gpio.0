From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 039/182] gpio: ml-ioh: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:18:11 +0100
Message-ID: <1449667091-31599-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:36223 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751531AbbLINSR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:18:17 -0500
Received: by lfs39 with SMTP id 39so34174633lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:18:16 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Feng Tang <feng.tang@intel.com>, Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Feng Tang <feng.tang@intel.com>
Cc: Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ml-ioh.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 5536108aa9db..91aa40c2287f 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -106,7 +106,7 @@ static const int num_ports[] = {6, 12, 16, 16, 15, 16, 16, 12};
 static void ioh_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
 {
 	u32 reg_val;
-	struct ioh_gpio *chip =	container_of(gpio, struct ioh_gpio, gpio);
+	struct ioh_gpio *chip =	gpiochip_get_data(gpio);
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->spinlock, flags);
@@ -122,7 +122,7 @@ static void ioh_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
 
 static int ioh_gpio_get(struct gpio_chip *gpio, unsigned nr)
 {
-	struct ioh_gpio *chip =	container_of(gpio, struct ioh_gpio, gpio);
+	struct ioh_gpio *chip =	gpiochip_get_data(gpio);
 
 	return ioread32(&chip->reg->regs[chip->ch].pi) & (1 << nr);
 }
@@ -130,7 +130,7 @@ static int ioh_gpio_get(struct gpio_chip *gpio, unsigned nr)
 static int ioh_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 				     int val)
 {
-	struct ioh_gpio *chip =	container_of(gpio, struct ioh_gpio, gpio);
+	struct ioh_gpio *chip =	gpiochip_get_data(gpio);
 	u32 pm;
 	u32 reg_val;
 	unsigned long flags;
@@ -155,7 +155,7 @@ static int ioh_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 
 static int ioh_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 {
-	struct ioh_gpio *chip =	container_of(gpio, struct ioh_gpio, gpio);
+	struct ioh_gpio *chip =	gpiochip_get_data(gpio);
 	u32 pm;
 	unsigned long flags;
 
@@ -225,7 +225,7 @@ static void ioh_gpio_restore_reg_conf(struct ioh_gpio *chip)
 
 static int ioh_gpio_to_irq(struct gpio_chip *gpio, unsigned offset)
 {
-	struct ioh_gpio *chip = container_of(gpio, struct ioh_gpio, gpio);
+	struct ioh_gpio *chip = gpiochip_get_data(gpio);
 	return chip->irq_base + offset;
 }
 
@@ -450,7 +450,7 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
 		chip->ch = i;
 		spin_lock_init(&chip->spinlock);
 		ioh_gpio_setup(chip, num_ports[i]);
-		ret = gpiochip_add(&chip->gpio);
+		ret = gpiochip_add_data(&chip->gpio, chip);
 		if (ret) {
 			dev_err(&pdev->dev, "IOH gpio: Failed to register GPIO\n");
 			goto err_gpiochip_add;
-- 
2.4.3

