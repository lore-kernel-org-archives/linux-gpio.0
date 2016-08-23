From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 5/6] pinctrl: sirf: make atlas7 explicitly non-modular
Date: Tue, 23 Aug 2016 17:19:43 -0400
Message-ID: <20160823211944.18554-6-paul.gortmaker@windriver.com>
References: <20160823211944.18554-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:37291 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756075AbcHWVWl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Aug 2016 17:22:41 -0400
In-Reply-To: <20160823211944.18554-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Barry Song <baohua@kernel.org>, linux-gpio@vger.kernel.org

The Makefile currently controlling compilation of this code is:

  drivers/pinctrl/sirf/pinctrl-atlas7.o
    ---> drivers/pinctrl/sirf/Makefile:obj-y += pinctrl-atlas7.o

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modular infrastructure use, so that
when reading the driver there is no doubt it is builtin-only.

We delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Barry Song <baohua@kernel.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/sirf/pinctrl-atlas7.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index 19952f73fa8c..7f3041697813 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -7,7 +7,7 @@
  * Licensed under GPLv2 or later.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/bitops.h>
@@ -6158,6 +6158,3 @@ static int __init atlas7_gpio_init(void)
 	return platform_driver_register(&atlas7_gpio_driver);
 }
 subsys_initcall(atlas7_gpio_init);
-
-MODULE_DESCRIPTION("SIRFSOC Atlas7 pin control driver");
-MODULE_LICENSE("GPL");
-- 
2.8.4

