From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 3/3] gpio: mockup: coding style fixes
Date: Tue, 20 Dec 2016 12:28:20 +0100
Message-ID: <1482233300-20078-4-git-send-email-bgolaszewski@baylibre.com>
References: <1482233300-20078-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wj0-f177.google.com ([209.85.210.177]:34654 "EHLO
        mail-wj0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762017AbcLTL2h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Dec 2016 06:28:37 -0500
Received: by mail-wj0-f177.google.com with SMTP id tg4so175001888wjb.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Dec 2016 03:28:36 -0800 (PST)
In-Reply-To: <1482233300-20078-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>

Fix whitespace errors and arrange local variables for better
readability.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 10f6bf6..82a9efd 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -120,12 +120,9 @@ static int mockup_gpio_add(struct device *dev,
 
 static int mockup_gpio_probe(struct platform_device *pdev)
 {
-	struct device *dev = &pdev->dev;
 	struct mockup_gpio_controller *cntr;
-	int ret;
-	int i;
-	int base;
-	int ngpio;
+	struct device *dev = &pdev->dev;
+	int ret, i, base, ngpio;
 	char *chip_name;
 
 	if (gpio_mockup_params_nr < 2)
@@ -174,8 +171,8 @@ static int mockup_gpio_probe(struct platform_device *pdev)
 
 static struct platform_driver mockup_gpio_driver = {
 	.driver = {
-		   .name = GPIO_NAME,
-		   },
+		.name = GPIO_NAME,
+	},
 	.probe = mockup_gpio_probe,
 };
 
-- 
2.9.3

