From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 8/8] gpio: mockup: use devm_kcalloc() where applicable
Date: Fri,  9 Jun 2017 13:41:32 +0200
Message-ID: <1497008492-14907-9-git-send-email-brgl@bgdev.pl>
References: <1497008492-14907-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497008492-14907-1-git-send-email-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

When allocating a zeroed array of objects use devm_kcalloc() instead
of manually calculating the required size and using devm_kzalloc().

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 536a229..a6565e1 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -128,7 +128,7 @@ static int gpio_mockup_name_lines(struct device *dev,
 	char **names;
 	int i;
 
-	names = devm_kzalloc(dev, sizeof(char *) * gc->ngpio, GFP_KERNEL);
+	names = devm_kcalloc(dev, gc->ngpio, sizeof(char *), GFP_KERNEL);
 	if (!names)
 		return -ENOMEM;
 
@@ -308,8 +308,8 @@ static int gpio_mockup_add(struct device *dev,
 	gc->get_direction = gpio_mockup_get_direction;
 	gc->to_irq = gpio_mockup_to_irq;
 
-	chip->lines = devm_kzalloc(dev, sizeof(*chip->lines) * gc->ngpio,
-				   GFP_KERNEL);
+	chip->lines = devm_kcalloc(dev, gc->ngpio,
+				   sizeof(*chip->lines), GFP_KERNEL);
 	if (!chip->lines)
 		return -ENOMEM;
 
@@ -346,7 +346,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	/* Each chip is described by two values. */
 	num_chips = gpio_mockup_params_nr / 2;
 
-	chips = devm_kzalloc(dev, sizeof(*chips) * num_chips, GFP_KERNEL);
+	chips = devm_kcalloc(dev, num_chips, sizeof(*chips), GFP_KERNEL);
 	if (!chips)
 		return -ENOMEM;
 
-- 
2.9.3
