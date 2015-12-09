From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 136/182] MIPS: ar7: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:39:11 +0100
Message-ID: <1449668351-4493-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:35299 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752002AbbLINjQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:39:16 -0500
Received: by lfdl133 with SMTP id l133so34253863lfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:39:15 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Ralf Baechle <ralf@linux-mips.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mips@linux-mips.org, Alban Bedel <albeu@free.fr>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: Alban Bedel <albeu@free.fr>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Ralf: please ACK this so I can take it through the GPIO tree.
BTW: would be nice if the MIPS GPIO drivers could move down
to drivers/gpio in the long run.
---
 arch/mips/ar7/gpio.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/arch/mips/ar7/gpio.c b/arch/mips/ar7/gpio.c
index f4930456eb8e..0b4485697d10 100644
--- a/arch/mips/ar7/gpio.c
+++ b/arch/mips/ar7/gpio.c
@@ -33,8 +33,7 @@ struct ar7_gpio_chip {
 
 static int ar7_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 {
-	struct ar7_gpio_chip *gpch =
-				container_of(chip, struct ar7_gpio_chip, chip);
+	struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
 	void __iomem *gpio_in = gpch->regs + AR7_GPIO_INPUT;
 
 	return readl(gpio_in) & (1 << gpio);
@@ -42,8 +41,7 @@ static int ar7_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 
 static int titan_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 {
-	struct ar7_gpio_chip *gpch =
-				container_of(chip, struct ar7_gpio_chip, chip);
+	struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
 	void __iomem *gpio_in0 = gpch->regs + TITAN_GPIO_INPUT_0;
 	void __iomem *gpio_in1 = gpch->regs + TITAN_GPIO_INPUT_1;
 
@@ -53,8 +51,7 @@ static int titan_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 static void ar7_gpio_set_value(struct gpio_chip *chip,
 				unsigned gpio, int value)
 {
-	struct ar7_gpio_chip *gpch =
-				container_of(chip, struct ar7_gpio_chip, chip);
+	struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
 	void __iomem *gpio_out = gpch->regs + AR7_GPIO_OUTPUT;
 	unsigned tmp;
 
@@ -67,8 +64,7 @@ static void ar7_gpio_set_value(struct gpio_chip *chip,
 static void titan_gpio_set_value(struct gpio_chip *chip,
 				unsigned gpio, int value)
 {
-	struct ar7_gpio_chip *gpch =
-				container_of(chip, struct ar7_gpio_chip, chip);
+	struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
 	void __iomem *gpio_out0 = gpch->regs + TITAN_GPIO_OUTPUT_0;
 	void __iomem *gpio_out1 = gpch->regs + TITAN_GPIO_OUTPUT_1;
 	unsigned tmp;
@@ -81,8 +77,7 @@ static void titan_gpio_set_value(struct gpio_chip *chip,
 
 static int ar7_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 {
-	struct ar7_gpio_chip *gpch =
-				container_of(chip, struct ar7_gpio_chip, chip);
+	struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
 	void __iomem *gpio_dir = gpch->regs + AR7_GPIO_DIR;
 
 	writel(readl(gpio_dir) | (1 << gpio), gpio_dir);
@@ -92,8 +87,7 @@ static int ar7_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 
 static int titan_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 {
-	struct ar7_gpio_chip *gpch =
-				container_of(chip, struct ar7_gpio_chip, chip);
+	struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
 	void __iomem *gpio_dir0 = gpch->regs + TITAN_GPIO_DIR_0;
 	void __iomem *gpio_dir1 = gpch->regs + TITAN_GPIO_DIR_1;
 
@@ -108,8 +102,7 @@ static int titan_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 static int ar7_gpio_direction_output(struct gpio_chip *chip,
 					unsigned gpio, int value)
 {
-	struct ar7_gpio_chip *gpch =
-				container_of(chip, struct ar7_gpio_chip, chip);
+	struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
 	void __iomem *gpio_dir = gpch->regs + AR7_GPIO_DIR;
 
 	ar7_gpio_set_value(chip, gpio, value);
@@ -121,8 +114,7 @@ static int ar7_gpio_direction_output(struct gpio_chip *chip,
 static int titan_gpio_direction_output(struct gpio_chip *chip,
 					unsigned gpio, int value)
 {
-	struct ar7_gpio_chip *gpch =
-				container_of(chip, struct ar7_gpio_chip, chip);
+	struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
 	void __iomem *gpio_dir0 = gpch->regs + TITAN_GPIO_DIR_0;
 	void __iomem *gpio_dir1 = gpch->regs + TITAN_GPIO_DIR_1;
 
@@ -335,7 +327,7 @@ int __init ar7_gpio_init(void)
 		return -ENOMEM;
 	}
 
-	ret = gpiochip_add(&gpch->chip);
+	ret = gpiochip_add_data(&gpch->chip, gpch);
 	if (ret) {
 		printk(KERN_ERR "%s: failed to add gpiochip\n",
 					gpch->chip.label);
-- 
2.4.3

