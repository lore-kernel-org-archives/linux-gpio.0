From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpio: mockup: use devm_kcalloc() where applicable
Date: Thu,  1 Jun 2017 13:47:03 +0200
Message-ID: <1496317623-24026-2-git-send-email-brgl@bgdev.pl>
References: <1496317623-24026-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:35603 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751054AbdFALrL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2017 07:47:11 -0400
Received: by mail-wm0-f46.google.com with SMTP id b84so155286462wmh.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jun 2017 04:47:10 -0700 (PDT)
In-Reply-To: <1496317623-24026-1-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

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

