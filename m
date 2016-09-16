From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] gpio: tps65218: use devm_gpiochip_add_data() for gpio registration
Date: Fri, 16 Sep 2016 01:51:10 +0000
Message-ID: <1473990670-19979-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:34159 "EHLO
        mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755161AbcIPBvP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2016 21:51:15 -0400
Received: by mail-pa0-f65.google.com with SMTP id vz6so2806060pab.1
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2016 18:51:15 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

Use devm_gpiochip_add_data() for GPIO registration and remove the need
of driver callback .remove.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpio-tps65218.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-tps65218.c b/drivers/gpio/gpio-tps65218.c
index 03e0dfb..d779307 100644
--- a/drivers/gpio/gpio-tps65218.c
+++ b/drivers/gpio/gpio-tps65218.c
@@ -204,7 +204,8 @@ static int tps65218_gpio_probe(struct platform_device *pdev)
 	tps65218_gpio->gpio_chip.of_node = pdev->dev.of_node;
 #endif
 
-	ret = gpiochip_add_data(&tps65218_gpio->gpio_chip, tps65218_gpio);
+	ret = devm_gpiochip_add_data(&pdev->dev, &tps65218_gpio->gpio_chip,
+				     tps65218_gpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to register gpiochip, %d\n", ret);
 		return ret;
@@ -215,15 +216,6 @@ static int tps65218_gpio_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int tps65218_gpio_remove(struct platform_device *pdev)
-{
-	struct tps65218_gpio *tps65218_gpio = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&tps65218_gpio->gpio_chip);
-
-	return 0;
-}
-
 static const struct of_device_id tps65218_dt_match[] = {
 	{ .compatible = "ti,tps65218-gpio" },
 	{  }
@@ -242,7 +234,6 @@ static struct platform_driver tps65218_gpio_driver = {
 		.of_match_table = of_match_ptr(tps65218_dt_match)
 	},
 	.probe = tps65218_gpio_probe,
-	.remove = tps65218_gpio_remove,
 	.id_table = tps65218_gpio_id_table,
 };
 



