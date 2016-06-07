From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 4/9] pinctrl: lpc18xx: make it explicitly non-modular
Date: Mon, 6 Jun 2016 22:43:03 -0400
Message-ID: <1465267388-17884-5-git-send-email-paul.gortmaker@windriver.com>
References: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Joachim Eastwood <manabian@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

config PINCTRL_LPC18XX
        bool "NXP LPC18XX/43XX SCU pinctrl driver"

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
Cc: Joachim Eastwood <manabian@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/pinctrl-lpc18xx.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-lpc18xx.c b/drivers/pinctrl/pinctrl-lpc18xx.c
index 8a931c7ba2ff..e053f1fa5512 100644
--- a/drivers/pinctrl/pinctrl-lpc18xx.c
+++ b/drivers/pinctrl/pinctrl-lpc18xx.c
@@ -11,7 +11,7 @@
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/io.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -1365,31 +1365,17 @@ static int lpc18xx_scu_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int lpc18xx_scu_remove(struct platform_device *pdev)
-{
-	struct lpc18xx_scu_data *scu = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(scu->clk);
-
-	return 0;
-}
-
 static const struct of_device_id lpc18xx_scu_match[] = {
 	{ .compatible = "nxp,lpc1850-scu" },
 	{},
 };
-MODULE_DEVICE_TABLE(of, lpc18xx_scu_match);
 
 static struct platform_driver lpc18xx_scu_driver = {
 	.probe		= lpc18xx_scu_probe,
-	.remove		= lpc18xx_scu_remove,
 	.driver = {
 		.name		= "lpc18xx-scu",
 		.of_match_table	= lpc18xx_scu_match,
+		.suppress_bind_attrs = true,
 	},
 };
-module_platform_driver(lpc18xx_scu_driver);
-
-MODULE_AUTHOR("Joachim Eastwood <manabian@gmail.com>");
-MODULE_DESCRIPTION("Pinctrl driver for NXP LPC18xx/43xx SCU");
-MODULE_LICENSE("GPL v2");
+builtin_platform_driver(lpc18xx_scu_driver);
-- 
2.8.0
