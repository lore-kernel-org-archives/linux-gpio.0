From: thor.thayer@linux.intel.com
Subject: [PATCH] gpio: altera-a10sr: Set gpio_chip parent property
Date: Mon, 13 Feb 2017 13:49:58 -0600
Message-ID: <1487015398-4603-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:64536 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751476AbdBMTrh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Feb 2017 14:47:37 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: thor.thayer@linux.intel.com, linux-gpio@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Set the gpio_chip parent property since some recent functions
such as devprop_gpiochip_set_names() can use it.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 drivers/gpio/gpio-altera-a10sr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-altera-a10sr.c b/drivers/gpio/gpio-altera-a10sr.c
index 9e1a138..16a8951 100644
--- a/drivers/gpio/gpio-altera-a10sr.c
+++ b/drivers/gpio/gpio-altera-a10sr.c
@@ -96,7 +96,7 @@ static int altr_a10sr_gpio_probe(struct platform_device *pdev)
 	gpio->regmap = a10sr->regmap;
 
 	gpio->gp = altr_a10sr_gc;
-
+	gpio->gp.parent = pdev->dev.parent;
 	gpio->gp.of_node = pdev->dev.of_node;
 
 	ret = devm_gpiochip_add_data(&pdev->dev, &gpio->gp, gpio);
-- 
1.9.1

