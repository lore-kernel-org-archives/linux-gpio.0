From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH 2/4] gpio: pxa: convert to devm_ioremap
Date: Sat, 28 Nov 2015 22:37:43 +0100
Message-ID: <1448746665-13422-3-git-send-email-robert.jarzmik@free.fr>
References: <1448746665-13422-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:46830 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750746AbbK1Vln (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Nov 2015 16:41:43 -0500
In-Reply-To: <1448746665-13422-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Mack <zonque@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>

Use the device managed ioremap to simplify the probe function.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/gpio/gpio-pxa.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index de2cfbeccaa1..8558abf98204 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -614,9 +614,8 @@ static int pxa_gpio_probe(struct platform_device *pdev)
 		|| (irq_mux <= 0))
 		return -EINVAL;
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EINVAL;
-	gpio_reg_base = ioremap(res->start, resource_size(res));
+	gpio_reg_base = devm_ioremap(&pdev->dev, res->start,
+				     resource_size(res));
 	if (!gpio_reg_base)
 		return -EINVAL;
 
@@ -627,13 +626,11 @@ static int pxa_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "Error %ld to get gpio clock\n",
 			PTR_ERR(clk));
-		iounmap(gpio_reg_base);
 		return PTR_ERR(clk);
 	}
 	ret = clk_prepare_enable(clk);
 	if (ret) {
 		clk_put(clk);
-		iounmap(gpio_reg_base);
 		return ret;
 	}
 
-- 
2.1.4

