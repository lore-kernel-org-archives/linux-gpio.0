From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 3/8] gpio/mm-lantiq: Do not replicate code
Date: Sun, 18 Jan 2015 12:39:28 +0100
Message-ID: <1421581173-28416-4-git-send-email-ricardo.ribalda@gmail.com>
References: <1421581173-28416-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:40425 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751396AbbARLjy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Jan 2015 06:39:54 -0500
In-Reply-To: <1421581173-28416-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, John Crispin <blogic@openwrt.org>

Do not replicate code from of_mm_gpiochip_add.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: John Crispin <blogic@openwrt.org>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/gpio/gpio-mm-lantiq.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
index 7890163..7d55161 100644
--- a/drivers/gpio/gpio-mm-lantiq.c
+++ b/drivers/gpio/gpio-mm-lantiq.c
@@ -104,21 +104,14 @@ static void ltq_mm_save_regs(struct of_mm_gpio_chip *mm_gc)
 
 static int ltq_mm_probe(struct platform_device *pdev)
 {
-	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	struct ltq_mm *chip;
 	const __be32 *shadow;
 
-	if (!res) {
-		dev_err(&pdev->dev, "failed to get memory resource\n");
-		return -ENOENT;
-	}
-
 	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
 	chip->mmchip.gc.ngpio = 16;
-	chip->mmchip.gc.label = "gpio-mm-ltq";
 	chip->mmchip.gc.direction_output = ltq_mm_dir_out;
 	chip->mmchip.gc.set = ltq_mm_set;
 	chip->mmchip.save_regs = ltq_mm_save_regs;
-- 
2.1.4

