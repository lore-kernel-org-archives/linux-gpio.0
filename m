From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 1/3] gpio: mockup: fix indicated direction
Date: Thu,  8 Nov 2018 17:52:53 +0100
Message-ID: <20181108165255.9940-2-brgl@bgdev.pl>
References: <20181108165255.9940-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108165255.9940-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bamvor Jian Zhang <bamv2005@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Commit 3edfb7bd76bd ("gpiolib: Show correct direction from the
beginning") fixed an existing issue but broke libgpiod tests by
changing the default direction of dummy lines to output.

We don't break user-space so make gpio-mockup behave as before.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 8269cffc2967..6a50f9f59c90 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -35,8 +35,8 @@
 #define gpio_mockup_err(...)	pr_err(GPIO_MOCKUP_NAME ": " __VA_ARGS__)
 
 enum {
-	GPIO_MOCKUP_DIR_OUT = 0,
-	GPIO_MOCKUP_DIR_IN = 1,
+	GPIO_MOCKUP_DIR_IN = 0,
+	GPIO_MOCKUP_DIR_OUT = 1,
 };
 
 /*
@@ -131,7 +131,7 @@ static int gpio_mockup_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
-	return chip->lines[offset].dir;
+	return !chip->lines[offset].dir;
 }
 
 static int gpio_mockup_to_irq(struct gpio_chip *gc, unsigned int offset)
-- 
2.19.1
