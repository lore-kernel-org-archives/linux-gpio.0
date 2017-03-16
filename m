From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: [PATCH 3/6] gpio: mvebu: checkpatch: unsigned int fixes
Date: Thu, 16 Mar 2017 07:33:58 +0100
Message-ID: <20170316063402.8667-4-ralph.sennhauser@gmail.com>
References: <20170316063402.8667-1-ralph.sennhauser@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170316063402.8667-1-ralph.sennhauser@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Ralph Sennhauser <ralph.sennhauser@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Use unsigned int instead of plain unsigned as reported by checkpatch.

Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
---
 drivers/gpio/gpio-mvebu.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 80b1d52..a9522f4 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -187,7 +187,7 @@ static void __iomem *mvebu_gpioreg_level_mask(struct mvebu_gpio_chip *mvchip)
  * Functions implementing the gpio_chip methods
  */
 
-static void mvebu_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
+static void mvebu_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
 {
 	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -203,7 +203,7 @@ static void mvebu_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
 	spin_unlock_irqrestore(&mvchip->lock, flags);
 }
 
-static int mvebu_gpio_get(struct gpio_chip *chip, unsigned pin)
+static int mvebu_gpio_get(struct gpio_chip *chip, unsigned int pin)
 {
 	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
 	u32 u;
@@ -218,7 +218,8 @@ static int mvebu_gpio_get(struct gpio_chip *chip, unsigned pin)
 	return (u >> pin) & 1;
 }
 
-static void mvebu_gpio_blink(struct gpio_chip *chip, unsigned pin, int value)
+static void mvebu_gpio_blink(struct gpio_chip *chip, unsigned int pin,
+			     int value)
 {
 	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -234,7 +235,7 @@ static void mvebu_gpio_blink(struct gpio_chip *chip, unsigned pin, int value)
 	spin_unlock_irqrestore(&mvchip->lock, flags);
 }
 
-static int mvebu_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
+static int mvebu_gpio_direction_input(struct gpio_chip *chip, unsigned int pin)
 {
 	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -258,7 +259,7 @@ static int mvebu_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
 	return 0;
 }
 
-static int mvebu_gpio_direction_output(struct gpio_chip *chip, unsigned pin,
+static int mvebu_gpio_direction_output(struct gpio_chip *chip, unsigned int pin,
 				       int value)
 {
 	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
@@ -286,7 +287,7 @@ static int mvebu_gpio_direction_output(struct gpio_chip *chip, unsigned pin,
 	return 0;
 }
 
-static int mvebu_gpio_to_irq(struct gpio_chip *chip, unsigned pin)
+static int mvebu_gpio_to_irq(struct gpio_chip *chip, unsigned int pin)
 {
 	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
 	return irq_create_mapping(mvchip->domain, pin);
-- 
2.10.2
