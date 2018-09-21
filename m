From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v2] gpiolib: Show correct direction from the beginning
Date: Fri, 21 Sep 2018 12:36:04 +0200
Message-ID: <20180921103604.13361-2-ricardo.ribalda@gmail.com>
References: <20180921103604.13361-1-ricardo.ribalda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921103604.13361-1-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Timur Tabi <timur@codeaurora.org>, swboyd@chromium.org, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
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
index 4b45de883ada..00c17f64d9ff 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1352,7 +1352,12 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 		 * it does, and in case chip->get_direction is not set, we may
 		 * expose the wrong direction in sysfs.
 		 */
-		desc->flags = !chip->direction_input ? (1 << FLAG_IS_OUT) : 0;
+		if (chip->get_direction && gpiochip_line_is_valid(chip, i))
+			desc->flags = !chip->get_direction(chip, i) ?
+					(1 << FLAG_IS_OUT) : 0;
+		else
+			desc->flags = !chip->direction_input ?
+					(1 << FLAG_IS_OUT) : 0;
 	}
 
 #ifdef CONFIG_PINCTRL
-- 
2.18.0
