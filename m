From: Chris Chiu <chiu@endlessm.com>
Subject: [PATCH] pinctrl: intel: save HOSTSW_OWN register over suspend/resume
Date: Tue, 14 Nov 2017 18:41:36 +0800
Message-ID: <20171114104136.25595-1-chiu@endlessm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:52981 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750828AbdKNKlm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Nov 2017 05:41:42 -0500
Received: by mail-pg0-f67.google.com with SMTP id j16so9518496pgn.9
        for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2017 02:41:42 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com

The touchpad in the Asus laptop model X540NA is unresponsive
after suspend/resume. The following error appears during resume:

i2c_hid i2c-ELAN1200:00: failed to reset device.

The problem here is that i2c_hid does not notice the interrupt
being generated at this point. Because the GPIO which connects
to touchpad interrupt is in ACPI mode after resume and no longer
work as IRQ.

Fix this by saving HOSTSW_OWN register during suspend and restore
them at resume.

Signed-off-by: Chris Chiu <chiu@endlessm.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 6dc1096d3d34..eaafa0e534f3 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -83,6 +83,7 @@ struct intel_pad_context {
 
 struct intel_community_context {
 	u32 *intmask;
+	u32 *modemask;
 };
 
 struct intel_pinctrl_context {
@@ -1158,6 +1159,7 @@ static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
 	for (i = 0; i < pctrl->ncommunities; i++) {
 		struct intel_community *community = &pctrl->communities[i];
 		u32 *intmask;
+		u32 *modemask;
 
 		intmask = devm_kcalloc(pctrl->dev, community->ngpps,
 				       sizeof(*intmask), GFP_KERNEL);
@@ -1165,6 +1167,13 @@ static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
 			return -ENOMEM;
 
 		communities[i].intmask = intmask;
+
+		modemask = devm_kcalloc(pctrl->dev, community->ngpps,
+				       sizeof(*modemask), GFP_KERNEL);
+		if (!modemask)
+			return -ENOMEM;
+
+		communities[i].modemask = modemask;
 	}
 
 	pctrl->context.pads = pads;
@@ -1329,6 +1338,10 @@ int intel_pinctrl_suspend(struct device *dev)
 		base = community->regs + community->ie_offset;
 		for (gpp = 0; gpp < community->ngpps; gpp++)
 			communities[i].intmask[gpp] = readl(base + gpp * 4);
+
+		base = community->regs + community->hostown_offset;
+		for (gpp = 0; gpp < community->ngpps; gpp++)
+			communities[i].modemask[gpp] = readl(base + gpp * 4);
 	}
 
 	return 0;
@@ -1411,7 +1424,14 @@ int intel_pinctrl_resume(struct device *dev)
 		base = community->regs + community->ie_offset;
 		for (gpp = 0; gpp < community->ngpps; gpp++) {
 			writel(communities[i].intmask[gpp], base + gpp * 4);
-			dev_dbg(dev, "restored mask %d/%u %#08x\n", i, gpp,
+			dev_dbg(dev, "restored intmask %d/%u %#08x\n", i, gpp,
+				readl(base + gpp * 4));
+		}
+
+		base = community->regs + community->hostown_offset;
+		for (gpp = 0; gpp < community->ngpps; gpp++) {
+			writel(communities[i].modemask[gpp], base + gpp * 4);
+			dev_dbg(dev, "restored modemask %d/%u %#08x\n", i, gpp,
 				readl(base + gpp * 4));
 		}
 	}
-- 
2.11.0

