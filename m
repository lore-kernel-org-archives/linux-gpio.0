From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 4/4] gpio: zevio: make it explicitly non-modular
Date: Mon, 9 May 2016 19:59:58 -0400
Message-ID: <1462838398-10725-5-git-send-email-paul.gortmaker@windriver.com>
References: <1462838398-10725-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462838398-10725-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Fabian Vogt <fabian@ritter-vogt.de>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/gpio/Kconfig:config GPIO_ZEVIO
drivers/gpio/Kconfig:   bool "LSI ZEVIO SoC memory mapped GPIOs"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Fabian Vogt <fabian@ritter-vogt.de>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-zevio.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
index cda6d922be98..e23ef7b9451d 100644
--- a/drivers/gpio/gpio-zevio.c
+++ b/drivers/gpio/gpio-zevio.c
@@ -10,7 +10,7 @@
 
 #include <linux/spinlock.h>
 #include <linux/errno.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/bitops.h>
 #include <linux/io.h>
 #include <linux/of_device.h>
@@ -203,32 +203,17 @@ static int zevio_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int zevio_gpio_remove(struct platform_device *pdev)
-{
-	struct zevio_gpio *controller = platform_get_drvdata(pdev);
-
-	of_mm_gpiochip_remove(&controller->chip);
-
-	return 0;
-}
-
 static const struct of_device_id zevio_gpio_of_match[] = {
 	{ .compatible = "lsi,zevio-gpio", },
 	{ },
 };
 
-MODULE_DEVICE_TABLE(of, zevio_gpio_of_match);
-
 static struct platform_driver zevio_gpio_driver = {
 	.driver		= {
 		.name	= "gpio-zevio",
 		.of_match_table = zevio_gpio_of_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe		= zevio_gpio_probe,
-	.remove		= zevio_gpio_remove,
 };
-module_platform_driver(zevio_gpio_driver);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Fabian Vogt <fabian@ritter-vogt.de>");
-MODULE_DESCRIPTION("LSI ZEVIO SoC GPIO driver");
+builtin_platform_driver(zevio_gpio_driver);
-- 
2.8.0
