From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 3/6] pinctrl: nomadik: make core support explicitly non-modular
Date: Tue, 23 Aug 2016 17:19:41 -0400
Message-ID: <20160823211944.18554-4-paul.gortmaker@windriver.com>
References: <20160823211944.18554-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:47201 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755941AbcHWVUD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Aug 2016 17:20:03 -0400
In-Reply-To: <20160823211944.18554-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alessandro Rubini <rubini@unipv.it>, linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/pinctrl/nomadik/Kconfig:config PINCTRL_NOMADIK
drivers/pinctrl/nomadik/Kconfig:        bool "Nomadik pin controller driver"

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modular infrastructure use, so that
when reading the driver there is no doubt it is builtin-only.

We delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alessandro Rubini <rubini@unipv.it>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 6f2e1da11b1e..205fb399268a 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -11,7 +11,6 @@
  * published by the Free Software Foundation.
  */
 #include <linux/kernel.h>
-#include <linux/module.h>
 #include <linux/init.h>
 #include <linux/device.h>
 #include <linux/platform_device.h>
@@ -1983,7 +1982,3 @@ static int __init nmk_pinctrl_init(void)
 	return platform_driver_register(&nmk_pinctrl_driver);
 }
 core_initcall(nmk_pinctrl_init);
-
-MODULE_AUTHOR("Prafulla WADASKAR and Alessandro Rubini");
-MODULE_DESCRIPTION("Nomadik GPIO Driver");
-MODULE_LICENSE("GPL");
-- 
2.8.4

