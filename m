From: Nizam Haider <nizamhaider786@gmail.com>
Subject: [PATCH] Gpio: use dev_get_platdata()
Date: Mon, 23 Nov 2015 20:53:18 +0530
Message-ID: <1448292198-6798-1-git-send-email-nizamhaider786@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f68.google.com ([209.85.220.68]:32769 "EHLO
	mail-pa0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754643AbbKWPXp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2015 10:23:45 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: albeu@free.fr, linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Nizam Haider <nizamhaider786@gmail.com>, Nizam Haider <nijamh@cdac.in>

Use the wrapper function for retrieving the platform data instead of
accessing dev->platform_data directly.

Signed-off-by: Nizam Haider <nijamh@cdac.in>
---
 drivers/gpio/gpio-ath79.c   | 2 +-
 drivers/gpio/gpio-davinci.c | 2 +-
 drivers/gpio/gpio-f7188x.c  | 2 +-
 drivers/gpio/gpio-octeon.c  | 2 +-
 drivers/gpio/gpio-sch311x.c | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index e5827a5..4c687c9 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -138,7 +138,7 @@ static const struct of_device_id ath79_gpio_of_match[] = {
 
 static int ath79_gpio_probe(struct platform_device *pdev)
 {
-	struct ath79_gpio_platform_data *pdata = pdev->dev.platform_data;
+	struct ath79_gpio_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct device_node *np = pdev->dev.of_node;
 	struct ath79_gpio_ctrl *ctrl;
 	struct resource *res;
diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 5e71538..c2c87ba 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -149,7 +149,7 @@ davinci_gpio_get_pdata(struct platform_device *pdev)
 	u32 val;
 
 	if (!IS_ENABLED(CONFIG_OF) || !pdev->dev.of_node)
-		return pdev->dev.platform_data;
+		return dev_get_platdata(&pdev->dev);
 
 	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index 5e3c4fa..1917bb8 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -298,7 +298,7 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
 {
 	int err;
 	int i;
-	struct f7188x_sio *sio = pdev->dev.platform_data;
+	struct f7188x_sio *sio = dev_get_platdata(&pdev->dev);
 	struct f7188x_gpio_data *data;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
diff --git a/drivers/gpio/gpio-octeon.c b/drivers/gpio/gpio-octeon.c
index 62ae251..1251a04 100644
--- a/drivers/gpio/gpio-octeon.c
+++ b/drivers/gpio/gpio-octeon.c
@@ -128,7 +128,7 @@ out:
 
 static int octeon_gpio_remove(struct platform_device *pdev)
 {
-	struct gpio_chip *chip = pdev->dev.platform_data;
+	struct gpio_chip *chip = dev_get_platdata(&pdev->dev);
 	gpiochip_remove(chip);
 	return 0;
 }
diff --git a/drivers/gpio/gpio-sch311x.c b/drivers/gpio/gpio-sch311x.c
index 0cb1141..da1f14f 100644
--- a/drivers/gpio/gpio-sch311x.c
+++ b/drivers/gpio/gpio-sch311x.c
@@ -229,7 +229,7 @@ static int sch311x_gpio_direction_out(struct gpio_chip *chip, unsigned offset,
 
 static int sch311x_gpio_probe(struct platform_device *pdev)
 {
-	struct sch311x_pdev_data *pdata = pdev->dev.platform_data;
+	struct sch311x_pdev_data *pdata = dev_get_platdata(&pdev->dev);
 	struct sch311x_gpio_priv *priv;
 	struct sch311x_gpio_block *block;
 	int err, i;
@@ -289,7 +289,7 @@ exit_err:
 
 static int sch311x_gpio_remove(struct platform_device *pdev)
 {
-	struct sch311x_pdev_data *pdata = pdev->dev.platform_data;
+	struct sch311x_pdev_data *pdata = dev_get_platdata(&pdev->dev);
 	struct sch311x_gpio_priv *priv = platform_get_drvdata(pdev);
 	int i;
 
-- 
1.8.1.4

