From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/2] pinctrl: at91: Use platform_register/unregister_drivers()
Date: Wed,  2 Dec 2015 17:31:55 +0100
Message-ID: <1449073915-12663-2-git-send-email-thierry.reding@gmail.com>
References: <1449073915-12663-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449073915-12663-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

These new helpers simplify implementing multi-driver modules and
properly handle failure to register one driver by unregistering all
previously registered drivers.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/pinctrl-at91.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 0d2fc0cff35e..47b625b1b789 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1828,20 +1828,20 @@ static struct platform_driver at91_pinctrl_driver = {
 	.remove = at91_pinctrl_remove,
 };
 
+static struct platform_driver * const drivers[] = {
+	&at91_gpio_driver,
+	&at91_pinctrl_driver,
+};
+
 static int __init at91_pinctrl_init(void)
 {
-	int ret;
-
-	ret = platform_driver_register(&at91_gpio_driver);
-	if (ret)
-		return ret;
-	return platform_driver_register(&at91_pinctrl_driver);
+	return platform_register_drivers(drivers, ARRAY_SIZE(drivers));
 }
 arch_initcall(at91_pinctrl_init);
 
 static void __exit at91_pinctrl_exit(void)
 {
-	platform_driver_unregister(&at91_pinctrl_driver);
+	platform_unregister_drivers(drivers, ARRAY_SIZE(drivers));
 }
 
 module_exit(at91_pinctrl_exit);
-- 
2.5.0
