From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH v2 3/3] gpio: davinci: Convert prinkt to dev_err
Date: Thu, 20 Jul 2017 15:12:18 +0530
Message-ID: <1500543738-9696-4-git-send-email-j-keerthy@ti.com>
References: <1500543738-9696-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:25601 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933027AbdGTJnP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2017 05:43:15 -0400
In-Reply-To: <1500543738-9696-1-git-send-email-j-keerthy@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: t-kristo@ti.com, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, fcooper@ti.com, s-anna@ti.com, nsekhar@ti.com, j-keerthy@ti.com

In case of devm_clk_get failure use dev_err instead of printk

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 drivers/gpio/gpio-davinci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index d6fb1ce..f75d844 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -490,8 +490,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 
 	clk = devm_clk_get(dev, "gpio");
 	if (IS_ERR(clk)) {
-		printk(KERN_ERR "Error %ld getting gpio clock?\n",
-		       PTR_ERR(clk));
+		dev_err(dev, "Error %ld getting gpio clock\n", PTR_ERR(clk));
 		return PTR_ERR(clk);
 	}
 	ret = clk_prepare_enable(clk);
-- 
1.9.1

