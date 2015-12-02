From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/2] pinctrl: adi2: Use platform_register/unregister_drivers()
Date: Wed,  2 Dec 2015 17:31:54 +0100
Message-ID: <1449073915-12663-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:34287 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932853AbbLBQb5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Dec 2015 11:31:57 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

These new helpers simplify implementing multi-driver modules and
properly handle failure to register one driver by unregistering all
previously registered drivers.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/pinctrl-adi2.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-adi2.c b/drivers/pinctrl/pinctrl-adi2.c
index fd342dffe4dc..8e9e8eab59ba 100644
--- a/drivers/pinctrl/pinctrl-adi2.c
+++ b/drivers/pinctrl/pinctrl-adi2.c
@@ -1102,32 +1102,24 @@ static struct platform_driver adi_gpio_driver = {
 	},
 };
 
+static struct platform_driver * const drivers[] = {
+	&adi_pinctrl_driver,
+	&adi_gpio_pint_driver,
+	&adi_gpio_driver,
+};
+
 static int __init adi_pinctrl_setup(void)
 {
 	int ret;
 
-	ret = platform_driver_register(&adi_pinctrl_driver);
+	ret = platform_register_drivers(drivers, ARRAY_SIZE(drivers));
 	if (ret)
 		return ret;
 
-	ret = platform_driver_register(&adi_gpio_pint_driver);
-	if (ret)
-		goto pint_error;
-
-	ret = platform_driver_register(&adi_gpio_driver);
-	if (ret)
-		goto gpio_error;
-
 #ifdef CONFIG_PM
 	register_syscore_ops(&gpio_pm_syscore_ops);
 #endif
-	return ret;
-gpio_error:
-	platform_driver_unregister(&adi_gpio_pint_driver);
-pint_error:
-	platform_driver_unregister(&adi_pinctrl_driver);
-
-	return ret;
+	return 0;
 }
 arch_initcall(adi_pinctrl_setup);
 
-- 
2.5.0

