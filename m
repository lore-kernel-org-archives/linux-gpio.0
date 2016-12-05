From: Mukesh Kaushik <mukesh.k4@samsung.com>
Subject: [PATCH] gpio/gpiolib.c:Fixing style issues in gpiolib.c
Date: Mon, 05 Dec 2016 17:15:25 +0530
Message-ID: <1480938325-4113-1-git-send-email-mukesh.k4@samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:55134 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750855AbcLELr5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2016 06:47:57 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mukesh Kaushik <mukesh.k4@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, vidushi.koul@samsung.com

Fixing the following checkpatch.pl error:

ERROR: else should follow close brace '}'
+       }
+       else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {

ERROR: space prohibited after that open parenthesis '('
+       if ( !desc->gdev->chip ) { \

ERROR: space prohibited before that close parenthesis ')'
+       if ( !desc->gdev->chip ) { \

and following warnings :

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'

WARNING: else is not generally useful after a break or return
+                       break;
+               else

Change-Id: I9164832686efb8db1f6d365f89f278e998104f81
Signed-off-by: Mukesh Kaushik <mukesh.k4@samsung.com>
---
 drivers/gpio/gpiolib.c |   34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 93ed0e0..1b3361a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -85,7 +85,7 @@ static inline void desc_set_label(struct gpio_desc *d, const char *label)
 /**
  * Convert a GPIO number to its descriptor
  */
-struct gpio_desc *gpio_to_desc(unsigned gpio)
+struct gpio_desc *gpio_to_desc(unsigned int gpio)
 {
 	struct gpio_device *gdev;
 	unsigned long flags;
@@ -157,9 +157,8 @@ static int gpiochip_find_base(int ngpio)
 		/* found a free space? */
 		if (gdev->base + gdev->ngpio <= base)
 			break;
-		else
-			/* nope, check the space right before the chip */
-			base = gdev->base - ngpio;
+		/* nope, check the space right before the chip */
+		base = gdev->base - ngpio;
 	}
 
 	if (gpio_is_valid(base)) {
@@ -182,7 +181,7 @@ static int gpiochip_find_base(int ngpio)
 int gpiod_get_direction(struct gpio_desc *desc)
 {
 	struct gpio_chip	*chip;
-	unsigned		offset;
+	unsigned int		offset;
 	int			status = -EINVAL;
 
 	chip = gpiod_to_chip(desc);
@@ -1104,7 +1103,7 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 {
 	unsigned long	flags;
 	int		status = 0;
-	unsigned	i;
+	unsigned int	i;
 	int		base = chip->base;
 	struct gpio_device *gdev;
 
@@ -1311,7 +1310,7 @@ void gpiochip_remove(struct gpio_chip *chip)
 	struct gpio_device *gdev = chip->gpiodev;
 	struct gpio_desc *desc;
 	unsigned long	flags;
-	unsigned	i;
+	unsigned int	i;
 	bool		requested = false;
 
 	/* FIXME: should the legacy sysfs handling be moved to gpio_device? */
@@ -1640,7 +1639,7 @@ static void gpiochip_irq_relres(struct irq_data *d)
 	module_put(chip->gpiodev->owner);
 }
 
-static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
+static int gpiochip_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	return irq_find_mapping(chip->irqdomain, offset);
 }
@@ -1717,7 +1716,7 @@ int _gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 	struct device_node *of_node;
 	bool irq_base_set = false;
 	unsigned int offset;
-	unsigned irq_base = 0;
+	unsigned int irq_base = 0;
 
 	if (!gpiochip || !irqchip)
 		return -EINVAL;
@@ -1815,7 +1814,7 @@ static inline void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip)
  * @chip: the gpiochip owning the GPIO
  * @offset: the offset of the GPIO to request for GPIO function
  */
-int gpiochip_generic_request(struct gpio_chip *chip, unsigned offset)
+int gpiochip_generic_request(struct gpio_chip *chip, unsigned int offset)
 {
 	return pinctrl_request_gpio(chip->gpiodev->base + offset);
 }
@@ -1826,7 +1825,7 @@ int gpiochip_generic_request(struct gpio_chip *chip, unsigned offset)
  * @chip: the gpiochip to request the gpio function for
  * @offset: the offset of the GPIO to free from GPIO function
  */
-void gpiochip_generic_free(struct gpio_chip *chip, unsigned offset)
+void gpiochip_generic_free(struct gpio_chip *chip, unsigned int offset)
 {
 	pinctrl_free_gpio(chip->gpiodev->base + offset);
 }
@@ -2015,7 +2014,7 @@ static int __gpiod_request(struct gpio_desc *desc, const char *label)
 		pr_warn("%s: invalid GPIO (no device)\n", __func__); \
 		return -EINVAL; \
 	} \
-	if ( !desc->gdev->chip ) { \
+	if (!desc->gdev->chip) { \
 		dev_warn(&desc->gdev->dev, \
 			 "%s: backing chip is gone\n", __func__); \
 		return 0; \
@@ -2117,7 +2116,7 @@ void gpiod_free(struct gpio_desc *desc)
  * help with diagnostics, and knowing that the signal is used as a GPIO
  * can help avoid accidentally multiplexing it to another controller.
  */
-const char *gpiochip_is_requested(struct gpio_chip *chip, unsigned offset)
+const char *gpiochip_is_requested(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_desc *desc;
 
@@ -2244,8 +2243,7 @@ static int _gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 		/* Emulate open drain by not actively driving the line high */
 		if (value)
 			return gpiod_direction_input(desc);
-	}
-	else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
+	} else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
 		if (gc->set_single_ended) {
 			ret = gc->set_single_ended(gc, gpio_chip_hwgpio(desc),
 						   LINE_MODE_OPEN_SOURCE);
@@ -2326,7 +2324,7 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
  * returns -ENOTSUPP if the controller does not support setting
  * debounce.
  */
-int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
+int gpiod_set_debounce(struct gpio_desc *desc, unsigned int debounce)
 {
 	struct gpio_chip	*chip;
 
@@ -3514,9 +3512,9 @@ static int __init gpiolib_dev_init(void)
 
 static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 {
-	unsigned		i;
+	unsigned int		i;
 	struct gpio_chip	*chip = gdev->chip;
-	unsigned		gpio = gdev->base;
+	unsigned int		gpio = gdev->base;
 	struct gpio_desc	*gdesc = &gdev->descs[0];
 	int			is_out;
 	int			is_irq;
-- 
1.7.9.5

