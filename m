From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 129/182] ARM: w90x900: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:36:02 +0100
Message-ID: <1449668162-3967-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:35967 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754569AbbLINgH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:36:07 -0500
Received: by lbblt2 with SMTP id lt2so30213286lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:36:06 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, arm@kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: arm@kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC people: please ACK this so I can take it with the rest of
the refactoring through the GPIO tree.
---
 arch/arm/mach-w90x900/gpio.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-w90x900/gpio.c b/arch/arm/mach-w90x900/gpio.c
index ba05aec7ea4b..55d1a00dbd28 100644
--- a/arch/arm/mach-w90x900/gpio.c
+++ b/arch/arm/mach-w90x900/gpio.c
@@ -20,7 +20,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 
 #include <mach/hardware.h>
 
@@ -30,7 +30,6 @@
 #define GPIO_IN			(0x0C)
 #define GROUPINERV		(0x10)
 #define GPIO_GPIO(Nb)		(0x00000001 << (Nb))
-#define to_nuc900_gpio_chip(c) container_of(c, struct nuc900_gpio_chip, chip)
 
 #define NUC900_GPIO_CHIP(name, base_gpio, nr_gpio)			\
 	{								\
@@ -53,7 +52,7 @@ struct nuc900_gpio_chip {
 
 static int nuc900_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct nuc900_gpio_chip *nuc900_gpio = to_nuc900_gpio_chip(chip);
+	struct nuc900_gpio_chip *nuc900_gpio = gpiochip_get_data(chip);
 	void __iomem *pio = nuc900_gpio->regbase + GPIO_IN;
 	unsigned int regval;
 
@@ -65,7 +64,7 @@ static int nuc900_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 static void nuc900_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 {
-	struct nuc900_gpio_chip *nuc900_gpio = to_nuc900_gpio_chip(chip);
+	struct nuc900_gpio_chip *nuc900_gpio = gpiochip_get_data(chip);
 	void __iomem *pio = nuc900_gpio->regbase + GPIO_OUT;
 	unsigned int regval;
 	unsigned long flags;
@@ -86,7 +85,7 @@ static void nuc900_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 
 static int nuc900_dir_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct nuc900_gpio_chip *nuc900_gpio = to_nuc900_gpio_chip(chip);
+	struct nuc900_gpio_chip *nuc900_gpio = gpiochip_get_data(chip);
 	void __iomem *pio = nuc900_gpio->regbase + GPIO_DIR;
 	unsigned int regval;
 	unsigned long flags;
@@ -104,7 +103,7 @@ static int nuc900_dir_input(struct gpio_chip *chip, unsigned offset)
 
 static int nuc900_dir_output(struct gpio_chip *chip, unsigned offset, int val)
 {
-	struct nuc900_gpio_chip *nuc900_gpio = to_nuc900_gpio_chip(chip);
+	struct nuc900_gpio_chip *nuc900_gpio = gpiochip_get_data(chip);
 	void __iomem *outreg = nuc900_gpio->regbase + GPIO_OUT;
 	void __iomem *pio = nuc900_gpio->regbase + GPIO_DIR;
 	unsigned int regval;
@@ -149,6 +148,6 @@ void __init nuc900_init_gpio(int nr_group)
 		gpio_chip = &nuc900_gpio[i];
 		spin_lock_init(&gpio_chip->gpio_lock);
 		gpio_chip->regbase = GPIO_BASE + i * GROUPINERV;
-		gpiochip_add(&gpio_chip->chip);
+		gpiochip_add_data(&gpio_chip->chip, gpio_chip);
 	}
 }
-- 
2.4.3

