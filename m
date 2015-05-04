From: Johan Hovold <johan@kernel.org>
Subject: [PATCH] gpio: fix gpio leak in gpiochip_add error path
Date: Mon,  4 May 2015 17:23:25 +0200
Message-ID: <1430753005-19691-1-git-send-email-johan@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:35201 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751346AbbEDPXj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2015 11:23:39 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>

Make sure to free any hogged gpios on errors in gpiochip_add.

Also move all forward declarations to the top of the file.

Fixes: f625d4601759 ("gpio: add GPIO hogging mechanism")
Signed-off-by: Johan Hovold <johan@kernel.org>
---

Here's another fix for 4.1.

Johan


 drivers/gpio/gpiolib.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 2ce3df3504e6..3b0b063ceb76 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -53,6 +53,11 @@ static DEFINE_MUTEX(gpio_lookup_lock);
 static LIST_HEAD(gpio_lookup_list);
 LIST_HEAD(gpio_chips);
 
+
+static void gpiochip_free_hogs(struct gpio_chip *chip);
+static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip);
+
+
 static inline void desc_set_label(struct gpio_desc *d, const char *label)
 {
 	d->label = label;
@@ -297,6 +302,7 @@ int gpiochip_add(struct gpio_chip *chip)
 
 err_remove_chip:
 	acpi_gpiochip_remove(chip);
+	gpiochip_free_hogs(chip);
 	of_gpiochip_remove(chip);
 	spin_lock_irqsave(&gpio_lock, flags);
 	list_del(&chip->list);
@@ -313,10 +319,6 @@ err_free_descs:
 }
 EXPORT_SYMBOL_GPL(gpiochip_add);
 
-/* Forward-declaration */
-static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip);
-static void gpiochip_free_hogs(struct gpio_chip *chip);
-
 /**
  * gpiochip_remove() - unregister a gpio_chip
  * @chip: the chip to unregister
-- 
2.0.5

