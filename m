From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 2/3] pinctrl: sh-pfc: r7s72100: IO mode selection
Date: Mon,  9 Jan 2017 20:32:25 +0100
Message-ID: <1483990346-26998-3-git-send-email-jacopo+renesas@jmondi.org>
References: <1483990346-26998-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:36471 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1763467AbdAITci (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2017 14:32:38 -0500
In-Reply-To: <1483990346-26998-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, chris.brandt@renesas.com, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

In r7s72100 SoC a pin can be configured in 3 different modes:
* DIO: direct IO
* SWI: software input mode
* SWO: software output mode

The r7s72100 pincontrol driver defaulted all modes to software input
(PIPC = 0, PIBC = 1, PBDC = 1).
This was wrong for most pins, which requires their pins input/output
mode to be determined by the selected alternate function.

Add to the alternate function configuration register values the correct
PIPC, PIBC, PM and PBDC values, to be configured accordingly to the
desired IO mode.

This new feature will be used when adding to PFC peripherals that needs
software I/O control, such as LVDS

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/pinctrl/sh-pfc/pfc-r7s72100.c | 124 +++++++++++++++++++++++++++-------
 1 file changed, 101 insertions(+), 23 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r7s72100.c b/drivers/pinctrl/sh-pfc/pfc-r7s72100.c
index 8c0ae13..e67b0d1 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r7s72100.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r7s72100.c
@@ -34,6 +34,7 @@ enum {
 	PINMUX_DATA_END,
 
 	PINMUX_FUNCTION_BEGIN,
+	GP_ALL(PM_0), GP_ALL(PM_1),
 	GP_ALL(PMC_0), GP_ALL(PMC_1),
 	GP_ALL(PFC_0), GP_ALL(PFC_1),
 	GP_ALL(PFCE_0), GP_ALL(PFCE_1),
@@ -44,8 +45,15 @@ enum {
 	PINMUX_FUNCTION_END,
 
 	PINMUX_MARK_BEGIN,
-	GP_ALL(MARK_FN1), GP_ALL(MARK_FN2), GP_ALL(MARK_FN3), GP_ALL(MARK_FN4),
-	GP_ALL(MARK_FN5), GP_ALL(MARK_FN6), GP_ALL(MARK_FN7), GP_ALL(MARK_FN8),
+	GP_ALL(MARK_FN1_DIO), GP_ALL(MARK_FN2_DIO), GP_ALL(MARK_FN3_DIO),
+	GP_ALL(MARK_FN4_DIO), GP_ALL(MARK_FN5_DIO), GP_ALL(MARK_FN6_DIO),
+	GP_ALL(MARK_FN7_DIO), GP_ALL(MARK_FN8_DIO),
+	GP_ALL(MARK_FN1_SWI), GP_ALL(MARK_FN2_SWI), GP_ALL(MARK_FN3_SWI),
+	GP_ALL(MARK_FN4_SWI), GP_ALL(MARK_FN5_SWI), GP_ALL(MARK_FN6_SWI),
+	GP_ALL(MARK_FN7_SWI), GP_ALL(MARK_FN8_SWI),
+	GP_ALL(MARK_FN1_SWO), GP_ALL(MARK_FN2_SWO), GP_ALL(MARK_FN3_SWO),
+	GP_ALL(MARK_FN4_SWO), GP_ALL(MARK_FN5_SWO), GP_ALL(MARK_FN6_SWO),
+	GP_ALL(MARK_FN7_SWO), GP_ALL(MARK_FN8_SWO),
 	PINMUX_MARK_END,
 };
 
@@ -58,28 +66,87 @@ enum {
 	PINMUX_DATA(name##_DATA, name##_PMC_0,		\
 		    name##_PIBC_1, name##_PBDC_1)
 
-#define _P_FN(n, fn, pfcae, pfce, pfc)			\
-	PINMUX_DATA(n##_MARK_FN##fn, n##_PMC_1,		\
-		    n##_PFCAE_##pfcae,			\
-		    n##_PFCE_##pfce,			\
-		    n##_PFC_##pfc,			\
-		    n##_PIPC_1, n##_PIBC_0, n##_PBDC_0)
-
-#define _P_MARK_FN1(bank, pin, name, sfx, cfg) _P_FN(name, 1, 0, 0, 0)
-#define _P_MARK_FN2(bank, pin, name, sfx, cfg) _P_FN(name, 2, 0, 0, 1)
-#define _P_MARK_FN3(bank, pin, name, sfx, cfg) _P_FN(name, 3, 0, 1, 0)
-#define _P_MARK_FN4(bank, pin, name, sfx, cfg) _P_FN(name, 4, 0, 1, 1)
-#define _P_MARK_FN5(bank, pin, name, sfx, cfg) _P_FN(name, 5, 1, 0, 0)
-#define _P_MARK_FN6(bank, pin, name, sfx, cfg) _P_FN(name, 6, 1, 0, 1)
-#define _P_MARK_FN7(bank, pin, name, sfx, cfg) _P_FN(name, 7, 1, 1, 0)
-#define _P_MARK_FN8(bank, pin, name, sfx, cfg) _P_FN(name, 8, 1, 1, 1)
+/*
+ * @n: pin name GP_n_m
+ * @fn: alternative function number
+ * @pfcae @pfce @pfc: select alternative function
+ * @pipc: I/O mode selector (direct I/O or software I/O)
+ * @pm: software I/O mode direction selector (do not set in DIO mode)
+ * @pibc: input buffer enable
+ * @pbdc: bidirection control (do not set in SWI mode)
+ */
+
+#define _P_FN_DIO(n, fn, pfcae, pfce, pfc)			\
+	PINMUX_DATA(n##_MARK_FN##fn##_DIO,			\
+		    n##_PMC_1,					\
+		    n##_PFCAE_##pfcae,				\
+		    n##_PFCE_##pfce,				\
+		    n##_PFC_##pfc,				\
+		    n##_PIPC_1,					\
+		    n##_PIBC_0,					\
+		    n##_PBDC_0)
+
+#define _P_FN_SWI(n, fn, pfcae, pfce, pfc)			\
+	PINMUX_DATA(n##_MARK_FN##fn##_SWI,			\
+		    n##_PMC_1,					\
+		    n##_PFCAE_##pfcae,				\
+		    n##_PFCE_##pfce,				\
+		    n##_PFC_##pfc,				\
+		    n##_PIPC_0,					\
+		    n##_PM_1,					\
+		    n##_PIBC_1)
+
+#define _P_FN_SWO(n, fn, pfcae, pfce, pfc)			\
+	PINMUX_DATA(n##_MARK_FN##fn##_SWI,			\
+		    n##_PMC_1,					\
+		    n##_PFCAE_##pfcae,				\
+		    n##_PFCE_##pfce,				\
+		    n##_PFC_##pfc,				\
+		    n##_PIPC_0,					\
+		    n##_PM_0,					\
+		    n##_PIBC_0,					\
+		    n##_PBDC_0)
+
+/* alternate function configuration with direct I/O mode */
+#define _P_MARK_FN1_DIO(bank, pin, name, sfx, cfg) _P_FN_DIO(name, 1, 0, 0, 0)
+#define _P_MARK_FN2_DIO(bank, pin, name, sfx, cfg) _P_FN_DIO(name, 2, 0, 0, 1)
+#define _P_MARK_FN3_DIO(bank, pin, name, sfx, cfg) _P_FN_DIO(name, 3, 0, 1, 0)
+#define _P_MARK_FN4_DIO(bank, pin, name, sfx, cfg) _P_FN_DIO(name, 4, 0, 1, 1)
+#define _P_MARK_FN5_DIO(bank, pin, name, sfx, cfg) _P_FN_DIO(name, 5, 1, 0, 0)
+#define _P_MARK_FN6_DIO(bank, pin, name, sfx, cfg) _P_FN_DIO(name, 6, 1, 0, 1)
+#define _P_MARK_FN7_DIO(bank, pin, name, sfx, cfg) _P_FN_DIO(name, 7, 1, 1, 0)
+#define _P_MARK_FN8_DIO(bank, pin, name, sfx, cfg) _P_FN_DIO(name, 8, 1, 1, 1)
+
+/* alternate function configuration with software input mode */
+#define _P_MARK_FN1_SWI(bank, pin, name, sfx, cfg) _P_FN_SWI(name, 1, 0, 0, 0)
+#define _P_MARK_FN2_SWI(bank, pin, name, sfx, cfg) _P_FN_SWI(name, 2, 0, 0, 1)
+#define _P_MARK_FN3_SWI(bank, pin, name, sfx, cfg) _P_FN_SWI(name, 3, 0, 1, 0)
+#define _P_MARK_FN4_SWI(bank, pin, name, sfx, cfg) _P_FN_SWI(name, 4, 0, 1, 1)
+#define _P_MARK_FN5_SWI(bank, pin, name, sfx, cfg) _P_FN_SWI(name, 5, 1, 0, 0)
+#define _P_MARK_FN6_SWI(bank, pin, name, sfx, cfg) _P_FN_SWI(name, 6, 1, 0, 1)
+#define _P_MARK_FN7_SWI(bank, pin, name, sfx, cfg) _P_FN_SWI(name, 7, 1, 1, 0)
+#define _P_MARK_FN8_SWI(bank, pin, name, sfx, cfg) _P_FN_SWI(name, 8, 1, 1, 1)
+
+/* alternate function configuration with software output mode */
+#define _P_MARK_FN1_SWO(bank, pin, name, sfx, cfg) _P_FN_SWO(name, 1, 0, 0, 0)
+#define _P_MARK_FN2_SWO(bank, pin, name, sfx, cfg) _P_FN_SWO(name, 2, 0, 0, 1)
+#define _P_MARK_FN3_SWO(bank, pin, name, sfx, cfg) _P_FN_SWO(name, 3, 0, 1, 0)
+#define _P_MARK_FN4_SWO(bank, pin, name, sfx, cfg) _P_FN_SWO(name, 4, 0, 1, 1)
+#define _P_MARK_FN5_SWO(bank, pin, name, sfx, cfg) _P_FN_SWO(name, 5, 1, 0, 0)
+#define _P_MARK_FN6_SWO(bank, pin, name, sfx, cfg) _P_FN_SWO(name, 6, 1, 0, 1)
+#define _P_MARK_FN7_SWO(bank, pin, name, sfx, cfg) _P_FN_SWO(name, 7, 1, 1, 0)
+#define _P_MARK_FN8_SWO(bank, pin, name, sfx, cfg) _P_FN_SWO(name, 8, 1, 1, 1)
 
 static const u16 pinmux_data[] = {
 	_P_ALL(_P_DATA), /* PINMUX_DATA(P_M_N_DATA, P_M_N_PMC_0)... */
-	_P_ALL(_P_MARK_FN1), _P_ALL(_P_MARK_FN2),
-	_P_ALL(_P_MARK_FN3), _P_ALL(_P_MARK_FN4),
-	_P_ALL(_P_MARK_FN5), _P_ALL(_P_MARK_FN6),
-	_P_ALL(_P_MARK_FN7), _P_ALL(_P_MARK_FN8),
+	_P_ALL(_P_MARK_FN1_DIO), _P_ALL(_P_MARK_FN1_SWI), _P_ALL(_P_MARK_FN1_SWO),
+	_P_ALL(_P_MARK_FN2_DIO), _P_ALL(_P_MARK_FN2_SWI), _P_ALL(_P_MARK_FN2_SWO),
+	_P_ALL(_P_MARK_FN3_DIO), _P_ALL(_P_MARK_FN3_SWI), _P_ALL(_P_MARK_FN3_SWO),
+	_P_ALL(_P_MARK_FN4_DIO), _P_ALL(_P_MARK_FN4_SWI), _P_ALL(_P_MARK_FN4_SWO),
+	_P_ALL(_P_MARK_FN5_DIO), _P_ALL(_P_MARK_FN5_SWI), _P_ALL(_P_MARK_FN5_SWO),
+	_P_ALL(_P_MARK_FN6_DIO), _P_ALL(_P_MARK_FN6_SWI), _P_ALL(_P_MARK_FN6_SWO),
+	_P_ALL(_P_MARK_FN7_DIO), _P_ALL(_P_MARK_FN7_SWI), _P_ALL(_P_MARK_FN7_SWO),
+	_P_ALL(_P_MARK_FN8_DIO), _P_ALL(_P_MARK_FN8_SWI), _P_ALL(_P_MARK_FN8_SWO),
 };
 
 static struct sh_pfc_pin pinmux_pins[] = {
@@ -91,14 +158,24 @@ static struct sh_pfc_pin pinmux_pins[] = {
 #define __RZ_STR(pfx, hw, bank, pin, sfx)		\
 	pfx##_##hw##_p##bank##_##pin####sfx
 
-#define RZ_PIN_AND_MUX(pfx, hw, bank, pin, fn)				\
+
+#define _RZ_PIN_AND_MUX(pfx, hw, bank, pin, fn, iomode)			\
 static const unsigned int __RZ_STR(pfx, hw, bank, pin, _pins)[] = {	\
 	RZ_PORT_PIN(bank, pin),						\
 };									\
 static const unsigned int __RZ_STR(pfx, hw, bank, pin, _mux)[] = {	\
-	GP_##bank##_##pin##_MARK_FN##fn,					\
+	GP_##bank##_##pin##_MARK_FN##fn##_##iomode,			\
 };
 
+#define RZ_PIN_AND_MUX(pfx, hw, bank, pin, fn)				\
+	_RZ_PIN_AND_MUX(pfx, hw, bank, pin, fn, DIO)
+
+#define RZ_PIN_AND_MUX_SWI(pfx, hw, bank, pin, fn)			\
+	_RZ_PIN_AND_MUX(pfx, hw, bank, pin, fn, SWI)
+
+#define RZ_PIN_AND_MUX_SWO(pfx, hw, bank, pin, fn)			\
+	_RZ_PIN_AND_MUX(pfx, hw, bank, pin, fn, SWO)
+
 #define RZ_PMX_GROUP(pfx, hw, bank, pin, fn) \
 	SH_PFC_PIN_GROUP(pfx##_##hw##_p##bank##_##pin),
 
@@ -496,6 +573,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	}
 
 #define PFC_REGS(idx)						\
+	PFC_REG(idx, PM, (0xfcfe3000 + (idx * 4))),		\
 	PFC_REG(idx, PMC, (0xfcfe3400 + (idx * 4))),		\
 	PFC_REG(idx, PFC, (0xfcfe3500 + (idx * 4))),		\
 	PFC_REG(idx, PFCE, (0xfcfe3600 + (idx * 4))),		\
-- 
2.7.4

