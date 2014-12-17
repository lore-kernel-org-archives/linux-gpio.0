From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v5 7/7] gpio/xilinx: Use of_mm_gpiochip_remove
Date: Wed, 17 Dec 2014 16:51:14 +0100
Message-ID: <1418831474-24428-8-git-send-email-ricardo.ribalda@gmail.com>
References: <1418831474-24428-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:42164 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751427AbaLQPvY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Dec 2014 10:51:24 -0500
In-Reply-To: <1418831474-24428-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Use the newly created of_mm_gpiochip_remove function for cleaning up
of_mm_gpiochip_add

Suggested-by: Alexandre Courbot <gnurou@gmail.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/gpio/gpio-xilinx.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index e89fb42..61243d1 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -236,10 +236,7 @@ static int xgpio_remove(struct platform_device *pdev)
 {
 	struct xgpio_instance *chip = platform_get_drvdata(pdev);
 
-	gpiochip_remove(&chip->mmchip.gc);
-
-	iounmap(chip->mmchip.regs);
-	kfree(chip->mmchip.gc.label);
+	of_mm_gpiochip_remove(&chip->mmchip);
 
 	return 0;
 }
-- 
2.1.3

