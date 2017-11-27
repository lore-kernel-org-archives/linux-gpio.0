From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 15/18] gpio: mockup: implement gpio_mockup_set_multiple()
Date: Mon, 27 Nov 2017 11:48:51 +0100
Message-ID: <20171127104854.333-16-brgl@bgdev.pl>
References: <20171127104854.333-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171127104854.333-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Implement the set_multiple() callback and register it with the gpiolib
framework. This is only meant to also test the internal kernel API.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index dfb9ee03a2f0..cbc823e43151 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -96,6 +96,16 @@ static void gpio_mockup_set(struct gpio_chip *gc,
 	chip->lines[offset].value = !!value;
 }
 
+static void gpio_mockup_set_multiple(struct gpio_chip *gc,
+				     unsigned long *mask, unsigned long *bits)
+{
+	unsigned int bit;
+
+	for_each_set_bit(bit, mask, gc->ngpio)
+		gpio_mockup_set(gc, bit, test_bit(bit, bits));
+
+}
+
 static int gpio_mockup_dirout(struct gpio_chip *gc,
 			      unsigned int offset, int value)
 {
@@ -269,6 +279,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	gc->parent = dev;
 	gc->get = gpio_mockup_get;
 	gc->set = gpio_mockup_set;
+	gc->set_multiple = gpio_mockup_set_multiple;
 	gc->direction_output = gpio_mockup_dirout;
 	gc->direction_input = gpio_mockup_dirin;
 	gc->get_direction = gpio_mockup_get_direction;
-- 
2.15.0
