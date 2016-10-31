From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/3] pinctrl: cherryview: Serialize register access in suspend and resume hooks
Date: Mon, 31 Oct 2016 16:57:32 +0200
Message-ID: <20161031145734.193016-1-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:55986 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S943727AbcJaO6i (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 31 Oct 2016 10:58:38 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Christian Steiner <christian.steiner@outlook.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

If async suspend is enabled, the driver may access registers concurrently
with another instance which may fail because of the bug in Cherryview GPIO
hardware. Prevent this by taking the shared lock while accessing the
hardware in suspend and resume hooks.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 30389f4ccab4..097d835b3a50 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1656,8 +1656,11 @@ static int chv_pinctrl_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct chv_pinctrl *pctrl = platform_get_drvdata(pdev);
+	unsigned long flags;
 	int i;
 
+	raw_spin_lock_irqsave(&chv_lock, flags);
+
 	pctrl->saved_intmask = readl(pctrl->regs + CHV_INTMASK);
 
 	for (i = 0; i < pctrl->community->npins; i++) {
@@ -1678,6 +1681,8 @@ static int chv_pinctrl_suspend(struct device *dev)
 		ctx->padctrl1 = readl(reg);
 	}
 
+	raw_spin_unlock_irqrestore(&chv_lock, flags);
+
 	return 0;
 }
 
@@ -1685,8 +1690,11 @@ static int chv_pinctrl_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct chv_pinctrl *pctrl = platform_get_drvdata(pdev);
+	unsigned long flags;
 	int i;
 
+	raw_spin_lock_irqsave(&chv_lock, flags);
+
 	/*
 	 * Mask all interrupts before restoring per-pin configuration
 	 * registers because we don't know in which state BIOS left them
@@ -1731,6 +1739,8 @@ static int chv_pinctrl_resume(struct device *dev)
 	chv_writel(0xffff, pctrl->regs + CHV_INTSTAT);
 	chv_writel(pctrl->saved_intmask, pctrl->regs + CHV_INTMASK);
 
+	raw_spin_unlock_irqrestore(&chv_lock, flags);
+
 	return 0;
 }
 #endif
-- 
2.9.3

