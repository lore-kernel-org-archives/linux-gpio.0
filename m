From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 14/18] gpio: mockup: tweak line breaks
Date: Mon, 27 Nov 2017 11:48:50 +0100
Message-ID: <20171127104854.333-15-brgl@bgdev.pl>
References: <20171127104854.333-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171127104854.333-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Minor readability tweak: prefer breaking the lines in a way where the
second part is longer than the first.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 532f5807390b..dfb9ee03a2f0 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -88,16 +88,16 @@ static int gpio_mockup_get(struct gpio_chip *gc, unsigned int offset)
 	return chip->lines[offset].value;
 }
 
-static void gpio_mockup_set(struct gpio_chip *gc, unsigned int offset,
-			    int value)
+static void gpio_mockup_set(struct gpio_chip *gc,
+			    unsigned int offset, int value)
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
 	chip->lines[offset].value = !!value;
 }
 
-static int gpio_mockup_dirout(struct gpio_chip *gc, unsigned int offset,
-			      int value)
+static int gpio_mockup_dirout(struct gpio_chip *gc,
+			      unsigned int offset, int value)
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
-- 
2.15.0
