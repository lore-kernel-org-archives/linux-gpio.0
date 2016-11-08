From: Tan Jui Nee <jui.nee.tan@intel.com>
Subject: [PATCH v9 2/6] mfd: lpc_ich: Rename lpc-ich driver
Date: Tue,  8 Nov 2016 16:57:19 +0800
Message-ID: <1478595443-6306-3-git-send-email-jui.nee.tan@intel.com>
References: <1478595443-6306-1-git-send-email-jui.nee.tan@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478595443-6306-1-git-send-email-jui.nee.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jui.nee.tan@intel.com, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com, yunying.sun@intel.com
List-Id: linux-gpio@vger.kernel.org

This patch follows the example of mfd/wm831x to rename the driver
from "lpc_ich" to "lpc_ich_core".

Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
---
Changes in V9:
	- Remove the filename from the header of lpc_ich_core.c (suggested by Lee).

Changes in V8:
	- Update new file name with lpc_ich_core.c at description of source file.
	- Rework Makefile with new source file name lpc_ich_apl.c.

Changes in V7:
	- No change

Changes in V6:
	- none, just a subject line and commit message change.

 drivers/mfd/Makefile                      | 1 +
 drivers/mfd/{lpc_ich.c => lpc_ich_core.c} | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)
 rename drivers/mfd/{lpc_ich.c => lpc_ich_core.c} (99%)

diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 9834e66..06a91ea 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -159,6 +159,7 @@ obj-$(CONFIG_PMIC_ADP5520)	+= adp5520.o
 obj-$(CONFIG_MFD_KEMPLD)	+= kempld-core.o
 obj-$(CONFIG_MFD_INTEL_QUARK_I2C_GPIO)	+= intel_quark_i2c_gpio.o
 obj-$(CONFIG_LPC_SCH)		+= lpc_sch.o
+lpc_ich-objs		:= lpc_ich_core.o
 obj-$(CONFIG_LPC_ICH)		+= lpc_ich.o
 obj-$(CONFIG_MFD_RDC321X)	+= rdc321x-southbridge.o
 obj-$(CONFIG_MFD_JANZ_CMODIO)	+= janz-cmodio.o
diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich_core.c
similarity index 99%
rename from drivers/mfd/lpc_ich.c
rename to drivers/mfd/lpc_ich_core.c
index c8dee47..7cbe037 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich_core.c
@@ -1,6 +1,4 @@
 /*
- *  lpc_ich.c - LPC interface for Intel ICH
- *
  *  LPC bridge function of the Intel ICH contains many other
  *  functional units, such as Interrupt controllers, Timers,
  *  Power Management, System Management, GPIO, RTC, and LPC
-- 
1.9.1
