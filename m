From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: sx150x: fixup OF support
Date: Thu, 22 Jan 2015 09:47:01 +0100
Message-ID: <1421916421-11716-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:48801 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752033AbbAVIrI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Jan 2015 03:47:08 -0500
Received: by mail-lb0-f176.google.com with SMTP id z12so325766lbi.7
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2015 00:47:07 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Wei Chen <Wei.Chen@csr.com>

Make OF conditional on CONFIG_OF_GPIO, rename and register
the match table.

Reported-by: Mike Krinkin <krinkin.m.u@gmail.com>
Cc: Wei Chen <Wei.Chen@csr.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-sx150x.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index 88012e2b5b15..458d9d7952b8 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -152,12 +152,13 @@ static const struct i2c_device_id sx150x_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, sx150x_id);
 
-static const struct of_device_id sx150x_dt_id[] = {
+static const struct of_device_id sx150x_of_match[] = {
 	{ .compatible = "semtech,sx1508q" },
 	{ .compatible = "semtech,sx1509q" },
 	{ .compatible = "semtech,sx1506q" },
 	{},
 };
+MODULE_DEVICE_TABLE(of, sx150x_of_match);
 
 static s32 sx150x_i2c_write(struct i2c_client *client, u8 reg, u8 val)
 {
@@ -484,8 +485,10 @@ static void sx150x_init_chip(struct sx150x_chip *chip,
 	chip->gpio_chip.base             = pdata->gpio_base;
 	chip->gpio_chip.can_sleep        = true;
 	chip->gpio_chip.ngpio            = chip->dev_cfg->ngpios;
+#ifdef CONFIG_OF_GPIO
 	chip->gpio_chip.of_node          = client->dev.of_node;
 	chip->gpio_chip.of_gpio_n_cells  = 2;
+#endif
 	if (pdata->oscio_is_gpo)
 		++chip->gpio_chip.ngpio;
 
@@ -681,7 +684,7 @@ static struct i2c_driver sx150x_driver = {
 	.driver = {
 		.name = "sx150x",
 		.owner = THIS_MODULE,
-		.of_match_table = of_match_ptr(sx150x_dt_id),
+		.of_match_table = of_match_ptr(sx150x_of_match),
 	},
 	.probe    = sx150x_probe,
 	.remove   = sx150x_remove,
-- 
1.9.3

