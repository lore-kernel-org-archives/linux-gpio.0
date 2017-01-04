From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 1/2] gpio: davinci: Remove redundant members davinci_gpio_controller stuct
Date: Wed, 4 Jan 2017 13:56:28 +0530
Message-ID: <1483518389-6200-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:15654 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964919AbdADI24 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Jan 2017 03:28:56 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, j-keerthy@ti.com, linux-gpio@vger.kernel.org, gnurou@gmail.com, t-kristo@ti.com

davinci_gpio_controller struct has set_data, in_data, clr_data
members that are assigned and never used.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 drivers/gpio/gpio-davinci.c                | 3 ---
 include/linux/platform_data/gpio-davinci.h | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 9191056..163f81e 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -266,9 +266,6 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 		if (!regs)
 			return -ENXIO;
 		chips[i].regs = regs;
-		chips[i].set_data = &regs->set_data;
-		chips[i].clr_data = &regs->clr_data;
-		chips[i].in_data = &regs->in_data;
 
 		gpiochip_add_data(&chips[i].chip, &chips[i]);
 	}
diff --git a/include/linux/platform_data/gpio-davinci.h b/include/linux/platform_data/gpio-davinci.h
index 6ace3fd..44ca530 100644
--- a/include/linux/platform_data/gpio-davinci.h
+++ b/include/linux/platform_data/gpio-davinci.h
@@ -33,9 +33,6 @@ struct davinci_gpio_controller {
 	/* Serialize access to GPIO registers */
 	spinlock_t		lock;
 	void __iomem		*regs;
-	void __iomem		*set_data;
-	void __iomem		*clr_data;
-	void __iomem		*in_data;
 	int			gpio_unbanked;
 	unsigned		gpio_irq;
 };
-- 
1.9.1

