From: Tan Jui Nee <jui.nee.tan@intel.com>
Subject: [PATCH v11 4/6] mfd: move enum lpc_chipsets into lpc_ich.h
Date: Fri, 18 Nov 2016 13:22:28 +0800
Message-ID: <1479446550-28677-5-git-send-email-jui.nee.tan@intel.com>
References: <1479446550-28677-1-git-send-email-jui.nee.tan@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479446550-28677-1-git-send-email-jui.nee.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, dvhart@infradead.org, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jui.nee.tan@intel.com, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com, yunying.sun@intel.com
List-Id: linux-gpio@vger.kernel.org

Move the enum's definition into a standalone header file which can be used
wherever its definition is needed.

Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
Changes in V11:
	- No change

Changes in V10:
	- No change

Changes in V9:
	- No change

Changes in V8:
	- No change

 drivers/mfd/lpc_ich_core.c  | 71 ---------------------------------------------
 include/linux/mfd/lpc_ich.h | 71 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+), 71 deletions(-)

diff --git a/drivers/mfd/lpc_ich_core.c b/drivers/mfd/lpc_ich_core.c
index 7cbe037..920198a 100644
--- a/drivers/mfd/lpc_ich_core.c
+++ b/drivers/mfd/lpc_ich_core.c
@@ -145,77 +145,6 @@ struct lpc_ich_priv {
 	.ignore_resource_conflicts = true,
 };
 
-/* chipset related info */
-enum lpc_chipsets {
-	LPC_ICH = 0,	/* ICH */
-	LPC_ICH0,	/* ICH0 */
-	LPC_ICH2,	/* ICH2 */
-	LPC_ICH2M,	/* ICH2-M */
-	LPC_ICH3,	/* ICH3-S */
-	LPC_ICH3M,	/* ICH3-M */
-	LPC_ICH4,	/* ICH4 */
-	LPC_ICH4M,	/* ICH4-M */
-	LPC_CICH,	/* C-ICH */
-	LPC_ICH5,	/* ICH5 & ICH5R */
-	LPC_6300ESB,	/* 6300ESB */
-	LPC_ICH6,	/* ICH6 & ICH6R */
-	LPC_ICH6M,	/* ICH6-M */
-	LPC_ICH6W,	/* ICH6W & ICH6RW */
-	LPC_631XESB,	/* 631xESB/632xESB */
-	LPC_ICH7,	/* ICH7 & ICH7R */
-	LPC_ICH7DH,	/* ICH7DH */
-	LPC_ICH7M,	/* ICH7-M & ICH7-U */
-	LPC_ICH7MDH,	/* ICH7-M DH */
-	LPC_NM10,	/* NM10 */
-	LPC_ICH8,	/* ICH8 & ICH8R */
-	LPC_ICH8DH,	/* ICH8DH */
-	LPC_ICH8DO,	/* ICH8DO */
-	LPC_ICH8M,	/* ICH8M */
-	LPC_ICH8ME,	/* ICH8M-E */
-	LPC_ICH9,	/* ICH9 */
-	LPC_ICH9R,	/* ICH9R */
-	LPC_ICH9DH,	/* ICH9DH */
-	LPC_ICH9DO,	/* ICH9DO */
-	LPC_ICH9M,	/* ICH9M */
-	LPC_ICH9ME,	/* ICH9M-E */
-	LPC_ICH10,	/* ICH10 */
-	LPC_ICH10R,	/* ICH10R */
-	LPC_ICH10D,	/* ICH10D */
-	LPC_ICH10DO,	/* ICH10DO */
-	LPC_PCH,	/* PCH Desktop Full Featured */
-	LPC_PCHM,	/* PCH Mobile Full Featured */
-	LPC_P55,	/* P55 */
-	LPC_PM55,	/* PM55 */
-	LPC_H55,	/* H55 */
-	LPC_QM57,	/* QM57 */
-	LPC_H57,	/* H57 */
-	LPC_HM55,	/* HM55 */
-	LPC_Q57,	/* Q57 */
-	LPC_HM57,	/* HM57 */
-	LPC_PCHMSFF,	/* PCH Mobile SFF Full Featured */
-	LPC_QS57,	/* QS57 */
-	LPC_3400,	/* 3400 */
-	LPC_3420,	/* 3420 */
-	LPC_3450,	/* 3450 */
-	LPC_EP80579,	/* EP80579 */
-	LPC_CPT,	/* Cougar Point */
-	LPC_CPTD,	/* Cougar Point Desktop */
-	LPC_CPTM,	/* Cougar Point Mobile */
-	LPC_PBG,	/* Patsburg */
-	LPC_DH89XXCC,	/* DH89xxCC */
-	LPC_PPT,	/* Panther Point */
-	LPC_LPT,	/* Lynx Point */
-	LPC_LPT_LP,	/* Lynx Point-LP */
-	LPC_WBG,	/* Wellsburg */
-	LPC_AVN,	/* Avoton SoC */
-	LPC_BAYTRAIL,   /* Bay Trail SoC */
-	LPC_COLETO,	/* Coleto Creek */
-	LPC_WPT_LP,	/* Wildcat Point-LP */
-	LPC_BRASWELL,	/* Braswell SoC */
-	LPC_LEWISBURG,	/* Lewisburg */
-	LPC_9S,		/* 9 Series */
-};
-
 static struct lpc_ich_info lpc_chipset_info[] = {
 	[LPC_ICH] = {
 		.name = "ICH",
diff --git a/include/linux/mfd/lpc_ich.h b/include/linux/mfd/lpc_ich.h
index 2b300b4..42307ee 100644
--- a/include/linux/mfd/lpc_ich.h
+++ b/include/linux/mfd/lpc_ich.h
@@ -43,4 +43,75 @@ struct lpc_ich_info {
 	u8 use_gpio;
 };
 
+/* chipset related info */
+enum lpc_chipsets {
+	LPC_ICH = 0,	/* ICH */
+	LPC_ICH0,	/* ICH0 */
+	LPC_ICH2,	/* ICH2 */
+	LPC_ICH2M,	/* ICH2-M */
+	LPC_ICH3,	/* ICH3-S */
+	LPC_ICH3M,	/* ICH3-M */
+	LPC_ICH4,	/* ICH4 */
+	LPC_ICH4M,	/* ICH4-M */
+	LPC_CICH,	/* C-ICH */
+	LPC_ICH5,	/* ICH5 & ICH5R */
+	LPC_6300ESB,	/* 6300ESB */
+	LPC_ICH6,	/* ICH6 & ICH6R */
+	LPC_ICH6M,	/* ICH6-M */
+	LPC_ICH6W,	/* ICH6W & ICH6RW */
+	LPC_631XESB,	/* 631xESB/632xESB */
+	LPC_ICH7,	/* ICH7 & ICH7R */
+	LPC_ICH7DH,	/* ICH7DH */
+	LPC_ICH7M,	/* ICH7-M & ICH7-U */
+	LPC_ICH7MDH,	/* ICH7-M DH */
+	LPC_NM10,	/* NM10 */
+	LPC_ICH8,	/* ICH8 & ICH8R */
+	LPC_ICH8DH,	/* ICH8DH */
+	LPC_ICH8DO,	/* ICH8DO */
+	LPC_ICH8M,	/* ICH8M */
+	LPC_ICH8ME,	/* ICH8M-E */
+	LPC_ICH9,	/* ICH9 */
+	LPC_ICH9R,	/* ICH9R */
+	LPC_ICH9DH,	/* ICH9DH */
+	LPC_ICH9DO,	/* ICH9DO */
+	LPC_ICH9M,	/* ICH9M */
+	LPC_ICH9ME,	/* ICH9M-E */
+	LPC_ICH10,	/* ICH10 */
+	LPC_ICH10R,	/* ICH10R */
+	LPC_ICH10D,	/* ICH10D */
+	LPC_ICH10DO,	/* ICH10DO */
+	LPC_PCH,	/* PCH Desktop Full Featured */
+	LPC_PCHM,	/* PCH Mobile Full Featured */
+	LPC_P55,	/* P55 */
+	LPC_PM55,	/* PM55 */
+	LPC_H55,	/* H55 */
+	LPC_QM57,	/* QM57 */
+	LPC_H57,	/* H57 */
+	LPC_HM55,	/* HM55 */
+	LPC_Q57,	/* Q57 */
+	LPC_HM57,	/* HM57 */
+	LPC_PCHMSFF,	/* PCH Mobile SFF Full Featured */
+	LPC_QS57,	/* QS57 */
+	LPC_3400,	/* 3400 */
+	LPC_3420,	/* 3420 */
+	LPC_3450,	/* 3450 */
+	LPC_EP80579,	/* EP80579 */
+	LPC_CPT,	/* Cougar Point */
+	LPC_CPTD,	/* Cougar Point Desktop */
+	LPC_CPTM,	/* Cougar Point Mobile */
+	LPC_PBG,	/* Patsburg */
+	LPC_DH89XXCC,	/* DH89xxCC */
+	LPC_PPT,	/* Panther Point */
+	LPC_LPT,	/* Lynx Point */
+	LPC_LPT_LP,	/* Lynx Point-LP */
+	LPC_WBG,	/* Wellsburg */
+	LPC_AVN,	/* Avoton SoC */
+	LPC_BAYTRAIL,   /* Bay Trail SoC */
+	LPC_COLETO,	/* Coleto Creek */
+	LPC_WPT_LP,	/* Wildcat Point-LP */
+	LPC_BRASWELL,	/* Braswell SoC */
+	LPC_LEWISBURG,	/* Lewisburg */
+	LPC_9S,		/* 9 Series */
+};
+
 #endif
-- 
1.9.1
