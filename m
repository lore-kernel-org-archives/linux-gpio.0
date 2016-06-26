From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 02/19] pinctrl: imx1: make it explicitly non-modular
Date: Sat, 25 Jun 2016 22:46:35 -0400
Message-ID: <20160626024652.5081-3-paul.gortmaker@windriver.com>
References: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail5.windriver.com ([192.103.53.11]:58255 "EHLO mail5.wrs.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751886AbcFZCr3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 25 Jun 2016 22:47:29 -0400
In-Reply-To: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexander Shiyan <shc_work@mail.ru>, linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/pinctrl/freescale/Kconfig:config PINCTRL_IMX1
drivers/pinctrl/freescale/Kconfig:	bool "IMX1 pinctrl driver"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/freescale/pinctrl-imx1.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1.c b/drivers/pinctrl/freescale/pinctrl-imx1.c
index 04723455db58..fc8efc748734 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1.c
@@ -9,7 +9,7 @@
  * (at your option) any later version.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -262,7 +262,6 @@ static const struct of_device_id imx1_pinctrl_of_match[] = {
 	{ .compatible = "fsl,imx1-iomuxc", },
 	{ }
 };
-MODULE_DEVICE_TABLE(of, imx1_pinctrl_of_match);
 
 static struct platform_driver imx1_pinctrl_driver = {
 	.driver	= {
@@ -270,8 +269,4 @@ static struct platform_driver imx1_pinctrl_driver = {
 		.of_match_table	= imx1_pinctrl_of_match,
 	},
 };
-module_platform_driver_probe(imx1_pinctrl_driver, imx1_pinctrl_probe);
-
-MODULE_AUTHOR("Alexander Shiyan <shc_work@mail.ru>");
-MODULE_DESCRIPTION("Freescale i.MX1 pinctrl driver");
-MODULE_LICENSE("GPL");
+builtin_platform_driver_probe(imx1_pinctrl_driver, imx1_pinctrl_probe);
-- 
2.8.4

