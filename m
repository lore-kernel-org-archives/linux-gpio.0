From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 18/18] gpio: mockup: add helpers for accessing the gpio ranges
Date: Mon, 27 Nov 2017 11:48:54 +0100
Message-ID: <20171127104854.333-19-brgl@bgdev.pl>
References: <20171127104854.333-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171127104854.333-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

In order to avoid repeating the calculations on every access - add
helpers for gpio base and ngpio components of the ranges array.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index a6bfbe58bc63..ea8c730d8af1 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -81,6 +81,16 @@ module_param_named(gpio_mockup_named_lines,
 
 static struct dentry *gpio_mockup_dbg_dir;
 
+static int gpio_mockup_range_base(unsigned int index)
+{
+	return gpio_mockup_ranges[index * 2];
+}
+
+static int gpio_mockup_range_ngpio(unsigned int index)
+{
+	return gpio_mockup_ranges[index * 2 + 1];
+}
+
 static int gpio_mockup_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
@@ -351,7 +361,7 @@ static int __init gpio_mockup_init(void)
 	 * always be greater than 0.
 	 */
 	for (i = 0; i < num_chips; i++) {
-		if (gpio_mockup_ranges[i * 2 + 1] < 0)
+		if (gpio_mockup_range_ngpio(i) < 0)
 			return -EINVAL;
 	}
 
@@ -367,10 +377,10 @@ static int __init gpio_mockup_init(void)
 
 	for (i = 0; i < num_chips; i++) {
 		pdata.index = index++;
-		pdata.base = gpio_mockup_ranges[i * 2];
+		pdata.base = gpio_mockup_range_base(i);
 		pdata.ngpio = pdata.base < 0
-				? gpio_mockup_ranges[i * 2 + 1]
-				: gpio_mockup_ranges[i * 2 + 1] - pdata.base;
+				? gpio_mockup_range_ngpio(i)
+				: gpio_mockup_range_ngpio(i) - pdata.base;
 		pdata.named_lines = gpio_mockup_named_lines;
 
 		pdev = platform_device_register_resndata(NULL,
-- 
2.15.0
