From: Qipeng Zha <qipeng.zha@intel.com>
Subject: [PATCH V4 2/2] pinctrl: intel: fix offset calculation issue of register PAD_OWN
Date: Mon, 30 Nov 2015 19:20:16 +0800
Message-ID: <1448882416-40845-2-git-send-email-qipeng.zha@intel.com>
References: <1448882416-40845-1-git-send-email-qipeng.zha@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:34163 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751844AbbK3DPw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 29 Nov 2015 22:15:52 -0500
In-Reply-To: <1448882416-40845-1-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, mika.westerberg@intel.com, qi.zheng@intel.com, qipeng.zha@intel.com

The calculation equation of PAD_OWN register offset is not
correct for Broxton, verified this fix will get right
offset for Broxton.

Signed-off-by: Qi Zheng <qi.zheng@intel.com>
Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>

---
change in v4
 fix the equation regarding to sunprisepoint platform.
---
 drivers/pinctrl/intel/pinctrl-intel.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 06004d8..26f6b6f 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -34,6 +34,7 @@
 #define PADOWN_BITS			4
 #define PADOWN_SHIFT(p)			((p) % 8 * PADOWN_BITS)
 #define PADOWN_MASK(p)			(0xf << PADOWN_SHIFT(p))
+#define PADOWN_GPP(p)			((p) / 8)
 
 /* Offset from pad_regs */
 #define PADCFG0				0x000
@@ -139,7 +140,7 @@ static void __iomem *intel_get_padcfg(struct intel_pinctrl *pctrl, unsigned pin,
 static bool intel_pad_owned_by_host(struct intel_pinctrl *pctrl, unsigned pin)
 {
 	const struct intel_community *community;
-	unsigned padno, gpp, gpp_offset, offset;
+	unsigned padno, gpp, offset, group;
 	void __iomem *padown;
 
 	community = intel_get_community(pctrl, pin);
@@ -149,9 +150,9 @@ static bool intel_pad_owned_by_host(struct intel_pinctrl *pctrl, unsigned pin)
 		return true;
 
 	padno = pin_to_padno(community, pin);
-	gpp = padno / NPADS_IN_GPP;
-	gpp_offset = padno % NPADS_IN_GPP;
-	offset = community->padown_offset + gpp * 16 + (gpp_offset / 8) * 4;
+	group = padno / community->gpp_size;
+	gpp = PADOWN_GPP(padno % community->gpp_size);
+	offset = community->padown_offset + 0x10 * group + gpp * 4;
 	padown = community->regs + offset;
 
 	return !(readl(padown) & PADOWN_MASK(padno));
-- 
1.8.3.2

