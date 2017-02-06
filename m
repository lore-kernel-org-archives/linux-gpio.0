From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 3/7] gpio: mockup: implement naming the lines
Date: Mon,  6 Feb 2017 13:10:37 +0100
Message-ID: <1486383041-16758-4-git-send-email-bgolaszewski@baylibre.com>
References: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

In order to allow testing line lookup by name from user space, add
a new boolean parameter that indicates whether we want the lines to
be named. The name is created by concatenating the chip name and the
line offset value.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index d425601..0ce9acc3 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #define GPIO_MOCKUP_NAME	"gpio-mockup"
 #define	GPIO_MOCKUP_MAX_GC	10
@@ -43,6 +44,10 @@ static int gpio_mockup_ranges[GPIO_MOCKUP_MAX_GC << 1];
 static int gpio_mockup_params_nr;
 module_param_array(gpio_mockup_ranges, int, &gpio_mockup_params_nr, 0400);
 
+static bool gpio_mockup_named_lines;
+module_param_named(gpio_mockup_named_lines,
+		   gpio_mockup_named_lines, bool, 0400);
+
 static const char gpio_mockup_name_start = 'A';
 
 static int gpio_mockup_get(struct gpio_chip *gc, unsigned int offset)
@@ -87,11 +92,35 @@ static int gpio_mockup_get_direction(struct gpio_chip *gc, unsigned int offset)
 	return chip->lines[offset].dir;
 }
 
+static int gpio_mockup_name_lines(struct device *dev,
+				  struct gpio_mockup_chip *chip)
+{
+	struct gpio_chip *gc = &chip->gc;
+	char **names;
+	int i;
+
+	names = devm_kzalloc(dev, sizeof(char *) * gc->ngpio, GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	for (i = 0; i < gc->ngpio; i++) {
+		names[i] = devm_kasprintf(dev, GFP_KERNEL,
+					  "%s-%d", gc->label, i);
+		if (!names[i])
+			return -ENOMEM;
+	}
+
+	gc->names = (const char *const *)names;
+
+	return 0;
+}
+
 static int gpio_mockup_add(struct device *dev,
 			   struct gpio_mockup_chip *chip,
 			   const char *name, int base, int ngpio)
 {
 	struct gpio_chip *gc = &chip->gc;
+	int ret;
 
 	gc->base = base;
 	gc->ngpio = ngpio;
@@ -109,6 +138,12 @@ static int gpio_mockup_add(struct device *dev,
 	if (!chip->lines)
 		return -ENOMEM;
 
+	if (gpio_mockup_named_lines) {
+		ret = gpio_mockup_name_lines(dev, chip);
+		if (ret)
+			return ret;
+	}
+
 	return devm_gpiochip_add_data(dev, &chip->gc, chip);
 }
 
-- 
2.9.3
