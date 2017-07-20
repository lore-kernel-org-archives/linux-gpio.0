From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH v2 2/3] gpio: davinci: Handle the return value of davinci_gpio_irq_setup function
Date: Thu, 20 Jul 2017 15:12:17 +0530
Message-ID: <1500543738-9696-3-git-send-email-j-keerthy@ti.com>
References: <1500543738-9696-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:56411 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964987AbdGTJnh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2017 05:43:37 -0400
In-Reply-To: <1500543738-9696-1-git-send-email-j-keerthy@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: t-kristo@ti.com, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, fcooper@ti.com, s-anna@ti.com, nsekhar@ti.com, j-keerthy@ti.com

Currently davinci_gpio_irq_setup return value is ignored. Handle the
return value appropriately.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 drivers/gpio/gpio-davinci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 27499ec..d6fb1ce 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -237,7 +237,10 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 		goto err;
 
 	platform_set_drvdata(pdev, chips);
-	davinci_gpio_irq_setup(pdev);
+	ret = davinci_gpio_irq_setup(pdev);
+	if (ret)
+		goto err;
+
 	return 0;
 
 err:
-- 
1.9.1

