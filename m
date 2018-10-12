From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH] gpiolib: Initialize gdev field before is used
Date: Fri, 12 Oct 2018 08:11:36 +0200
Message-ID: <20181012061136.11421-1-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>, Jeffrey Hugo <jhugo@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Timur Tabi <timur@kernel.org>, Stephen Boyd <swboyd@chromium.org>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: linux-gpio@vger.kernel.org

gpio_hog depends on gdev field being initialized. This patch fixes an
OOPs during initialization of TI's AM335x-ICEv2.

Fixes: 3edfb7bd76bd1cba ("gpiolib: Show correct direction from the beginning")
Tested-by: Vignesh R <vigneshr@ti.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/gpio/gpiolib.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e016b22658ff..bcd0ef49ce97 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1349,6 +1349,9 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
+	for (i = 0; i < chip->ngpio; i++)
+		gdev->descs[i].gdev = gdev;
+
 #ifdef CONFIG_PINCTRL
 	INIT_LIST_HEAD(&gdev->pin_ranges);
 #endif
@@ -1380,8 +1383,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	for (i = 0; i < chip->ngpio; i++) {
 		struct gpio_desc *desc = &gdev->descs[i];
 
-		desc->gdev = gdev;
-
 		if (chip->get_direction && gpiochip_line_is_valid(chip, i))
 			desc->flags = !chip->get_direction(chip, i) ?
 					(1 << FLAG_IS_OUT) : 0;
-- 
2.19.1
