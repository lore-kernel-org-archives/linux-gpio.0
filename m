From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 1/6] pinctrl: mediatek: make mtk-common explicitly non-modular
Date: Tue, 23 Aug 2016 17:19:39 -0400
Message-ID: <20160823211944.18554-2-paul.gortmaker@windriver.com>
References: <20160823211944.18554-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail5.windriver.com ([192.103.53.11]:49008 "EHLO mail5.wrs.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755997AbcHWVUE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Aug 2016 17:20:04 -0400
In-Reply-To: <20160823211944.18554-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>, linux-gpio@vger.kernel.org

The Makefile currently controlling compilation of this code is:

  drivers/pinctrl/mediatek/pinctrl-mtk-common.o
    ---> drivers/pinctrl/mediatek/Makefile:obj-y += pinctrl-mtk-common.o

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modular infrastructure use, so that
when reading the driver there is no doubt it is builtin-only.

We delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

We don't replace module.h with init.h since the file doesn't need that.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index ce554e0d6979..ba2b03dbfe3b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -15,7 +15,6 @@
 
 #include <linux/io.h>
 #include <linux/gpio/driver.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
@@ -1496,7 +1495,3 @@ chip_error:
 	gpiochip_remove(pctl->chip);
 	return ret;
 }
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("MediaTek Pinctrl Driver");
-MODULE_AUTHOR("Hongzhou Yang <hongzhou.yang@mediatek.com>");
-- 
2.8.4

