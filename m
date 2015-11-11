From: LABBE Corentin <clabbe.montjoie@gmail.com>
Subject: [PATCH 1/3] gpio: 74xx: fix a possible NULL dereference
Date: Wed, 11 Nov 2015 21:27:34 +0100
Message-ID: <1447273657-1668-1-git-send-email-clabbe.montjoie@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:36414 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752109AbbKKU1m (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2015 15:27:42 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: gnurou@gmail.com, linus.walleij@linaro.org
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

of_match_device could return NULL, and so cause a NULL pointer
dereference later at line 132:
priv->flags = (uintptr_t) of_id->data;

Reported-by: coverity (CID 1324141)
Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
---
 drivers/gpio/gpio-74xx-mmio.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
index 6ed7c0f..6b18682 100644
--- a/drivers/gpio/gpio-74xx-mmio.c
+++ b/drivers/gpio/gpio-74xx-mmio.c
@@ -113,13 +113,16 @@ static int mmio_74xx_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 
 static int mmio_74xx_gpio_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *of_id =
-		of_match_device(mmio_74xx_gpio_ids, &pdev->dev);
+	const struct of_device_id *of_id;
 	struct mmio_74xx_gpio_priv *priv;
 	struct resource *res;
 	void __iomem *dat;
 	int err;
 
+	of_id = of_match_device(mmio_74xx_gpio_ids, &pdev->dev);
+	if (!of_id)
+		return -ENODEV;
+
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
-- 
2.4.10

