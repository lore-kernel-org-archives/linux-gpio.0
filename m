From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 3/8] drivers/pinctrl: make meson/pinctrl-meson.c explicitly non-modular
Date: Mon, 29 Feb 2016 15:48:39 -0500
Message-ID: <1456778924-20730-4-git-send-email-paul.gortmaker@windriver.com>
References: <1456778924-20730-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:64988 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753658AbcB2UtX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Feb 2016 15:49:23 -0500
In-Reply-To: <1456778924-20730-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Beniamino Galvani <b.galvani@gmail.com>, Carlo Caione <carlo@endlessm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/pinctrl/Kconfig:config PINCTRL_MESON
drivers/pinctrl/Kconfig:        bool

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modularity so that when reading the
driver there is no doubt it is builtin-only.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

We don't replace module.h with init.h since the file already has that.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>
Cc: Carlo Caione <carlo@endlessm.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 50cab27c64d4..3dd1a446f6f4 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -49,7 +49,6 @@
 #include <linux/gpio.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/pinctrl/pinconf-generic.h>
@@ -546,7 +545,6 @@ static const struct of_device_id meson_pinctrl_dt_match[] = {
 	},
 	{ },
 };
-MODULE_DEVICE_TABLE(of, meson_pinctrl_dt_match);
 
 static int meson_gpiolib_register(struct meson_pinctrl *pc)
 {
@@ -754,8 +752,4 @@ static struct platform_driver meson_pinctrl_driver = {
 		.of_match_table = meson_pinctrl_dt_match,
 	},
 };
-module_platform_driver(meson_pinctrl_driver);
-
-MODULE_AUTHOR("Beniamino Galvani <b.galvani@gmail.com>");
-MODULE_DESCRIPTION("Amlogic Meson pinctrl driver");
-MODULE_LICENSE("GPL v2");
+builtin_platform_driver(meson_pinctrl_driver);
-- 
2.6.1

