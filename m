From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] gpio: mpc5200: Use platform_register/unregister_drivers()
Date: Wed,  2 Dec 2015 17:19:55 +0100
Message-ID: <1449073195-11054-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

These new helpers simplify implementing multi-driver modules and
properly handle failure to register one driver by unregistering all
previously registered drivers.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-mpc5200.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-mpc5200.c b/drivers/gpio/gpio-mpc5200.c
index 4c542153e923..044bbbb747f2 100644
--- a/drivers/gpio/gpio-mpc5200.c
+++ b/drivers/gpio/gpio-mpc5200.c
@@ -360,15 +360,14 @@ static struct platform_driver mpc52xx_simple_gpiochip_driver = {
 	.remove = mpc52xx_gpiochip_remove,
 };
 
+static struct platform_driver * const drivers[] = {
+	&mpc52xx_wkup_gpiochip_driver,
+	&mpc52xx_simple_gpiochip_driver,
+};
+
 static int __init mpc52xx_gpio_init(void)
 {
-	if (platform_driver_register(&mpc52xx_wkup_gpiochip_driver))
-		printk(KERN_ERR "Unable to register wakeup GPIO driver\n");
-
-	if (platform_driver_register(&mpc52xx_simple_gpiochip_driver))
-		printk(KERN_ERR "Unable to register simple GPIO driver\n");
-
-	return 0;
+	return platform_register_drivers(drivers, ARRAY_SIZE(drivers));
 }
 
 /* Make sure we get initialised before anyone else tries to use us */
@@ -376,9 +375,7 @@ subsys_initcall(mpc52xx_gpio_init);
 
 static void __exit mpc52xx_gpio_exit(void)
 {
-	platform_driver_unregister(&mpc52xx_wkup_gpiochip_driver);
-
-	platform_driver_unregister(&mpc52xx_simple_gpiochip_driver);
+	platform_unregister_drivers(drivers, ARRAY_SIZE(drivers));
 }
 module_exit(mpc52xx_gpio_exit);
 
-- 
2.5.0
