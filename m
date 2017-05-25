From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 07/10] gpio: mockup: improve readability
Date: Thu, 25 May 2017 10:33:44 +0200
Message-ID: <1495701227-28809-8-git-send-email-brgl@bgdev.pl>
References: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

We currently shift bits here and there without actually explaining
what we're doing. Add some helper variables with names indicating
their purpose to improve the code readability.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index d771112..f6efa97 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -27,6 +27,11 @@
 
 #define GPIO_MOCKUP_NAME	"gpio-mockup"
 #define	GPIO_MOCKUP_MAX_GC	10
+/*
+ * We're storing two values per chip: the GPIO base and the number
+ * of GPIO lines.
+ */
+#define GPIO_MOCKUP_MAX_RANGES	(GPIO_MOCKUP_MAX_GC * 2)
 
 enum {
 	GPIO_MOCKUP_DIR_OUT = 0,
@@ -62,7 +67,7 @@ struct gpio_mockup_dbgfs_private {
 	int offset;
 };
 
-static int gpio_mockup_ranges[GPIO_MOCKUP_MAX_GC << 1];
+static int gpio_mockup_ranges[GPIO_MOCKUP_MAX_RANGES];
 static int gpio_mockup_params_nr;
 module_param_array(gpio_mockup_ranges, int, &gpio_mockup_params_nr, 0400);
 
@@ -341,23 +346,24 @@ static int gpio_mockup_add(struct device *dev,
 
 static int gpio_mockup_probe(struct platform_device *pdev)
 {
-	struct gpio_mockup_chip *chips;
+	int ret, i, base, ngpio, num_chips;
 	struct device *dev = &pdev->dev;
-	int ret, i, base, ngpio;
+	struct gpio_mockup_chip *chips;
 	char *chip_name;
 
 	if (gpio_mockup_params_nr < 2 || (gpio_mockup_params_nr % 2))
 		return -EINVAL;
 
-	chips = devm_kzalloc(dev,
-			     sizeof(*chips) * (gpio_mockup_params_nr >> 1),
-			     GFP_KERNEL);
+	/* Each chip is described by two values. */
+	num_chips = gpio_mockup_params_nr / 2;
+
+	chips = devm_kzalloc(dev, sizeof(*chips) * num_chips, GFP_KERNEL);
 	if (!chips)
 		return -ENOMEM;
 
 	platform_set_drvdata(pdev, chips);
 
-	for (i = 0; i < gpio_mockup_params_nr >> 1; i++) {
+	for (i = 0; i < num_chips; i++) {
 		base = gpio_mockup_ranges[i * 2];
 
 		if (base == -1)
-- 
2.9.3
