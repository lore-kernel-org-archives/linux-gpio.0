From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 03/19] pinctrl: imx21: make it explicitly non-modular
Date: Sat, 25 Jun 2016 22:46:36 -0400
Message-ID: <20160626024652.5081-4-paul.gortmaker@windriver.com>
References: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexander Shiyan <shc_work@mail.ru>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/pinctrl/freescale/Kconfig:config PINCTRL_IMX21
drivers/pinctrl/freescale/Kconfig:	bool "i.MX21 pinctrl driver"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/freescale/pinctrl-imx21.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx21.c b/drivers/pinctrl/freescale/pinctrl-imx21.c
index aa1221f4dbb7..b9f9b3b8eeb1 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx21.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx21.c
@@ -9,7 +9,7 @@
  * (at your option) any later version.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -333,8 +333,4 @@ static struct platform_driver imx21_pinctrl_driver = {
 		.of_match_table	= imx21_pinctrl_of_match,
 	},
 };
-module_platform_driver_probe(imx21_pinctrl_driver, imx21_pinctrl_probe);
-
-MODULE_AUTHOR("Alexander Shiyan <shc_work@mail.ru>");
-MODULE_DESCRIPTION("Freescale i.MX21 pinctrl driver");
-MODULE_LICENSE("GPL");
+builtin_platform_driver_probe(imx21_pinctrl_driver, imx21_pinctrl_probe);
-- 
2.8.4
