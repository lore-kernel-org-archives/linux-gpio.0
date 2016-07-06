From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] pinctrl: imx21: Remove the MODULE_DEVICE_TABLE() macro
Date: Wed,  6 Jul 2016 10:25:17 -0300
Message-ID: <1467811517-20187-1-git-send-email-festevam@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:34654 "EHLO
	mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751669AbcGFNZp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2016 09:25:45 -0400
Received: by mail-qk0-f195.google.com with SMTP id 82so1285202qko.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jul 2016 06:25:45 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: paul.gortmaker@windriver.com, arnd@arndb.de, linux-gpio@vger.kernel.org, Fabio Estevam <festevam@gmail.com>

Commit e2756baa4217 ("pinctrl: imx21: make it explicitly non-modular")
missed the removal of the MODULE_DEVICE_TABLE() macro causing the
following build error:

drivers/pinctrl/freescale/pinctrl-imx21.c:328:1: error: data definition has no type or storage class [-Werror]
 MODULE_DEVICE_TABLE(of, imx21_pinctrl_of_match);

,so remove the macro to fix this problem.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx21.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx21.c b/drivers/pinctrl/freescale/pinctrl-imx21.c
index b9f9b3b..73e26bc 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx21.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx21.c
@@ -325,7 +325,6 @@ static const struct of_device_id imx21_pinctrl_of_match[] = {
 	{ .compatible = "fsl,imx21-iomuxc", },
 	{ }
 };
-MODULE_DEVICE_TABLE(of, imx21_pinctrl_of_match);
 
 static struct platform_driver imx21_pinctrl_driver = {
 	.driver	= {
-- 
1.9.1

