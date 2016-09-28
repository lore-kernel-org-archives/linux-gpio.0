From: Tan Jui Nee <jui.nee.tan@intel.com>
Subject: [PATCH v7 5/6] mfd: lpc_ich: Add Device IDs for Intel Apollo Lake PCH
Date: Wed, 28 Sep 2016 17:52:22 +0800
Message-ID: <1475056343-31907-6-git-send-email-jui.nee.tan@intel.com>
References: <1475056343-31907-1-git-send-email-jui.nee.tan@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:27984 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752917AbcI1Jxy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Sep 2016 05:53:54 -0400
In-Reply-To: <1475056343-31907-1-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jui.nee.tan@intel.com, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

Adding Intel codename Apollo Lake platform device IDs for PCH.

Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
---
 drivers/mfd/lpc_ich-core.c  | 6 ++++++
 include/linux/mfd/lpc_ich.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/mfd/lpc_ich-core.c b/drivers/mfd/lpc_ich-core.c
index 05ed985..589155c 100644
--- a/drivers/mfd/lpc_ich-core.c
+++ b/drivers/mfd/lpc_ich-core.c
@@ -56,6 +56,7 @@
  *	document number TBD : Wildcat Point-LP
  *	document number TBD : 9 Series
  *	document number TBD : Lewisburg
+ *	document number TBD : Apollo Lake
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -460,6 +461,10 @@ static struct lpc_ich_info lpc_chipset_info[] = {
 		.name = "9 Series",
 		.iTCO_version = 2,
 	},
+	[LPC_APL]  = {
+		.name = "Apollo Lake SoC",
+		.iTCO_version = 5,
+	},
 };
 
 /*
@@ -608,6 +613,7 @@ static const struct pci_device_id lpc_ich_ids[] = {
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

