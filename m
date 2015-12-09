From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 172/182] staging: vme: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:50:05 +0100
Message-ID: <1449669005-6835-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:33107 "EHLO
	mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753131AbbLINuL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:50:11 -0500
Received: by lfaz4 with SMTP id z4so34645969lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:50:09 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Martyn Welch <martyn@welchs.me.uk>, Manohar Vanga <manohar.vanga@gmail.com>, devel@driverdev.osuosl.org

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Martyn Welch <martyn@welchs.me.uk>
Cc: Manohar Vanga <manohar.vanga@gmail.com>
Cc: devel@driverdev.osuosl.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Greg, please ACK this so I can take this through the GPIO tree.
---
 drivers/staging/vme/devices/vme_pio2_gpio.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/vme/devices/vme_pio2_gpio.c b/drivers/staging/vme/devices/vme_pio2_gpio.c
index 77901b345a71..a2b740ab7ffe 100644
--- a/drivers/staging/vme/devices/vme_pio2_gpio.c
+++ b/drivers/staging/vme/devices/vme_pio2_gpio.c
@@ -17,7 +17,7 @@
 #include <linux/device.h>
 #include <linux/platform_device.h>
 #include <linux/ctype.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/slab.h>
 #include <linux/vme.h>
 
@@ -25,16 +25,11 @@
 
 static const char driver_name[] = "pio2_gpio";
 
-static struct pio2_card *gpio_to_pio2_card(struct gpio_chip *chip)
-{
-	return container_of(chip, struct pio2_card, gc);
-}
-
 static int pio2_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	u8 reg;
 	int retval;
-	struct pio2_card *card = gpio_to_pio2_card(chip);
+	struct pio2_card *card = gpiochip_get_data(chip);
 
 	if ((card->bank[PIO2_CHANNEL_BANK[offset]].config == OUTPUT) |
 		(card->bank[PIO2_CHANNEL_BANK[offset]].config == NOFIT)) {
@@ -72,7 +67,7 @@ static void pio2_gpio_set(struct gpio_chip *chip, unsigned int offset,
 {
 	u8 reg;
 	int retval;
-	struct pio2_card *card = gpio_to_pio2_card(chip);
+	struct pio2_card *card = gpiochip_get_data(chip);
 
 	if ((card->bank[PIO2_CHANNEL_BANK[offset]].config == INPUT) |
 		(card->bank[PIO2_CHANNEL_BANK[offset]].config == NOFIT)) {
@@ -102,7 +97,7 @@ static void pio2_gpio_set(struct gpio_chip *chip, unsigned int offset,
 static int pio2_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
 {
 	int data;
-	struct pio2_card *card = gpio_to_pio2_card(chip);
+	struct pio2_card *card = gpiochip_get_data(chip);
 
 	if ((card->bank[PIO2_CHANNEL_BANK[offset]].config == OUTPUT) |
 		(card->bank[PIO2_CHANNEL_BANK[offset]].config == NOFIT)) {
@@ -121,7 +116,7 @@ static int pio2_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
 static int pio2_gpio_dir_out(struct gpio_chip *chip, unsigned offset, int value)
 {
 	int data;
-	struct pio2_card *card = gpio_to_pio2_card(chip);
+	struct pio2_card *card = gpiochip_get_data(chip);
 
 	if ((card->bank[PIO2_CHANNEL_BANK[offset]].config == INPUT) |
 		(card->bank[PIO2_CHANNEL_BANK[offset]].config == NOFIT)) {
@@ -207,7 +202,7 @@ int pio2_gpio_init(struct pio2_card *card)
 	card->gc.set = pio2_gpio_set;
 
 	/* This function adds a memory mapped GPIO chip */
-	retval = gpiochip_add(&(card->gc));
+	retval = gpiochip_add_data(&(card->gc), card);
 	if (retval) {
 		dev_err(&card->vdev->dev, "Unable to register GPIO\n");
 		kfree(card->gc.label);
-- 
2.4.3

