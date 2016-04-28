From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: set up initial state from .get_direction()
Date: Thu, 28 Apr 2016 14:35:27 +0200
Message-ID: <1461846927-30734-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:36705 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751571AbcD1Mfc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Apr 2016 08:35:32 -0400
Received: by mail-lf0-f43.google.com with SMTP id u64so82338285lff.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Apr 2016 05:35:32 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

If the gpiochip supports the .get_direction() callback, then
the initial state of the descriptor flags should be set up
as output accordingly. Also put in comments explaining what is
going on.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f72dfb6094a7..d2246f58abbc 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -755,14 +755,31 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 		struct gpio_desc *desc = &gdev->descs[i];
 
 		desc->gdev = gdev;
-
-		/* REVISIT: most hardware initializes GPIOs as inputs (often
-		 * with pullups enabled) so power usage is minimized. Linux
-		 * code should set the gpio direction first thing; but until
-		 * it does, and in case chip->get_direction is not set, we may
-		 * expose the wrong direction in sysfs.
+		/*
+		 * REVISIT: most hardware initializes GPIOs as inputs
+		 * (often with pullups enabled) so power usage is
+		 * minimized. Linux code should set the gpio direction
+		 * first thing; but until it does, and in case
+		 * chip->get_direction is not set, we may expose the
+		 * wrong direction in sysfs.
 		 */
-		desc->flags = !chip->direction_input ? (1 << FLAG_IS_OUT) : 0;
+
+		if (chip->get_direction) {
+			/*
+			 * If we have .get_direction, set up the initial
+			 * direction flag from the hardware.
+			 */
+			int dir = chip->get_direction(chip, i);
+
+			if (!dir)
+				set_bit(FLAG_IS_OUT, &desc->flags);
+		} else if (!chip->direction_input) {
+			/*
+			 * If the chip lacks the .direction_input callback
+			 * we logically assume all lines are outputs.
+			 */
+			set_bit(FLAG_IS_OUT, &desc->flags);
+		}
 	}
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
-- 
2.4.11

