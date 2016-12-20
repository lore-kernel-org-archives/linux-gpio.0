From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] mtd: nand: fix implicit module.h usage in xway_nand.c
Date: Tue, 20 Dec 2016 16:18:00 -0500
Message-ID: <20161220211800.4701-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail5.windriver.com ([192.103.53.11]:54622 "EHLO mail5.wrs.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755599AbcLTVSd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Dec 2016 16:18:33 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Hauke Mehrtens <hauke@hauke-m.de>, Boris Brezillon <boris.brezillon@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

In commit d47529b2e9fe0ec2eb1f072afad8849f52e385c4 ("gpio: don't
include module.h in shared driver header") we fixed a bunch of
implicit includes and then did what the shortlog says -- remove
module.h from a gpio header.

In parallel, commit 024366750c2e04fdcda8bca685194ef0196b35fe
("mtd: nand: xway: convert to normal platform driver") added new
modular function calls to a file that now became relying on the
above module.h presence in the gpio header, since it did not
explicitly include module.h header for them as part of the change.

The problem only appears when the two dev streams are merged.

Since the file is tristate, the fix is obvious -- it needs an
explicit include of module.h header.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[Resending with all Cc: enabled/added this time ...   :-(  ]

 drivers/mtd/nand/xway_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index 1f2948c0c458..00168d633bcf 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -7,6 +7,7 @@
  *  Copyright © 2016 Hauke Mehrtens <hauke@hauke-m.de>
  */
 
+#include <linux/module.h>
 #include <linux/mtd/nand.h>
 #include <linux/of_gpio.h>
 #include <linux/of_platform.h>
-- 
2.11.0

