From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: ath79: Check valid gpio count for both DT and non-DT
 cases
Date: Sat, 20 Feb 2016 09:48:07 +0800
Message-ID: <1455932887.31674.0.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:35055 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1424899AbcBTBsM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2016 20:48:12 -0500
Received: by mail-pa0-f46.google.com with SMTP id ho8so60743381pac.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 Feb 2016 17:48:12 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alban Bedel <albeu@free.fr>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Move the code checking valid gpio count to cover both DT and non-DT cases.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-ath79.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 018ea9d..c4f4cdd 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -240,10 +240,6 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "ngpios property is not valid\n");
 			return err;
 		}
-		if (ath79_gpio_count >= 32) {
-			dev_err(&pdev->dev, "ngpios must be less than 32\n");
-			return -EINVAL;
-		}
 		oe_inverted = of_device_is_compatible(np, "qca,ar9340-gpio");
 	} else if (pdata) {
 		ath79_gpio_count = pdata->ngpios;
@@ -253,6 +249,11 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	if (ath79_gpio_count >= 32) {
+		dev_err(&pdev->dev, "ngpios must be less than 32\n");
+		return -EINVAL;
+	}
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	ctrl->base = devm_ioremap_nocache(
 		&pdev->dev, res->start, resource_size(res));
-- 
2.1.4



