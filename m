From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 7/8] gpio: wcove: fix implicit assumption module.h is present
Date: Mon, 12 Sep 2016 18:16:30 -0400
Message-ID: <20160912221631.15812-8-paul.gortmaker@windriver.com>
References: <20160912221631.15812-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:55401 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756099AbcILWQ6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2016 18:16:58 -0400
In-Reply-To: <20160912221631.15812-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Bin Gao <bin.gao@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

The Kconfig for this file is:

drivers/gpio/Kconfig:config GPIO_WHISKEY_COVE
drivers/gpio/Kconfig:   tristate "GPIO support for Whiskey Cove PMIC"

...but however it does not include module.h -- it in turn gets it from
another header (gpio/driver.h) and we'd like to replace that with a
forward delcaration of "struct module;" but if we do, this file will
fail to compile.

So we fix this first to avoid putting build failures into the bisect
commit history.

Cc: Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>
Cc: Bin Gao <bin.gao@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-wcove.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index e11d6a3fb641..d0ddba7a9d08 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -16,6 +16,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/gpio/driver.h>
 #include <linux/mfd/intel_soc_pmic.h>
-- 
2.8.4

