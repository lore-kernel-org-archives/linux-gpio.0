From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 5/6] gpio: fix sleep-while-atomic in gpiochip_remove
Date: Mon, 12 Jan 2015 17:12:28 +0100
Message-ID: <1421079149-2236-6-git-send-email-johan@kernel.org>
References: <1421079149-2236-1-git-send-email-johan@kernel.org>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1421079149-2236-1-git-send-email-johan@kernel.org>
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Move direct and indirect calls to gpiochip_remove_pin_ranges outside of
spin lock as they can end up taking a mutex in pinctrl_remove_gpio_range.

Note that the pin ranges are already added outside of the lock.

Fixes: 9ef0d6f7628b ("gpiolib: call pin removal in chip removal function")
Fixes: f23f1516b675 ("gpiolib: provide provision to register pin ranges")
Cc: stable <stable@vger.kernel.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0f8173051edc..37f919dc2cb4 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -330,12 +330,10 @@ void gpiochip_remove(struct gpio_chip *chip)
 	gpiochip_irqchip_remove(chip);
 
 	acpi_gpiochip_remove(chip);
-
-	spin_lock_irqsave(&gpio_lock, flags);
-
 	gpiochip_remove_pin_ranges(chip);
 	of_gpiochip_remove(chip);
 
+	spin_lock_irqsave(&gpio_lock, flags);
 	for (id = 0; id < chip->ngpio; id++) {
 		if (test_bit(FLAG_REQUESTED, &chip->desc[id].flags))
 			dev_crit(chip->dev, "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");
-- 
2.0.5
