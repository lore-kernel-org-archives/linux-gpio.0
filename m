From: Tan Jui Nee <jui.nee.tan@intel.com>
Subject: [PATCH v8 5/6] mfd: lpc_ich: Add Device IDs for Intel Apollo Lake PCH
Date: Wed, 12 Oct 2016 14:51:05 +0800
Message-ID: <1476255066-22653-6-git-send-email-jui.nee.tan@intel.com>
References: <1476255066-22653-1-git-send-email-jui.nee.tan@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:9143 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754073AbcJLGwk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Oct 2016 02:52:40 -0400
In-Reply-To: <1476255066-22653-1-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jui.nee.tan@intel.com, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

Adding Intel codename Apollo Lake platform device IDs for PCH.

Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
---
Changes in V8:
	- No change

 drivers/mfd/lpc_ich_core.c  | 6 ++++++
 include/linux/mfd/lpc_ich.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/mfd/lpc_ich_core.c b/drivers/mfd/lpc_ich_core.c
index bfba832..27e7e63 100644
--- a/drivers/mfd/lpc_ich_core.c
+++ b/drivers/mfd/lpc_ich_core.c
@@ -56,6 +56,7 @@
  *	document number TBD : Wildcat Point-LP
  *	document number TBD : 9 Series
  *	document number TBD : Lewisburg
+ *	document number TBD : Apollo Lake
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -460,6 +461,10 @@ struct lpc_ich_priv {
 		.name = "9 Series",
 		.iTCO_version = 2,
 	},
+	[LPC_APL]  = {
+		.name = "Apollo Lake SoC",
+		.iTCO_version = 5,
+	},
 };
 
 /*
@@ -608,6 +613,7 @@ struct lpc_ich_priv {
 	{ PCI_VDEVICE(INTEL, 0x3b14), LPC_3420},
 	{ PCI_VDEVICE(INTEL, 0x3b16), LPC_3450},
 	{ PCI_VDEVICE(INTEL, 0x5031), LPC_EP80579},
+	{ PCI_VDEVICE(INTEL, 0x5ae8), LPC_APL},
 	{ PCI_VDEVICE(INTEL, 0x8c40), LPC_LPT},
 	{ PCI_VDEVICE(INTEL, 0x8c41), LPC_LPT},
 	{ PCI_VDEVICE(INTEL, 0x8c42), LPC_LPT},
diff --git a/include/linux/mfd/lpc_ich.h b/include/linux/mfd/lpc_ich.h
index 42307ee..397008c 100644
--- a/include/linux/mfd/lpc_ich.h
+++ b/include/linux/mfd/lpc_ich.h
@@ -112,6 +112,7 @@ enum lpc_chipsets {
 	LPC_BRASWELL,	/* Braswell SoC */
 	LPC_LEWISBURG,	/* Lewisburg */
 	LPC_9S,		/* 9 Series */
+	LPC_APL,	/* Apollo Lake SoC */
 };
 
 #endif
-- 
1.9.1

