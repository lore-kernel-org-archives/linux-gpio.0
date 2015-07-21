From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] gpio: remove unneeded initializer in gpiochip_add_to_list()
Date: Tue, 21 Jul 2015 14:45:40 +0900
Message-ID: <1437457540-1778-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This variable is used as an iterator and initialized in the
list_for_each() loop.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bf4bd1d..adb03c6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -190,7 +190,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_direction);
  */
 static int gpiochip_add_to_list(struct gpio_chip *chip)
 {
-	struct list_head *pos = &gpio_chips;
+	struct list_head *pos;
 	struct gpio_chip *_chip;
 	int err = 0;
 
-- 
1.9.1
