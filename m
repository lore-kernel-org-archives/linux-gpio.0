From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 02/10] gpio: mockup: add prefixes to the direction enum
Date: Thu, 25 May 2017 10:33:39 +0200
Message-ID: <1495701227-28809-3-git-send-email-brgl@bgdev.pl>
References: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

All internal symbols except for the direction enum follow the same
convention and use the gpio_mockup prefix. Add the prefix to the
DIR_IN and DIR_OUT definitions as well for consistency across the
file.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index c18d011..b1ee45c 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -29,8 +29,8 @@
 #define	GPIO_MOCKUP_MAX_GC	10
 
 enum {
-	DIR_OUT = 0,
-	DIR_IN = 1,
+	GPIO_MOCKUP_DIR_OUT = 0,
+	GPIO_MOCKUP_DIR_IN = 1,
 };
 
 /*
@@ -93,7 +93,7 @@ static int gpio_mockup_dirout(struct gpio_chip *gc, unsigned int offset,
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
 	gpio_mockup_set(gc, offset, value);
-	chip->lines[offset].dir = DIR_OUT;
+	chip->lines[offset].dir = GPIO_MOCKUP_DIR_OUT;
 
 	return 0;
 }
@@ -102,7 +102,7 @@ static int gpio_mockup_dirin(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
-	chip->lines[offset].dir = DIR_IN;
+	chip->lines[offset].dir = GPIO_MOCKUP_DIR_IN;
 
 	return 0;
 }
-- 
2.9.3
