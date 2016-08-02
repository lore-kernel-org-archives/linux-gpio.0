From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] pinctrl: intel: merrifield: Add missed header
Date: Tue,  2 Aug 2016 18:18:33 +0300
Message-ID: <1470151113-75409-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:46013 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S967156AbcHBPVt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 2 Aug 2016 11:21:49 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On x86 builds the absense of <linux/io.h> makes static analyzer and compiler
unhappy which fails to build the driver.

CHECK   drivers/pinctrl/intel/pinctrl-merrifield.c
drivers/pinctrl/intel/pinctrl-merrifield.c:518:17: error: undefined identifier 'readl'
drivers/pinctrl/intel/pinctrl-merrifield.c:570:17: error: undefined identifier 'readl'
drivers/pinctrl/intel/pinctrl-merrifield.c:575:9: error: undefined identifier 'writel'
drivers/pinctrl/intel/pinctrl-merrifield.c:645:17: error: undefined identifier 'readl'
  CC      drivers/pinctrl/intel/pinctrl-merrifield.o
drivers/pinctrl/intel/pinctrl-merrifield.c: In function ‘mrfld_pin_dbg_show’:
drivers/pinctrl/intel/pinctrl-merrifield.c:518:10: error: implicit declaration of function ‘readl’ [-Werror=implicit-function-declaration]
  value = readl(bufcfg);
            ^
drivers/pinctrl/intel/pinctrl-merrifield.c: In function ‘mrfld_update_bufcfg’:
drivers/pinctrl/intel/pinctrl-merrifield.c:575:2: error: implicit declaration of function ‘writel’ [-Werror=implicit-function-declaration]
  writel(value, bufcfg);
    ^
cc1: some warnings being treated as errors

Add header to the top of the module.

Fixes: 4e80c8f50574 ("pinctrl: intel: Add Intel Merrifield pin controller support")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-merrifield.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/intel/pinctrl-merrifield.c b/drivers/pinctrl/intel/pinctrl-merrifield.c
index eb4990f..7fb7656 100644
--- a/drivers/pinctrl/intel/pinctrl-merrifield.c
+++ b/drivers/pinctrl/intel/pinctrl-merrifield.c
@@ -11,6 +11,7 @@
 
 #include <linux/bitops.h>
 #include <linux/err.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinconf.h>
-- 
2.8.1

