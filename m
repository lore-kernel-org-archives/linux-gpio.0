From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] gpio: lp873x: Use devm_gpiochip_add_data() for gpio registration
Date: Sat, 10 Sep 2016 12:04:42 +0000
Message-ID: <1473509082-3996-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:34766 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751219AbcIJMEs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Sep 2016 08:04:48 -0400
Received: by mail-pf0-f195.google.com with SMTP id g202so5381977pfb.1
        for <linux-gpio@vger.kernel.org>; Sat, 10 Sep 2016 05:04:48 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Keerthy <j-keerthy@ti.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

Use devm_gpiochip_add_data() for GPIO registration and remove the need
of driver callback .remove.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpio-lp873x.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-lp873x.c b/drivers/gpio/gpio-lp873x.c
index f10d49d..2386b0f 100644
--- a/drivers/gpio/gpio-lp873x.c
+++ b/drivers/gpio/gpio-lp873x.c
@@ -154,7 +154,7 @@ static int lp873x_gpio_probe(struct platform_device *pdev)
 	gpio->chip = template_chip;
 	gpio->chip.parent = gpio->lp873->dev;
 
-	ret = gpiochip_add_data(&gpio->chip, gpio);
+	ret = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
 		return ret;
@@ -163,15 +163,6 @@ static int lp873x_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int lp873x_gpio_remove(struct platform_device *pdev)
-{
-	struct lp873x_gpio *gpio = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&gpio->chip);
-
-	return 0;
-}
-
 static const struct platform_device_id lp873x_gpio_id_table[] = {
 	{ "lp873x-gpio", },
 	{ /* sentinel */ }
@@ -183,7 +174,6 @@ static struct platform_driver lp873x_gpio_driver = {
 		.name = "lp873x-gpio",
 	},
 	.probe = lp873x_gpio_probe,
-	.remove = lp873x_gpio_remove,
 	.id_table = lp873x_gpio_id_table,
 };
 module_platform_driver(lp873x_gpio_driver);

