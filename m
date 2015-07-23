From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 5/5] pinctrl: nomadik: depromote GPIO to subsystem_init()
Date: Thu, 23 Jul 2015 09:10:00 +0200
Message-ID: <1437635400-23509-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:34900 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751173AbbGWHKG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2015 03:10:06 -0400
Received: by lblf12 with SMTP id f12so151309807lbl.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2015 00:10:05 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

We no longer have to do GPIO initialization before the
pinctrl initialization, instead we can initialize the pinctrl
portions of the driver first and then the GPIO. Thus we can
move GPIO initialization to a subsystem_initcall(), but
not yet to a device_initcall().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 3f53213cf89e..45c077fbe124 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -2104,15 +2104,15 @@ static struct platform_driver nmk_pinctrl_driver = {
 
 static int __init nmk_gpio_init(void)
 {
-	int ret;
+	return platform_driver_register(&nmk_gpio_driver);
+}
+subsys_initcall(nmk_gpio_init);
 
-	ret = platform_driver_register(&nmk_gpio_driver);
-	if (ret)
-		return ret;
+static int __init nmk_pinctrl_init(void)
+{
 	return platform_driver_register(&nmk_pinctrl_driver);
 }
-
-core_initcall(nmk_gpio_init);
+core_initcall(nmk_pinctrl_init);
 
 MODULE_AUTHOR("Prafulla WADASKAR and Alessandro Rubini");
 MODULE_DESCRIPTION("Nomadik GPIO Driver");
-- 
2.4.3

