From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/6] gpio: clean up gpiochip_add error handling
Date: Mon, 12 Jan 2015 17:12:26 +0100
Message-ID: <1421079149-2236-4-git-send-email-johan@kernel.org>
References: <1421079149-2236-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421079149-2236-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Clean up gpiochip_add error handling.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ac5944b4e4d8..4efb92ca3463 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -255,32 +255,29 @@ int gpiochip_add(struct gpio_chip *chip)
 	}
 
 	status = gpiochip_add_to_list(chip);
+	if (status) {
+		spin_unlock_irqrestore(&gpio_lock, flags);
+		goto err_free_descs;
+	}
 
-	if (status == 0) {
-		for (id = 0; id < chip->ngpio; id++) {
-			struct gpio_desc *desc = &descs[id];
-			desc->chip = chip;
-
-			/* REVISIT:  most hardware initializes GPIOs as
-			 * inputs (often with pullups enabled) so power
-			 * usage is minimized.  Linux code should set the
-			 * gpio direction first thing; but until it does,
-			 * and in case chip->get_direction is not set,
-			 * we may expose the wrong direction in sysfs.
-			 */
-			desc->flags = !chip->direction_input
-				? (1 << FLAG_IS_OUT)
-				: 0;
-		}
+	for (id = 0; id < chip->ngpio; id++) {
+		struct gpio_desc *desc = &descs[id];
+
+		desc->chip = chip;
+
+		/* REVISIT: most hardware initializes GPIOs as inputs (often
+		 * with pullups enabled) so power usage is minimized. Linux
+		 * code should set the gpio direction first thing; but until
+		 * it does, and in case chip->get_direction is not set, we may
+		 * expose the wrong direction in sysfs.
+		 */
+		desc->flags = !chip->direction_input ? (1 << FLAG_IS_OUT) : 0;
 	}
 
 	chip->desc = descs;
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
-	if (status)
-		goto fail;
-
 #ifdef CONFIG_PINCTRL
 	INIT_LIST_HEAD(&chip->pin_ranges);
 #endif
@@ -304,10 +301,9 @@ err_remove_chip:
 	spin_lock_irqsave(&gpio_lock, flags);
 	list_del(&chip->list);
 	spin_unlock_irqrestore(&gpio_lock, flags);
-fail:
+	chip->desc = NULL;
 err_free_descs:
 	kfree(descs);
-	chip->desc = NULL;
 
 	/* failures here can mean systems won't boot... */
 	pr_err("%s: GPIOs %d..%d (%s) failed to register\n", __func__,
-- 
2.0.5
