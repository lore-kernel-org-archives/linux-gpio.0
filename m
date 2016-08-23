From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 6/6] pinctrl: sirf: make core support explicitly non-modular
Date: Tue, 23 Aug 2016 17:19:44 -0400
Message-ID: <20160823211944.18554-7-paul.gortmaker@windriver.com>
References: <20160823211944.18554-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:47208 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755826AbcHWVWl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Aug 2016 17:22:41 -0400
In-Reply-To: <20160823211944.18554-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Rongjun Ying <rongjun.ying@csr.com>, Yuping Luo <yuping.luo@csr.com>, Barry Song <baohua@kernel.org>, linux-gpio@vger.kernel.org

The Makefile currently controlling compilation of this code is:

  drivers/pinctrl/sirf/pinctrl-sirf.o
      --> drivers/pinctrl/sirf/Makefile:obj-y += pinctrl-sirf.o

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modular infrastructure use, so that
when reading the driver there is no doubt it is builtin-only.

We also delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rongjun Ying <rongjun.ying@csr.com>
Cc: Yuping Luo <yuping.luo@csr.com>
Cc: Barry Song <baohua@kernel.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/sirf/pinctrl-sirf.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-sirf.c b/drivers/pinctrl/sirf/pinctrl-sirf.c
index 762c0c9c1278..0df72be60704 100644
--- a/drivers/pinctrl/sirf/pinctrl-sirf.c
+++ b/drivers/pinctrl/sirf/pinctrl-sirf.c
@@ -1,6 +1,11 @@
 /*
  * pinmux driver for CSR SiRFprimaII
  *
+ * Authors:
+ *	Rongjun Ying <rongjun.ying@csr.com>
+ *	Yuping Luo <yuping.luo@csr.com>
+ *	Barry Song <baohua.song@csr.com>
+ *
  * Copyright (c) 2011 - 2014 Cambridge Silicon Radio Limited, a CSR plc group
  * company.
  *
@@ -8,7 +13,6 @@
  */
 
 #include <linux/init.h>
-#include <linux/module.h>
 #include <linux/irq.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
@@ -884,9 +888,3 @@ static int __init sirfsoc_gpio_init(void)
 	return sirfsoc_gpio_probe(np);
 }
 subsys_initcall(sirfsoc_gpio_init);
-
-MODULE_AUTHOR("Rongjun Ying <rongjun.ying@csr.com>");
-MODULE_AUTHOR("Yuping Luo <yuping.luo@csr.com>");
-MODULE_AUTHOR("Barry Song <baohua.song@csr.com>");
-MODULE_DESCRIPTION("SIRFSOC pin control driver");
-MODULE_LICENSE("GPL");
-- 
2.8.4

