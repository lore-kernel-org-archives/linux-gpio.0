From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] gpio: altera-a10sr: Drop unnecessary gpiochip_remove
Date: Mon, 24 Oct 2016 14:49:13 +0000
Message-ID: <1477320553-4676-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33885 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753513AbcJXOtb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2016 10:49:31 -0400
Received: by mail-pf0-f196.google.com with SMTP id 128so16818281pfz.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2016 07:49:30 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thor Thayer <tthayer@opensource.altera.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

It's not necessary to unregister gpio_chip which registered
with devm_gpiochip_add_data().
Also get rid of useless altr_a10sr_gpio_remove().

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpio-altera-a10sr.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpio/gpio-altera-a10sr.c b/drivers/gpio/gpio-altera-a10sr.c
index 8274f98..9e1a138 100644
--- a/drivers/gpio/gpio-altera-a10sr.c
+++ b/drivers/gpio/gpio-altera-a10sr.c
@@ -110,15 +110,6 @@ static int altr_a10sr_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int altr_a10sr_gpio_remove(struct platform_device *pdev)
-{
-	struct altr_a10sr_gpio *gpio = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&gpio->gp);
-
-	return 0;
-}
-
 static const struct of_device_id altr_a10sr_gpio_of_match[] = {
 	{ .compatible = "altr,a10sr-gpio" },
 	{ },
@@ -127,7 +118,6 @@ MODULE_DEVICE_TABLE(of, altr_a10sr_gpio_of_match);
 
 static struct platform_driver altr_a10sr_gpio_driver = {
 	.probe = altr_a10sr_gpio_probe,
-	.remove = altr_a10sr_gpio_remove,
 	.driver = {
 		.name	= "altr_a10sr_gpio",
 		.of_match_table = of_match_ptr(altr_a10sr_gpio_of_match),

