From: Qipeng Zha <qipeng.zha@intel.com>
Subject: [PATCH V3 1/2] pinctrl: intel: fix offset calculation issue of register PAD_OWN
Date: Thu, 26 Nov 2015 01:09:50 +0800
Message-ID: <1448471391-1115-1-git-send-email-qipeng.zha@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:23522 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932089AbbKYJF3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 25 Nov 2015 04:05:29 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, mika.westerberg@intel.com, qi.zheng@intel.com, qipeng.zha@intel.com

The equation of offset calculation is not correct for PAD_OWN,
verified this fix will get right offset.

Signed-off-by: Qi Zheng <qi.zheng@intel.com>
Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 392e28d..e3f580b 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -37,6 +37,7 @@
 #define PADOWN_BITS			4
 #define PADOWN_SHIFT(p)			((p) % 8 * PADOWN_BITS)
 #define PADOWN_MASK(p)			(0xf << PADOWN_SHIFT(p))
+#define PADOWN_GPP(p)			((p) / 8)
 
 /* Offset from pad_regs */
 #define PADCFG0				0x000
@@ -142,7 +143,7 @@ static void __iomem *intel_get_padcfg(struct intel_pinctrl *pctrl, unsigned pin,
 static bool intel_pad_owned_by_host(struct intel_pinctrl *pctrl, unsigned pin)
 {
 	const struct intel_community *community;
-	unsigned padno, gpp, gpp_offset, offset;
+	unsigned padno, gpp, offset;
 	void __iomem *padown;
 
 	community = intel_get_community(pctrl, pin);
@@ -152,9 +153,8 @@ static bool intel_pad_owned_by_host(struct intel_pinctrl *pctrl, unsigned pin)
 		return true;
 
 	padno = pin_to_padno(community, pin);
-	gpp = padno / NPADS_IN_GPP;
-	gpp_offset = padno % NPADS_IN_GPP;
-	offset = community->padown_offset + gpp * 16 + (gpp_offset / 8) * 4;
+	gpp = PADOWN_GPP(padno);
+	offset = community->padown_offset + gpp * 4;
 	padown = community->regs + offset;
 
 	return !(readl(padown) & PADOWN_MASK(padno));
-- 
1.8.3.2

