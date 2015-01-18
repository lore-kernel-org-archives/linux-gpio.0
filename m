From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 2/8] gpio/-mm-lantiq: Use devm_kzalloc
Date: Sun, 18 Jan 2015 12:39:27 +0100
Message-ID: <1421581173-28416-3-git-send-email-ricardo.ribalda@gmail.com>
References: <1421581173-28416-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421581173-28416-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, John Crispin <blogic@openwrt.org>
List-Id: linux-gpio@vger.kernel.org

Replace kzalloc with the device managed devm_kzalloc

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: John Crispin <blogic@openwrt.org>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/gpio/gpio-mm-lantiq.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
index f228b1c..7890163 100644
--- a/drivers/gpio/gpio-mm-lantiq.c
+++ b/drivers/gpio/gpio-mm-lantiq.c
@@ -107,14 +107,13 @@ static int ltq_mm_probe(struct platform_device *pdev)
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	struct ltq_mm *chip;
 	const __be32 *shadow;
-	int ret = 0;
 
 	if (!res) {
 		dev_err(&pdev->dev, "failed to get memory resource\n");
 		return -ENOENT;
 	}
 
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
+	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
@@ -129,10 +128,7 @@ static int ltq_mm_probe(struct platform_device *pdev)
 	if (shadow)
 		chip->shadow = be32_to_cpu(*shadow);
 
-	ret = of_mm_gpiochip_add(pdev->dev.of_node, &chip->mmchip);
-	if (ret)
-		kfree(chip);
-	return ret;
+	return of_mm_gpiochip_add(pdev->dev.of_node, &chip->mmchip);
 }
 
 static const struct of_device_id ltq_mm_match[] = {
-- 
2.1.4
