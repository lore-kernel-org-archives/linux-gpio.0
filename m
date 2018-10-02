From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v3 3/3] gpiolib: Show correct direction from the beginning
Date: Tue,  2 Oct 2018 10:27:31 +0200
Message-ID: <20181002082731.20141-3-ricardo.ribalda@gmail.com>
References: <20181002082731.20141-1-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181002082731.20141-1-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Timur Tabi <timur@codeaurora.org>, swboyd@chromium.org, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Current code assumes that the direction is input if direction_input
function is set.
This might not be the case on GPIOs with programmable direction.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/gpio/gpiolib.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6925196136ce..eaadbcb5c0f8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1344,20 +1344,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
-	for (i = 0; i < chip->ngpio; i++) {
-		struct gpio_desc *desc = &gdev->descs[i];
-
-		desc->gdev = gdev;
-
-		/* REVISIT: most hardware initializes GPIOs as inputs (often
-		 * with pullups enabled) so power usage is minimized. Linux
-		 * code should set the gpio direction first thing; but until
-		 * it does, and in case chip->get_direction is not set, we may
-		 * expose the wrong direction in sysfs.
-		 */
-		desc->flags = !chip->direction_input ? (1 << FLAG_IS_OUT) : 0;
-	}
-
 #ifdef CONFIG_PINCTRL
 	INIT_LIST_HEAD(&gdev->pin_ranges);
 #endif
@@ -1374,6 +1360,25 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	if (status)
 		goto err_remove_irqchip_mask;
 
+	for (i = 0; i < chip->ngpio; i++) {
+		struct gpio_desc *desc = &gdev->descs[i];
+
+		desc->gdev = gdev;
+
+		/* REVISIT: most hardware initializes GPIOs as inputs (often
+		 * with pullups enabled) so power usage is minimized. Linux
+		 * code should set the gpio direction first thing; but until
+		 * it does, and in case chip->get_direction is not set, we may
+		 * expose the wrong direction in sysfs.
+		 */
+		if (chip->get_direction && gpiochip_line_is_valid(chip, i))
+			desc->flags = !chip->get_direction(chip, i) ?
+					(1 << FLAG_IS_OUT) : 0;
+		else
+			desc->flags = !chip->direction_input ?
+					(1 << FLAG_IS_OUT) : 0;
+	}
+
 	status = gpiochip_add_irqchip(chip, lock_key, request_key);
 	if (status)
 		goto err_remove_chip;
-- 
2.19.0
