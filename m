From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] pinctrl: sunxi: make sun5i explicitly non-modular
Date: Thu, 2 Feb 2017 15:17:40 -0500
Message-ID: <20170202201740.9134-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:46614 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751298AbdBBUSc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2017 15:18:32 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-gpio@vger.kernel.org

We had all these corrected in commit 0c8c6ba00cbf ("pinctrl: sunxi:
make bool drivers explicitly non-modular") but this new one recently
crept in.

The Kconfig currently controlling compilation of this code is:

   drivers/pinctrl/sunxi/Kconfig:config PINCTRL_SUN5I
   drivers/pinctrl/sunxi/Kconfig:  def_bool MACH_SUN5I

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modular infrastructure use, so that
when reading the driver there is no doubt it is builtin-only.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun5i.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun5i.c b/drivers/pinctrl/sunxi/pinctrl-sun5i.c
index c8a94323ce8b..7e8204482ecf 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun5i.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun5i.c
@@ -4,12 +4,12 @@
  * Copyright (C) 2014-2016 Maxime Ripard <maxime.ripard@free-electrons.com>
  * Copyright (C) 2016 Mylene Josserand <mylene.josserand@free-electrons.com>
  *
-g * This file is licensed under the terms of the GNU General Public
+ * This file is licensed under the terms of the GNU General Public
  * License version 2.  This program is licensed "as is" without any
  * warranty of any kind, whether express or implied.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -740,7 +740,6 @@ static const struct of_device_id sun5i_pinctrl_match[] = {
 	},
 	{ },
 };
-MODULE_DEVICE_TABLE(of, sun5i_pinctrl_match);
 
 static struct platform_driver sun5i_pinctrl_driver = {
 	.probe	= sun5i_pinctrl_probe,
@@ -749,8 +748,4 @@ static struct platform_driver sun5i_pinctrl_driver = {
 		.of_match_table	= sun5i_pinctrl_match,
 	},
 };
-module_platform_driver(sun5i_pinctrl_driver);
-
-MODULE_AUTHOR("Maxime Ripard <maxime.ripard@free-electrons.com");
-MODULE_DESCRIPTION("Allwinner sun5i pinctrl driver");
-MODULE_LICENSE("GPL");
+builtin_platform_driver(sun5i_pinctrl_driver);
-- 
2.11.0

