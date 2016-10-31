From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] gpio: htc-egpio: Make it explicitly non-modular
Date: Mon, 31 Oct 2016 14:27:07 -0400
Message-ID: <20161031182707.14034-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Kevin O'Connor <kevin@koconnor.net>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/gpio/Kconfig:config HTC_EGPIO
drivers/gpio/Kconfig:   bool "HTC EGPIO support"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.

Since module_init was not in use by this code, the init ordering
remains unchanged with this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Kevin O'Connor <kevin@koconnor.net>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[we had all these fixed for gpio, but then this file recently moved from
 the mfd subsystem over here to gpio....]

 drivers/gpio/gpio-htc-egpio.c | 32 ++------------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index 0b4df6051097..5ab895b41819 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -17,7 +17,7 @@
 #include <linux/platform_data/gpio-htc-egpio.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/module.h>
+#include <linux/init.h>
 
 struct egpio_chip {
 	int              reg_start;
@@ -367,24 +367,6 @@ static int __init egpio_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int __exit egpio_remove(struct platform_device *pdev)
-{
-	struct egpio_info *ei = platform_get_drvdata(pdev);
-	unsigned int      irq, irq_end;
-
-	if (ei->chained_irq) {
-		irq_end = ei->irq_start + ei->nirqs;
-		for (irq = ei->irq_start; irq < irq_end; irq++) {
-			irq_set_chip_and_handler(irq, NULL, NULL);
-			irq_set_status_flags(irq, IRQ_NOREQUEST | IRQ_NOPROBE);
-		}
-		irq_set_chained_handler(ei->chained_irq, NULL);
-		device_init_wakeup(&pdev->dev, 0);
-	}
-
-	return 0;
-}
-
 #ifdef CONFIG_PM
 static int egpio_suspend(struct platform_device *pdev, pm_message_t state)
 {
@@ -416,8 +398,8 @@ static int egpio_resume(struct platform_device *pdev)
 static struct platform_driver egpio_driver = {
 	.driver = {
 		.name = "htc-egpio",
+		.suppress_bind_attrs = true,
 	},
-	.remove       = __exit_p(egpio_remove),
 	.suspend      = egpio_suspend,
 	.resume       = egpio_resume,
 };
@@ -426,15 +408,5 @@ static int __init egpio_init(void)
 {
 	return platform_driver_probe(&egpio_driver, egpio_probe);
 }
-
-static void __exit egpio_exit(void)
-{
-	platform_driver_unregister(&egpio_driver);
-}
-
 /* start early for dependencies */
 subsys_initcall(egpio_init);
-module_exit(egpio_exit)
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Kevin O'Connor <kevin@koconnor.net>");
-- 
2.10.0
