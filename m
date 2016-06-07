From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 6/9] pinctrl: palmas: make it explicitly non-modular
Date: Mon, 6 Jun 2016 22:43:05 -0400
Message-ID: <1465267388-17884-7-git-send-email-paul.gortmaker@windriver.com>
References: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

config PINCTRL_PALMAS
        bool "Pinctrl driver for the PALMAS Series MFD devices"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/pinctrl-palmas.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-palmas.c b/drivers/pinctrl/pinctrl-palmas.c
index 8edb3f8c72c8..3def8805a882 100644
--- a/drivers/pinctrl/pinctrl-palmas.c
+++ b/drivers/pinctrl/pinctrl-palmas.c
@@ -21,7 +21,7 @@
  */
 
 #include <linux/delay.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/mfd/palmas.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -1059,10 +1059,4 @@ static struct platform_driver palmas_pinctrl_driver = {
 	},
 	.probe = palmas_pinctrl_probe,
 };
-
-module_platform_driver(palmas_pinctrl_driver);
-
-MODULE_DESCRIPTION("Palmas pin control driver");
-MODULE_AUTHOR("Laxman Dewangan<ldewangan@nvidia.com>");
-MODULE_ALIAS("platform:palmas-pinctrl");
-MODULE_LICENSE("GPL v2");
+builtin_platform_driver(palmas_pinctrl_driver);
-- 
2.8.0
