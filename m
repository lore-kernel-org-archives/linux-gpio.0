From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] gpio: refactor gpiochip_find() slightly
Date: Fri, 12 Aug 2016 01:21:58 +0900
Message-ID: <1470932518-8748-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The if...else... block after the loop can be dropped with
a slight refactoring.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/gpiolib.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 53ff25a..deaf4d4 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1363,19 +1363,15 @@ struct gpio_chip *gpiochip_find(void *data,
 					     void *data))
 {
 	struct gpio_device *gdev;
-	struct gpio_chip *chip;
+	struct gpio_chip *chip = NULL;
 	unsigned long flags;
 
 	spin_lock_irqsave(&gpio_lock, flags);
 	list_for_each_entry(gdev, &gpio_devices, list)
-		if (gdev->chip && match(gdev->chip, data))
+		if (gdev->chip && match(gdev->chip, data)) {
+			chip = gdev->chip;
 			break;
-
-	/* No match? */
-	if (&gdev->list == &gpio_devices)
-		chip = NULL;
-	else
-		chip = gdev->chip;
+		}
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
-- 
1.9.1
