From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v3 2/8] pinctrl: sh-pfc: r7s72100: Configure I/O mode
Date: Mon, 16 Jan 2017 13:12:46 +0100
Message-ID: <1484568772-18137-3-git-send-email-jacopo+renesas@jmondi.org>
References: <1484568772-18137-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:51584 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751035AbdAPMNI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2017 07:13:08 -0500
In-Reply-To: <1484568772-18137-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, chris.brandt@renesas.com, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

When selecting an alternate function for one pin, set the PIPCn.PIPCnm
bit to 1 to enable direct IO mode control (the alternate function
drives the pin direction) and disable input buffer and bidirection
control functionalities (PIBCn.PIBCnm = 0 and PBDCn.PDBCnm = 0).
Enable input buffer and bidirection control for port mode configuration.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/pinctrl/sh-pfc/pfc-r7s72100.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r7s72100.c b/drivers/pinctrl/sh-pfc/pfc-r7s72100.c
index 72e1dff..1923a11 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r7s72100.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r7s72100.c
@@ -54,13 +54,16 @@ enum {
 #define _P_GPIO(bank, _pin, _name, sfx, cfg) \
 	_GP_GPIO(16, bank, _pin, _name, sfx, cfg)
 
-#define _P_DATA(bank, pin, name, sfx, cfg)					\
-	PINMUX_DATA(name##_DATA, name##_PMC_0,		\
-		    name##_PIBC_1, name##_PBDC_1)
+#define _P_DATA(bank, pin, n, sfx, cfg)		\
+	PINMUX_DATA(n##_DATA, n##_PMC_0,		\
+		    n##_PIPC_0, n##_PIBC_1, n##_PBDC_1)
 
-#define _P_FN(n, fn, pfcae, pfce, pfc)					\
+#define _P_FN(n, fn, pfcae, pfce, pfc)			\
 	PINMUX_DATA(n##_MARK_FN##fn, n##_PMC_1,		\
-		    n##_PFCAE_##pfcae, n##_PFCE_##pfce, n##_PFC_##pfc)
+		    n##_PFCAE_##pfcae,			\
+		    n##_PFCE_##pfce,			\
+		    n##_PFC_##pfc,			\
+		    n##_PIPC_1, n##_PIBC_0, n##_PBDC_0)
 
 #define _P_MARK_FN1(bank, pin, name, sfx, cfg) _P_FN(name, 1, 0, 0, 0)
 #define _P_MARK_FN2(bank, pin, name, sfx, cfg) _P_FN(name, 2, 0, 0, 1)
-- 
2.7.4

