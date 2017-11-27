From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 11/18] gpio: mockup: group code by logic
Date: Mon, 27 Nov 2017 11:48:47 +0100
Message-ID: <20171127104854.333-12-brgl@bgdev.pl>
References: <20171127104854.333-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171127104854.333-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Keep GPIO chip callbacks, event trigger callbacks and mockup chip
setup code visibly separated. We're mostly good - just need to move
the line naming routine below.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 46 +++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 8a61328a255d..dba5e79e3278 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -123,29 +123,6 @@ static int gpio_mockup_get_direction(struct gpio_chip *gc, unsigned int offset)
 	return chip->lines[offset].dir;
 }
 
-static int gpio_mockup_name_lines(struct device *dev,
-				  struct gpio_mockup_chip *chip)
-{
-	struct gpio_chip *gc = &chip->gc;
-	char **names;
-	int i;
-
-	names = devm_kcalloc(dev, gc->ngpio, sizeof(char *), GFP_KERNEL);
-	if (!names)
-		return -ENOMEM;
-
-	for (i = 0; i < gc->ngpio; i++) {
-		names[i] = devm_kasprintf(dev, GFP_KERNEL,
-					  "%s-%d", gc->label, i);
-		if (!names[i])
-			return -ENOMEM;
-	}
-
-	gc->names = (const char *const *)names;
-
-	return 0;
-}
-
 static int gpio_mockup_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
@@ -238,6 +215,29 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 	dev_err(dev, "error creating debugfs directory\n");
 }
 
+static int gpio_mockup_name_lines(struct device *dev,
+				  struct gpio_mockup_chip *chip)
+{
+	struct gpio_chip *gc = &chip->gc;
+	char **names;
+	int i;
+
+	names = devm_kcalloc(dev, gc->ngpio, sizeof(char *), GFP_KERNEL);
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
 static int gpio_mockup_probe(struct platform_device *pdev)
 {
 	struct gpio_mockup_platform_data *pdata;
-- 
2.15.0
