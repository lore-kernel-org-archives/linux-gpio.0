From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 050/182] gpio: pch: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:19:48 +0100
Message-ID: <1449667188-32127-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:36058 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754172AbbLINTw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:19:52 -0500
Received: by lfs39 with SMTP id 39so34205962lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:19:51 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Daniel Krueger <daniel.krueger@systec-electronic.com>, Jean Delvare <jdelvare@suse.de>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Thierry Reding <treding@nvidia.com>
Cc: Daniel Krueger <daniel.krueger@systec-electronic.com>
Cc: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pch.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index e43db64e52b3..9349351afb47 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -109,7 +109,7 @@ struct pch_gpio {
 static void pch_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
 {
 	u32 reg_val;
-	struct pch_gpio *chip =	container_of(gpio, struct pch_gpio, gpio);
+	struct pch_gpio *chip =	gpiochip_get_data(gpio);
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->spinlock, flags);
@@ -125,7 +125,7 @@ static void pch_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
 
 static int pch_gpio_get(struct gpio_chip *gpio, unsigned nr)
 {
-	struct pch_gpio *chip =	container_of(gpio, struct pch_gpio, gpio);
+	struct pch_gpio *chip =	gpiochip_get_data(gpio);
 
 	return ioread32(&chip->reg->pi) & (1 << nr);
 }
@@ -133,7 +133,7 @@ static int pch_gpio_get(struct gpio_chip *gpio, unsigned nr)
 static int pch_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 				     int val)
 {
-	struct pch_gpio *chip =	container_of(gpio, struct pch_gpio, gpio);
+	struct pch_gpio *chip =	gpiochip_get_data(gpio);
 	u32 pm;
 	u32 reg_val;
 	unsigned long flags;
@@ -158,7 +158,7 @@ static int pch_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 
 static int pch_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 {
-	struct pch_gpio *chip =	container_of(gpio, struct pch_gpio, gpio);
+	struct pch_gpio *chip =	gpiochip_get_data(gpio);
 	u32 pm;
 	unsigned long flags;
 
@@ -211,7 +211,7 @@ static void pch_gpio_restore_reg_conf(struct pch_gpio *chip)
 
 static int pch_gpio_to_irq(struct gpio_chip *gpio, unsigned offset)
 {
-	struct pch_gpio *chip = container_of(gpio, struct pch_gpio, gpio);
+	struct pch_gpio *chip = gpiochip_get_data(gpio);
 	return chip->irq_base + offset;
 }
 
@@ -394,7 +394,7 @@ static int pch_gpio_probe(struct pci_dev *pdev,
 	pci_set_drvdata(pdev, chip);
 	spin_lock_init(&chip->spinlock);
 	pch_gpio_setup(chip);
-	ret = gpiochip_add(&chip->gpio);
+	ret = gpiochip_add_data(&chip->gpio, chip);
 	if (ret) {
 		dev_err(&pdev->dev, "PCH gpio: Failed to register GPIO\n");
 		goto err_gpiochip_add;
-- 
2.4.3

