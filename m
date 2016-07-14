From: Tan Jui Nee <jui.nee.tan@intel.com>
Subject: [PATCH v6 2/3] mfd: lpc_ich: Rename lpc-ich driver
Date: Thu, 14 Jul 2016 16:11:58 +0800
Message-ID: <1468483919-31258-3-git-send-email-jui.nee.tan@intel.com>
References: <1468483919-31258-1-git-send-email-jui.nee.tan@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:18261 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751028AbcGNIMW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 14 Jul 2016 04:12:22 -0400
In-Reply-To: <1468483919-31258-1-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jui.nee.tan@intel.com, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

This patch follows the example of mfd/wm831x to rename the driver
from "lpc_ich" to "lpc_ich-core".

Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
---
Changes in V6:
	- none, just a subject line and commit message change.

 drivers/mfd/Makefile                      | 1 +
 drivers/mfd/{lpc_ich.c => lpc_ich-core.c} | 0
 2 files changed, 1 insertion(+)
 rename drivers/mfd/{lpc_ich.c => lpc_ich-core.c} (100%)

diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 42a66e1..1dfe5fb 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -155,6 +155,7 @@ obj-$(CONFIG_PMIC_ADP5520)	+= adp5520.o
 obj-$(CONFIG_MFD_KEMPLD)	+= kempld-core.o
 obj-$(CONFIG_MFD_INTEL_QUARK_I2C_GPIO)	+= intel_quark_i2c_gpio.o
 obj-$(CONFIG_LPC_SCH)		+= lpc_sch.o
+lpc_ich-objs		:= lpc_ich-core.o
 obj-$(CONFIG_LPC_ICH)		+= lpc_ich.o
 obj-$(CONFIG_MFD_RDC321X)	+= rdc321x-southbridge.o
 obj-$(CONFIG_MFD_JANZ_CMODIO)	+= janz-cmodio.o
diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich-core.c
similarity index 100%
rename from drivers/mfd/lpc_ich.c
rename to drivers/mfd/lpc_ich-core.c
-- 
1.9.1

