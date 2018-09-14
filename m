From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH] gpiolib: Show correct direction from the beginning
Date: Fri, 14 Sep 2018 09:08:39 +0200
Message-ID: <20180914070839.4667-2-ricardo.ribalda@gmail.com>
References: <20180914070839.4667-1-ricardo.ribalda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180914070839.4667-1-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Current code assumes that the direction is input if direction_input
function is set.
This might not be the case on GPIOs with programmable direction.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/gpio/gpiolib.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a57300c1d649..af853749e0bb 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1352,7 +1352,12 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 		 * it does, and in case chip->get_direction is not set, we may
 		 * expose the wrong direction in sysfs.
 		 */
-		desc->flags = !chip->direction_input ? (1 << FLAG_IS_OUT) : 0;
+		if (chip->get_direction)
+			desc->flags = !chip->get_direction(chip, i) ?
+					(1 << FLAG_IS_OUT) : 0;
+		else
+			desc->flags = !chip->direction_input ?
+					(1 << FLAG_IS_OUT) : 0;
 	}
 
 #ifdef CONFIG_PINCTRL
-- 
2.18.0
