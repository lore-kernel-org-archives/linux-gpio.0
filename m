From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/4] pinctrl: sh-pfc: r8a7795: Add support for R-Car H3 ES2.0
Date: Mon, 13 Mar 2017 18:12:45 +0100
Message-ID: <1489425167-22711-3-git-send-email-geert+renesas@glider.be>
References: <1489425167-22711-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:60618 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751703AbdCMRMy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2017 13:12:54 -0400
In-Reply-To: <1489425167-22711-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>, Takeshi Kihara <takeshi.kihara.df@renesas.com>

The Pin Function Controller module in the R-Car H3 ES2.0 differs from
ES1.x in many ways.

The goal is twofold:
  1. Support both the ES1.x and ES2.0 SoC revisions in a single binary
     for now,
  2. Make it clear which code supports ES1.x, so it can easily be
     identified and removed later, when production SoCs are deemed
     ubiquitous.

Hence this patch:
  1. Extracts the support for R-Car H3 ES1.x into a separate file, as
     the differences are quite large,
  2. Adds code for detecting the SoC revision at runtime using the new
     soc_device_match() API, and selecting pinctrl tables for the actual
     SoC revision,
  3. Replaces the core register and bitfield definitions by their
     counterparts for R-Car H3 ES2.0.

The addition of pins, groups, and functions for the various on-chip
devices is left to subsequent patches.

The R-Car H3 ES2.0 register and bitfield definitions were extracted from
a patch in the BSP by Takeshi Kihara.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>
---
v2:
  - Extend the Proof-of-Concept to basic support.
---
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               | 4780 ++++----------------
 .../sh-pfc/{pfc-r8a7795.c => pfc-r8a7795es1.c}     |   25 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |    1 +
 4 files changed, 911 insertions(+), 3896 deletions(-)
 copy drivers/pinctrl/sh-pfc/{pfc-r8a7795.c => pfc-r8a7795es1.c} (99%)

diff --git a/drivers/pinctrl/sh-pfc/Makefile b/drivers/pinctrl/sh-pfc/Makefile
index 2dda8c63f3cf29a4..2ebd4ff424151fb8 100644
--- a/drivers/pinctrl/sh-pfc/Makefile
+++ b/drivers/pinctrl/sh-pfc/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_PINCTRL_PFC_R8A7792)	+= pfc-r8a7792.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7793)	+= pfc-r8a7791.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7794)	+= pfc-r8a7794.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7795)	+= pfc-r8a7795.o
+obj-$(CONFIG_PINCTRL_PFC_R8A7795)	+= pfc-r8a7795es1.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7796)	+= pfc-r8a7796.o
 obj-$(CONFIG_PINCTRL_PFC_SH7203)	+= pfc-sh7203.o
 obj-$(CONFIG_PINCTRL_PFC_SH7264)	+= pfc-sh7264.o
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 3d1c32cca16a0398..6caaed53938ca9cf 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1,7 +1,7 @@
 /*
- * R8A7795 processor support - PFC hardware block.
+ * R8A7795 ES2.0+ processor support - PFC hardware block.
  *
- * Copyright (C) 2015  Renesas Electronics Corporation
+ * Copyright (C) 2015-2016 Renesas Electronics Corporation
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -9,6 +9,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/sys_soc.h>
 
 #include "core.h"
 #include "sh_pfc.h"
@@ -101,10 +102,10 @@
 #define GPSR2_0		F_(IRQ0,		IP0_27_24)
 
 /* GPSR3 */
-#define GPSR3_15	F_(SD1_WP,		IP10_23_20)
-#define GPSR3_14	F_(SD1_CD,		IP10_19_16)
-#define GPSR3_13	F_(SD0_WP,		IP10_15_12)
-#define GPSR3_12	F_(SD0_CD,		IP10_11_8)
+#define GPSR3_15	F_(SD1_WP,		IP11_23_20)
+#define GPSR3_14	F_(SD1_CD,		IP11_19_16)
+#define GPSR3_13	F_(SD0_WP,		IP11_15_12)
+#define GPSR3_12	F_(SD0_CD,		IP11_11_8)
 #define GPSR3_11	F_(SD1_DAT3,		IP8_31_28)
 #define GPSR3_10	F_(SD1_DAT2,		IP8_27_24)
 #define GPSR3_9		F_(SD1_DAT1,		IP8_23_20)
@@ -119,86 +120,86 @@
 #define GPSR3_0		F_(SD0_CLK,		IP7_19_16)
 
 /* GPSR4 */
-#define GPSR4_17	FM(SD3_DS)
-#define GPSR4_16	F_(SD3_DAT7,		IP10_7_4)
-#define GPSR4_15	F_(SD3_DAT6,		IP10_3_0)
-#define GPSR4_14	F_(SD3_DAT5,		IP9_31_28)
-#define GPSR4_13	F_(SD3_DAT4,		IP9_27_24)
-#define GPSR4_12	FM(SD3_DAT3)
-#define GPSR4_11	FM(SD3_DAT2)
-#define GPSR4_10	FM(SD3_DAT1)
-#define GPSR4_9		FM(SD3_DAT0)
-#define GPSR4_8		FM(SD3_CMD)
-#define GPSR4_7		FM(SD3_CLK)
-#define GPSR4_6		F_(SD2_DS,		IP9_23_20)
-#define GPSR4_5		F_(SD2_DAT3,		IP9_19_16)
-#define GPSR4_4		F_(SD2_DAT2,		IP9_15_12)
-#define GPSR4_3		F_(SD2_DAT1,		IP9_11_8)
-#define GPSR4_2		F_(SD2_DAT0,		IP9_7_4)
-#define GPSR4_1		FM(SD2_CMD)
+#define GPSR4_17	F_(SD3_DS,		IP11_7_4)
+#define GPSR4_16	F_(SD3_DAT7,		IP11_3_0)
+#define GPSR4_15	F_(SD3_DAT6,		IP10_31_28)
+#define GPSR4_14	F_(SD3_DAT5,		IP10_27_24)
+#define GPSR4_13	F_(SD3_DAT4,		IP10_23_20)
+#define GPSR4_12	F_(SD3_DAT3,		IP10_19_16)
+#define GPSR4_11	F_(SD3_DAT2,		IP10_15_12)
+#define GPSR4_10	F_(SD3_DAT1,		IP10_11_8)
+#define GPSR4_9		F_(SD3_DAT0,		IP10_7_4)
+#define GPSR4_8		F_(SD3_CMD,		IP10_3_0)
+#define GPSR4_7		F_(SD3_CLK,		IP9_31_28)
+#define GPSR4_6		F_(SD2_DS,		IP9_27_24)
+#define GPSR4_5		F_(SD2_DAT3,		IP9_23_20)
+#define GPSR4_4		F_(SD2_DAT2,		IP9_19_16)
+#define GPSR4_3		F_(SD2_DAT1,		IP9_15_12)
+#define GPSR4_2		F_(SD2_DAT0,		IP9_11_8)
+#define GPSR4_1		F_(SD2_CMD,		IP9_7_4)
 #define GPSR4_0		F_(SD2_CLK,		IP9_3_0)
 
 /* GPSR5 */
-#define GPSR5_25	F_(MLB_DAT,		IP13_19_16)
-#define GPSR5_24	F_(MLB_SIG,		IP13_15_12)
-#define GPSR5_23	F_(MLB_CLK,		IP13_11_8)
+#define GPSR5_25	F_(MLB_DAT,		IP14_19_16)
+#define GPSR5_24	F_(MLB_SIG,		IP14_15_12)
+#define GPSR5_23	F_(MLB_CLK,		IP14_11_8)
 #define GPSR5_22	FM(MSIOF0_RXD)
-#define GPSR5_21	F_(MSIOF0_SS2,		IP13_7_4)
+#define GPSR5_21	F_(MSIOF0_SS2,		IP14_7_4)
 #define GPSR5_20	FM(MSIOF0_TXD)
-#define GPSR5_19	F_(MSIOF0_SS1,		IP13_3_0)
-#define GPSR5_18	F_(MSIOF0_SYNC,		IP12_31_28)
+#define GPSR5_19	F_(MSIOF0_SS1,		IP14_3_0)
+#define GPSR5_18	F_(MSIOF0_SYNC,		IP13_31_28)
 #define GPSR5_17	FM(MSIOF0_SCK)
-#define GPSR5_16	F_(HRTS0_N,		IP12_27_24)
-#define GPSR5_15	F_(HCTS0_N,		IP12_23_20)
-#define GPSR5_14	F_(HTX0,		IP12_19_16)
-#define GPSR5_13	F_(HRX0,		IP12_15_12)
-#define GPSR5_12	F_(HSCK0,		IP12_11_8)
-#define GPSR5_11	F_(RX2_A,		IP12_7_4)
-#define GPSR5_10	F_(TX2_A,		IP12_3_0)
-#define GPSR5_9		F_(SCK2,		IP11_31_28)
-#define GPSR5_8		F_(RTS1_N_TANS,		IP11_27_24)
-#define GPSR5_7		F_(CTS1_N,		IP11_23_20)
-#define GPSR5_6		F_(TX1_A,		IP11_19_16)
-#define GPSR5_5		F_(RX1_A,		IP11_15_12)
-#define GPSR5_4		F_(RTS0_N_TANS,		IP11_11_8)
-#define GPSR5_3		F_(CTS0_N,		IP11_7_4)
-#define GPSR5_2		F_(TX0,			IP11_3_0)
-#define GPSR5_1		F_(RX0,			IP10_31_28)
-#define GPSR5_0		F_(SCK0,		IP10_27_24)
+#define GPSR5_16	F_(HRTS0_N,		IP13_27_24)
+#define GPSR5_15	F_(HCTS0_N,		IP13_23_20)
+#define GPSR5_14	F_(HTX0,		IP13_19_16)
+#define GPSR5_13	F_(HRX0,		IP13_15_12)
+#define GPSR5_12	F_(HSCK0,		IP13_11_8)
+#define GPSR5_11	F_(RX2_A,		IP13_7_4)
+#define GPSR5_10	F_(TX2_A,		IP13_3_0)
+#define GPSR5_9		F_(SCK2,		IP12_31_28)
+#define GPSR5_8		F_(RTS1_N_TANS,		IP12_27_24)
+#define GPSR5_7		F_(CTS1_N,		IP12_23_20)
+#define GPSR5_6		F_(TX1_A,		IP12_19_16)
+#define GPSR5_5		F_(RX1_A,		IP12_15_12)
+#define GPSR5_4		F_(RTS0_N_TANS,		IP12_11_8)
+#define GPSR5_3		F_(CTS0_N,		IP12_7_4)
+#define GPSR5_2		F_(TX0,			IP12_3_0)
+#define GPSR5_1		F_(RX0,			IP11_31_28)
+#define GPSR5_0		F_(SCK0,		IP11_27_24)
 
 /* GPSR6 */
-#define GPSR6_31	F_(USB31_OVC,		IP17_7_4)
-#define GPSR6_30	F_(USB31_PWEN,		IP17_3_0)
-#define GPSR6_29	F_(USB30_OVC,		IP16_31_28)
-#define GPSR6_28	F_(USB30_PWEN,		IP16_27_24)
-#define GPSR6_27	F_(USB1_OVC,		IP16_23_20)
-#define GPSR6_26	F_(USB1_PWEN,		IP16_19_16)
-#define GPSR6_25	F_(USB0_OVC,		IP16_15_12)
-#define GPSR6_24	F_(USB0_PWEN,		IP16_11_8)
-#define GPSR6_23	F_(AUDIO_CLKB_B,	IP16_7_4)
-#define GPSR6_22	F_(AUDIO_CLKA_A,	IP16_3_0)
-#define GPSR6_21	F_(SSI_SDATA9_A,	IP15_31_28)
-#define GPSR6_20	F_(SSI_SDATA8,		IP15_27_24)
-#define GPSR6_19	F_(SSI_SDATA7,		IP15_23_20)
-#define GPSR6_18	F_(SSI_WS78,		IP15_19_16)
-#define GPSR6_17	F_(SSI_SCK78,		IP15_15_12)
-#define GPSR6_16	F_(SSI_SDATA6,		IP15_11_8)
-#define GPSR6_15	F_(SSI_WS6,		IP15_7_4)
-#define GPSR6_14	F_(SSI_SCK6,		IP15_3_0)
+#define GPSR6_31	F_(USB3_OVC,		IP18_7_4)
+#define GPSR6_30	F_(USB3_PWEN,		IP18_3_0)
+#define GPSR6_29	F_(USB30_OVC,		IP17_31_28)
+#define GPSR6_28	F_(USB30_PWEN,		IP17_27_24)
+#define GPSR6_27	F_(USB1_OVC,		IP17_23_20)
+#define GPSR6_26	F_(USB1_PWEN,		IP17_19_16)
+#define GPSR6_25	F_(USB0_OVC,		IP17_15_12)
+#define GPSR6_24	F_(USB0_PWEN,		IP17_11_8)
+#define GPSR6_23	F_(AUDIO_CLKB_B,	IP17_7_4)
+#define GPSR6_22	F_(AUDIO_CLKA_A,	IP17_3_0)
+#define GPSR6_21	F_(SSI_SDATA9_A,	IP16_31_28)
+#define GPSR6_20	F_(SSI_SDATA8,		IP16_27_24)
+#define GPSR6_19	F_(SSI_SDATA7,		IP16_23_20)
+#define GPSR6_18	F_(SSI_WS78,		IP16_19_16)
+#define GPSR6_17	F_(SSI_SCK78,		IP16_15_12)
+#define GPSR6_16	F_(SSI_SDATA6,		IP16_11_8)
+#define GPSR6_15	F_(SSI_WS6,		IP16_7_4)
+#define GPSR6_14	F_(SSI_SCK6,		IP16_3_0)
 #define GPSR6_13	FM(SSI_SDATA5)
 #define GPSR6_12	FM(SSI_WS5)
 #define GPSR6_11	FM(SSI_SCK5)
-#define GPSR6_10	F_(SSI_SDATA4,		IP14_31_28)
-#define GPSR6_9		F_(SSI_WS4,		IP14_27_24)
-#define GPSR6_8		F_(SSI_SCK4,		IP14_23_20)
-#define GPSR6_7		F_(SSI_SDATA3,		IP14_19_16)
-#define GPSR6_6		F_(SSI_WS34,		IP14_15_12)
-#define GPSR6_5		F_(SSI_SCK34,		IP14_11_8)
-#define GPSR6_4		F_(SSI_SDATA2_A,	IP14_7_4)
-#define GPSR6_3		F_(SSI_SDATA1_A,	IP14_3_0)
-#define GPSR6_2		F_(SSI_SDATA0,		IP13_31_28)
-#define GPSR6_1		F_(SSI_WS01239,		IP13_27_24)
-#define GPSR6_0		F_(SSI_SCK01239,	IP13_23_20)
+#define GPSR6_10	F_(SSI_SDATA4,		IP15_31_28)
+#define GPSR6_9		F_(SSI_WS4,		IP15_27_24)
+#define GPSR6_8		F_(SSI_SCK4,		IP15_23_20)
+#define GPSR6_7		F_(SSI_SDATA3,		IP15_19_16)
+#define GPSR6_6		F_(SSI_WS34,		IP15_15_12)
+#define GPSR6_5		F_(SSI_SCK34,		IP15_11_8)
+#define GPSR6_4		F_(SSI_SDATA2_A,	IP15_7_4)
+#define GPSR6_3		F_(SSI_SDATA1_A,	IP15_3_0)
+#define GPSR6_2		F_(SSI_SDATA0,		IP14_31_28)
+#define GPSR6_1		F_(SSI_WS01239,		IP14_27_24)
+#define GPSR6_0		F_(SSI_SCK01239,		IP14_23_20)
 
 /* GPSR7 */
 #define GPSR7_3		FM(HDMI1_CEC)
@@ -212,14 +213,14 @@
 #define IP0_7_4		FM(AVB_MAGIC)		F_(0, 0)	FM(MSIOF2_SS1_C)	FM(SCK4_A)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_11_8	FM(AVB_PHY_INT)		F_(0, 0)	FM(MSIOF2_SYNC_C)	FM(RX4_A)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_15_12	FM(AVB_LINK)		F_(0, 0)	FM(MSIOF2_SCK_C)	FM(TX4_A)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0_19_16	FM(AVB_AVTP_MATCH_A)	F_(0, 0)	FM(MSIOF2_RXD_C)	FM(CTS4_N_A)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0_19_16	FM(AVB_AVTP_MATCH_A)	F_(0, 0)	FM(MSIOF2_RXD_C)	FM(CTS4_N_A)			F_(0, 0)	FM(FSCLKST2_N_A) F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_23_20	FM(AVB_AVTP_CAPTURE_A)	F_(0, 0)	FM(MSIOF2_TXD_C)	FM(RTS4_N_TANS_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0_27_24	FM(IRQ0)		FM(QPOLB)	F_(0, 0)		FM(DU_CDE)			FM(VI4_DATA0_B)	FM(CAN0_TX_B)	FM(CANFD0_TX_B)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0_31_28	FM(IRQ1)		FM(QPOLA)	F_(0, 0)		FM(DU_DISP)			FM(VI4_DATA1_B)	FM(CAN0_RX_B)	FM(CANFD0_RX_B)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1_3_0		FM(IRQ2)		FM(QCPV_QDE)	F_(0, 0)		FM(DU_EXODDF_DU_ODDF_DISP_CDE)	FM(VI4_DATA2_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		FM(PWM3_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1_7_4		FM(IRQ3)		FM(QSTVB_QVE)	FM(A25)			FM(DU_DOTCLKOUT1)		FM(VI4_DATA3_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		FM(PWM4_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1_11_8	FM(IRQ4)		FM(QSTH_QHS)	FM(A24)			FM(DU_EXHSYNC_DU_HSYNC)		FM(VI4_DATA4_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		FM(PWM5_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1_15_12	FM(IRQ5)		FM(QSTB_QHE)	FM(A23)			FM(DU_EXVSYNC_DU_VSYNC)		FM(VI4_DATA5_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		FM(PWM6_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0_27_24	FM(IRQ0)		FM(QPOLB)	F_(0, 0)		FM(DU_CDE)			FM(VI4_DATA0_B) FM(CAN0_TX_B)	FM(CANFD0_TX_B)		FM(MSIOF3_SS1_E) F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0_31_28	FM(IRQ1)		FM(QPOLA)	F_(0, 0)		FM(DU_DISP)			FM(VI4_DATA1_B) FM(CAN0_RX_B)	FM(CANFD0_RX_B)		FM(MSIOF3_SS2_E) F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1_3_0		FM(IRQ2)		FM(QCPV_QDE)	F_(0, 0)		FM(DU_EXODDF_DU_ODDF_DISP_CDE)	FM(VI4_DATA2_B) F_(0, 0)	F_(0, 0)		FM(MSIOF3_SYNC_E) F_(0, 0)		FM(PWM3_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1_7_4		FM(IRQ3)		FM(QSTVB_QVE)	FM(A25)			FM(DU_DOTCLKOUT1)		FM(VI4_DATA3_B) F_(0, 0)	F_(0, 0)		FM(MSIOF3_SCK_E) F_(0, 0)		FM(PWM4_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1_11_8	FM(IRQ4)		FM(QSTH_QHS)	FM(A24)			FM(DU_EXHSYNC_DU_HSYNC)		FM(VI4_DATA4_B) F_(0, 0)	F_(0, 0)		FM(MSIOF3_RXD_E) F_(0, 0)		FM(PWM5_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1_15_12	FM(IRQ5)		FM(QSTB_QHE)	FM(A23)			FM(DU_EXVSYNC_DU_VSYNC)		FM(VI4_DATA5_B) FM(FSCLKST2_N_B) F_(0, 0)		FM(MSIOF3_TXD_E) F_(0, 0)		FM(PWM6_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1_19_16	FM(PWM0)		FM(AVB_AVTP_PPS)FM(A22)			F_(0, 0)			FM(VI4_DATA6_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		FM(IECLK_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1_23_20	FM(PWM1_A)		F_(0, 0)	FM(A21)			FM(HRX3_D)			FM(VI4_DATA7_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		FM(IERX_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1_27_24	FM(PWM2_A)		F_(0, 0)	FM(A20)			FM(HTX3_D)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		FM(IETX_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -279,79 +280,89 @@
 #define IP8_3_0		FM(SD0_DAT2)		F_(0, 0)	FM(MSIOF1_SS1_E)	F_(0, 0)			F_(0, 0)	FM(TS_SDAT0_B)	FM(STP_ISD_0_B)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP8_7_4		FM(SD0_DAT3)		F_(0, 0)	FM(MSIOF1_SS2_E)	F_(0, 0)			F_(0, 0)	FM(TS_SDEN0_B)	FM(STP_ISEN_0_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP8_11_8	FM(SD1_CLK)		F_(0, 0)	FM(MSIOF1_SCK_G)	F_(0, 0)			F_(0, 0)	FM(SIM0_CLK_A)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP8_15_12	FM(SD1_CMD)		F_(0, 0)	FM(MSIOF1_SYNC_G)	F_(0, 0)			F_(0, 0)	FM(SIM0_D_A)	FM(STP_IVCXO27_1_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP8_19_16	FM(SD1_DAT0)		FM(SD2_DAT4)	FM(MSIOF1_RXD_G)	F_(0, 0)			F_(0, 0)	FM(TS_SCK1_B)	FM(STP_ISCLK_1_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP8_23_20	FM(SD1_DAT1)		FM(SD2_DAT5)	FM(MSIOF1_TXD_G)	F_(0, 0)			F_(0, 0)	FM(TS_SPSYNC1_B)FM(STP_ISSYNC_1_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP8_27_24	FM(SD1_DAT2)		FM(SD2_DAT6)	FM(MSIOF1_SS1_G)	F_(0, 0)			F_(0, 0)	FM(TS_SDAT1_B)	FM(STP_ISD_1_B)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP8_31_28	FM(SD1_DAT3)		FM(SD2_DAT7)	FM(MSIOF1_SS2_G)	F_(0, 0)			F_(0, 0)	FM(TS_SDEN1_B)	FM(STP_ISEN_1_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP9_3_0		FM(SD2_CLK)		F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP9_7_4		FM(SD2_DAT0)		F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP9_11_8	FM(SD2_DAT1)		F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP9_15_12	FM(SD2_DAT2)		F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP9_19_16	FM(SD2_DAT3)		F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP9_23_20	FM(SD2_DS)		F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	FM(SATA_DEVSLP_B)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP9_27_24	FM(SD3_DAT4)		FM(SD2_CD_A)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP9_31_28	FM(SD3_DAT5)		FM(SD2_WP_A)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP10_3_0	FM(SD3_DAT6)		FM(SD3_CD)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP10_7_4	FM(SD3_DAT7)		FM(SD3_WP)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP10_11_8	FM(SD0_CD)		F_(0, 0)	F_(0, 0)		F_(0, 0)			FM(SCL2_B)	FM(SIM0_RST_A)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP10_15_12	FM(SD0_WP)		F_(0, 0)	F_(0, 0)		F_(0, 0)			FM(SDA2_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP10_19_16	FM(SD1_CD)		F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(SIM0_CLK_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP10_23_20	FM(SD1_WP)		F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(SIM0_D_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP10_27_24	FM(SCK0)		FM(HSCK1_B)	FM(MSIOF1_SS2_B)	FM(AUDIO_CLKC_B)		FM(SDA2_A)	FM(SIM0_RST_B)	FM(STP_OPWM_0_C)	FM(RIF0_CLK_B)	F_(0, 0)		FM(ADICHS2)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP10_31_28	FM(RX0)			FM(HRX1_B)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(TS_SCK0_C)	FM(STP_ISCLK_0_C)	FM(RIF0_D0_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP11_3_0	FM(TX0)			FM(HTX1_B)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(TS_SPSYNC0_C)FM(STP_ISSYNC_0_C)	FM(RIF0_D1_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP11_7_4	FM(CTS0_N)		FM(HCTS1_N_B)	FM(MSIOF1_SYNC_B)	F_(0, 0)			F_(0, 0)	FM(TS_SPSYNC1_C)FM(STP_ISSYNC_1_C)	FM(RIF1_SYNC_B)	FM(AUDIO_CLKOUT_C)	FM(ADICS_SAMP)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP11_11_8	FM(RTS0_N_TANS)		FM(HRTS1_N_B)	FM(MSIOF1_SS1_B)	FM(AUDIO_CLKA_B)		FM(SCL2_A)	F_(0, 0)	FM(STP_IVCXO27_1_C)	FM(RIF0_SYNC_B)	F_(0, 0)		FM(ADICHS1)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP11_15_12	FM(RX1_A)		FM(HRX1_A)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(TS_SDAT0_C)	FM(STP_ISD_0_C)		FM(RIF1_CLK_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP11_19_16	FM(TX1_A)		FM(HTX1_A)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(TS_SDEN0_C)	FM(STP_ISEN_0_C)	FM(RIF1_D0_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP11_23_20	FM(CTS1_N)		FM(HCTS1_N_A)	FM(MSIOF1_RXD_B)	F_(0, 0)			F_(0, 0)	FM(TS_SDEN1_C)	FM(STP_ISEN_1_C)	FM(RIF1_D0_B)	F_(0, 0)		FM(ADIDATA)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP11_27_24	FM(RTS1_N_TANS)		FM(HRTS1_N_A)	FM(MSIOF1_TXD_B)	F_(0, 0)			F_(0, 0)	FM(TS_SDAT1_C)	FM(STP_ISD_1_C)		FM(RIF1_D1_B)	F_(0, 0)		FM(ADICHS0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP11_31_28	FM(SCK2)		FM(SCIF_CLK_B)	FM(MSIOF1_SCK_B)	F_(0, 0)			F_(0, 0)	FM(TS_SCK1_C)	FM(STP_ISCLK_1_C)	FM(RIF1_CLK_B)	F_(0, 0)		FM(ADICLK)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP12_3_0	FM(TX2_A)		F_(0, 0)	F_(0, 0)		FM(SD2_CD_B)			FM(SCL1_A)	F_(0, 0)	FM(FMCLK_A)		FM(RIF1_D1_C)	F_(0, 0)		FM(FSO_CFE_0_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP12_7_4	FM(RX2_A)		F_(0, 0)	F_(0, 0)		FM(SD2_WP_B)			FM(SDA1_A)	F_(0, 0)	FM(FMIN_A)		FM(RIF1_SYNC_C)	F_(0, 0)		FM(FSO_CFE_1_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP12_11_8	FM(HSCK0)		F_(0, 0)	FM(MSIOF1_SCK_D)	FM(AUDIO_CLKB_A)		FM(SSI_SDATA1_B)FM(TS_SCK0_D)	FM(STP_ISCLK_0_D)	FM(RIF0_CLK_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP12_15_12	FM(HRX0)		F_(0, 0)	FM(MSIOF1_RXD_D)	F_(0, 0)			FM(SSI_SDATA2_B)FM(TS_SDEN0_D)	FM(STP_ISEN_0_D)	FM(RIF0_D0_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP12_19_16	FM(HTX0)		F_(0, 0)	FM(MSIOF1_TXD_D)	F_(0, 0)			FM(SSI_SDATA9_B)FM(TS_SDAT0_D)	FM(STP_ISD_0_D)		FM(RIF0_D1_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP12_23_20	FM(HCTS0_N)		FM(RX2_B)	FM(MSIOF1_SYNC_D)	F_(0, 0)			FM(SSI_SCK9_A)	FM(TS_SPSYNC0_D)FM(STP_ISSYNC_0_D)	FM(RIF0_SYNC_C)	FM(AUDIO_CLKOUT1_A)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP12_27_24	FM(HRTS0_N)		FM(TX2_B)	FM(MSIOF1_SS1_D)	F_(0, 0)			FM(SSI_WS9_A)	F_(0, 0)	FM(STP_IVCXO27_0_D)	FM(BPFCLK_A)	FM(AUDIO_CLKOUT2_A)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP8_15_12	FM(SD1_CMD)		F_(0, 0)	FM(MSIOF1_SYNC_G)	FM(NFCE_N_B)			F_(0, 0)	FM(SIM0_D_A)	FM(STP_IVCXO27_1_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP8_19_16	FM(SD1_DAT0)		FM(SD2_DAT4)	FM(MSIOF1_RXD_G)	FM(NFWP_N_B)			F_(0, 0)	FM(TS_SCK1_B)	FM(STP_ISCLK_1_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP8_23_20	FM(SD1_DAT1)		FM(SD2_DAT5)	FM(MSIOF1_TXD_G)	FM(NFDATA14_B)			F_(0, 0)	FM(TS_SPSYNC1_B)FM(STP_ISSYNC_1_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP8_27_24	FM(SD1_DAT2)		FM(SD2_DAT6)	FM(MSIOF1_SS1_G)	FM(NFDATA15_B)			F_(0, 0)	FM(TS_SDAT1_B)	FM(STP_ISD_1_B)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP8_31_28	FM(SD1_DAT3)		FM(SD2_DAT7)	FM(MSIOF1_SS2_G)	FM(NFRB_N_B)			F_(0, 0)	FM(TS_SDEN1_B)	FM(STP_ISEN_1_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP9_3_0		FM(SD2_CLK)		F_(0, 0)	F_(0, 0)		FM(NFDATA8)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP9_7_4		FM(SD2_CMD)		F_(0, 0)	F_(0, 0)		FM(NFDATA9)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP9_11_8	FM(SD2_DAT0)		F_(0, 0)	F_(0, 0)		FM(NFDATA10)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP9_15_12	FM(SD2_DAT1)		F_(0, 0)	F_(0, 0)		FM(NFDATA11)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP9_19_16	FM(SD2_DAT2)		F_(0, 0)	F_(0, 0)		FM(NFDATA12)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP9_23_20	FM(SD2_DAT3)		F_(0, 0)	F_(0, 0)		FM(NFDATA13)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP9_27_24	FM(SD2_DS)		F_(0, 0)	F_(0, 0)		FM(NFALE)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	FM(SATA_DEVSLP_B)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP9_31_28	FM(SD3_CLK)		F_(0, 0)	F_(0, 0)		FM(NFWE_N)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP10_3_0	FM(SD3_CMD)		F_(0, 0)	F_(0, 0)		FM(NFRE_N)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP10_7_4	FM(SD3_DAT0)		F_(0, 0)	F_(0, 0)		FM(NFDATA0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP10_11_8	FM(SD3_DAT1)		F_(0, 0)	F_(0, 0)		FM(NFDATA1)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP10_15_12	FM(SD3_DAT2)		F_(0, 0)	F_(0, 0)		FM(NFDATA2)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP10_19_16	FM(SD3_DAT3)		F_(0, 0)	F_(0, 0)		FM(NFDATA3)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP10_23_20	FM(SD3_DAT4)		FM(SD2_CD_A)	F_(0, 0)		FM(NFDATA4)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP10_27_24	FM(SD3_DAT5)		FM(SD2_WP_A)	F_(0, 0)		FM(NFDATA5)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP10_31_28	FM(SD3_DAT6)		FM(SD3_CD)	F_(0, 0)		FM(NFDATA6)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP11_3_0	FM(SD3_DAT7)		FM(SD3_WP)	F_(0, 0)		FM(NFDATA7)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP11_7_4	FM(SD3_DS)		F_(0, 0)	F_(0, 0)		FM(NFCLE)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP11_11_8	FM(SD0_CD)		F_(0, 0)	FM(NFDATA14_A)		F_(0, 0)			FM(SCL2_B)	FM(SIM0_RST_A)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IPSRx */		/* 0 */			/* 1 */		/* 2 */			/* 3 */				/* 4 */		/* 5 */		/* 6 */			/* 7 */		/* 8 */			/* 9 */		/* A */		/* B */		/* C - F */
-#define IP12_31_28	FM(MSIOF0_SYNC)		F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	FM(AUDIO_CLKOUT_A)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP13_3_0	FM(MSIOF0_SS1)		FM(RX5)		F_(0, 0)		FM(AUDIO_CLKA_C)		FM(SSI_SCK2_A)	F_(0, 0)	FM(STP_IVCXO27_0_C)	F_(0, 0)	FM(AUDIO_CLKOUT3_A)	F_(0, 0)	FM(TCLK1_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP13_7_4	FM(MSIOF0_SS2)		FM(TX5)		FM(MSIOF1_SS2_D)	FM(AUDIO_CLKC_A)		FM(SSI_WS2_A)	F_(0, 0)	FM(STP_OPWM_0_D)	F_(0, 0)	FM(AUDIO_CLKOUT_D)	F_(0, 0)	FM(SPEEDIN_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP13_11_8	FM(MLB_CLK)		F_(0, 0)	FM(MSIOF1_SCK_F)	F_(0, 0)			FM(SCL1_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP13_15_12	FM(MLB_SIG)		FM(RX1_B)	FM(MSIOF1_SYNC_F)	F_(0, 0)			FM(SDA1_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP13_19_16	FM(MLB_DAT)		FM(TX1_B)	FM(MSIOF1_RXD_F)	F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP13_23_20	FM(SSI_SCK01239)	F_(0, 0)	FM(MSIOF1_TXD_F)	F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP13_27_24	FM(SSI_WS01239)		F_(0, 0)	FM(MSIOF1_SS1_F)	F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP13_31_28	FM(SSI_SDATA0)		F_(0, 0)	FM(MSIOF1_SS2_F)	F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP14_3_0	FM(SSI_SDATA1_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP14_7_4	FM(SSI_SDATA2_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)			FM(SSI_SCK1_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP14_11_8	FM(SSI_SCK34)		F_(0, 0)	FM(MSIOF1_SS1_A)	F_(0, 0)			F_(0, 0)	F_(0, 0)	FM(STP_OPWM_0_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP14_15_12	FM(SSI_WS34)		FM(HCTS2_N_A)	FM(MSIOF1_SS2_A)	F_(0, 0)			F_(0, 0)	F_(0, 0)	FM(STP_IVCXO27_0_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP14_19_16	FM(SSI_SDATA3)		FM(HRTS2_N_A)	FM(MSIOF1_TXD_A)	F_(0, 0)			F_(0, 0)	FM(TS_SCK0_A)	FM(STP_ISCLK_0_A)	FM(RIF0_D1_A)	FM(RIF2_D0_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP14_23_20	FM(SSI_SCK4)		FM(HRX2_A)	FM(MSIOF1_SCK_A)	F_(0, 0)			F_(0, 0)	FM(TS_SDAT0_A)	FM(STP_ISD_0_A)		FM(RIF0_CLK_A)	FM(RIF2_CLK_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP14_27_24	FM(SSI_WS4)		FM(HTX2_A)	FM(MSIOF1_SYNC_A)	F_(0, 0)			F_(0, 0)	FM(TS_SDEN0_A)	FM(STP_ISEN_0_A)	FM(RIF0_SYNC_A)	FM(RIF2_SYNC_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP14_31_28	FM(SSI_SDATA4)		FM(HSCK2_A)	FM(MSIOF1_RXD_A)	F_(0, 0)			F_(0, 0)	FM(TS_SPSYNC0_A)FM(STP_ISSYNC_0_A)	FM(RIF0_D0_A)	FM(RIF2_D1_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP15_3_0	FM(SSI_SCK6)		FM(USB2_PWEN)	F_(0, 0)		FM(SIM0_RST_D)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP15_7_4	FM(SSI_WS6)		FM(USB2_OVC)	F_(0, 0)		FM(SIM0_D_D)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP15_11_8	FM(SSI_SDATA6)		F_(0, 0)	F_(0, 0)		FM(SIM0_CLK_D)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	FM(SATA_DEVSLP_A)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP15_15_12	FM(SSI_SCK78)		FM(HRX2_B)	FM(MSIOF1_SCK_C)	F_(0, 0)			F_(0, 0)	FM(TS_SCK1_A)	FM(STP_ISCLK_1_A)	FM(RIF1_CLK_A)	FM(RIF3_CLK_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP15_19_16	FM(SSI_WS78)		FM(HTX2_B)	FM(MSIOF1_SYNC_C)	F_(0, 0)			F_(0, 0)	FM(TS_SDAT1_A)	FM(STP_ISD_1_A)		FM(RIF1_SYNC_A)	FM(RIF3_SYNC_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP15_23_20	FM(SSI_SDATA7)		FM(HCTS2_N_B)	FM(MSIOF1_RXD_C)	F_(0, 0)			F_(0, 0)	FM(TS_SDEN1_A)	FM(STP_ISEN_1_A)	FM(RIF1_D0_A)	FM(RIF3_D0_A)		F_(0, 0)	FM(TCLK2_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP15_27_24	FM(SSI_SDATA8)		FM(HRTS2_N_B)	FM(MSIOF1_TXD_C)	F_(0, 0)			F_(0, 0)	FM(TS_SPSYNC1_A)FM(STP_ISSYNC_1_A)	FM(RIF1_D1_A)	FM(RIF3_D1_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP15_31_28	FM(SSI_SDATA9_A)	FM(HSCK2_B)	FM(MSIOF1_SS1_C)	FM(HSCK1_A)			FM(SSI_WS1_B)	FM(SCK1)	FM(STP_IVCXO27_1_A)	FM(SCK5)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP16_3_0	FM(AUDIO_CLKA_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	FM(CC5_OSCOUT)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP16_7_4	FM(AUDIO_CLKB_B)	FM(SCIF_CLK_A)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	FM(STP_IVCXO27_1_D)	FM(REMOCON_A)	F_(0, 0)		F_(0, 0)	FM(TCLK1_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP16_11_8	FM(USB0_PWEN)		F_(0, 0)	F_(0, 0)		FM(SIM0_RST_C)			F_(0, 0)	FM(TS_SCK1_D)	FM(STP_ISCLK_1_D)	FM(BPFCLK_B)	FM(RIF3_CLK_B)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP16_15_12	FM(USB0_OVC)		F_(0, 0)	F_(0, 0)		FM(SIM0_D_C)			F_(0, 0)	FM(TS_SDAT1_D)	FM(STP_ISD_1_D)		F_(0, 0)	FM(RIF3_SYNC_B)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP16_19_16	FM(USB1_PWEN)		F_(0, 0)	F_(0, 0)		FM(SIM0_CLK_C)			FM(SSI_SCK1_A)	FM(TS_SCK0_E)	FM(STP_ISCLK_0_E)	FM(FMCLK_B)	FM(RIF2_CLK_B)		F_(0, 0)	FM(SPEEDIN_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP16_23_20	FM(USB1_OVC)		F_(0, 0)	FM(MSIOF1_SS2_C)	F_(0, 0)			FM(SSI_WS1_A)	FM(TS_SDAT0_E)	FM(STP_ISD_0_E)		FM(FMIN_B)	FM(RIF2_SYNC_B)		F_(0, 0)	FM(REMOCON_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP16_27_24	FM(USB30_PWEN)		F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT_B)		FM(SSI_SCK2_B)	FM(TS_SDEN1_D)	FM(STP_ISEN_1_D)	FM(STP_OPWM_0_E)FM(RIF3_D0_B)		F_(0, 0)	FM(TCLK2_B)	FM(TPU0TO0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP16_31_28	FM(USB30_OVC)		F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT1_B)		FM(SSI_WS2_B)	FM(TS_SPSYNC1_D)FM(STP_ISSYNC_1_D)	FM(STP_IVCXO27_0_E)FM(RIF3_D1_B)	F_(0, 0)	FM(FSO_TOE_B)	FM(TPU0TO1)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP17_3_0	FM(USB31_PWEN)		F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT2_B)		FM(SSI_SCK9_B)	FM(TS_SDEN0_E)	FM(STP_ISEN_0_E)	F_(0, 0)	FM(RIF2_D0_B)		F_(0, 0)	F_(0, 0)	FM(TPU0TO2)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP17_7_4	FM(USB31_OVC)		F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT3_B)		FM(SSI_WS9_B)	FM(TS_SPSYNC0_E)FM(STP_ISSYNC_0_E)	F_(0, 0)	FM(RIF2_D1_B)		F_(0, 0)	F_(0, 0)	FM(TPU0TO3)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP11_15_12	FM(SD0_WP)		F_(0, 0)	FM(NFDATA15_A)		F_(0, 0)			FM(SDA2_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP11_19_16	FM(SD1_CD)		F_(0, 0)	FM(NFRB_N_A)		F_(0, 0)			F_(0, 0)	FM(SIM0_CLK_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP11_23_20	FM(SD1_WP)		F_(0, 0)	FM(NFCE_N_A)		F_(0, 0)			F_(0, 0)	FM(SIM0_D_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP11_27_24	FM(SCK0)		FM(HSCK1_B)	FM(MSIOF1_SS2_B)	FM(AUDIO_CLKC_B)		FM(SDA2_A)	FM(SIM0_RST_B)	FM(STP_OPWM_0_C)	FM(RIF0_CLK_B)	F_(0, 0)		FM(ADICHS2)	FM(SCK5_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP11_31_28	FM(RX0)			FM(HRX1_B)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(TS_SCK0_C)	FM(STP_ISCLK_0_C)	FM(RIF0_D0_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP12_3_0	FM(TX0)			FM(HTX1_B)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(TS_SPSYNC0_C)FM(STP_ISSYNC_0_C)	FM(RIF0_D1_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP12_7_4	FM(CTS0_N)		FM(HCTS1_N_B)	FM(MSIOF1_SYNC_B)	F_(0, 0)			F_(0, 0)	FM(TS_SPSYNC1_C)FM(STP_ISSYNC_1_C)	FM(RIF1_SYNC_B)	FM(AUDIO_CLKOUT_C)	FM(ADICS_SAMP)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP12_11_8	FM(RTS0_N_TANS)		FM(HRTS1_N_B)	FM(MSIOF1_SS1_B)	FM(AUDIO_CLKA_B)		FM(SCL2_A)	F_(0, 0)	FM(STP_IVCXO27_1_C)	FM(RIF0_SYNC_B)	F_(0, 0)		FM(ADICHS1)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP12_15_12	FM(RX1_A)		FM(HRX1_A)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(TS_SDAT0_C)	FM(STP_ISD_0_C)		FM(RIF1_CLK_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP12_19_16	FM(TX1_A)		FM(HTX1_A)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(TS_SDEN0_C)	FM(STP_ISEN_0_C)	FM(RIF1_D0_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP12_23_20	FM(CTS1_N)		FM(HCTS1_N_A)	FM(MSIOF1_RXD_B)	F_(0, 0)			F_(0, 0)	FM(TS_SDEN1_C)	FM(STP_ISEN_1_C)	FM(RIF1_D0_B)	F_(0, 0)		FM(ADIDATA)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP12_27_24	FM(RTS1_N_TANS)		FM(HRTS1_N_A)	FM(MSIOF1_TXD_B)	F_(0, 0)			F_(0, 0)	FM(TS_SDAT1_C)	FM(STP_ISD_1_C)		FM(RIF1_D1_B)	F_(0, 0)		FM(ADICHS0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP12_31_28	FM(SCK2)		FM(SCIF_CLK_B)	FM(MSIOF1_SCK_B)	F_(0, 0)			F_(0, 0)	FM(TS_SCK1_C)	FM(STP_ISCLK_1_C)	FM(RIF1_CLK_B)	F_(0, 0)		FM(ADICLK)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP13_3_0	FM(TX2_A)		F_(0, 0)	F_(0, 0)		FM(SD2_CD_B)			FM(SCL1_A)	F_(0, 0)	FM(FMCLK_A)		FM(RIF1_D1_C)	F_(0, 0)		FM(FSO_CFE_0_N)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP13_7_4	FM(RX2_A)		F_(0, 0)	F_(0, 0)		FM(SD2_WP_B)			FM(SDA1_A)	F_(0, 0)	FM(FMIN_A)		FM(RIF1_SYNC_C)	F_(0, 0)		FM(FSO_CFE_1_N)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP13_11_8	FM(HSCK0)		F_(0, 0)	FM(MSIOF1_SCK_D)	FM(AUDIO_CLKB_A)		FM(SSI_SDATA1_B)FM(TS_SCK0_D)	FM(STP_ISCLK_0_D)	FM(RIF0_CLK_C)	F_(0, 0)		F_(0, 0)	FM(RX5_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP13_15_12	FM(HRX0)		F_(0, 0)	FM(MSIOF1_RXD_D)	F_(0, 0)			FM(SSI_SDATA2_B)FM(TS_SDEN0_D)	FM(STP_ISEN_0_D)	FM(RIF0_D0_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP13_19_16	FM(HTX0)		F_(0, 0)	FM(MSIOF1_TXD_D)	F_(0, 0)			FM(SSI_SDATA9_B)FM(TS_SDAT0_D)	FM(STP_ISD_0_D)		FM(RIF0_D1_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP13_23_20	FM(HCTS0_N)		FM(RX2_B)	FM(MSIOF1_SYNC_D)	F_(0, 0)			FM(SSI_SCK9_A)	FM(TS_SPSYNC0_D)FM(STP_ISSYNC_0_D)	FM(RIF0_SYNC_C)	FM(AUDIO_CLKOUT1_A)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP13_27_24	FM(HRTS0_N)		FM(TX2_B)	FM(MSIOF1_SS1_D)	F_(0, 0)			FM(SSI_WS9_A)	F_(0, 0)	FM(STP_IVCXO27_0_D)	FM(BPFCLK_A)	FM(AUDIO_CLKOUT2_A)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP13_31_28	FM(MSIOF0_SYNC)		F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	FM(AUDIO_CLKOUT_A)	F_(0, 0)	FM(TX5_B)	F_(0, 0)	F_(0, 0) FM(BPFCLK_D) F_(0, 0) F_(0, 0)
+#define IP14_3_0	FM(MSIOF0_SS1)		FM(RX5_A)	FM(NFWP_N_A)		FM(AUDIO_CLKA_C)		FM(SSI_SCK2_A)	F_(0, 0)	FM(STP_IVCXO27_0_C)	F_(0, 0)	FM(AUDIO_CLKOUT3_A)	F_(0, 0)	FM(TCLK1_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP14_7_4	FM(MSIOF0_SS2)		FM(TX5_A)	FM(MSIOF1_SS2_D)	FM(AUDIO_CLKC_A)		FM(SSI_WS2_A)	F_(0, 0)	FM(STP_OPWM_0_D)	F_(0, 0)	FM(AUDIO_CLKOUT_D)	F_(0, 0)	FM(SPEEDIN_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP14_11_8	FM(MLB_CLK)		F_(0, 0)	FM(MSIOF1_SCK_F)	F_(0, 0)			FM(SCL1_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP14_15_12	FM(MLB_SIG)		FM(RX1_B)	FM(MSIOF1_SYNC_F)	F_(0, 0)			FM(SDA1_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP14_19_16	FM(MLB_DAT)		FM(TX1_B)	FM(MSIOF1_RXD_F)	F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP14_23_20	FM(SSI_SCK01239)	F_(0, 0)	FM(MSIOF1_TXD_F)	F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP14_27_24	FM(SSI_WS01239)		F_(0, 0)	FM(MSIOF1_SS1_F)	F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+
+/* IPSRx */		/* 0 */			/* 1 */		/* 2 */			/* 3 */				/* 4 */		/* 5 */		/* 6 */			/* 7 */		/* 8 */			/* 9 */		/* A */		/* B */		/* C - F */
+#define IP14_31_28	FM(SSI_SDATA0)		F_(0, 0)	FM(MSIOF1_SS2_F)	F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP15_3_0	FM(SSI_SDATA1_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP15_7_4	FM(SSI_SDATA2_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)			FM(SSI_SCK1_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP15_11_8	FM(SSI_SCK34)		F_(0, 0)	FM(MSIOF1_SS1_A)	F_(0, 0)			F_(0, 0)	F_(0, 0)	FM(STP_OPWM_0_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP15_15_12	FM(SSI_WS34)		FM(HCTS2_N_A)	FM(MSIOF1_SS2_A)	F_(0, 0)			F_(0, 0)	F_(0, 0)	FM(STP_IVCXO27_0_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP15_19_16	FM(SSI_SDATA3)		FM(HRTS2_N_A)	FM(MSIOF1_TXD_A)	F_(0, 0)			F_(0, 0)	FM(TS_SCK0_A)	FM(STP_ISCLK_0_A)	FM(RIF0_D1_A)	FM(RIF2_D0_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP15_23_20	FM(SSI_SCK4)		FM(HRX2_A)	FM(MSIOF1_SCK_A)	F_(0, 0)			F_(0, 0)	FM(TS_SDAT0_A)	FM(STP_ISD_0_A)		FM(RIF0_CLK_A)	FM(RIF2_CLK_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP15_27_24	FM(SSI_WS4)		FM(HTX2_A)	FM(MSIOF1_SYNC_A)	F_(0, 0)			F_(0, 0)	FM(TS_SDEN0_A)	FM(STP_ISEN_0_A)	FM(RIF0_SYNC_A)	FM(RIF2_SYNC_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP15_31_28	FM(SSI_SDATA4)		FM(HSCK2_A)	FM(MSIOF1_RXD_A)	F_(0, 0)			F_(0, 0)	FM(TS_SPSYNC0_A)FM(STP_ISSYNC_0_A)	FM(RIF0_D0_A)	FM(RIF2_D1_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP16_3_0	FM(SSI_SCK6)		FM(USB2_PWEN)	F_(0, 0)		FM(SIM0_RST_D)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP16_7_4	FM(SSI_WS6)		FM(USB2_OVC)	F_(0, 0)		FM(SIM0_D_D)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP16_11_8	FM(SSI_SDATA6)		F_(0, 0)	F_(0, 0)		FM(SIM0_CLK_D)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	FM(SATA_DEVSLP_A)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP16_15_12	FM(SSI_SCK78)		FM(HRX2_B)	FM(MSIOF1_SCK_C)	F_(0, 0)			F_(0, 0)	FM(TS_SCK1_A)	FM(STP_ISCLK_1_A)	FM(RIF1_CLK_A)	FM(RIF3_CLK_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP16_19_16	FM(SSI_WS78)		FM(HTX2_B)	FM(MSIOF1_SYNC_C)	F_(0, 0)			F_(0, 0)	FM(TS_SDAT1_A)	FM(STP_ISD_1_A)		FM(RIF1_SYNC_A)	FM(RIF3_SYNC_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP16_23_20	FM(SSI_SDATA7)		FM(HCTS2_N_B)	FM(MSIOF1_RXD_C)	F_(0, 0)			F_(0, 0)	FM(TS_SDEN1_A)	FM(STP_ISEN_1_A)	FM(RIF1_D0_A)	FM(RIF3_D0_A)		F_(0, 0)	FM(TCLK2_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP16_27_24	FM(SSI_SDATA8)		FM(HRTS2_N_B)	FM(MSIOF1_TXD_C)	F_(0, 0)			F_(0, 0)	FM(TS_SPSYNC1_A)FM(STP_ISSYNC_1_A)	FM(RIF1_D1_A)	FM(RIF3_D1_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP16_31_28	FM(SSI_SDATA9_A)	FM(HSCK2_B)	FM(MSIOF1_SS1_C)	FM(HSCK1_A)			FM(SSI_WS1_B)	FM(SCK1)	FM(STP_IVCXO27_1_A)	FM(SCK5_A)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP17_3_0	FM(AUDIO_CLKA_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	FM(CC5_OSCOUT)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP17_7_4	FM(AUDIO_CLKB_B)	FM(SCIF_CLK_A)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	FM(STP_IVCXO27_1_D)	FM(REMOCON_A)	F_(0, 0)		F_(0, 0)	FM(TCLK1_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP17_11_8	FM(USB0_PWEN)		F_(0, 0)	F_(0, 0)		FM(SIM0_RST_C)			F_(0, 0)	FM(TS_SCK1_D)	FM(STP_ISCLK_1_D)	FM(BPFCLK_B)	FM(RIF3_CLK_B)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) FM(HSCK2_C) F_(0, 0) F_(0, 0)
+#define IP17_15_12	FM(USB0_OVC)		F_(0, 0)	F_(0, 0)		FM(SIM0_D_C)			F_(0, 0)	FM(TS_SDAT1_D)	FM(STP_ISD_1_D)		F_(0, 0)	FM(RIF3_SYNC_B)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) FM(HRX2_C) F_(0, 0) F_(0, 0)
+#define IP17_19_16	FM(USB1_PWEN)		F_(0, 0)	F_(0, 0)		FM(SIM0_CLK_C)			FM(SSI_SCK1_A)	FM(TS_SCK0_E)	FM(STP_ISCLK_0_E)	FM(FMCLK_B)	FM(RIF2_CLK_B)		F_(0, 0)	FM(SPEEDIN_A)	F_(0, 0)	F_(0, 0) FM(HTX2_C) F_(0, 0) F_(0, 0)
+#define IP17_23_20	FM(USB1_OVC)		F_(0, 0)	FM(MSIOF1_SS2_C)	F_(0, 0)			FM(SSI_WS1_A)	FM(TS_SDAT0_E)	FM(STP_ISD_0_E)		FM(FMIN_B)	FM(RIF2_SYNC_B)		F_(0, 0)	FM(REMOCON_B)	F_(0, 0)	F_(0, 0) FM(HCTS2_N_C) F_(0, 0) F_(0, 0)
+#define IP17_27_24	FM(USB30_PWEN)		F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT_B)		FM(SSI_SCK2_B)	FM(TS_SDEN1_D)	FM(STP_ISEN_1_D)	FM(STP_OPWM_0_E)FM(RIF3_D0_B)		F_(0, 0)	FM(TCLK2_B)	FM(TPU0TO0)	FM(BPFCLK_C) FM(HRTS2_N_C) F_(0, 0) F_(0, 0)
+#define IP17_31_28	FM(USB30_OVC)		F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT1_B)		FM(SSI_WS2_B)	FM(TS_SPSYNC1_D)FM(STP_ISSYNC_1_D)	FM(STP_IVCXO27_0_E)FM(RIF3_D1_B)	F_(0, 0)	FM(FSO_TOE_N)	FM(TPU0TO1)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP18_3_0	FM(USB3_PWEN)		F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT2_B)		FM(SSI_SCK9_B)	FM(TS_SDEN0_E)	FM(STP_ISEN_0_E)	F_(0, 0)	FM(RIF2_D0_B)		F_(0, 0)	F_(0, 0)	FM(TPU0TO2)	F_(0, 0) FM(FMCLK_C) FM(FMCLK_D) F_(0, 0)
+#define IP18_7_4	FM(USB3_OVC)		F_(0, 0)	F_(0, 0)		FM(AUDIO_CLKOUT3_B)		FM(SSI_WS9_B)	FM(TS_SPSYNC0_E)FM(STP_ISSYNC_0_E)	F_(0, 0)	FM(RIF2_D1_B)		F_(0, 0)	F_(0, 0)	FM(TPU0TO3)	F_(0, 0) FM(FMIN_C) FM(FMIN_D) F_(0, 0)
 
 #define PINMUX_GPSR	\
 \
@@ -426,37 +437,34 @@ FM(IP12_23_20)	IP12_23_20	FM(IP13_23_20)	IP13_23_20	FM(IP14_23_20)	IP14_23_20	FM
 FM(IP12_27_24)	IP12_27_24	FM(IP13_27_24)	IP13_27_24	FM(IP14_27_24)	IP14_27_24	FM(IP15_27_24)	IP15_27_24 \
 FM(IP12_31_28)	IP12_31_28	FM(IP13_31_28)	IP13_31_28	FM(IP14_31_28)	IP14_31_28	FM(IP15_31_28)	IP15_31_28 \
 \
-FM(IP16_3_0)	IP16_3_0	FM(IP17_3_0)	IP17_3_0 \
-FM(IP16_7_4)	IP16_7_4	FM(IP17_7_4)	IP17_7_4 \
-FM(IP16_11_8)	IP16_11_8 \
-FM(IP16_15_12)	IP16_15_12 \
-FM(IP16_19_16)	IP16_19_16 \
-FM(IP16_23_20)	IP16_23_20 \
-FM(IP16_27_24)	IP16_27_24 \
-FM(IP16_31_28)	IP16_31_28
+FM(IP16_3_0)	IP16_3_0	FM(IP17_3_0)	IP17_3_0	FM(IP18_3_0)	IP18_3_0 \
+FM(IP16_7_4)	IP16_7_4	FM(IP17_7_4)	IP17_7_4	FM(IP18_7_4)	IP18_7_4 \
+FM(IP16_11_8)	IP16_11_8	FM(IP17_11_8)	IP17_11_8 \
+FM(IP16_15_12)	IP16_15_12	FM(IP17_15_12)	IP17_15_12 \
+FM(IP16_19_16)	IP16_19_16	FM(IP17_19_16)	IP17_19_16 \
+FM(IP16_23_20)	IP16_23_20	FM(IP17_23_20)	IP17_23_20 \
+FM(IP16_27_24)	IP16_27_24	FM(IP17_27_24)	IP17_27_24 \
+FM(IP16_31_28)	IP16_31_28	FM(IP17_31_28)	IP17_31_28
 
 /* MOD_SEL0 */			/* 0 */			/* 1 */			/* 2 */			/* 3 */			/* 4 */			/* 5 */			/* 6 */			/* 7 */
-#define MOD_SEL0_30_29		FM(SEL_MSIOF3_0)	FM(SEL_MSIOF3_1)	FM(SEL_MSIOF3_2)	FM(SEL_MSIOF3_3)
+#define MOD_SEL0_31_30_29	FM(SEL_MSIOF3_0)	FM(SEL_MSIOF3_1)	FM(SEL_MSIOF3_2)	FM(SEL_MSIOF3_3)	FM(SEL_MSIOF3_4)	F_(0, 0)		F_(0, 0)		F_(0, 0)
 #define MOD_SEL0_28_27		FM(SEL_MSIOF2_0)	FM(SEL_MSIOF2_1)	FM(SEL_MSIOF2_2)	FM(SEL_MSIOF2_3)
 #define MOD_SEL0_26_25_24	FM(SEL_MSIOF1_0)	FM(SEL_MSIOF1_1)	FM(SEL_MSIOF1_2)	FM(SEL_MSIOF1_3)	FM(SEL_MSIOF1_4)	FM(SEL_MSIOF1_5)	FM(SEL_MSIOF1_6)	F_(0, 0)
 #define MOD_SEL0_23		FM(SEL_LBSC_0)		FM(SEL_LBSC_1)
 #define MOD_SEL0_22		FM(SEL_IEBUS_0)		FM(SEL_IEBUS_1)
-#define MOD_SEL0_21_20		FM(SEL_I2C6_0)		FM(SEL_I2C6_1)		FM(SEL_I2C6_2)		F_(0, 0)
-#define MOD_SEL0_19		FM(SEL_I2C2_0)		FM(SEL_I2C2_1)
-#define MOD_SEL0_18		FM(SEL_I2C1_0)		FM(SEL_I2C1_1)
-#define MOD_SEL0_17		FM(SEL_HSCIF4_0)	FM(SEL_HSCIF4_1)
-#define MOD_SEL0_16_15		FM(SEL_HSCIF3_0)	FM(SEL_HSCIF3_1)	FM(SEL_HSCIF3_2)	FM(SEL_HSCIF3_3)
-#define MOD_SEL0_14		FM(SEL_HSCIF2_0)	FM(SEL_HSCIF2_1)
-#define MOD_SEL0_13		FM(SEL_HSCIF1_0)	FM(SEL_HSCIF1_1)
-#define MOD_SEL0_12		FM(SEL_FSO_0)		FM(SEL_FSO_1)
-#define MOD_SEL0_11		FM(SEL_FM_0)		FM(SEL_FM_1)
-#define MOD_SEL0_10		FM(SEL_ETHERAVB_0)	FM(SEL_ETHERAVB_1)
-#define MOD_SEL0_9		FM(SEL_DRIF3_0)		FM(SEL_DRIF3_1)
-#define MOD_SEL0_8		FM(SEL_DRIF2_0)		FM(SEL_DRIF2_1)
-#define MOD_SEL0_7_6		FM(SEL_DRIF1_0)		FM(SEL_DRIF1_1)		FM(SEL_DRIF1_2)		F_(0, 0)
-#define MOD_SEL0_5_4		FM(SEL_DRIF0_0)		FM(SEL_DRIF0_1)		FM(SEL_DRIF0_2)		F_(0, 0)
-#define MOD_SEL0_3		FM(SEL_CANFD0_0)	FM(SEL_CANFD0_1)
-#define MOD_SEL0_2_1		FM(SEL_ADG_0)		FM(SEL_ADG_1)		FM(SEL_ADG_2)		FM(SEL_ADG_3)
+#define MOD_SEL0_21		FM(SEL_I2C2_0)		FM(SEL_I2C2_1)
+#define MOD_SEL0_20		FM(SEL_I2C1_0)		FM(SEL_I2C1_1)
+#define MOD_SEL0_19		FM(SEL_HSCIF4_0)	FM(SEL_HSCIF4_1)
+#define MOD_SEL0_18_17		FM(SEL_HSCIF3_0)	FM(SEL_HSCIF3_1)	FM(SEL_HSCIF3_2)	FM(SEL_HSCIF3_3)
+#define MOD_SEL0_16		FM(SEL_HSCIF1_0)	FM(SEL_HSCIF1_1)
+#define MOD_SEL0_14_13		FM(SEL_HSCIF2_0)	FM(SEL_HSCIF2_1)	FM(SEL_HSCIF2_2)	F_(0, 0)
+#define MOD_SEL0_12		FM(SEL_ETHERAVB_0)	FM(SEL_ETHERAVB_1)
+#define MOD_SEL0_11		FM(SEL_DRIF3_0)		FM(SEL_DRIF3_1)
+#define MOD_SEL0_10		FM(SEL_DRIF2_0)		FM(SEL_DRIF2_1)
+#define MOD_SEL0_9_8		FM(SEL_DRIF1_0)		FM(SEL_DRIF1_1)		FM(SEL_DRIF1_2)		F_(0, 0)
+#define MOD_SEL0_7_6		FM(SEL_DRIF0_0)		FM(SEL_DRIF0_1)		FM(SEL_DRIF0_2)		F_(0, 0)
+#define MOD_SEL0_5		FM(SEL_CANFD0_0)	FM(SEL_CANFD0_1)
+#define MOD_SEL0_4_3		FM(SEL_ADG_A_0)		FM(SEL_ADG_A_1)		FM(SEL_ADG_A_2)		FM(SEL_ADG_A_3)
 
 /* MOD_SEL1 */			/* 0 */			/* 1 */			/* 2 */			/* 3 */			/* 4 */			/* 5 */			/* 6 */			/* 7 */
 #define MOD_SEL1_31_30		FM(SEL_TSIF1_0)		FM(SEL_TSIF1_1)		FM(SEL_TSIF1_2)		FM(SEL_TSIF1_3)
@@ -486,40 +494,46 @@ FM(IP16_31_28)	IP16_31_28
 #define MOD_SEL2_31		FM(I2C_SEL_5_0)		FM(I2C_SEL_5_1)
 #define MOD_SEL2_30		FM(I2C_SEL_3_0)		FM(I2C_SEL_3_1)
 #define MOD_SEL2_29		FM(I2C_SEL_0_0)		FM(I2C_SEL_0_1)
+#define MOD_SEL2_28_27		FM(SEL_FM_0)		FM(SEL_FM_1)		FM(SEL_FM_2)		FM(SEL_FM_3)
+#define MOD_SEL2_26		FM(SEL_SCIF5_0)		FM(SEL_SCIF5_1)
+#define MOD_SEL2_25_24_23	FM(SEL_I2C6_0)		FM(SEL_I2C6_1)		FM(SEL_I2C6_2)		F_(0, 0)		F_(0, 0)		F_(0, 0)		F_(0, 0)		F_(0, 0)
+#define MOD_SEL2_22		FM(SEL_NDF_0)		FM(SEL_NDF_1)
+#define MOD_SEL2_21		FM(SEL_SSI2_0)		FM(SEL_SSI2_1)
+#define MOD_SEL2_20		FM(SEL_SSI9_0)		FM(SEL_SSI9_1)
+#define MOD_SEL2_19		FM(SEL_TIMER_TMU2_0)	FM(SEL_TIMER_TMU2_1)
+#define MOD_SEL2_18		FM(SEL_ADG_B_0)		FM(SEL_ADG_B_1)
+#define MOD_SEL2_17		FM(SEL_ADG_C_0)		FM(SEL_ADG_C_1)
 #define MOD_SEL2_0		FM(SEL_VIN4_0)		FM(SEL_VIN4_1)
 
-#define PINMUX_MOD_SELS\
+#define PINMUX_MOD_SELS	\
 \
-			MOD_SEL1_31_30		MOD_SEL2_31 \
-MOD_SEL0_30_29					MOD_SEL2_30 \
+MOD_SEL0_31_30_29	MOD_SEL1_31_30		MOD_SEL2_31 \
+						MOD_SEL2_30 \
 			MOD_SEL1_29_28_27	MOD_SEL2_29 \
-MOD_SEL0_28_27 \
-\
-MOD_SEL0_26_25_24	MOD_SEL1_26 \
-			MOD_SEL1_25_24 \
-\
+MOD_SEL0_28_27					MOD_SEL2_28_27 \
+MOD_SEL0_26_25_24	MOD_SEL1_26		MOD_SEL2_26 \
+			MOD_SEL1_25_24		MOD_SEL2_25_24_23 \
 MOD_SEL0_23		MOD_SEL1_23_22_21 \
-MOD_SEL0_22 \
-MOD_SEL0_21_20 \
-			MOD_SEL1_20 \
-MOD_SEL0_19		MOD_SEL1_19 \
-MOD_SEL0_18		MOD_SEL1_18_17 \
-MOD_SEL0_17 \
-MOD_SEL0_16_15		MOD_SEL1_16 \
+MOD_SEL0_22					MOD_SEL2_22 \
+MOD_SEL0_21					MOD_SEL2_21 \
+MOD_SEL0_20		MOD_SEL1_20		MOD_SEL2_20 \
+MOD_SEL0_19		MOD_SEL1_19		MOD_SEL2_19 \
+MOD_SEL0_18_17		MOD_SEL1_18_17		MOD_SEL2_18 \
+						MOD_SEL2_17 \
+MOD_SEL0_16		MOD_SEL1_16 \
 			MOD_SEL1_15_14 \
-MOD_SEL0_14 \
-MOD_SEL0_13		MOD_SEL1_13 \
+MOD_SEL0_14_13 \
+			MOD_SEL1_13 \
 MOD_SEL0_12		MOD_SEL1_12 \
 MOD_SEL0_11		MOD_SEL1_11 \
 MOD_SEL0_10		MOD_SEL1_10 \
-MOD_SEL0_9		MOD_SEL1_9 \
-MOD_SEL0_8 \
+MOD_SEL0_9_8		MOD_SEL1_9 \
 MOD_SEL0_7_6 \
 			MOD_SEL1_6 \
-MOD_SEL0_5_4		MOD_SEL1_5 \
-			MOD_SEL1_4 \
-MOD_SEL0_3		MOD_SEL1_3 \
-MOD_SEL0_2_1		MOD_SEL1_2 \
+MOD_SEL0_5		MOD_SEL1_5 \
+MOD_SEL0_4_3		MOD_SEL1_4 \
+			MOD_SEL1_3 \
+			MOD_SEL1_2 \
 			MOD_SEL1_1 \
 			MOD_SEL1_0		MOD_SEL2_0
 
@@ -583,14 +597,6 @@ static const u16 pinmux_data[] = {
 	PINMUX_SINGLE(MSIOF0_RXD),
 	PINMUX_SINGLE(MSIOF0_SCK),
 	PINMUX_SINGLE(MSIOF0_TXD),
-	PINMUX_SINGLE(SD2_CMD),
-	PINMUX_SINGLE(SD3_CLK),
-	PINMUX_SINGLE(SD3_CMD),
-	PINMUX_SINGLE(SD3_DAT0),
-	PINMUX_SINGLE(SD3_DAT1),
-	PINMUX_SINGLE(SD3_DAT2),
-	PINMUX_SINGLE(SD3_DAT3),
-	PINMUX_SINGLE(SD3_DS),
 	PINMUX_SINGLE(SSI_SCK5),
 	PINMUX_SINGLE(SSI_SDATA5),
 	PINMUX_SINGLE(SSI_WS5),
@@ -614,6 +620,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP0_19_16,	AVB_AVTP_MATCH_A,	SEL_ETHERAVB_0),
 	PINMUX_IPSR_MSEL(IP0_19_16,	MSIOF2_RXD_C,		SEL_MSIOF2_2),
 	PINMUX_IPSR_MSEL(IP0_19_16,	CTS4_N_A,		SEL_SCIF4_0),
+	PINMUX_IPSR_GPSR(IP0_19_16,	FSCLKST2_N_A),
 
 	PINMUX_IPSR_MSEL(IP0_23_20,	AVB_AVTP_CAPTURE_A,	SEL_ETHERAVB_0),
 	PINMUX_IPSR_MSEL(IP0_23_20,	MSIOF2_TXD_C,		SEL_MSIOF2_2),
@@ -625,6 +632,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP0_27_24,	VI4_DATA0_B,		SEL_VIN4_1),
 	PINMUX_IPSR_MSEL(IP0_27_24,	CAN0_TX_B,		SEL_RCAN0_1),
 	PINMUX_IPSR_MSEL(IP0_27_24,	CANFD0_TX_B,		SEL_CANFD0_1),
+	PINMUX_IPSR_MSEL(IP0_27_24,	MSIOF3_SS2_E,		SEL_MSIOF3_4),
 
 	PINMUX_IPSR_GPSR(IP0_31_28,	IRQ1),
 	PINMUX_IPSR_GPSR(IP0_31_28,	QPOLA),
@@ -632,6 +640,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP0_31_28,	VI4_DATA1_B,		SEL_VIN4_1),
 	PINMUX_IPSR_MSEL(IP0_31_28,	CAN0_RX_B,		SEL_RCAN0_1),
 	PINMUX_IPSR_MSEL(IP0_31_28,	CANFD0_RX_B,		SEL_CANFD0_1),
+	PINMUX_IPSR_MSEL(IP0_31_28,	MSIOF3_SS1_E,		SEL_MSIOF3_4),
 
 	/* IPSR1 */
 	PINMUX_IPSR_GPSR(IP1_3_0,	IRQ2),
@@ -639,6 +648,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP1_3_0,	DU_EXODDF_DU_ODDF_DISP_CDE),
 	PINMUX_IPSR_MSEL(IP1_3_0,	VI4_DATA2_B,		SEL_VIN4_1),
 	PINMUX_IPSR_MSEL(IP1_3_0,	PWM3_B,			SEL_PWM3_1),
+	PINMUX_IPSR_MSEL(IP1_3_0,	MSIOF3_SYNC_E,		SEL_MSIOF3_4),
 
 	PINMUX_IPSR_GPSR(IP1_7_4,	IRQ3),
 	PINMUX_IPSR_GPSR(IP1_7_4,	QSTVB_QVE),
@@ -646,6 +656,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP1_7_4,	DU_DOTCLKOUT1),
 	PINMUX_IPSR_MSEL(IP1_7_4,	VI4_DATA3_B,		SEL_VIN4_1),
 	PINMUX_IPSR_MSEL(IP1_7_4,	PWM4_B,			SEL_PWM4_1),
+	PINMUX_IPSR_MSEL(IP1_7_4,	MSIOF3_SCK_E,		SEL_MSIOF3_4),
 
 	PINMUX_IPSR_GPSR(IP1_11_8,	IRQ4),
 	PINMUX_IPSR_GPSR(IP1_11_8,	QSTH_QHS),
@@ -653,6 +664,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP1_11_8,	DU_EXHSYNC_DU_HSYNC),
 	PINMUX_IPSR_MSEL(IP1_11_8,	VI4_DATA4_B,		SEL_VIN4_1),
 	PINMUX_IPSR_MSEL(IP1_11_8,	PWM5_B,			SEL_PWM5_1),
+	PINMUX_IPSR_MSEL(IP1_11_8,	MSIOF3_RXD_E,		SEL_MSIOF3_4),
 
 	PINMUX_IPSR_GPSR(IP1_15_12,	IRQ5),
 	PINMUX_IPSR_GPSR(IP1_15_12,	QSTB_QHE),
@@ -660,6 +672,8 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP1_15_12,	DU_EXVSYNC_DU_VSYNC),
 	PINMUX_IPSR_MSEL(IP1_15_12,	VI4_DATA5_B,		SEL_VIN4_1),
 	PINMUX_IPSR_MSEL(IP1_15_12,	PWM6_B,			SEL_PWM6_1),
+	PINMUX_IPSR_GPSR(IP1_15_12,	FSCLKST2_N_B),
+	PINMUX_IPSR_MSEL(IP1_15_12,	MSIOF3_TXD_E,		SEL_MSIOF3_4),
 
 	PINMUX_IPSR_GPSR(IP1_19_16,	PWM0),
 	PINMUX_IPSR_GPSR(IP1_19_16,	AVB_AVTP_PPS),
@@ -902,3692 +916,670 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP6_3_0,	VI4_DATA21),
 	PINMUX_IPSR_GPSR(IP6_3_0,	VI5_DATA5),
 
-	PINMUX_IPSR_GPSR(IP6_7_4,	D6),
-	PINMUX_IPSR_MSEL(IP6_7_4,	MSIOF2_RXD_B,		SEL_MSIOF2_1),
-	PINMUX_IPSR_GPSR(IP6_7_4,	VI4_DATA22),
-	PINMUX_IPSR_GPSR(IP6_7_4,	VI5_DATA6),
-
-	PINMUX_IPSR_GPSR(IP6_11_8,	D7),
-	PINMUX_IPSR_MSEL(IP6_11_8,	MSIOF2_TXD_B,		SEL_MSIOF2_1),
-	PINMUX_IPSR_GPSR(IP6_11_8,	VI4_DATA23),
-	PINMUX_IPSR_GPSR(IP6_11_8,	VI5_DATA7),
-
-	PINMUX_IPSR_GPSR(IP6_15_12,	D8),
-	PINMUX_IPSR_GPSR(IP6_15_12,	LCDOUT0),
-	PINMUX_IPSR_MSEL(IP6_15_12,	MSIOF2_SCK_D,		SEL_MSIOF2_3),
-	PINMUX_IPSR_MSEL(IP6_15_12,	SCK4_C,			SEL_SCIF4_2),
-	PINMUX_IPSR_MSEL(IP6_15_12,	VI4_DATA0_A,		SEL_VIN4_0),
-	PINMUX_IPSR_GPSR(IP6_15_12,	DU_DR0),
-
-	PINMUX_IPSR_GPSR(IP6_19_16,	D9),
-	PINMUX_IPSR_GPSR(IP6_19_16,	LCDOUT1),
-	PINMUX_IPSR_MSEL(IP6_19_16,	MSIOF2_SYNC_D,		SEL_MSIOF2_3),
-	PINMUX_IPSR_MSEL(IP6_19_16,	VI4_DATA1_A,		SEL_VIN4_0),
-	PINMUX_IPSR_GPSR(IP6_19_16,	DU_DR1),
-
-	PINMUX_IPSR_GPSR(IP6_23_20,	D10),
-	PINMUX_IPSR_GPSR(IP6_23_20,	LCDOUT2),
-	PINMUX_IPSR_MSEL(IP6_23_20,	MSIOF2_RXD_D,		SEL_MSIOF2_3),
-	PINMUX_IPSR_MSEL(IP6_23_20,	HRX3_B,			SEL_HSCIF3_1),
-	PINMUX_IPSR_MSEL(IP6_23_20,	VI4_DATA2_A,		SEL_VIN4_0),
-	PINMUX_IPSR_MSEL(IP6_23_20,	CTS4_N_C,		SEL_SCIF4_2),
-	PINMUX_IPSR_GPSR(IP6_23_20,	DU_DR2),
-
-	PINMUX_IPSR_GPSR(IP6_27_24,	D11),
-	PINMUX_IPSR_GPSR(IP6_27_24,	LCDOUT3),
-	PINMUX_IPSR_MSEL(IP6_27_24,	MSIOF2_TXD_D,		SEL_MSIOF2_3),
-	PINMUX_IPSR_MSEL(IP6_27_24,	HTX3_B,			SEL_HSCIF3_1),
-	PINMUX_IPSR_MSEL(IP6_27_24,	VI4_DATA3_A,		SEL_VIN4_0),
-	PINMUX_IPSR_MSEL(IP6_27_24,	RTS4_N_TANS_C,		SEL_SCIF4_2),
-	PINMUX_IPSR_GPSR(IP6_27_24,	DU_DR3),
-
-	PINMUX_IPSR_GPSR(IP6_31_28,	D12),
-	PINMUX_IPSR_GPSR(IP6_31_28,	LCDOUT4),
-	PINMUX_IPSR_MSEL(IP6_31_28,	MSIOF2_SS1_D,		SEL_MSIOF2_3),
-	PINMUX_IPSR_MSEL(IP6_31_28,	RX4_C,			SEL_SCIF4_2),
-	PINMUX_IPSR_MSEL(IP6_31_28,	VI4_DATA4_A,		SEL_VIN4_0),
-	PINMUX_IPSR_GPSR(IP6_31_28,	DU_DR4),
-
-	/* IPSR7 */
-	PINMUX_IPSR_GPSR(IP7_3_0,	D13),
-	PINMUX_IPSR_GPSR(IP7_3_0,	LCDOUT5),
-	PINMUX_IPSR_MSEL(IP7_3_0,	MSIOF2_SS2_D,		SEL_MSIOF2_3),
-	PINMUX_IPSR_MSEL(IP7_3_0,	TX4_C,			SEL_SCIF4_2),
-	PINMUX_IPSR_MSEL(IP7_3_0,	VI4_DATA5_A,		SEL_VIN4_0),
-	PINMUX_IPSR_GPSR(IP7_3_0,	DU_DR5),
-
-	PINMUX_IPSR_GPSR(IP7_7_4,	D14),
-	PINMUX_IPSR_GPSR(IP7_7_4,	LCDOUT6),
-	PINMUX_IPSR_MSEL(IP7_7_4,	MSIOF3_SS1_A,		SEL_MSIOF3_0),
-	PINMUX_IPSR_MSEL(IP7_7_4,	HRX3_C,			SEL_HSCIF3_2),
-	PINMUX_IPSR_MSEL(IP7_7_4,	VI4_DATA6_A,		SEL_VIN4_0),
-	PINMUX_IPSR_GPSR(IP7_7_4,	DU_DR6),
-	PINMUX_IPSR_MSEL(IP7_7_4,	SCL6_C,			SEL_I2C6_2),
-
-	PINMUX_IPSR_GPSR(IP7_11_8,	D15),
-	PINMUX_IPSR_GPSR(IP7_11_8,	LCDOUT7),
-	PINMUX_IPSR_MSEL(IP7_11_8,	MSIOF3_SS2_A,		SEL_MSIOF3_0),
-	PINMUX_IPSR_MSEL(IP7_11_8,	HTX3_C,			SEL_HSCIF3_2),
-	PINMUX_IPSR_MSEL(IP7_11_8,	VI4_DATA7_A,		SEL_VIN4_0),
-	PINMUX_IPSR_GPSR(IP7_11_8,	DU_DR7),
-	PINMUX_IPSR_MSEL(IP7_11_8,	SDA6_C,			SEL_I2C6_2),
-
-	PINMUX_IPSR_GPSR(IP7_15_12,	FSCLKST),
-
-	PINMUX_IPSR_GPSR(IP7_19_16,	SD0_CLK),
-	PINMUX_IPSR_MSEL(IP7_19_16,	MSIOF1_SCK_E,		SEL_MSIOF1_4),
-	PINMUX_IPSR_MSEL(IP7_19_16,	STP_OPWM_0_B,		SEL_SSP1_0_1),
-
-	PINMUX_IPSR_GPSR(IP7_23_20,	SD0_CMD),
-	PINMUX_IPSR_MSEL(IP7_23_20,	MSIOF1_SYNC_E,		SEL_MSIOF1_4),
-	PINMUX_IPSR_MSEL(IP7_23_20,	STP_IVCXO27_0_B,	SEL_SSP1_0_1),
-
-	PINMUX_IPSR_GPSR(IP7_27_24,	SD0_DAT0),
-	PINMUX_IPSR_MSEL(IP7_27_24,	MSIOF1_RXD_E,		SEL_MSIOF1_4),
-	PINMUX_IPSR_MSEL(IP7_27_24,	TS_SCK0_B,		SEL_TSIF0_1),
-	PINMUX_IPSR_MSEL(IP7_27_24,	STP_ISCLK_0_B,		SEL_SSP1_0_1),
-
-	PINMUX_IPSR_GPSR(IP7_31_28,	SD0_DAT1),
-	PINMUX_IPSR_MSEL(IP7_31_28,	MSIOF1_TXD_E,		SEL_MSIOF1_4),
-	PINMUX_IPSR_MSEL(IP7_31_28,	TS_SPSYNC0_B,		SEL_TSIF0_1),
-	PINMUX_IPSR_MSEL(IP7_31_28,	STP_ISSYNC_0_B,		SEL_SSP1_0_1),
-
-	/* IPSR8 */
-	PINMUX_IPSR_GPSR(IP8_3_0,	SD0_DAT2),
-	PINMUX_IPSR_MSEL(IP8_3_0,	MSIOF1_SS1_E,		SEL_MSIOF1_4),
-	PINMUX_IPSR_MSEL(IP8_3_0,	TS_SDAT0_B,		SEL_TSIF0_1),
-	PINMUX_IPSR_MSEL(IP8_3_0,	STP_ISD_0_B,		SEL_SSP1_0_1),
-
-	PINMUX_IPSR_GPSR(IP8_7_4,	SD0_DAT3),
-	PINMUX_IPSR_MSEL(IP8_7_4,	MSIOF1_SS2_E,		SEL_MSIOF1_4),
-	PINMUX_IPSR_MSEL(IP8_7_4,	TS_SDEN0_B,		SEL_TSIF0_1),
-	PINMUX_IPSR_MSEL(IP8_7_4,	STP_ISEN_0_B,		SEL_SSP1_0_1),
-
-	PINMUX_IPSR_GPSR(IP8_11_8,	SD1_CLK),
-	PINMUX_IPSR_MSEL(IP8_11_8,	MSIOF1_SCK_G,		SEL_MSIOF1_6),
-	PINMUX_IPSR_MSEL(IP8_11_8,	SIM0_CLK_A,		SEL_SIMCARD_0),
-
-	PINMUX_IPSR_GPSR(IP8_15_12,	SD1_CMD),
-	PINMUX_IPSR_MSEL(IP8_15_12,	MSIOF1_SYNC_G,		SEL_MSIOF1_6),
-	PINMUX_IPSR_MSEL(IP8_15_12,	SIM0_D_A,		SEL_SIMCARD_0),
-	PINMUX_IPSR_MSEL(IP8_15_12,	STP_IVCXO27_1_B,	SEL_SSP1_1_1),
-
-	PINMUX_IPSR_GPSR(IP8_19_16,	SD1_DAT0),
-	PINMUX_IPSR_GPSR(IP8_19_16,	SD2_DAT4),
-	PINMUX_IPSR_MSEL(IP8_19_16,	MSIOF1_RXD_G,		SEL_MSIOF1_6),
-	PINMUX_IPSR_MSEL(IP8_19_16,	TS_SCK1_B,		SEL_TSIF1_1),
-	PINMUX_IPSR_MSEL(IP8_19_16,	STP_ISCLK_1_B,		SEL_SSP1_1_1),
-
-	PINMUX_IPSR_GPSR(IP8_23_20,	SD1_DAT1),
-	PINMUX_IPSR_GPSR(IP8_23_20,	SD2_DAT5),
-	PINMUX_IPSR_MSEL(IP8_23_20,	MSIOF1_TXD_G,		SEL_MSIOF1_6),
-	PINMUX_IPSR_MSEL(IP8_23_20,	TS_SPSYNC1_B,		SEL_TSIF1_1),
-	PINMUX_IPSR_MSEL(IP8_23_20,	STP_ISSYNC_1_B,		SEL_SSP1_1_1),
-
-	PINMUX_IPSR_GPSR(IP8_27_24,	SD1_DAT2),
-	PINMUX_IPSR_GPSR(IP8_27_24,	SD2_DAT6),
-	PINMUX_IPSR_MSEL(IP8_27_24,	MSIOF1_SS1_G,		SEL_MSIOF1_6),
-	PINMUX_IPSR_MSEL(IP8_27_24,	TS_SDAT1_B,		SEL_TSIF1_1),
-	PINMUX_IPSR_MSEL(IP8_27_24,	STP_ISD_1_B,		SEL_SSP1_1_1),
-
-	PINMUX_IPSR_GPSR(IP8_31_28,	SD1_DAT3),
-	PINMUX_IPSR_GPSR(IP8_31_28,	SD2_DAT7),
-	PINMUX_IPSR_MSEL(IP8_31_28,	MSIOF1_SS2_G,		SEL_MSIOF1_6),
-	PINMUX_IPSR_MSEL(IP8_31_28,	TS_SDEN1_B,		SEL_TSIF1_1),
-	PINMUX_IPSR_MSEL(IP8_31_28,	STP_ISEN_1_B,		SEL_SSP1_1_1),
-
-	/* IPSR9 */
-	PINMUX_IPSR_GPSR(IP9_3_0,	SD2_CLK),
-
-	PINMUX_IPSR_GPSR(IP9_7_4,	SD2_DAT0),
-
-	PINMUX_IPSR_GPSR(IP9_11_8,	SD2_DAT1),
-
-	PINMUX_IPSR_GPSR(IP9_15_12,	SD2_DAT2),
-
-	PINMUX_IPSR_GPSR(IP9_19_16,	SD2_DAT3),
-
-	PINMUX_IPSR_GPSR(IP9_23_20,	SD2_DS),
-	PINMUX_IPSR_MSEL(IP9_23_20,	SATA_DEVSLP_B,		SEL_SATA_1),
-
-	PINMUX_IPSR_GPSR(IP9_27_24,	SD3_DAT4),
-	PINMUX_IPSR_MSEL(IP9_27_24,	SD2_CD_A,		SEL_SDHI2_0),
-
-	PINMUX_IPSR_GPSR(IP9_31_28,	SD3_DAT5),
-	PINMUX_IPSR_MSEL(IP9_31_28,	SD2_WP_A,		SEL_SDHI2_0),
-
-	/* IPSR10 */
-	PINMUX_IPSR_GPSR(IP10_3_0,	SD3_DAT6),
-	PINMUX_IPSR_GPSR(IP10_3_0,	SD3_CD),
-
-	PINMUX_IPSR_GPSR(IP10_7_4,	SD3_DAT7),
-	PINMUX_IPSR_GPSR(IP10_7_4,	SD3_WP),
-
-	PINMUX_IPSR_GPSR(IP10_11_8,	SD0_CD),
-	PINMUX_IPSR_MSEL(IP10_11_8,	SCL2_B,			SEL_I2C2_1),
-	PINMUX_IPSR_MSEL(IP10_11_8,	SIM0_RST_A,		SEL_SIMCARD_0),
-
-	PINMUX_IPSR_GPSR(IP10_15_12,	SD0_WP),
-	PINMUX_IPSR_MSEL(IP10_15_12,	SDA2_B,			SEL_I2C2_1),
-
-	PINMUX_IPSR_GPSR(IP10_19_16,	SD1_CD),
-	PINMUX_IPSR_MSEL(IP10_19_16,	SIM0_CLK_B,		SEL_SIMCARD_1),
-
-	PINMUX_IPSR_GPSR(IP10_23_20,	SD1_WP),
-	PINMUX_IPSR_MSEL(IP10_23_20,	SIM0_D_B,		SEL_SIMCARD_1),
-
-	PINMUX_IPSR_GPSR(IP10_27_24,	SCK0),
-	PINMUX_IPSR_MSEL(IP10_27_24,	HSCK1_B,		SEL_HSCIF1_1),
-	PINMUX_IPSR_MSEL(IP10_27_24,	MSIOF1_SS2_B,		SEL_MSIOF1_1),
-	PINMUX_IPSR_MSEL(IP10_27_24,	AUDIO_CLKC_B,		SEL_ADG_1),
-	PINMUX_IPSR_MSEL(IP10_27_24,	SDA2_A,			SEL_I2C2_0),
-	PINMUX_IPSR_MSEL(IP10_27_24,	SIM0_RST_B,		SEL_SIMCARD_1),
-	PINMUX_IPSR_MSEL(IP10_27_24,	STP_OPWM_0_C,		SEL_SSP1_0_2),
-	PINMUX_IPSR_MSEL(IP10_27_24,	RIF0_CLK_B,		SEL_DRIF0_1),
-	PINMUX_IPSR_GPSR(IP10_27_24,	ADICHS2),
-
-	PINMUX_IPSR_GPSR(IP10_31_28,	RX0),
-	PINMUX_IPSR_MSEL(IP10_31_28,	HRX1_B,			SEL_HSCIF1_1),
-	PINMUX_IPSR_MSEL(IP10_31_28,	TS_SCK0_C,		SEL_TSIF0_2),
-	PINMUX_IPSR_MSEL(IP10_31_28,	STP_ISCLK_0_C,		SEL_SSP1_0_2),
-	PINMUX_IPSR_MSEL(IP10_31_28,	RIF0_D0_B,		SEL_DRIF0_1),
-
-	/* IPSR11 */
-	PINMUX_IPSR_GPSR(IP11_3_0,	TX0),
-	PINMUX_IPSR_MSEL(IP11_3_0,	HTX1_B,			SEL_HSCIF1_1),
-	PINMUX_IPSR_MSEL(IP11_3_0,	TS_SPSYNC0_C,		SEL_TSIF0_2),
-	PINMUX_IPSR_MSEL(IP11_3_0,	STP_ISSYNC_0_C,		SEL_SSP1_0_2),
-	PINMUX_IPSR_MSEL(IP11_3_0,	RIF0_D1_B,		SEL_DRIF0_1),
-
-	PINMUX_IPSR_GPSR(IP11_7_4,	CTS0_N),
-	PINMUX_IPSR_MSEL(IP11_7_4,	HCTS1_N_B,		SEL_HSCIF1_1),
-	PINMUX_IPSR_MSEL(IP11_7_4,	MSIOF1_SYNC_B,		SEL_MSIOF1_1),
-	PINMUX_IPSR_MSEL(IP11_7_4,	TS_SPSYNC1_C,		SEL_TSIF1_2),
-	PINMUX_IPSR_MSEL(IP11_7_4,	STP_ISSYNC_1_C,		SEL_SSP1_1_2),
-	PINMUX_IPSR_MSEL(IP11_7_4,	RIF1_SYNC_B,		SEL_DRIF1_1),
-	PINMUX_IPSR_MSEL(IP11_7_4,	AUDIO_CLKOUT_C,		SEL_ADG_2),
-	PINMUX_IPSR_GPSR(IP11_7_4,	ADICS_SAMP),
-
-	PINMUX_IPSR_GPSR(IP11_11_8,	RTS0_N_TANS),
-	PINMUX_IPSR_MSEL(IP11_11_8,	HRTS1_N_B,		SEL_HSCIF1_1),
-	PINMUX_IPSR_MSEL(IP11_11_8,	MSIOF1_SS1_B,		SEL_MSIOF1_1),
-	PINMUX_IPSR_MSEL(IP11_11_8,	AUDIO_CLKA_B,		SEL_ADG_1),
-	PINMUX_IPSR_MSEL(IP11_11_8,	SCL2_A,			SEL_I2C2_0),
-	PINMUX_IPSR_MSEL(IP11_11_8,	STP_IVCXO27_1_C,	SEL_SSP1_1_2),
-	PINMUX_IPSR_MSEL(IP11_11_8,	RIF0_SYNC_B,		SEL_DRIF0_1),
-	PINMUX_IPSR_GPSR(IP11_11_8,	ADICHS1),
-
-	PINMUX_IPSR_MSEL(IP11_15_12,	RX1_A,			SEL_SCIF1_0),
-	PINMUX_IPSR_MSEL(IP11_15_12,	HRX1_A,			SEL_HSCIF1_0),
-	PINMUX_IPSR_MSEL(IP11_15_12,	TS_SDAT0_C,		SEL_TSIF0_2),
-	PINMUX_IPSR_MSEL(IP11_15_12,	STP_ISD_0_C,		SEL_SSP1_0_2),
-	PINMUX_IPSR_MSEL(IP11_15_12,	RIF1_CLK_C,		SEL_DRIF1_2),
-
-	PINMUX_IPSR_MSEL(IP11_19_16,	TX1_A,			SEL_SCIF1_0),
-	PINMUX_IPSR_MSEL(IP11_19_16,	HTX1_A,			SEL_HSCIF1_0),
-	PINMUX_IPSR_MSEL(IP11_19_16,	TS_SDEN0_C,		SEL_TSIF0_2),
-	PINMUX_IPSR_MSEL(IP11_19_16,	STP_ISEN_0_C,		SEL_SSP1_0_2),
-	PINMUX_IPSR_MSEL(IP11_19_16,	RIF1_D0_C,		SEL_DRIF1_2),
-
-	PINMUX_IPSR_GPSR(IP11_23_20,	CTS1_N),
-	PINMUX_IPSR_MSEL(IP11_23_20,	HCTS1_N_A,		SEL_HSCIF1_0),
-	PINMUX_IPSR_MSEL(IP11_23_20,	MSIOF1_RXD_B,		SEL_MSIOF1_1),
-	PINMUX_IPSR_MSEL(IP11_23_20,	TS_SDEN1_C,		SEL_TSIF1_2),
-	PINMUX_IPSR_MSEL(IP11_23_20,	STP_ISEN_1_C,		SEL_SSP1_1_2),
-	PINMUX_IPSR_MSEL(IP11_23_20,	RIF1_D0_B,		SEL_DRIF1_1),
-	PINMUX_IPSR_GPSR(IP11_23_20,	ADIDATA),
-
-	PINMUX_IPSR_GPSR(IP11_27_24,	RTS1_N_TANS),
-	PINMUX_IPSR_MSEL(IP11_27_24,	HRTS1_N_A,		SEL_HSCIF1_0),
-	PINMUX_IPSR_MSEL(IP11_27_24,	MSIOF1_TXD_B,		SEL_MSIOF1_1),
-	PINMUX_IPSR_MSEL(IP11_27_24,	TS_SDAT1_C,		SEL_TSIF1_2),
-	PINMUX_IPSR_MSEL(IP11_27_24,	STP_ISD_1_C,		SEL_SSP1_1_2),
-	PINMUX_IPSR_MSEL(IP11_27_24,	RIF1_D1_B,		SEL_DRIF1_1),
-	PINMUX_IPSR_GPSR(IP11_27_24,	ADICHS0),
-
-	PINMUX_IPSR_GPSR(IP11_31_28,	SCK2),
-	PINMUX_IPSR_MSEL(IP11_31_28,	SCIF_CLK_B,		SEL_SCIF1_1),
-	PINMUX_IPSR_MSEL(IP11_31_28,	MSIOF1_SCK_B,		SEL_MSIOF1_1),
-	PINMUX_IPSR_MSEL(IP11_31_28,	TS_SCK1_C,		SEL_TSIF1_2),
-	PINMUX_IPSR_MSEL(IP11_31_28,	STP_ISCLK_1_C,		SEL_SSP1_1_2),
-	PINMUX_IPSR_MSEL(IP11_31_28,	RIF1_CLK_B,		SEL_DRIF1_1),
-	PINMUX_IPSR_GPSR(IP11_31_28,	ADICLK),
-
-	/* IPSR12 */
-	PINMUX_IPSR_MSEL(IP12_3_0,	TX2_A,			SEL_SCIF2_0),
-	PINMUX_IPSR_MSEL(IP12_3_0,	SD2_CD_B,		SEL_SDHI2_1),
-	PINMUX_IPSR_MSEL(IP12_3_0,	SCL1_A,			SEL_I2C1_0),
-	PINMUX_IPSR_MSEL(IP12_3_0,	FMCLK_A,		SEL_FM_0),
-	PINMUX_IPSR_MSEL(IP12_3_0,	RIF1_D1_C,		SEL_DRIF1_2),
-	PINMUX_IPSR_MSEL(IP12_3_0,	FSO_CFE_0_B,		SEL_FSO_1),
-
-	PINMUX_IPSR_MSEL(IP12_7_4,	RX2_A,			SEL_SCIF2_0),
-	PINMUX_IPSR_MSEL(IP12_7_4,	SD2_WP_B,		SEL_SDHI2_1),
-	PINMUX_IPSR_MSEL(IP12_7_4,	SDA1_A,			SEL_I2C1_0),
-	PINMUX_IPSR_MSEL(IP12_7_4,	FMIN_A,			SEL_FM_0),
-	PINMUX_IPSR_MSEL(IP12_7_4,	RIF1_SYNC_C,		SEL_DRIF1_2),
-	PINMUX_IPSR_MSEL(IP12_7_4,	FSO_CFE_1_B,		SEL_FSO_1),
-
-	PINMUX_IPSR_GPSR(IP12_11_8,	HSCK0),
-	PINMUX_IPSR_MSEL(IP12_11_8,	MSIOF1_SCK_D,		SEL_MSIOF1_3),
-	PINMUX_IPSR_MSEL(IP12_11_8,	AUDIO_CLKB_A,		SEL_ADG_0),
-	PINMUX_IPSR_MSEL(IP12_11_8,	SSI_SDATA1_B,		SEL_SSI_1),
-	PINMUX_IPSR_MSEL(IP12_11_8,	TS_SCK0_D,		SEL_TSIF0_3),
-	PINMUX_IPSR_MSEL(IP12_11_8,	STP_ISCLK_0_D,		SEL_SSP1_0_3),
-	PINMUX_IPSR_MSEL(IP12_11_8,	RIF0_CLK_C,		SEL_DRIF0_2),
-
-	PINMUX_IPSR_GPSR(IP12_15_12,	HRX0),
-	PINMUX_IPSR_MSEL(IP12_15_12,	MSIOF1_RXD_D,		SEL_MSIOF1_3),
-	PINMUX_IPSR_MSEL(IP12_15_12,	SSI_SDATA2_B,		SEL_SSI_1),
-	PINMUX_IPSR_MSEL(IP12_15_12,	TS_SDEN0_D,		SEL_TSIF0_3),
-	PINMUX_IPSR_MSEL(IP12_15_12,	STP_ISEN_0_D,		SEL_SSP1_0_3),
-	PINMUX_IPSR_MSEL(IP12_15_12,	RIF0_D0_C,		SEL_DRIF0_2),
-
-	PINMUX_IPSR_GPSR(IP12_19_16,	HTX0),
-	PINMUX_IPSR_MSEL(IP12_19_16,	MSIOF1_TXD_D,		SEL_MSIOF1_3),
-	PINMUX_IPSR_MSEL(IP12_19_16,	SSI_SDATA9_B,		SEL_SSI_1),
-	PINMUX_IPSR_MSEL(IP12_19_16,	TS_SDAT0_D,		SEL_TSIF0_3),
-	PINMUX_IPSR_MSEL(IP12_19_16,	STP_ISD_0_D,		SEL_SSP1_0_3),
-	PINMUX_IPSR_MSEL(IP12_19_16,	RIF0_D1_C,		SEL_DRIF0_2),
-
-	PINMUX_IPSR_GPSR(IP12_23_20,	HCTS0_N),
-	PINMUX_IPSR_MSEL(IP12_23_20,	RX2_B,			SEL_SCIF2_1),
-	PINMUX_IPSR_MSEL(IP12_23_20,	MSIOF1_SYNC_D,		SEL_MSIOF1_3),
-	PINMUX_IPSR_MSEL(IP12_23_20,	SSI_SCK9_A,		SEL_SSI_0),
-	PINMUX_IPSR_MSEL(IP12_23_20,	TS_SPSYNC0_D,		SEL_TSIF0_3),
-	PINMUX_IPSR_MSEL(IP12_23_20,	STP_ISSYNC_0_D,		SEL_SSP1_0_3),
-	PINMUX_IPSR_MSEL(IP12_23_20,	RIF0_SYNC_C,		SEL_DRIF0_2),
-	PINMUX_IPSR_MSEL(IP12_23_20,	AUDIO_CLKOUT1_A,	SEL_ADG_0),
-
-	PINMUX_IPSR_GPSR(IP12_27_24,	HRTS0_N),
-	PINMUX_IPSR_MSEL(IP12_27_24,	TX2_B,			SEL_SCIF2_1),
-	PINMUX_IPSR_MSEL(IP12_27_24,	MSIOF1_SS1_D,		SEL_MSIOF1_3),
-	PINMUX_IPSR_MSEL(IP12_27_24,	SSI_WS9_A,		SEL_SSI_0),
-	PINMUX_IPSR_MSEL(IP12_27_24,	STP_IVCXO27_0_D,	SEL_SSP1_0_3),
-	PINMUX_IPSR_MSEL(IP12_27_24,	BPFCLK_A,		SEL_FM_0),
-	PINMUX_IPSR_MSEL(IP12_27_24,	AUDIO_CLKOUT2_A,	SEL_ADG_0),
-
-	PINMUX_IPSR_GPSR(IP12_31_28,	MSIOF0_SYNC),
-	PINMUX_IPSR_MSEL(IP12_31_28,	AUDIO_CLKOUT_A,		SEL_ADG_0),
-
-	/* IPSR13 */
-	PINMUX_IPSR_GPSR(IP13_3_0,	MSIOF0_SS1),
-	PINMUX_IPSR_GPSR(IP13_3_0,	RX5),
-	PINMUX_IPSR_MSEL(IP13_3_0,	AUDIO_CLKA_C,		SEL_ADG_2),
-	PINMUX_IPSR_MSEL(IP13_3_0,	SSI_SCK2_A,		SEL_SSI_0),
-	PINMUX_IPSR_MSEL(IP13_3_0,	STP_IVCXO27_0_C,	SEL_SSP1_0_2),
-	PINMUX_IPSR_MSEL(IP13_3_0,	AUDIO_CLKOUT3_A,	SEL_ADG_0),
-	PINMUX_IPSR_MSEL(IP13_3_0,	TCLK1_B,		SEL_TIMER_TMU_1),
-
-	PINMUX_IPSR_GPSR(IP13_7_4,	MSIOF0_SS2),
-	PINMUX_IPSR_GPSR(IP13_7_4,	TX5),
-	PINMUX_IPSR_MSEL(IP13_7_4,	MSIOF1_SS2_D,		SEL_MSIOF1_3),
-	PINMUX_IPSR_MSEL(IP13_7_4,	AUDIO_CLKC_A,		SEL_ADG_0),
-	PINMUX_IPSR_MSEL(IP13_7_4,	SSI_WS2_A,		SEL_SSI_0),
-	PINMUX_IPSR_MSEL(IP13_7_4,	STP_OPWM_0_D,		SEL_SSP1_0_3),
-	PINMUX_IPSR_MSEL(IP13_7_4,	AUDIO_CLKOUT_D,		SEL_ADG_3),
-	PINMUX_IPSR_MSEL(IP13_7_4,	SPEEDIN_B,		SEL_SPEED_PULSE_1),
-
-	PINMUX_IPSR_GPSR(IP13_11_8,	MLB_CLK),
-	PINMUX_IPSR_MSEL(IP13_11_8,	MSIOF1_SCK_F,		SEL_MSIOF1_5),
-	PINMUX_IPSR_MSEL(IP13_11_8,	SCL1_B,			SEL_I2C1_1),
-
-	PINMUX_IPSR_GPSR(IP13_15_12,	MLB_SIG),
-	PINMUX_IPSR_MSEL(IP13_15_12,	RX1_B,			SEL_SCIF1_1),
-	PINMUX_IPSR_MSEL(IP13_15_12,	MSIOF1_SYNC_F,		SEL_MSIOF1_5),
-	PINMUX_IPSR_MSEL(IP13_15_12,	SDA1_B,			SEL_I2C1_1),
-
-	PINMUX_IPSR_GPSR(IP13_19_16,	MLB_DAT),
-	PINMUX_IPSR_MSEL(IP13_19_16,	TX1_B,			SEL_SCIF1_1),
-	PINMUX_IPSR_MSEL(IP13_19_16,	MSIOF1_RXD_F,		SEL_MSIOF1_5),
-
-	PINMUX_IPSR_GPSR(IP13_23_20,	SSI_SCK01239),
-	PINMUX_IPSR_MSEL(IP13_23_20,	MSIOF1_TXD_F,		SEL_MSIOF1_5),
-
-	PINMUX_IPSR_GPSR(IP13_27_24,	SSI_WS01239),
-	PINMUX_IPSR_MSEL(IP13_27_24,	MSIOF1_SS1_F,		SEL_MSIOF1_5),
-
-	PINMUX_IPSR_GPSR(IP13_31_28,	SSI_SDATA0),
-	PINMUX_IPSR_MSEL(IP13_31_28,	MSIOF1_SS2_F,		SEL_MSIOF1_5),
-
-	/* IPSR14 */
-	PINMUX_IPSR_MSEL(IP14_3_0,	SSI_SDATA1_A,		SEL_SSI_0),
-
-	PINMUX_IPSR_MSEL(IP14_7_4,	SSI_SDATA2_A,		SEL_SSI_0),
-	PINMUX_IPSR_MSEL(IP14_7_4,	SSI_SCK1_B,		SEL_SSI_1),
-
-	PINMUX_IPSR_GPSR(IP14_11_8,	SSI_SCK34),
-	PINMUX_IPSR_MSEL(IP14_11_8,	MSIOF1_SS1_A,		SEL_MSIOF1_0),
-	PINMUX_IPSR_MSEL(IP14_11_8,	STP_OPWM_0_A,		SEL_SSP1_0_0),
-
-	PINMUX_IPSR_GPSR(IP14_15_12,	SSI_WS34),
-	PINMUX_IPSR_MSEL(IP14_15_12,	HCTS2_N_A,		SEL_HSCIF2_0),
-	PINMUX_IPSR_MSEL(IP14_15_12,	MSIOF1_SS2_A,		SEL_MSIOF1_0),
-	PINMUX_IPSR_MSEL(IP14_15_12,	STP_IVCXO27_0_A,	SEL_SSP1_0_0),
-
-	PINMUX_IPSR_GPSR(IP14_19_16,	SSI_SDATA3),
-	PINMUX_IPSR_MSEL(IP14_19_16,	HRTS2_N_A,		SEL_HSCIF2_0),
-	PINMUX_IPSR_MSEL(IP14_19_16,	MSIOF1_TXD_A,		SEL_MSIOF1_0),
-	PINMUX_IPSR_MSEL(IP14_19_16,	TS_SCK0_A,		SEL_TSIF0_0),
-	PINMUX_IPSR_MSEL(IP14_19_16,	STP_ISCLK_0_A,		SEL_SSP1_0_0),
-	PINMUX_IPSR_MSEL(IP14_19_16,	RIF0_D1_A,		SEL_DRIF0_0),
-	PINMUX_IPSR_MSEL(IP14_19_16,	RIF2_D0_A,		SEL_DRIF2_0),
-
-	PINMUX_IPSR_GPSR(IP14_23_20,	SSI_SCK4),
-	PINMUX_IPSR_MSEL(IP14_23_20,	HRX2_A,			SEL_HSCIF2_0),
-	PINMUX_IPSR_MSEL(IP14_23_20,	MSIOF1_SCK_A,		SEL_MSIOF1_0),
-	PINMUX_IPSR_MSEL(IP14_23_20,	TS_SDAT0_A,		SEL_TSIF0_0),
-	PINMUX_IPSR_MSEL(IP14_23_20,	STP_ISD_0_A,		SEL_SSP1_0_0),
-	PINMUX_IPSR_MSEL(IP14_23_20,	RIF0_CLK_A,		SEL_DRIF0_0),
-	PINMUX_IPSR_MSEL(IP14_23_20,	RIF2_CLK_A,		SEL_DRIF2_0),
-
-	PINMUX_IPSR_GPSR(IP14_27_24,	SSI_WS4),
-	PINMUX_IPSR_MSEL(IP14_27_24,	HTX2_A,			SEL_HSCIF2_0),
-	PINMUX_IPSR_MSEL(IP14_27_24,	MSIOF1_SYNC_A,		SEL_MSIOF1_0),
-	PINMUX_IPSR_MSEL(IP14_27_24,	TS_SDEN0_A,		SEL_TSIF0_0),
-	PINMUX_IPSR_MSEL(IP14_27_24,	STP_ISEN_0_A,		SEL_SSP1_0_0),
-	PINMUX_IPSR_MSEL(IP14_27_24,	RIF0_SYNC_A,		SEL_DRIF0_0),
-	PINMUX_IPSR_MSEL(IP14_27_24,	RIF2_SYNC_A,		SEL_DRIF2_0),
-
-	PINMUX_IPSR_GPSR(IP14_31_28,	SSI_SDATA4),
-	PINMUX_IPSR_MSEL(IP14_31_28,	HSCK2_A,		SEL_HSCIF2_0),
-	PINMUX_IPSR_MSEL(IP14_31_28,	MSIOF1_RXD_A,		SEL_MSIOF1_0),
-	PINMUX_IPSR_MSEL(IP14_31_28,	TS_SPSYNC0_A,		SEL_TSIF0_0),
-	PINMUX_IPSR_MSEL(IP14_31_28,	STP_ISSYNC_0_A,		SEL_SSP1_0_0),
-	PINMUX_IPSR_MSEL(IP14_31_28,	RIF0_D0_A,		SEL_DRIF0_0),
-	PINMUX_IPSR_MSEL(IP14_31_28,	RIF2_D1_A,		SEL_DRIF2_0),
-
-	/* IPSR15 */
-	PINMUX_IPSR_GPSR(IP15_3_0,	SSI_SCK6),
-	PINMUX_IPSR_GPSR(IP15_3_0,	USB2_PWEN),
-	PINMUX_IPSR_MSEL(IP15_3_0,	SIM0_RST_D,		SEL_SIMCARD_3),
-
-	PINMUX_IPSR_GPSR(IP15_7_4,	SSI_WS6),
-	PINMUX_IPSR_GPSR(IP15_7_4,	USB2_OVC),
-	PINMUX_IPSR_MSEL(IP15_7_4,	SIM0_D_D,		SEL_SIMCARD_3),
-
-	PINMUX_IPSR_GPSR(IP15_11_8,	SSI_SDATA6),
-	PINMUX_IPSR_MSEL(IP15_11_8,	SIM0_CLK_D,		SEL_SIMCARD_3),
-	PINMUX_IPSR_MSEL(IP15_11_8,	SATA_DEVSLP_A,		SEL_SATA_0),
-
-	PINMUX_IPSR_GPSR(IP15_15_12,	SSI_SCK78),
-	PINMUX_IPSR_MSEL(IP15_15_12,	HRX2_B,			SEL_HSCIF2_1),
-	PINMUX_IPSR_MSEL(IP15_15_12,	MSIOF1_SCK_C,		SEL_MSIOF1_2),
-	PINMUX_IPSR_MSEL(IP15_15_12,	TS_SCK1_A,		SEL_TSIF1_0),
-	PINMUX_IPSR_MSEL(IP15_15_12,	STP_ISCLK_1_A,		SEL_SSP1_1_0),
-	PINMUX_IPSR_MSEL(IP15_15_12,	RIF1_CLK_A,		SEL_DRIF1_0),
-	PINMUX_IPSR_MSEL(IP15_15_12,	RIF3_CLK_A,		SEL_DRIF3_0),
-
-	PINMUX_IPSR_GPSR(IP15_19_16,	SSI_WS78),
-	PINMUX_IPSR_MSEL(IP15_19_16,	HTX2_B,			SEL_HSCIF2_1),
-	PINMUX_IPSR_MSEL(IP15_19_16,	MSIOF1_SYNC_C,		SEL_MSIOF1_2),
-	PINMUX_IPSR_MSEL(IP15_19_16,	TS_SDAT1_A,		SEL_TSIF1_0),
-	PINMUX_IPSR_MSEL(IP15_19_16,	STP_ISD_1_A,		SEL_SSP1_1_0),
-	PINMUX_IPSR_MSEL(IP15_19_16,	RIF1_SYNC_A,		SEL_DRIF1_0),
-	PINMUX_IPSR_MSEL(IP15_19_16,	RIF3_SYNC_A,		SEL_DRIF3_0),
-
-	PINMUX_IPSR_GPSR(IP15_23_20,	SSI_SDATA7),
-	PINMUX_IPSR_MSEL(IP15_23_20,	HCTS2_N_B,		SEL_HSCIF2_1),
-	PINMUX_IPSR_MSEL(IP15_23_20,	MSIOF1_RXD_C,		SEL_MSIOF1_2),
-	PINMUX_IPSR_MSEL(IP15_23_20,	TS_SDEN1_A,		SEL_TSIF1_0),
-	PINMUX_IPSR_MSEL(IP15_23_20,	STP_ISEN_1_A,		SEL_SSP1_1_0),
-	PINMUX_IPSR_MSEL(IP15_23_20,	RIF1_D0_A,		SEL_DRIF1_0),
-	PINMUX_IPSR_MSEL(IP15_23_20,	RIF3_D0_A,		SEL_DRIF3_0),
-	PINMUX_IPSR_MSEL(IP15_23_20,	TCLK2_A,		SEL_TIMER_TMU_0),
-
-	PINMUX_IPSR_GPSR(IP15_27_24,	SSI_SDATA8),
-	PINMUX_IPSR_MSEL(IP15_27_24,	HRTS2_N_B,		SEL_HSCIF2_1),
-	PINMUX_IPSR_MSEL(IP15_27_24,	MSIOF1_TXD_C,		SEL_MSIOF1_2),
-	PINMUX_IPSR_MSEL(IP15_27_24,	TS_SPSYNC1_A,		SEL_TSIF1_0),
-	PINMUX_IPSR_MSEL(IP15_27_24,	STP_ISSYNC_1_A,		SEL_SSP1_1_0),
-	PINMUX_IPSR_MSEL(IP15_27_24,	RIF1_D1_A,		SEL_DRIF1_0),
-	PINMUX_IPSR_MSEL(IP15_27_24,	RIF3_D1_A,		SEL_DRIF3_0),
-
-	PINMUX_IPSR_MSEL(IP15_31_28,	SSI_SDATA9_A,		SEL_SSI_0),
-	PINMUX_IPSR_MSEL(IP15_31_28,	HSCK2_B,		SEL_HSCIF2_1),
-	PINMUX_IPSR_MSEL(IP15_31_28,	MSIOF1_SS1_C,		SEL_MSIOF1_2),
-	PINMUX_IPSR_MSEL(IP15_31_28,	HSCK1_A,		SEL_HSCIF1_0),
-	PINMUX_IPSR_MSEL(IP15_31_28,	SSI_WS1_B,		SEL_SSI_1),
-	PINMUX_IPSR_GPSR(IP15_31_28,	SCK1),
-	PINMUX_IPSR_MSEL(IP15_31_28,	STP_IVCXO27_1_A,	SEL_SSP1_1_0),
-	PINMUX_IPSR_GPSR(IP15_31_28,	SCK5),
-
-	/* IPSR16 */
-	PINMUX_IPSR_MSEL(IP16_3_0,	AUDIO_CLKA_A,		SEL_ADG_0),
-	PINMUX_IPSR_GPSR(IP16_3_0,	CC5_OSCOUT),
-
-	PINMUX_IPSR_MSEL(IP16_7_4,	AUDIO_CLKB_B,		SEL_ADG_1),
-	PINMUX_IPSR_MSEL(IP16_7_4,	SCIF_CLK_A,		SEL_SCIF1_0),
-	PINMUX_IPSR_MSEL(IP16_7_4,	STP_IVCXO27_1_D,	SEL_SSP1_1_3),
-	PINMUX_IPSR_MSEL(IP16_7_4,	REMOCON_A,		SEL_REMOCON_0),
-	PINMUX_IPSR_MSEL(IP16_7_4,	TCLK1_A,		SEL_TIMER_TMU_0),
-
-	PINMUX_IPSR_GPSR(IP16_11_8,	USB0_PWEN),
-	PINMUX_IPSR_MSEL(IP16_11_8,	SIM0_RST_C,		SEL_SIMCARD_2),
-	PINMUX_IPSR_MSEL(IP16_11_8,	TS_SCK1_D,		SEL_TSIF1_3),
-	PINMUX_IPSR_MSEL(IP16_11_8,	STP_ISCLK_1_D,		SEL_SSP1_1_3),
-	PINMUX_IPSR_MSEL(IP16_11_8,	BPFCLK_B,		SEL_FM_1),
-	PINMUX_IPSR_MSEL(IP16_11_8,	RIF3_CLK_B,		SEL_DRIF3_1),
-
-	PINMUX_IPSR_GPSR(IP16_15_12,	USB0_OVC),
-	PINMUX_IPSR_MSEL(IP16_11_8,	SIM0_D_C,		SEL_SIMCARD_2),
-	PINMUX_IPSR_MSEL(IP16_11_8,	TS_SDAT1_D,		SEL_TSIF1_3),
-	PINMUX_IPSR_MSEL(IP16_11_8,	STP_ISD_1_D,		SEL_SSP1_1_3),
-	PINMUX_IPSR_MSEL(IP16_11_8,	RIF3_SYNC_B,		SEL_DRIF3_1),
-
-	PINMUX_IPSR_GPSR(IP16_19_16,	USB1_PWEN),
-	PINMUX_IPSR_MSEL(IP16_19_16,	SIM0_CLK_C,		SEL_SIMCARD_2),
-	PINMUX_IPSR_MSEL(IP16_19_16,	SSI_SCK1_A,		SEL_SSI_0),
-	PINMUX_IPSR_MSEL(IP16_19_16,	TS_SCK0_E,		SEL_TSIF0_4),
-	PINMUX_IPSR_MSEL(IP16_19_16,	STP_ISCLK_0_E,		SEL_SSP1_0_4),
-	PINMUX_IPSR_MSEL(IP16_19_16,	FMCLK_B,		SEL_FM_1),
-	PINMUX_IPSR_MSEL(IP16_19_16,	RIF2_CLK_B,		SEL_DRIF2_1),
-	PINMUX_IPSR_MSEL(IP16_19_16,	SPEEDIN_A,		SEL_SPEED_PULSE_0),
-
-	PINMUX_IPSR_GPSR(IP16_23_20,	USB1_OVC),
-	PINMUX_IPSR_MSEL(IP16_23_20,	MSIOF1_SS2_C,		SEL_MSIOF1_2),
-	PINMUX_IPSR_MSEL(IP16_23_20,	SSI_WS1_A,		SEL_SSI_0),
-	PINMUX_IPSR_MSEL(IP16_23_20,	TS_SDAT0_E,		SEL_TSIF0_4),
-	PINMUX_IPSR_MSEL(IP16_23_20,	STP_ISD_0_E,		SEL_SSP1_0_4),
-	PINMUX_IPSR_MSEL(IP16_23_20,	FMIN_B,			SEL_FM_1),
-	PINMUX_IPSR_MSEL(IP16_23_20,	RIF2_SYNC_B,		SEL_DRIF2_1),
-	PINMUX_IPSR_MSEL(IP16_23_20,	REMOCON_B,		SEL_REMOCON_1),
-
-	PINMUX_IPSR_GPSR(IP16_27_24,	USB30_PWEN),
-	PINMUX_IPSR_MSEL(IP16_27_24,	AUDIO_CLKOUT_B,		SEL_ADG_1),
-	PINMUX_IPSR_MSEL(IP16_27_24,	SSI_SCK2_B,		SEL_SSI_1),
-	PINMUX_IPSR_MSEL(IP16_27_24,	TS_SDEN1_D,		SEL_TSIF1_3),
-	PINMUX_IPSR_MSEL(IP16_27_24,	STP_ISEN_1_D,		SEL_SSP1_1_2),
-	PINMUX_IPSR_MSEL(IP16_27_24,	STP_OPWM_0_E,		SEL_SSP1_0_4),
-	PINMUX_IPSR_MSEL(IP16_27_24,	RIF3_D0_B,		SEL_DRIF3_1),
-	PINMUX_IPSR_MSEL(IP16_27_24,	TCLK2_B,		SEL_TIMER_TMU_1),
-	PINMUX_IPSR_GPSR(IP16_27_24,	TPU0TO0),
-
-	PINMUX_IPSR_GPSR(IP16_31_28,	USB30_OVC),
-	PINMUX_IPSR_MSEL(IP16_31_28,	AUDIO_CLKOUT1_B,	SEL_ADG_1),
-	PINMUX_IPSR_MSEL(IP16_31_28,	SSI_WS2_B,		SEL_SSI_1),
-	PINMUX_IPSR_MSEL(IP16_31_28,	TS_SPSYNC1_D,		SEL_TSIF1_3),
-	PINMUX_IPSR_MSEL(IP16_31_28,	STP_ISSYNC_1_D,		SEL_SSP1_1_3),
-	PINMUX_IPSR_MSEL(IP16_31_28,	STP_IVCXO27_0_E,	SEL_SSP1_0_4),
-	PINMUX_IPSR_MSEL(IP16_31_28,	RIF3_D1_B,		SEL_DRIF3_1),
-	PINMUX_IPSR_MSEL(IP16_31_28,	FSO_TOE_B,		SEL_FSO_1),
-	PINMUX_IPSR_GPSR(IP16_31_28,	TPU0TO1),
-
-	/* IPSR17 */
-	PINMUX_IPSR_GPSR(IP17_3_0,	USB31_PWEN),
-	PINMUX_IPSR_MSEL(IP17_3_0,	AUDIO_CLKOUT2_B,	SEL_ADG_1),
-	PINMUX_IPSR_MSEL(IP17_3_0,	SSI_SCK9_B,		SEL_SSI_1),
-	PINMUX_IPSR_MSEL(IP17_3_0,	TS_SDEN0_E,		SEL_TSIF0_4),
-	PINMUX_IPSR_MSEL(IP17_3_0,	STP_ISEN_0_E,		SEL_SSP1_0_4),
-	PINMUX_IPSR_MSEL(IP17_3_0,	RIF2_D0_B,		SEL_DRIF2_1),
-	PINMUX_IPSR_GPSR(IP17_3_0,	TPU0TO2),
-
-	PINMUX_IPSR_GPSR(IP17_7_4,	USB31_OVC),
-	PINMUX_IPSR_MSEL(IP17_7_4,	AUDIO_CLKOUT3_B,	SEL_ADG_1),
-	PINMUX_IPSR_MSEL(IP17_7_4,	SSI_WS9_B,		SEL_SSI_1),
-	PINMUX_IPSR_MSEL(IP17_7_4,	TS_SPSYNC0_E,		SEL_TSIF0_4),
-	PINMUX_IPSR_MSEL(IP17_7_4,	STP_ISSYNC_0_E,		SEL_SSP1_0_4),
-	PINMUX_IPSR_MSEL(IP17_7_4,	RIF2_D1_B,		SEL_DRIF2_1),
-	PINMUX_IPSR_GPSR(IP17_7_4,	TPU0TO3),
-
-/*
- * Static pins can not be muxed between different functions but
- * still needs a mark entry in the pinmux list. Add each static
- * pin to the list without an associated function. The sh-pfc
- * core will do the right thing and skip trying to mux then pin
- * while still applying configuration to it
- */
-#define FM(x)	PINMUX_DATA(x##_MARK, 0),
-	PINMUX_STATIC
-#undef FM
-};
-
-/*
- * R8A7795 has 8 banks with 32 PGIOS in each => 256 GPIOs.
- * Physical layout rows: A - AW, cols: 1 - 39.
- */
-#define ROW_GROUP_A(r) ('Z' - 'A' + 1 + (r))
-#define PIN_NUMBER(r, c) (((r) - 'A') * 39 + (c) + 300)
-#define PIN_A_NUMBER(r, c) PIN_NUMBER(ROW_GROUP_A(r), c)
-
-static const struct sh_pfc_pin pinmux_pins[] = {
-	PINMUX_GPIO_GP_ALL(),
-
-	/*
-	 * Pins not associated with a GPIO port.
-	 *
-	 * The pin positions are different between different r8a7795
-	 * packages, all that is needed for the pfc driver is a unique
-	 * number for each pin. To this end use the pin layout from
-	 * R-Car H3SiP to calculate a unique number for each pin.
-	 */
-	SH_PFC_PIN_NAMED_CFG('A',  8, AVB_TX_CTL, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('A',  9, AVB_MDIO, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('A', 12, AVB_TXCREFCLK, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('A', 13, AVB_RD0, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('A', 14, AVB_RD2, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('A', 16, AVB_RX_CTL, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('A', 17, AVB_TD2, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('A', 18, AVB_TD0, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('A', 19, AVB_TXC, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('B', 13, AVB_RD1, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('B', 14, AVB_RD3, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('B', 17, AVB_TD3, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('B', 18, AVB_TD1, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('B', 19, AVB_RXC, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('C',  1, PRESETOUT#, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('F',  1, CLKOUT, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('H', 37, MLB_REF, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('V',  3, QSPI1_SPCLK, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('V',  5, QSPI1_SSL, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('V',  6, RPC_WP#, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('V',  7, RPC_RESET#, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('W',  3, QSPI0_SPCLK, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('Y',  3, QSPI0_SSL, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('Y',  6, QSPI0_IO2, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('Y',  7, RPC_INT#, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('B'),  4, QSPI0_MISO_IO1, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('B'),  6, QSPI0_IO3, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  3, QSPI1_IO3, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  5, QSPI0_MOSI_IO0, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  7, QSPI1_MOSI_IO0, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 38, FSCLKST#, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 39, EXTALR, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  4, QSPI1_IO2, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  5, QSPI1_MISO_IO1, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  7, DU_DOTCLKIN0, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  8, DU_DOTCLKIN1, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  7, DU_DOTCLKIN2, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  8, DU_DOTCLKIN3, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 26, TRST#, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 29, TDI, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 30, TMS, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 27, TCK, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 28, TDO, SH_PFC_PIN_CFG_DRIVE_STRENGTH),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 30, ASEBRK, CFG_FLAGS),
-};
-
-/* - AUDIO CLOCK ------------------------------------------------------------ */
-static const unsigned int audio_clk_a_a_pins[] = {
-	/* CLK A */
-	RCAR_GP_PIN(6, 22),
-};
-static const unsigned int audio_clk_a_a_mux[] = {
-	AUDIO_CLKA_A_MARK,
-};
-static const unsigned int audio_clk_a_b_pins[] = {
-	/* CLK A */
-	RCAR_GP_PIN(5, 4),
-};
-static const unsigned int audio_clk_a_b_mux[] = {
-	AUDIO_CLKA_B_MARK,
-};
-static const unsigned int audio_clk_a_c_pins[] = {
-	/* CLK A */
-	RCAR_GP_PIN(5, 19),
-};
-static const unsigned int audio_clk_a_c_mux[] = {
-	AUDIO_CLKA_C_MARK,
-};
-static const unsigned int audio_clk_b_a_pins[] = {
-	/* CLK B */
-	RCAR_GP_PIN(5, 12),
-};
-static const unsigned int audio_clk_b_a_mux[] = {
-	AUDIO_CLKB_A_MARK,
-};
-static const unsigned int audio_clk_b_b_pins[] = {
-	/* CLK B */
-	RCAR_GP_PIN(6, 23),
-};
-static const unsigned int audio_clk_b_b_mux[] = {
-	AUDIO_CLKB_B_MARK,
-};
-static const unsigned int audio_clk_c_a_pins[] = {
-	/* CLK C */
-	RCAR_GP_PIN(5, 21),
-};
-static const unsigned int audio_clk_c_a_mux[] = {
-	AUDIO_CLKC_A_MARK,
-};
-static const unsigned int audio_clk_c_b_pins[] = {
-	/* CLK C */
-	RCAR_GP_PIN(5, 0),
-};
-static const unsigned int audio_clk_c_b_mux[] = {
-	AUDIO_CLKC_B_MARK,
-};
-static const unsigned int audio_clkout_a_pins[] = {
-	/* CLKOUT */
-	RCAR_GP_PIN(5, 18),
-};
-static const unsigned int audio_clkout_a_mux[] = {
-	AUDIO_CLKOUT_A_MARK,
-};
-static const unsigned int audio_clkout_b_pins[] = {
-	/* CLKOUT */
-	RCAR_GP_PIN(6, 28),
-};
-static const unsigned int audio_clkout_b_mux[] = {
-	AUDIO_CLKOUT_B_MARK,
-};
-static const unsigned int audio_clkout_c_pins[] = {
-	/* CLKOUT */
-	RCAR_GP_PIN(5, 3),
-};
-static const unsigned int audio_clkout_c_mux[] = {
-	AUDIO_CLKOUT_C_MARK,
-};
-static const unsigned int audio_clkout_d_pins[] = {
-	/* CLKOUT */
-	RCAR_GP_PIN(5, 21),
-};
-static const unsigned int audio_clkout_d_mux[] = {
-	AUDIO_CLKOUT_D_MARK,
-};
-static const unsigned int audio_clkout1_a_pins[] = {
-	/* CLKOUT1 */
-	RCAR_GP_PIN(5, 15),
-};
-static const unsigned int audio_clkout1_a_mux[] = {
-	AUDIO_CLKOUT1_A_MARK,
-};
-static const unsigned int audio_clkout1_b_pins[] = {
-	/* CLKOUT1 */
-	RCAR_GP_PIN(6, 29),
-};
-static const unsigned int audio_clkout1_b_mux[] = {
-	AUDIO_CLKOUT1_B_MARK,
-};
-static const unsigned int audio_clkout2_a_pins[] = {
-	/* CLKOUT2 */
-	RCAR_GP_PIN(5, 16),
-};
-static const unsigned int audio_clkout2_a_mux[] = {
-	AUDIO_CLKOUT2_A_MARK,
-};
-static const unsigned int audio_clkout2_b_pins[] = {
-	/* CLKOUT2 */
-	RCAR_GP_PIN(6, 30),
-};
-static const unsigned int audio_clkout2_b_mux[] = {
-	AUDIO_CLKOUT2_B_MARK,
-};
-
-static const unsigned int audio_clkout3_a_pins[] = {
-	/* CLKOUT3 */
-	RCAR_GP_PIN(5, 19),
-};
-static const unsigned int audio_clkout3_a_mux[] = {
-	AUDIO_CLKOUT3_A_MARK,
-};
-static const unsigned int audio_clkout3_b_pins[] = {
-	/* CLKOUT3 */
-	RCAR_GP_PIN(6, 31),
-};
-static const unsigned int audio_clkout3_b_mux[] = {
-	AUDIO_CLKOUT3_B_MARK,
-};
-
-/* - EtherAVB --------------------------------------------------------------- */
-static const unsigned int avb_link_pins[] = {
-	/* AVB_LINK */
-	RCAR_GP_PIN(2, 12),
-};
-static const unsigned int avb_link_mux[] = {
-	AVB_LINK_MARK,
-};
-static const unsigned int avb_magic_pins[] = {
-	/* AVB_MAGIC_ */
-	RCAR_GP_PIN(2, 10),
-};
-static const unsigned int avb_magic_mux[] = {
-	AVB_MAGIC_MARK,
-};
-static const unsigned int avb_phy_int_pins[] = {
-	/* AVB_PHY_INT */
-	RCAR_GP_PIN(2, 11),
-};
-static const unsigned int avb_phy_int_mux[] = {
-	AVB_PHY_INT_MARK,
-};
-static const unsigned int avb_mdc_pins[] = {
-	/* AVB_MDC, AVB_MDIO */
-	RCAR_GP_PIN(2, 9), PIN_NUMBER('A', 9),
-};
-static const unsigned int avb_mdc_mux[] = {
-	AVB_MDC_MARK, AVB_MDIO_MARK,
-};
-static const unsigned int avb_mii_pins[] = {
-	/*
-	 * AVB_TX_CTL, AVB_TXC, AVB_TD0,
-	 * AVB_TD1, AVB_TD2, AVB_TD3,
-	 * AVB_RX_CTL, AVB_RXC, AVB_RD0,
-	 * AVB_RD1, AVB_RD2, AVB_RD3,
-	 * AVB_TXCREFCLK
-	 */
-	PIN_NUMBER('A', 8), PIN_NUMBER('A', 19), PIN_NUMBER('A', 18),
-	PIN_NUMBER('B', 18), PIN_NUMBER('A', 17), PIN_NUMBER('B', 17),
-	PIN_NUMBER('A', 16), PIN_NUMBER('B', 19), PIN_NUMBER('A', 13),
-	PIN_NUMBER('B', 13), PIN_NUMBER('A', 14), PIN_NUMBER('B', 14),
-	PIN_NUMBER('A', 12),
-
-};
-static const unsigned int avb_mii_mux[] = {
-	AVB_TX_CTL_MARK, AVB_TXC_MARK, AVB_TD0_MARK,
-	AVB_TD1_MARK, AVB_TD2_MARK, AVB_TD3_MARK,
-	AVB_RX_CTL_MARK, AVB_RXC_MARK, AVB_RD0_MARK,
-	AVB_RD1_MARK, AVB_RD2_MARK, AVB_RD3_MARK,
-	AVB_TXCREFCLK_MARK,
-};
-static const unsigned int avb_avtp_pps_pins[] = {
-	/* AVB_AVTP_PPS */
-	RCAR_GP_PIN(2, 6),
-};
-static const unsigned int avb_avtp_pps_mux[] = {
-	AVB_AVTP_PPS_MARK,
-};
-static const unsigned int avb_avtp_match_a_pins[] = {
-	/* AVB_AVTP_MATCH_A */
-	RCAR_GP_PIN(2, 13),
-};
-static const unsigned int avb_avtp_match_a_mux[] = {
-	AVB_AVTP_MATCH_A_MARK,
-};
-static const unsigned int avb_avtp_capture_a_pins[] = {
-	/* AVB_AVTP_CAPTURE_A */
-	RCAR_GP_PIN(2, 14),
-};
-static const unsigned int avb_avtp_capture_a_mux[] = {
-	AVB_AVTP_CAPTURE_A_MARK,
-};
-static const unsigned int avb_avtp_match_b_pins[] = {
-	/*  AVB_AVTP_MATCH_B */
-	RCAR_GP_PIN(1, 8),
-};
-static const unsigned int avb_avtp_match_b_mux[] = {
-	AVB_AVTP_MATCH_B_MARK,
-};
-static const unsigned int avb_avtp_capture_b_pins[] = {
-	/* AVB_AVTP_CAPTURE_B */
-	RCAR_GP_PIN(1, 11),
-};
-static const unsigned int avb_avtp_capture_b_mux[] = {
-	AVB_AVTP_CAPTURE_B_MARK,
-};
-
-/* - CAN ------------------------------------------------------------------ */
-static const unsigned int can0_data_a_pins[] = {
-	/* TX, RX */
-	RCAR_GP_PIN(1, 23),	RCAR_GP_PIN(1, 24),
-};
-static const unsigned int can0_data_a_mux[] = {
-	CAN0_TX_A_MARK,		CAN0_RX_A_MARK,
-};
-static const unsigned int can0_data_b_pins[] = {
-	/* TX, RX */
-	RCAR_GP_PIN(2, 0),	RCAR_GP_PIN(2, 1),
-};
-static const unsigned int can0_data_b_mux[] = {
-	CAN0_TX_B_MARK,		CAN0_RX_B_MARK,
-};
-static const unsigned int can1_data_pins[] = {
-	/* TX, RX */
-	RCAR_GP_PIN(1, 22),	RCAR_GP_PIN(1, 26),
-};
-static const unsigned int can1_data_mux[] = {
-	CAN1_TX_MARK,		CAN1_RX_MARK,
-};
-
-/* - CAN Clock -------------------------------------------------------------- */
-static const unsigned int can_clk_pins[] = {
-	/* CLK */
-	RCAR_GP_PIN(1, 25),
-};
-static const unsigned int can_clk_mux[] = {
-	CAN_CLK_MARK,
-};
-
-/* - CAN FD --------------------------------------------------------------- */
-static const unsigned int canfd0_data_a_pins[] = {
-	/* TX, RX */
-	RCAR_GP_PIN(1, 23),     RCAR_GP_PIN(1, 24),
-};
-static const unsigned int canfd0_data_a_mux[] = {
-	CANFD0_TX_A_MARK,       CANFD0_RX_A_MARK,
-};
-static const unsigned int canfd0_data_b_pins[] = {
-	/* TX, RX */
-	RCAR_GP_PIN(2, 0),      RCAR_GP_PIN(2, 1),
-};
-static const unsigned int canfd0_data_b_mux[] = {
-	CANFD0_TX_B_MARK,       CANFD0_RX_B_MARK,
-};
-static const unsigned int canfd1_data_pins[] = {
-	/* TX, RX */
-	RCAR_GP_PIN(1, 22),     RCAR_GP_PIN(1, 26),
-};
-static const unsigned int canfd1_data_mux[] = {
-	CANFD1_TX_MARK,         CANFD1_RX_MARK,
-};
-
-/* - DRIF0 --------------------------------------------------------------- */
-static const unsigned int drif0_ctrl_a_pins[] = {
-	/* CLK, SYNC */
-	RCAR_GP_PIN(6, 8), RCAR_GP_PIN(6, 9),
-};
-static const unsigned int drif0_ctrl_a_mux[] = {
-	RIF0_CLK_A_MARK, RIF0_SYNC_A_MARK,
-};
-static const unsigned int drif0_data0_a_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(6, 10),
-};
-static const unsigned int drif0_data0_a_mux[] = {
-	RIF0_D0_A_MARK,
-};
-static const unsigned int drif0_data1_a_pins[] = {
-	/* D1 */
-	RCAR_GP_PIN(6, 7),
-};
-static const unsigned int drif0_data1_a_mux[] = {
-	RIF0_D1_A_MARK,
-};
-static const unsigned int drif0_ctrl_b_pins[] = {
-	/* CLK, SYNC */
-	RCAR_GP_PIN(5, 0), RCAR_GP_PIN(5, 4),
-};
-static const unsigned int drif0_ctrl_b_mux[] = {
-	RIF0_CLK_B_MARK, RIF0_SYNC_B_MARK,
-};
-static const unsigned int drif0_data0_b_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(5, 1),
-};
-static const unsigned int drif0_data0_b_mux[] = {
-	RIF0_D0_B_MARK,
-};
-static const unsigned int drif0_data1_b_pins[] = {
-	/* D1 */
-	RCAR_GP_PIN(5, 2),
-};
-static const unsigned int drif0_data1_b_mux[] = {
-	RIF0_D1_B_MARK,
-};
-static const unsigned int drif0_ctrl_c_pins[] = {
-	/* CLK, SYNC */
-	RCAR_GP_PIN(5, 12), RCAR_GP_PIN(5, 15),
-};
-static const unsigned int drif0_ctrl_c_mux[] = {
-	RIF0_CLK_C_MARK, RIF0_SYNC_C_MARK,
-};
-static const unsigned int drif0_data0_c_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(5, 13),
-};
-static const unsigned int drif0_data0_c_mux[] = {
-	RIF0_D0_C_MARK,
-};
-static const unsigned int drif0_data1_c_pins[] = {
-	/* D1 */
-	RCAR_GP_PIN(5, 14),
-};
-static const unsigned int drif0_data1_c_mux[] = {
-	RIF0_D1_C_MARK,
-};
-/* - DRIF1 --------------------------------------------------------------- */
-static const unsigned int drif1_ctrl_a_pins[] = {
-	/* CLK, SYNC */
-	RCAR_GP_PIN(6, 17), RCAR_GP_PIN(6, 18),
-};
-static const unsigned int drif1_ctrl_a_mux[] = {
-	RIF1_CLK_A_MARK, RIF1_SYNC_A_MARK,
-};
-static const unsigned int drif1_data0_a_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(6, 19),
-};
-static const unsigned int drif1_data0_a_mux[] = {
-	RIF1_D0_A_MARK,
-};
-static const unsigned int drif1_data1_a_pins[] = {
-	/* D1 */
-	RCAR_GP_PIN(6, 20),
-};
-static const unsigned int drif1_data1_a_mux[] = {
-	RIF1_D1_A_MARK,
-};
-static const unsigned int drif1_ctrl_b_pins[] = {
-	/* CLK, SYNC */
-	RCAR_GP_PIN(5, 9), RCAR_GP_PIN(5, 3),
-};
-static const unsigned int drif1_ctrl_b_mux[] = {
-	RIF1_CLK_B_MARK, RIF1_SYNC_B_MARK,
-};
-static const unsigned int drif1_data0_b_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(5, 7),
-};
-static const unsigned int drif1_data0_b_mux[] = {
-	RIF1_D0_B_MARK,
-};
-static const unsigned int drif1_data1_b_pins[] = {
-	/* D1 */
-	RCAR_GP_PIN(5, 8),
-};
-static const unsigned int drif1_data1_b_mux[] = {
-	RIF1_D1_B_MARK,
-};
-static const unsigned int drif1_ctrl_c_pins[] = {
-	/* CLK, SYNC */
-	RCAR_GP_PIN(5, 5), RCAR_GP_PIN(5, 11),
-};
-static const unsigned int drif1_ctrl_c_mux[] = {
-	RIF1_CLK_C_MARK, RIF1_SYNC_C_MARK,
-};
-static const unsigned int drif1_data0_c_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(5, 6),
-};
-static const unsigned int drif1_data0_c_mux[] = {
-	RIF1_D0_C_MARK,
-};
-static const unsigned int drif1_data1_c_pins[] = {
-	/* D1 */
-	RCAR_GP_PIN(5, 10),
-};
-static const unsigned int drif1_data1_c_mux[] = {
-	RIF1_D1_C_MARK,
-};
-/* - DRIF2 --------------------------------------------------------------- */
-static const unsigned int drif2_ctrl_a_pins[] = {
-	/* CLK, SYNC */
-	RCAR_GP_PIN(6, 8), RCAR_GP_PIN(6, 9),
-};
-static const unsigned int drif2_ctrl_a_mux[] = {
-	RIF2_CLK_A_MARK, RIF2_SYNC_A_MARK,
-};
-static const unsigned int drif2_data0_a_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(6, 7),
-};
-static const unsigned int drif2_data0_a_mux[] = {
-	RIF2_D0_A_MARK,
-};
-static const unsigned int drif2_data1_a_pins[] = {
-	/* D1 */
-	RCAR_GP_PIN(6, 10),
-};
-static const unsigned int drif2_data1_a_mux[] = {
-	RIF2_D1_A_MARK,
-};
-static const unsigned int drif2_ctrl_b_pins[] = {
-	/* CLK, SYNC */
-	RCAR_GP_PIN(6, 26), RCAR_GP_PIN(6, 27),
-};
-static const unsigned int drif2_ctrl_b_mux[] = {
-	RIF2_CLK_B_MARK, RIF2_SYNC_B_MARK,
-};
-static const unsigned int drif2_data0_b_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(6, 30),
-};
-static const unsigned int drif2_data0_b_mux[] = {
-	RIF2_D0_B_MARK,
-};
-static const unsigned int drif2_data1_b_pins[] = {
-	/* D1 */
-	RCAR_GP_PIN(6, 31),
-};
-static const unsigned int drif2_data1_b_mux[] = {
-	RIF2_D1_B_MARK,
-};
-/* - DRIF3 --------------------------------------------------------------- */
-static const unsigned int drif3_ctrl_a_pins[] = {
-	/* CLK, SYNC */
-	RCAR_GP_PIN(6, 17), RCAR_GP_PIN(6, 18),
-};
-static const unsigned int drif3_ctrl_a_mux[] = {
-	RIF3_CLK_A_MARK, RIF3_SYNC_A_MARK,
-};
-static const unsigned int drif3_data0_a_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(6, 19),
-};
-static const unsigned int drif3_data0_a_mux[] = {
-	RIF3_D0_A_MARK,
-};
-static const unsigned int drif3_data1_a_pins[] = {
-	/* D1 */
-	RCAR_GP_PIN(6, 20),
-};
-static const unsigned int drif3_data1_a_mux[] = {
-	RIF3_D1_A_MARK,
-};
-static const unsigned int drif3_ctrl_b_pins[] = {
-	/* CLK, SYNC */
-	RCAR_GP_PIN(6, 24), RCAR_GP_PIN(6, 25),
-};
-static const unsigned int drif3_ctrl_b_mux[] = {
-	RIF3_CLK_B_MARK, RIF3_SYNC_B_MARK,
-};
-static const unsigned int drif3_data0_b_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(6, 28),
-};
-static const unsigned int drif3_data0_b_mux[] = {
-	RIF3_D0_B_MARK,
-};
-static const unsigned int drif3_data1_b_pins[] = {
-	/* D1 */
-	RCAR_GP_PIN(6, 29),
-};
-static const unsigned int drif3_data1_b_mux[] = {
-	RIF3_D1_B_MARK,
-};
-
-/* - DU --------------------------------------------------------------------- */
-static const unsigned int du_rgb666_pins[] = {
-	/* R[7:2], G[7:2], B[7:2] */
-	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 13),
-	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 11), RCAR_GP_PIN(0, 10),
-	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 13),
-	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 18),
-	RCAR_GP_PIN(1, 7),  RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 5),
-	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 2),
-};
-static const unsigned int du_rgb666_mux[] = {
-	DU_DR7_MARK, DU_DR6_MARK, DU_DR5_MARK, DU_DR4_MARK,
-	DU_DR3_MARK, DU_DR2_MARK,
-	DU_DG7_MARK, DU_DG6_MARK, DU_DG5_MARK, DU_DG4_MARK,
-	DU_DG3_MARK, DU_DG2_MARK,
-	DU_DB7_MARK, DU_DB6_MARK, DU_DB5_MARK, DU_DB4_MARK,
-	DU_DB3_MARK, DU_DB2_MARK,
-};
-static const unsigned int du_rgb888_pins[] = {
-	/* R[7:0], G[7:0], B[7:0] */
-	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 13),
-	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 11), RCAR_GP_PIN(0, 10),
-	RCAR_GP_PIN(0, 9),  RCAR_GP_PIN(0, 8),
-	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 13),
-	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 18),
-	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 16),
-	RCAR_GP_PIN(1, 7),  RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 5),
-	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 2),
-	RCAR_GP_PIN(1, 1),  RCAR_GP_PIN(1, 0),
-};
-static const unsigned int du_rgb888_mux[] = {
-	DU_DR7_MARK, DU_DR6_MARK, DU_DR5_MARK, DU_DR4_MARK,
-	DU_DR3_MARK, DU_DR2_MARK, DU_DR1_MARK, DU_DR0_MARK,
-	DU_DG7_MARK, DU_DG6_MARK, DU_DG5_MARK, DU_DG4_MARK,
-	DU_DG3_MARK, DU_DG2_MARK, DU_DG1_MARK, DU_DG0_MARK,
-	DU_DB7_MARK, DU_DB6_MARK, DU_DB5_MARK, DU_DB4_MARK,
-	DU_DB3_MARK, DU_DB2_MARK, DU_DB1_MARK, DU_DB0_MARK,
-};
-static const unsigned int du_clk_out_0_pins[] = {
-	/* CLKOUT */
-	RCAR_GP_PIN(1, 27),
-};
-static const unsigned int du_clk_out_0_mux[] = {
-	DU_DOTCLKOUT0_MARK
-};
-static const unsigned int du_clk_out_1_pins[] = {
-	/* CLKOUT */
-	RCAR_GP_PIN(2, 3),
-};
-static const unsigned int du_clk_out_1_mux[] = {
-	DU_DOTCLKOUT1_MARK
-};
-static const unsigned int du_sync_pins[] = {
-	/* EXVSYNC/VSYNC, EXHSYNC/HSYNC */
-	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 4),
-};
-static const unsigned int du_sync_mux[] = {
-	DU_EXVSYNC_DU_VSYNC_MARK, DU_EXHSYNC_DU_HSYNC_MARK
-};
-static const unsigned int du_oddf_pins[] = {
-	/* EXDISP/EXODDF/EXCDE */
-	RCAR_GP_PIN(2, 2),
-};
-static const unsigned int du_oddf_mux[] = {
-	DU_EXODDF_DU_ODDF_DISP_CDE_MARK,
-};
-static const unsigned int du_cde_pins[] = {
-	/* CDE */
-	RCAR_GP_PIN(2, 0),
-};
-static const unsigned int du_cde_mux[] = {
-	DU_CDE_MARK,
-};
-static const unsigned int du_disp_pins[] = {
-	/* DISP */
-	RCAR_GP_PIN(2, 1),
-};
-static const unsigned int du_disp_mux[] = {
-	DU_DISP_MARK,
-};
-/* - HSCIF0 ----------------------------------------------------------------- */
-static const unsigned int hscif0_data_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(5, 13), RCAR_GP_PIN(5, 14),
-};
-static const unsigned int hscif0_data_mux[] = {
-	HRX0_MARK, HTX0_MARK,
-};
-static const unsigned int hscif0_clk_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(5, 12),
-};
-static const unsigned int hscif0_clk_mux[] = {
-	HSCK0_MARK,
-};
-static const unsigned int hscif0_ctrl_pins[] = {
-	/* RTS, CTS */
-	RCAR_GP_PIN(5, 16), RCAR_GP_PIN(5, 15),
-};
-static const unsigned int hscif0_ctrl_mux[] = {
-	HRTS0_N_MARK, HCTS0_N_MARK,
-};
-/* - HSCIF1 ----------------------------------------------------------------- */
-static const unsigned int hscif1_data_a_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(5, 5), RCAR_GP_PIN(5, 6),
-};
-static const unsigned int hscif1_data_a_mux[] = {
-	HRX1_A_MARK, HTX1_A_MARK,
-};
-static const unsigned int hscif1_clk_a_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(6, 21),
-};
-static const unsigned int hscif1_clk_a_mux[] = {
-	HSCK1_A_MARK,
-};
-static const unsigned int hscif1_ctrl_a_pins[] = {
-	/* RTS, CTS */
-	RCAR_GP_PIN(5, 8), RCAR_GP_PIN(5, 7),
-};
-static const unsigned int hscif1_ctrl_a_mux[] = {
-	HRTS1_N_A_MARK, HCTS1_N_A_MARK,
-};
-
-static const unsigned int hscif1_data_b_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(5, 1), RCAR_GP_PIN(5, 2),
-};
-static const unsigned int hscif1_data_b_mux[] = {
-	HRX1_B_MARK, HTX1_B_MARK,
-};
-static const unsigned int hscif1_clk_b_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(5, 0),
-};
-static const unsigned int hscif1_clk_b_mux[] = {
-	HSCK1_B_MARK,
-};
-static const unsigned int hscif1_ctrl_b_pins[] = {
-	/* RTS, CTS */
-	RCAR_GP_PIN(5, 4), RCAR_GP_PIN(5, 3),
-};
-static const unsigned int hscif1_ctrl_b_mux[] = {
-	HRTS1_N_B_MARK, HCTS1_N_B_MARK,
-};
-/* - HSCIF2 ----------------------------------------------------------------- */
-static const unsigned int hscif2_data_a_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(6, 8), RCAR_GP_PIN(6, 9),
-};
-static const unsigned int hscif2_data_a_mux[] = {
-	HRX2_A_MARK, HTX2_A_MARK,
-};
-static const unsigned int hscif2_clk_a_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(6, 10),
-};
-static const unsigned int hscif2_clk_a_mux[] = {
-	HSCK2_A_MARK,
-};
-static const unsigned int hscif2_ctrl_a_pins[] = {
-	/* RTS, CTS */
-	RCAR_GP_PIN(6, 7), RCAR_GP_PIN(6, 6),
-};
-static const unsigned int hscif2_ctrl_a_mux[] = {
-	HRTS2_N_A_MARK, HCTS2_N_A_MARK,
-};
-
-static const unsigned int hscif2_data_b_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(6, 17), RCAR_GP_PIN(6, 18),
-};
-static const unsigned int hscif2_data_b_mux[] = {
-	HRX2_B_MARK, HTX2_B_MARK,
-};
-static const unsigned int hscif2_clk_b_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(6, 21),
-};
-static const unsigned int hscif2_clk_b_mux[] = {
-	HSCK2_B_MARK,
-};
-static const unsigned int hscif2_ctrl_b_pins[] = {
-	/* RTS, CTS */
-	RCAR_GP_PIN(6, 20), RCAR_GP_PIN(6, 19),
-};
-static const unsigned int hscif2_ctrl_b_mux[] = {
-	HRTS2_N_B_MARK, HCTS2_N_B_MARK,
-};
-/* - HSCIF3 ----------------------------------------------------------------- */
-static const unsigned int hscif3_data_a_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(1, 23), RCAR_GP_PIN(1, 24),
-};
-static const unsigned int hscif3_data_a_mux[] = {
-	HRX3_A_MARK, HTX3_A_MARK,
-};
-static const unsigned int hscif3_clk_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(1, 22),
-};
-static const unsigned int hscif3_clk_mux[] = {
-	HSCK3_MARK,
-};
-static const unsigned int hscif3_ctrl_pins[] = {
-	/* RTS, CTS */
-	RCAR_GP_PIN(1, 26), RCAR_GP_PIN(1, 25),
-};
-static const unsigned int hscif3_ctrl_mux[] = {
-	HRTS3_N_MARK, HCTS3_N_MARK,
-};
-
-static const unsigned int hscif3_data_b_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
-};
-static const unsigned int hscif3_data_b_mux[] = {
-	HRX3_B_MARK, HTX3_B_MARK,
-};
-static const unsigned int hscif3_data_c_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
-};
-static const unsigned int hscif3_data_c_mux[] = {
-	HRX3_C_MARK, HTX3_C_MARK,
-};
-static const unsigned int hscif3_data_d_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
-};
-static const unsigned int hscif3_data_d_mux[] = {
-	HRX3_D_MARK, HTX3_D_MARK,
-};
-/* - HSCIF4 ----------------------------------------------------------------- */
-static const unsigned int hscif4_data_a_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
-};
-static const unsigned int hscif4_data_a_mux[] = {
-	HRX4_A_MARK, HTX4_A_MARK,
-};
-static const unsigned int hscif4_clk_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(1, 11),
-};
-static const unsigned int hscif4_clk_mux[] = {
-	HSCK4_MARK,
-};
-static const unsigned int hscif4_ctrl_pins[] = {
-	/* RTS, CTS */
-	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14),
-};
-static const unsigned int hscif4_ctrl_mux[] = {
-	HRTS4_N_MARK, HCTS4_N_MARK,
-};
-
-static const unsigned int hscif4_data_b_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 11),
-};
-static const unsigned int hscif4_data_b_mux[] = {
-	HRX4_B_MARK, HTX4_B_MARK,
-};
-
-/* - I2C -------------------------------------------------------------------- */
-static const unsigned int i2c1_a_pins[] = {
-	/* SDA, SCL */
-	RCAR_GP_PIN(5, 11), RCAR_GP_PIN(5, 10),
-};
-static const unsigned int i2c1_a_mux[] = {
-	SDA1_A_MARK, SCL1_A_MARK,
-};
-static const unsigned int i2c1_b_pins[] = {
-	/* SDA, SCL */
-	RCAR_GP_PIN(5, 24), RCAR_GP_PIN(5, 23),
-};
-static const unsigned int i2c1_b_mux[] = {
-	SDA1_B_MARK, SCL1_B_MARK,
-};
-static const unsigned int i2c2_a_pins[] = {
-	/* SDA, SCL */
-	RCAR_GP_PIN(5, 0), RCAR_GP_PIN(5, 4),
-};
-static const unsigned int i2c2_a_mux[] = {
-	SDA2_A_MARK, SCL2_A_MARK,
-};
-static const unsigned int i2c2_b_pins[] = {
-	/* SDA, SCL */
-	RCAR_GP_PIN(3, 13), RCAR_GP_PIN(3, 12),
-};
-static const unsigned int i2c2_b_mux[] = {
-	SDA2_B_MARK, SCL2_B_MARK,
-};
-static const unsigned int i2c6_a_pins[] = {
-	/* SDA, SCL */
-	RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 11),
-};
-static const unsigned int i2c6_a_mux[] = {
-	SDA6_A_MARK, SCL6_A_MARK,
-};
-static const unsigned int i2c6_b_pins[] = {
-	/* SDA, SCL */
-	RCAR_GP_PIN(1, 26), RCAR_GP_PIN(1, 25),
-};
-static const unsigned int i2c6_b_mux[] = {
-	SDA6_B_MARK, SCL6_B_MARK,
-};
-static const unsigned int i2c6_c_pins[] = {
-	/* SDA, SCL */
-	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 14),
-};
-static const unsigned int i2c6_c_mux[] = {
-	SDA6_C_MARK, SCL6_C_MARK,
-};
-
-/* - INTC-EX ---------------------------------------------------------------- */
-static const unsigned int intc_ex_irq0_pins[] = {
-	/* IRQ0 */
-	RCAR_GP_PIN(2, 0),
-};
-static const unsigned int intc_ex_irq0_mux[] = {
-	IRQ0_MARK,
-};
-static const unsigned int intc_ex_irq1_pins[] = {
-	/* IRQ1 */
-	RCAR_GP_PIN(2, 1),
-};
-static const unsigned int intc_ex_irq1_mux[] = {
-	IRQ1_MARK,
-};
-static const unsigned int intc_ex_irq2_pins[] = {
-	/* IRQ2 */
-	RCAR_GP_PIN(2, 2),
-};
-static const unsigned int intc_ex_irq2_mux[] = {
-	IRQ2_MARK,
-};
-static const unsigned int intc_ex_irq3_pins[] = {
-	/* IRQ3 */
-	RCAR_GP_PIN(2, 3),
-};
-static const unsigned int intc_ex_irq3_mux[] = {
-	IRQ3_MARK,
-};
-static const unsigned int intc_ex_irq4_pins[] = {
-	/* IRQ4 */
-	RCAR_GP_PIN(2, 4),
-};
-static const unsigned int intc_ex_irq4_mux[] = {
-	IRQ4_MARK,
-};
-static const unsigned int intc_ex_irq5_pins[] = {
-	/* IRQ5 */
-	RCAR_GP_PIN(2, 5),
-};
-static const unsigned int intc_ex_irq5_mux[] = {
-	IRQ5_MARK,
-};
-
-/* - MSIOF0 ----------------------------------------------------------------- */
-static const unsigned int msiof0_clk_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(5, 17),
-};
-static const unsigned int msiof0_clk_mux[] = {
-	MSIOF0_SCK_MARK,
-};
-static const unsigned int msiof0_sync_pins[] = {
-	/* SYNC */
-	RCAR_GP_PIN(5, 18),
-};
-static const unsigned int msiof0_sync_mux[] = {
-	MSIOF0_SYNC_MARK,
-};
-static const unsigned int msiof0_ss1_pins[] = {
-	/* SS1 */
-	RCAR_GP_PIN(5, 19),
-};
-static const unsigned int msiof0_ss1_mux[] = {
-	MSIOF0_SS1_MARK,
-};
-static const unsigned int msiof0_ss2_pins[] = {
-	/* SS2 */
-	RCAR_GP_PIN(5, 21),
-};
-static const unsigned int msiof0_ss2_mux[] = {
-	MSIOF0_SS2_MARK,
-};
-static const unsigned int msiof0_txd_pins[] = {
-	/* TXD */
-	RCAR_GP_PIN(5, 20),
-};
-static const unsigned int msiof0_txd_mux[] = {
-	MSIOF0_TXD_MARK,
-};
-static const unsigned int msiof0_rxd_pins[] = {
-	/* RXD */
-	RCAR_GP_PIN(5, 22),
-};
-static const unsigned int msiof0_rxd_mux[] = {
-	MSIOF0_RXD_MARK,
-};
-/* - MSIOF1 ----------------------------------------------------------------- */
-static const unsigned int msiof1_clk_a_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(6, 8),
-};
-static const unsigned int msiof1_clk_a_mux[] = {
-	MSIOF1_SCK_A_MARK,
-};
-static const unsigned int msiof1_sync_a_pins[] = {
-	/* SYNC */
-	RCAR_GP_PIN(6, 9),
-};
-static const unsigned int msiof1_sync_a_mux[] = {
-	MSIOF1_SYNC_A_MARK,
-};
-static const unsigned int msiof1_ss1_a_pins[] = {
-	/* SS1 */
-	RCAR_GP_PIN(6, 5),
-};
-static const unsigned int msiof1_ss1_a_mux[] = {
-	MSIOF1_SS1_A_MARK,
-};
-static const unsigned int msiof1_ss2_a_pins[] = {
-	/* SS2 */
-	RCAR_GP_PIN(6, 6),
-};
-static const unsigned int msiof1_ss2_a_mux[] = {
-	MSIOF1_SS2_A_MARK,
-};
-static const unsigned int msiof1_txd_a_pins[] = {
-	/* TXD */
-	RCAR_GP_PIN(6, 7),
-};
-static const unsigned int msiof1_txd_a_mux[] = {
-	MSIOF1_TXD_A_MARK,
-};
-static const unsigned int msiof1_rxd_a_pins[] = {
-	/* RXD */
-	RCAR_GP_PIN(6, 10),
-};
-static const unsigned int msiof1_rxd_a_mux[] = {
-	MSIOF1_RXD_A_MARK,
-};
-static const unsigned int msiof1_clk_b_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(5, 9),
-};
-static const unsigned int msiof1_clk_b_mux[] = {
-	MSIOF1_SCK_B_MARK,
-};
-static const unsigned int msiof1_sync_b_pins[] = {
-	/* SYNC */
-	RCAR_GP_PIN(5, 3),
-};
-static const unsigned int msiof1_sync_b_mux[] = {
-	MSIOF1_SYNC_B_MARK,
-};
-static const unsigned int msiof1_ss1_b_pins[] = {
-	/* SS1 */
-	RCAR_GP_PIN(5, 4),
-};
-static const unsigned int msiof1_ss1_b_mux[] = {
-	MSIOF1_SS1_B_MARK,
-};
-static const unsigned int msiof1_ss2_b_pins[] = {
-	/* SS2 */
-	RCAR_GP_PIN(5, 0),
-};
-static const unsigned int msiof1_ss2_b_mux[] = {
-	MSIOF1_SS2_B_MARK,
-};
-static const unsigned int msiof1_txd_b_pins[] = {
-	/* TXD */
-	RCAR_GP_PIN(5, 8),
-};
-static const unsigned int msiof1_txd_b_mux[] = {
-	MSIOF1_TXD_B_MARK,
-};
-static const unsigned int msiof1_rxd_b_pins[] = {
-	/* RXD */
-	RCAR_GP_PIN(5, 7),
-};
-static const unsigned int msiof1_rxd_b_mux[] = {
-	MSIOF1_RXD_B_MARK,
-};
-static const unsigned int msiof1_clk_c_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(6, 17),
-};
-static const unsigned int msiof1_clk_c_mux[] = {
-	MSIOF1_SCK_C_MARK,
-};
-static const unsigned int msiof1_sync_c_pins[] = {
-	/* SYNC */
-	RCAR_GP_PIN(6, 18),
-};
-static const unsigned int msiof1_sync_c_mux[] = {
-	MSIOF1_SYNC_C_MARK,
-};
-static const unsigned int msiof1_ss1_c_pins[] = {
-	/* SS1 */
-	RCAR_GP_PIN(6, 21),
-};
-static const unsigned int msiof1_ss1_c_mux[] = {
-	MSIOF1_SS1_C_MARK,
-};
-static const unsigned int msiof1_ss2_c_pins[] = {
-	/* SS2 */
-	RCAR_GP_PIN(6, 27),
-};
-static const unsigned int msiof1_ss2_c_mux[] = {
-	MSIOF1_SS2_C_MARK,
-};
-static const unsigned int msiof1_txd_c_pins[] = {
-	/* TXD */
-	RCAR_GP_PIN(6, 20),
-};
-static const unsigned int msiof1_txd_c_mux[] = {
-	MSIOF1_TXD_C_MARK,
-};
-static const unsigned int msiof1_rxd_c_pins[] = {
-	/* RXD */
-	RCAR_GP_PIN(6, 19),
-};
-static const unsigned int msiof1_rxd_c_mux[] = {
-	MSIOF1_RXD_C_MARK,
-};
-static const unsigned int msiof1_clk_d_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(5, 12),
-};
-static const unsigned int msiof1_clk_d_mux[] = {
-	MSIOF1_SCK_D_MARK,
-};
-static const unsigned int msiof1_sync_d_pins[] = {
-	/* SYNC */
-	RCAR_GP_PIN(5, 15),
-};
-static const unsigned int msiof1_sync_d_mux[] = {
-	MSIOF1_SYNC_D_MARK,
-};
-static const unsigned int msiof1_ss1_d_pins[] = {
-	/* SS1 */
-	RCAR_GP_PIN(5, 16),
-};
-static const unsigned int msiof1_ss1_d_mux[] = {
-	MSIOF1_SS1_D_MARK,
-};
-static const unsigned int msiof1_ss2_d_pins[] = {
-	/* SS2 */
-	RCAR_GP_PIN(5, 21),
-};
-static const unsigned int msiof1_ss2_d_mux[] = {
-	MSIOF1_SS2_D_MARK,
-};
-static const unsigned int msiof1_txd_d_pins[] = {
-	/* TXD */
-	RCAR_GP_PIN(5, 14),
-};
-static const unsigned int msiof1_txd_d_mux[] = {
-	MSIOF1_TXD_D_MARK,
-};
-static const unsigned int msiof1_rxd_d_pins[] = {
-	/* RXD */
-	RCAR_GP_PIN(5, 13),
-};
-static const unsigned int msiof1_rxd_d_mux[] = {
-	MSIOF1_RXD_D_MARK,
-};
-static const unsigned int msiof1_clk_e_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(3, 0),
-};
-static const unsigned int msiof1_clk_e_mux[] = {
-	MSIOF1_SCK_E_MARK,
-};
-static const unsigned int msiof1_sync_e_pins[] = {
-	/* SYNC */
-	RCAR_GP_PIN(3, 1),
-};
-static const unsigned int msiof1_sync_e_mux[] = {
-	MSIOF1_SYNC_E_MARK,
-};
-static const unsigned int msiof1_ss1_e_pins[] = {
-	/* SS1 */
-	RCAR_GP_PIN(3, 4),
-};
-static const unsigned int msiof1_ss1_e_mux[] = {
-	MSIOF1_SS1_E_MARK,
-};
-static const unsigned int msiof1_ss2_e_pins[] = {
-	/* SS2 */
-	RCAR_GP_PIN(3, 5),
-};
-static const unsigned int msiof1_ss2_e_mux[] = {
-	MSIOF1_SS2_E_MARK,
-};
-static const unsigned int msiof1_txd_e_pins[] = {
-	/* TXD */
-	RCAR_GP_PIN(3, 3),
-};
-static const unsigned int msiof1_txd_e_mux[] = {
-	MSIOF1_TXD_E_MARK,
-};
-static const unsigned int msiof1_rxd_e_pins[] = {
-	/* RXD */
-	RCAR_GP_PIN(3, 2),
-};
-static const unsigned int msiof1_rxd_e_mux[] = {
-	MSIOF1_RXD_E_MARK,
-};
-static const unsigned int msiof1_clk_f_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(5, 23),
-};
-static const unsigned int msiof1_clk_f_mux[] = {
-	MSIOF1_SCK_F_MARK,
-};
-static const unsigned int msiof1_sync_f_pins[] = {
-	/* SYNC */
-	RCAR_GP_PIN(5, 24),
-};
-static const unsigned int msiof1_sync_f_mux[] = {
-	MSIOF1_SYNC_F_MARK,
-};
-static const unsigned int msiof1_ss1_f_pins[] = {
-	/* SS1 */
-	RCAR_GP_PIN(6, 1),
-};
-static const unsigned int msiof1_ss1_f_mux[] = {
-	MSIOF1_SS1_F_MARK,
-};
-static const unsigned int msiof1_ss2_f_pins[] = {
-	/* SS2 */
-	RCAR_GP_PIN(6, 2),
-};
-static const unsigned int msiof1_ss2_f_mux[] = {
-	MSIOF1_SS2_F_MARK,
-};
-static const unsigned int msiof1_txd_f_pins[] = {
-	/* TXD */
-	RCAR_GP_PIN(6, 0),
-};
-static const unsigned int msiof1_txd_f_mux[] = {
-	MSIOF1_TXD_F_MARK,
-};
-static const unsigned int msiof1_rxd_f_pins[] = {
-	/* RXD */
-	RCAR_GP_PIN(5, 25),
-};
-static const unsigned int msiof1_rxd_f_mux[] = {
-	MSIOF1_RXD_F_MARK,
-};
-static const unsigned int msiof1_clk_g_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(3, 6),
-};
-static const unsigned int msiof1_clk_g_mux[] = {
-	MSIOF1_SCK_G_MARK,
-};
-static const unsigned int msiof1_sync_g_pins[] = {
-	/* SYNC */
-	RCAR_GP_PIN(3, 7),
-};
-static const unsigned int msiof1_sync_g_mux[] = {
-	MSIOF1_SYNC_G_MARK,
-};
-static const unsigned int msiof1_ss1_g_pins[] = {
-	/* SS1 */
-	RCAR_GP_PIN(3, 10),
-};
-static const unsigned int msiof1_ss1_g_mux[] = {
-	MSIOF1_SS1_G_MARK,
-};
-static const unsigned int msiof1_ss2_g_pins[] = {
-	/* SS2 */
-	RCAR_GP_PIN(3, 11),
-};
-static const unsigned int msiof1_ss2_g_mux[] = {
-	MSIOF1_SS2_G_MARK,
-};
-static const unsigned int msiof1_txd_g_pins[] = {
-	/* TXD */
-	RCAR_GP_PIN(3, 9),
-};
-static const unsigned int msiof1_txd_g_mux[] = {
-	MSIOF1_TXD_G_MARK,
-};
-static const unsigned int msiof1_rxd_g_pins[] = {
-	/* RXD */
-	RCAR_GP_PIN(3, 8),
-};
-static const unsigned int msiof1_rxd_g_mux[] = {
-	MSIOF1_RXD_G_MARK,
-};
-/* - MSIOF2 ----------------------------------------------------------------- */
-static const unsigned int msiof2_clk_a_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(1, 9),
-};
-static const unsigned int msiof2_clk_a_mux[] = {
-	MSIOF2_SCK_A_MARK,
-};
-static const unsigned int msiof2_sync_a_pins[] = {
-	/* SYNC */
-	RCAR_GP_PIN(1, 8),
-};
-static const unsigned int msiof2_sync_a_mux[] = {
-	MSIOF2_SYNC_A_MARK,
-};
-static const unsigned int msiof2_ss1_a_pins[] = {
-	/* SS1 */
-	RCAR_GP_PIN(1, 6),
-};
-static const unsigned int msiof2_ss1_a_mux[] = {
-	MSIOF2_SS1_A_MARK,
-};
-static const unsigned int msiof2_ss2_a_pins[] = {
-	/* SS2 */
-	RCAR_GP_PIN(1, 7),
-};
-static const unsigned int msiof2_ss2_a_mux[] = {
-	MSIOF2_SS2_A_MARK,
-};
-static const unsigned int msiof2_txd_a_pins[] = {
-	/* TXD */
-	RCAR_GP_PIN(1, 11),
-};
-static const unsigned int msiof2_txd_a_mux[] = {
-	MSIOF2_TXD_A_MARK,
-};
-static const unsigned int msiof2_rxd_a_pins[] = {
-	/* RXD */
-	RCAR_GP_PIN(1, 10),
-};
-static const unsigned int msiof2_rxd_a_mux[] = {
-	MSIOF2_RXD_A_MARK,
-};
-static const unsigned int msiof2_clk_b_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(0, 4),
-};
-static const unsigned int msiof2_clk_b_mux[] = {
-	MSIOF2_SCK_B_MARK,
-};
-static const unsigned int msiof2_sync_b_pins[] = {
-	/* SYNC */
-	RCAR_GP_PIN(0, 5),
-};
-static const unsigned int msiof2_sync_b_mux[] = {
-	MSIOF2_SYNC_B_MARK,
-};
-static const unsigned int msiof2_ss1_b_pins[] = {
-	/* SS1 */
-	RCAR_GP_PIN(0, 0),
-};
-static const unsigned int msiof2_ss1_b_mux[] = {
-	MSIOF2_SS1_B_MARK,
-};
-static const unsigned int msiof2_ss2_b_pins[] = {
-	/* SS2 */
-	RCAR_GP_PIN(0, 1),
-};
-static const unsigned int msiof2_ss2_b_mux[] = {
-	MSIOF2_SS2_B_MARK,
-};
-static const unsigned int msiof2_txd_b_pins[] = {
-	/* TXD */
-	RCAR_GP_PIN(0, 7),
-};
-static const unsigned int msiof2_txd_b_mux[] = {
-	MSIOF2_TXD_B_MARK,
-};
-static const unsigned int msiof2_rxd_b_pins[] = {
-	/* RXD */
-	RCAR_GP_PIN(0, 6),
-};
-static const unsigned int msiof2_rxd_b_mux[] = {
-	MSIOF2_RXD_B_MARK,
-};
-static const unsigned int msiof2_clk_c_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(2, 12),
-};
-static const unsigned int msiof2_clk_c_mux[] = {
-	MSIOF2_SCK_C_MARK,
-};
-static const unsigned int msiof2_sync_c_pins[] = {
-	/* SYNC */
-	RCAR_GP_PIN(2, 11),
-};
-static const unsigned int msiof2_sync_c_mux[] = {
-	MSIOF2_SYNC_C_MARK,
-};
-static const unsigned int msiof2_ss1_c_pins[] = {
-	/* SS1 */
-	RCAR_GP_PIN(2, 10),
-};
-static const unsigned int msiof2_ss1_c_mux[] = {
-	MSIOF2_SS1_C_MARK,
-};
-static const unsigned int msiof2_ss2_c_pins[] = {
-	/* SS2 */
-	RCAR_GP_PIN(2, 9),
-};
-static const unsigned int msiof2_ss2_c_mux[] = {
-	MSIOF2_SS2_C_MARK,
-};
-static const unsigned int msiof2_txd_c_pins[] = {
-	/* TXD */
-	RCAR_GP_PIN(2, 14),
-};
-static const unsigned int msiof2_txd_c_mux[] = {
-	MSIOF2_TXD_C_MARK,
-};
-static const unsigned int msiof2_rxd_c_pins[] = {
-	/* RXD */
-	RCAR_GP_PIN(2, 13),
-};
-static const unsigned int msiof2_rxd_c_mux[] = {
-	MSIOF2_RXD_C_MARK,
-};
-static const unsigned int msiof2_clk_d_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(0, 8),
-};
-static const unsigned int msiof2_clk_d_mux[] = {
-	MSIOF2_SCK_D_MARK,
-};
-static const unsigned int msiof2_sync_d_pins[] = {
-	/* SYNC */
-	RCAR_GP_PIN(0, 9),
-};
-static const unsigned int msiof2_sync_d_mux[] = {
-	MSIOF2_SYNC_D_MARK,
-};
-static const unsigned int msiof2_ss1_d_pins[] = {
-	/* SS1 */
-	RCAR_GP_PIN(0, 12),
-};
-static const unsigned int msiof2_ss1_d_mux[] = {
-	MSIOF2_SS1_D_MARK,
-};
-static const unsigned int msiof2_ss2_d_pins[] = {
-	/* SS2 */
-	RCAR_GP_PIN(0, 13),
-};
-static const unsigned int msiof2_ss2_d_mux[] = {
-	MSIOF2_SS2_D_MARK,
-};
-static const unsigned int msiof2_txd_d_pins[] = {
-	/* TXD */
-	RCAR_GP_PIN(0, 11),
-};
-static const unsigned int msiof2_txd_d_mux[] = {
-	MSIOF2_TXD_D_MARK,
-};
-static const unsigned int msiof2_rxd_d_pins[] = {
-	/* RXD */
-	RCAR_GP_PIN(0, 10),
-};
-static const unsigned int msiof2_rxd_d_mux[] = {
-	MSIOF2_RXD_D_MARK,
-};
-/* - MSIOF3 ----------------------------------------------------------------- */
-static const unsigned int msiof3_clk_a_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(0, 0),
-};
-static const unsigned int msiof3_clk_a_mux[] = {
-	MSIOF3_SCK_A_MARK,
-};
-static const unsigned int msiof3_sync_a_pins[] = {
-	/* SYNC */
-	RCAR_GP_PIN(0, 1),
-};
-static const unsigned int msiof3_sync_a_mux[] = {
-	MSIOF3_SYNC_A_MARK,
-};
-static const unsigned int msiof3_ss1_a_pins[] = {
-	/* SS1 */
-	RCAR_GP_PIN(0, 14),
-};
-static const unsigned int msiof3_ss1_a_mux[] = {
-	MSIOF3_SS1_A_MARK,
-};
-static const unsigned int msiof3_ss2_a_pins[] = {
-	/* SS2 */
-	RCAR_GP_PIN(0, 15),
-};
-static const unsigned int msiof3_ss2_a_mux[] = {
-	MSIOF3_SS2_A_MARK,
-};
-static const unsigned int msiof3_txd_a_pins[] = {
-	/* TXD */
-	RCAR_GP_PIN(0, 3),
-};
-static const unsigned int msiof3_txd_a_mux[] = {
-	MSIOF3_TXD_A_MARK,
-};
-static const unsigned int msiof3_rxd_a_pins[] = {
-	/* RXD */
-	RCAR_GP_PIN(0, 2),
-};
-static const unsigned int msiof3_rxd_a_mux[] = {
-	MSIOF3_RXD_A_MARK,
-};
-static const unsigned int msiof3_clk_b_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(1, 2),
-};
-static const unsigned int msiof3_clk_b_mux[] = {
-	MSIOF3_SCK_B_MARK,
-};
-static const unsigned int msiof3_sync_b_pins[] = {
-	/* SYNC */
-	RCAR_GP_PIN(1, 0),
-};
-static const unsigned int msiof3_sync_b_mux[] = {
-	MSIOF3_SYNC_B_MARK,
-};
-static const unsigned int msiof3_ss1_b_pins[] = {
-	/* SS1 */
-	RCAR_GP_PIN(1, 4),
-};
-static const unsigned int msiof3_ss1_b_mux[] = {
-	MSIOF3_SS1_B_MARK,
-};
-static const unsigned int msiof3_ss2_b_pins[] = {
-	/* SS2 */
-	RCAR_GP_PIN(1, 5),
-};
-static const unsigned int msiof3_ss2_b_mux[] = {
-	MSIOF3_SS2_B_MARK,
-};
-static const unsigned int msiof3_txd_b_pins[] = {
-	/* TXD */
-	RCAR_GP_PIN(1, 1),
-};
-static const unsigned int msiof3_txd_b_mux[] = {
-	MSIOF3_TXD_B_MARK,
-};
-static const unsigned int msiof3_rxd_b_pins[] = {
-	/* RXD */
-	RCAR_GP_PIN(1, 3),
-};
-static const unsigned int msiof3_rxd_b_mux[] = {
-	MSIOF3_RXD_B_MARK,
-};
-static const unsigned int msiof3_clk_c_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(1, 12),
-};
-static const unsigned int msiof3_clk_c_mux[] = {
-	MSIOF3_SCK_C_MARK,
-};
-static const unsigned int msiof3_sync_c_pins[] = {
-	/* SYNC */
-	RCAR_GP_PIN(1, 13),
-};
-static const unsigned int msiof3_sync_c_mux[] = {
-	MSIOF3_SYNC_C_MARK,
-};
-static const unsigned int msiof3_txd_c_pins[] = {
-	/* TXD */
-	RCAR_GP_PIN(1, 15),
-};
-static const unsigned int msiof3_txd_c_mux[] = {
-	MSIOF3_TXD_C_MARK,
-};
-static const unsigned int msiof3_rxd_c_pins[] = {
-	/* RXD */
-	RCAR_GP_PIN(1, 14),
-};
-static const unsigned int msiof3_rxd_c_mux[] = {
-	MSIOF3_RXD_C_MARK,
-};
-static const unsigned int msiof3_clk_d_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(1, 22),
-};
-static const unsigned int msiof3_clk_d_mux[] = {
-	MSIOF3_SCK_D_MARK,
-};
-static const unsigned int msiof3_sync_d_pins[] = {
-	/* SYNC */
-	RCAR_GP_PIN(1, 23),
-};
-static const unsigned int msiof3_sync_d_mux[] = {
-	MSIOF3_SYNC_D_MARK,
-};
-static const unsigned int msiof3_ss1_d_pins[] = {
-	/* SS1 */
-	RCAR_GP_PIN(1, 26),
-};
-static const unsigned int msiof3_ss1_d_mux[] = {
-	MSIOF3_SS1_D_MARK,
-};
-static const unsigned int msiof3_txd_d_pins[] = {
-	/* TXD */
-	RCAR_GP_PIN(1, 25),
-};
-static const unsigned int msiof3_txd_d_mux[] = {
-	MSIOF3_TXD_D_MARK,
-};
-static const unsigned int msiof3_rxd_d_pins[] = {
-	/* RXD */
-	RCAR_GP_PIN(1, 24),
-};
-static const unsigned int msiof3_rxd_d_mux[] = {
-	MSIOF3_RXD_D_MARK,
-};
-
-/* - PWM0 --------------------------------------------------------------------*/
-static const unsigned int pwm0_pins[] = {
-	/* PWM */
-	RCAR_GP_PIN(2, 6),
-};
-static const unsigned int pwm0_mux[] = {
-	PWM0_MARK,
-};
-/* - PWM1 --------------------------------------------------------------------*/
-static const unsigned int pwm1_a_pins[] = {
-	/* PWM */
-	RCAR_GP_PIN(2, 7),
-};
-static const unsigned int pwm1_a_mux[] = {
-	PWM1_A_MARK,
-};
-static const unsigned int pwm1_b_pins[] = {
-	/* PWM */
-	RCAR_GP_PIN(1, 8),
-};
-static const unsigned int pwm1_b_mux[] = {
-	PWM1_B_MARK,
-};
-/* - PWM2 --------------------------------------------------------------------*/
-static const unsigned int pwm2_a_pins[] = {
-	/* PWM */
-	RCAR_GP_PIN(2, 8),
-};
-static const unsigned int pwm2_a_mux[] = {
-	PWM2_A_MARK,
-};
-static const unsigned int pwm2_b_pins[] = {
-	/* PWM */
-	RCAR_GP_PIN(1, 11),
-};
-static const unsigned int pwm2_b_mux[] = {
-	PWM2_B_MARK,
-};
-/* - PWM3 --------------------------------------------------------------------*/
-static const unsigned int pwm3_a_pins[] = {
-	/* PWM */
-	RCAR_GP_PIN(1, 0),
-};
-static const unsigned int pwm3_a_mux[] = {
-	PWM3_A_MARK,
-};
-static const unsigned int pwm3_b_pins[] = {
-	/* PWM */
-	RCAR_GP_PIN(2, 2),
-};
-static const unsigned int pwm3_b_mux[] = {
-	PWM3_B_MARK,
-};
-/* - PWM4 --------------------------------------------------------------------*/
-static const unsigned int pwm4_a_pins[] = {
-	/* PWM */
-	RCAR_GP_PIN(1, 1),
-};
-static const unsigned int pwm4_a_mux[] = {
-	PWM4_A_MARK,
-};
-static const unsigned int pwm4_b_pins[] = {
-	/* PWM */
-	RCAR_GP_PIN(2, 3),
-};
-static const unsigned int pwm4_b_mux[] = {
-	PWM4_B_MARK,
-};
-/* - PWM5 --------------------------------------------------------------------*/
-static const unsigned int pwm5_a_pins[] = {
-	/* PWM */
-	RCAR_GP_PIN(1, 2),
-};
-static const unsigned int pwm5_a_mux[] = {
-	PWM5_A_MARK,
-};
-static const unsigned int pwm5_b_pins[] = {
-	/* PWM */
-	RCAR_GP_PIN(2, 4),
-};
-static const unsigned int pwm5_b_mux[] = {
-	PWM5_B_MARK,
-};
-/* - PWM6 --------------------------------------------------------------------*/
-static const unsigned int pwm6_a_pins[] = {
-	/* PWM */
-	RCAR_GP_PIN(1, 3),
-};
-static const unsigned int pwm6_a_mux[] = {
-	PWM6_A_MARK,
-};
-static const unsigned int pwm6_b_pins[] = {
-	/* PWM */
-	RCAR_GP_PIN(2, 5),
-};
-static const unsigned int pwm6_b_mux[] = {
-	PWM6_B_MARK,
-};
-
-/* - QSPI0 ------------------------------------------------------------------ */
-static const unsigned int qspi0_ctrl_pins[] = {
-	/* QSPI0_SPCLK, QSPI0_SSL */
-	PIN_NUMBER('W', 3), PIN_NUMBER('Y', 3),
-};
-static const unsigned int qspi0_ctrl_mux[] = {
-	QSPI0_SPCLK_MARK, QSPI0_SSL_MARK,
-};
-static const unsigned int qspi0_data2_pins[] = {
-	/* QSPI0_MOSI_IO0, QSPI0_MISO_IO1 */
-	PIN_A_NUMBER('C', 5), PIN_A_NUMBER('B', 4),
-};
-static const unsigned int qspi0_data2_mux[] = {
-	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
-};
-static const unsigned int qspi0_data4_pins[] = {
-	/* QSPI0_MOSI_IO0, QSPI0_MISO_IO1, QSPI0_IO2, QSPI0_IO3 */
-	PIN_A_NUMBER('C', 5), PIN_A_NUMBER('B', 4),
-	PIN_NUMBER('Y', 6), PIN_A_NUMBER('B', 6),
-};
-static const unsigned int qspi0_data4_mux[] = {
-	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
-	QSPI0_IO2_MARK, QSPI0_IO3_MARK,
-};
-/* - QSPI1 ------------------------------------------------------------------ */
-static const unsigned int qspi1_ctrl_pins[] = {
-	/* QSPI1_SPCLK, QSPI1_SSL */
-	PIN_NUMBER('V', 3), PIN_NUMBER('V', 5),
-};
-static const unsigned int qspi1_ctrl_mux[] = {
-	QSPI1_SPCLK_MARK, QSPI1_SSL_MARK,
-};
-static const unsigned int qspi1_data2_pins[] = {
-	/* QSPI1_MOSI_IO0, QSPI1_MISO_IO1 */
-	PIN_A_NUMBER('C', 7), PIN_A_NUMBER('E', 5),
-};
-static const unsigned int qspi1_data2_mux[] = {
-	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
-};
-static const unsigned int qspi1_data4_pins[] = {
-	/* QSPI1_MOSI_IO0, QSPI1_MISO_IO1, QSPI1_IO2, QSPI1_IO3 */
-	PIN_A_NUMBER('C', 7), PIN_A_NUMBER('E', 5),
-	PIN_A_NUMBER('E', 4), PIN_A_NUMBER('C', 3),
-};
-static const unsigned int qspi1_data4_mux[] = {
-	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
-	QSPI1_IO2_MARK, QSPI1_IO3_MARK,
-};
-
-/* - SATA --------------------------------------------------------------------*/
-static const unsigned int sata0_devslp_a_pins[] = {
-	/* DEVSLP */
-	RCAR_GP_PIN(6, 16),
-};
-static const unsigned int sata0_devslp_a_mux[] = {
-	SATA_DEVSLP_A_MARK,
-};
-static const unsigned int sata0_devslp_b_pins[] = {
-	/* DEVSLP */
-	RCAR_GP_PIN(4, 6),
-};
-static const unsigned int sata0_devslp_b_mux[] = {
-	SATA_DEVSLP_B_MARK,
-};
-
-/* - SCIF0 ------------------------------------------------------------------ */
-static const unsigned int scif0_data_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(5, 1), RCAR_GP_PIN(5, 2),
-};
-static const unsigned int scif0_data_mux[] = {
-	RX0_MARK, TX0_MARK,
-};
-static const unsigned int scif0_clk_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(5, 0),
-};
-static const unsigned int scif0_clk_mux[] = {
-	SCK0_MARK,
-};
-static const unsigned int scif0_ctrl_pins[] = {
-	/* RTS, CTS */
-	RCAR_GP_PIN(5, 4), RCAR_GP_PIN(5, 3),
-};
-static const unsigned int scif0_ctrl_mux[] = {
-	RTS0_N_TANS_MARK, CTS0_N_MARK,
-};
-/* - SCIF1 ------------------------------------------------------------------ */
-static const unsigned int scif1_data_a_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(5, 5), RCAR_GP_PIN(5, 6),
-};
-static const unsigned int scif1_data_a_mux[] = {
-	RX1_A_MARK, TX1_A_MARK,
-};
-static const unsigned int scif1_clk_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(6, 21),
-};
-static const unsigned int scif1_clk_mux[] = {
-	SCK1_MARK,
-};
-static const unsigned int scif1_ctrl_pins[] = {
-	/* RTS, CTS */
-	RCAR_GP_PIN(5, 8), RCAR_GP_PIN(5, 7),
-};
-static const unsigned int scif1_ctrl_mux[] = {
-	RTS1_N_TANS_MARK, CTS1_N_MARK,
-};
-
-static const unsigned int scif1_data_b_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(5, 24), RCAR_GP_PIN(5, 25),
-};
-static const unsigned int scif1_data_b_mux[] = {
-	RX1_B_MARK, TX1_B_MARK,
-};
-/* - SCIF2 ------------------------------------------------------------------ */
-static const unsigned int scif2_data_a_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(5, 11), RCAR_GP_PIN(5, 10),
-};
-static const unsigned int scif2_data_a_mux[] = {
-	RX2_A_MARK, TX2_A_MARK,
-};
-static const unsigned int scif2_clk_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(5, 9),
-};
-static const unsigned int scif2_clk_mux[] = {
-	SCK2_MARK,
-};
-static const unsigned int scif2_data_b_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(5, 15), RCAR_GP_PIN(5, 16),
-};
-static const unsigned int scif2_data_b_mux[] = {
-	RX2_B_MARK, TX2_B_MARK,
-};
-/* - SCIF3 ------------------------------------------------------------------ */
-static const unsigned int scif3_data_a_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(1, 23), RCAR_GP_PIN(1, 24),
-};
-static const unsigned int scif3_data_a_mux[] = {
-	RX3_A_MARK, TX3_A_MARK,
-};
-static const unsigned int scif3_clk_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(1, 22),
-};
-static const unsigned int scif3_clk_mux[] = {
-	SCK3_MARK,
-};
-static const unsigned int scif3_ctrl_pins[] = {
-	/* RTS, CTS */
-	RCAR_GP_PIN(1, 26), RCAR_GP_PIN(1, 25),
-};
-static const unsigned int scif3_ctrl_mux[] = {
-	RTS3_N_TANS_MARK, CTS3_N_MARK,
-};
-static const unsigned int scif3_data_b_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 11),
-};
-static const unsigned int scif3_data_b_mux[] = {
-	RX3_B_MARK, TX3_B_MARK,
-};
-/* - SCIF4 ------------------------------------------------------------------ */
-static const unsigned int scif4_data_a_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(2, 11), RCAR_GP_PIN(2, 12),
-};
-static const unsigned int scif4_data_a_mux[] = {
-	RX4_A_MARK, TX4_A_MARK,
-};
-static const unsigned int scif4_clk_a_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(2, 10),
-};
-static const unsigned int scif4_clk_a_mux[] = {
-	SCK4_A_MARK,
-};
-static const unsigned int scif4_ctrl_a_pins[] = {
-	/* RTS, CTS */
-	RCAR_GP_PIN(2, 14), RCAR_GP_PIN(2, 13),
-};
-static const unsigned int scif4_ctrl_a_mux[] = {
-	RTS4_N_TANS_A_MARK, CTS4_N_A_MARK,
-};
-static const unsigned int scif4_data_b_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
-};
-static const unsigned int scif4_data_b_mux[] = {
-	RX4_B_MARK, TX4_B_MARK,
-};
-static const unsigned int scif4_clk_b_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(1, 5),
-};
-static const unsigned int scif4_clk_b_mux[] = {
-	SCK4_B_MARK,
-};
-static const unsigned int scif4_ctrl_b_pins[] = {
-	/* RTS, CTS */
-	RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 9),
-};
-static const unsigned int scif4_ctrl_b_mux[] = {
-	RTS4_N_TANS_B_MARK, CTS4_N_B_MARK,
-};
-static const unsigned int scif4_data_c_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
-};
-static const unsigned int scif4_data_c_mux[] = {
-	RX4_C_MARK, TX4_C_MARK,
-};
-static const unsigned int scif4_clk_c_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(0, 8),
-};
-static const unsigned int scif4_clk_c_mux[] = {
-	SCK4_C_MARK,
-};
-static const unsigned int scif4_ctrl_c_pins[] = {
-	/* RTS, CTS */
-	RCAR_GP_PIN(0, 11), RCAR_GP_PIN(0, 10),
-};
-static const unsigned int scif4_ctrl_c_mux[] = {
-	RTS4_N_TANS_C_MARK, CTS4_N_C_MARK,
-};
-/* - SCIF5 ------------------------------------------------------------------ */
-static const unsigned int scif5_data_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(5, 19), RCAR_GP_PIN(5, 21),
-};
-static const unsigned int scif5_data_mux[] = {
-	RX5_MARK, TX5_MARK,
-};
-static const unsigned int scif5_clk_pins[] = {
-	/* SCK */
-	RCAR_GP_PIN(6, 21),
-};
-static const unsigned int scif5_clk_mux[] = {
-	SCK5_MARK,
-};
-
-/* - SCIF Clock ------------------------------------------------------------- */
-static const unsigned int scif_clk_a_pins[] = {
-	/* SCIF_CLK */
-	RCAR_GP_PIN(6, 23),
-};
-static const unsigned int scif_clk_a_mux[] = {
-	SCIF_CLK_A_MARK,
-};
-static const unsigned int scif_clk_b_pins[] = {
-	/* SCIF_CLK */
-	RCAR_GP_PIN(5, 9),
-};
-static const unsigned int scif_clk_b_mux[] = {
-	SCIF_CLK_B_MARK,
-};
-
-/* - SDHI0 ------------------------------------------------------------------ */
-static const unsigned int sdhi0_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(3, 2),
-};
-static const unsigned int sdhi0_data1_mux[] = {
-	SD0_DAT0_MARK,
-};
-static const unsigned int sdhi0_data4_pins[] = {
-	/* D[0:3] */
-	RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 3),
-	RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
-};
-static const unsigned int sdhi0_data4_mux[] = {
-	SD0_DAT0_MARK, SD0_DAT1_MARK,
-	SD0_DAT2_MARK, SD0_DAT3_MARK,
-};
-static const unsigned int sdhi0_ctrl_pins[] = {
-	/* CLK, CMD */
-	RCAR_GP_PIN(3, 0), RCAR_GP_PIN(3, 1),
-};
-static const unsigned int sdhi0_ctrl_mux[] = {
-	SD0_CLK_MARK, SD0_CMD_MARK,
-};
-static const unsigned int sdhi0_cd_pins[] = {
-	/* CD */
-	RCAR_GP_PIN(3, 12),
-};
-static const unsigned int sdhi0_cd_mux[] = {
-	SD0_CD_MARK,
-};
-static const unsigned int sdhi0_wp_pins[] = {
-	/* WP */
-	RCAR_GP_PIN(3, 13),
-};
-static const unsigned int sdhi0_wp_mux[] = {
-	SD0_WP_MARK,
-};
-/* - SDHI1 ------------------------------------------------------------------ */
-static const unsigned int sdhi1_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(3, 8),
-};
-static const unsigned int sdhi1_data1_mux[] = {
-	SD1_DAT0_MARK,
-};
-static const unsigned int sdhi1_data4_pins[] = {
-	/* D[0:3] */
-	RCAR_GP_PIN(3, 8),  RCAR_GP_PIN(3, 9),
-	RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 11),
-};
-static const unsigned int sdhi1_data4_mux[] = {
-	SD1_DAT0_MARK, SD1_DAT1_MARK,
-	SD1_DAT2_MARK, SD1_DAT3_MARK,
-};
-static const unsigned int sdhi1_ctrl_pins[] = {
-	/* CLK, CMD */
-	RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
-};
-static const unsigned int sdhi1_ctrl_mux[] = {
-	SD1_CLK_MARK, SD1_CMD_MARK,
-};
-static const unsigned int sdhi1_cd_pins[] = {
-	/* CD */
-	RCAR_GP_PIN(3, 14),
-};
-static const unsigned int sdhi1_cd_mux[] = {
-	SD1_CD_MARK,
-};
-static const unsigned int sdhi1_wp_pins[] = {
-	/* WP */
-	RCAR_GP_PIN(3, 15),
-};
-static const unsigned int sdhi1_wp_mux[] = {
-	SD1_WP_MARK,
-};
-/* - SDHI2 ------------------------------------------------------------------ */
-static const unsigned int sdhi2_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(4, 2),
-};
-static const unsigned int sdhi2_data1_mux[] = {
-	SD2_DAT0_MARK,
-};
-static const unsigned int sdhi2_data4_pins[] = {
-	/* D[0:3] */
-	RCAR_GP_PIN(4, 2), RCAR_GP_PIN(4, 3),
-	RCAR_GP_PIN(4, 4), RCAR_GP_PIN(4, 5),
-};
-static const unsigned int sdhi2_data4_mux[] = {
-	SD2_DAT0_MARK, SD2_DAT1_MARK,
-	SD2_DAT2_MARK, SD2_DAT3_MARK,
-};
-static const unsigned int sdhi2_data8_pins[] = {
-	/* D[0:7] */
-	RCAR_GP_PIN(4, 2),  RCAR_GP_PIN(4, 3),
-	RCAR_GP_PIN(4, 4),  RCAR_GP_PIN(4, 5),
-	RCAR_GP_PIN(3, 8),  RCAR_GP_PIN(3, 9),
-	RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 11),
-};
-static const unsigned int sdhi2_data8_mux[] = {
-	SD2_DAT0_MARK, SD2_DAT1_MARK,
-	SD2_DAT2_MARK, SD2_DAT3_MARK,
-	SD2_DAT4_MARK, SD2_DAT5_MARK,
-	SD2_DAT6_MARK, SD2_DAT7_MARK,
-};
-static const unsigned int sdhi2_ctrl_pins[] = {
-	/* CLK, CMD */
-	RCAR_GP_PIN(4, 0), RCAR_GP_PIN(4, 1),
-};
-static const unsigned int sdhi2_ctrl_mux[] = {
-	SD2_CLK_MARK, SD2_CMD_MARK,
-};
-static const unsigned int sdhi2_cd_a_pins[] = {
-	/* CD */
-	RCAR_GP_PIN(4, 13),
-};
-static const unsigned int sdhi2_cd_a_mux[] = {
-	SD2_CD_A_MARK,
-};
-static const unsigned int sdhi2_cd_b_pins[] = {
-	/* CD */
-	RCAR_GP_PIN(5, 10),
-};
-static const unsigned int sdhi2_cd_b_mux[] = {
-	SD2_CD_B_MARK,
-};
-static const unsigned int sdhi2_wp_a_pins[] = {
-	/* WP */
-	RCAR_GP_PIN(4, 14),
-};
-static const unsigned int sdhi2_wp_a_mux[] = {
-	SD2_WP_A_MARK,
-};
-static const unsigned int sdhi2_wp_b_pins[] = {
-	/* WP */
-	RCAR_GP_PIN(5, 11),
-};
-static const unsigned int sdhi2_wp_b_mux[] = {
-	SD2_WP_B_MARK,
-};
-static const unsigned int sdhi2_ds_pins[] = {
-	/* DS */
-	RCAR_GP_PIN(4, 6),
-};
-static const unsigned int sdhi2_ds_mux[] = {
-	SD2_DS_MARK,
-};
-/* - SDHI3 ------------------------------------------------------------------ */
-static const unsigned int sdhi3_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(4, 9),
-};
-static const unsigned int sdhi3_data1_mux[] = {
-	SD3_DAT0_MARK,
-};
-static const unsigned int sdhi3_data4_pins[] = {
-	/* D[0:3] */
-	RCAR_GP_PIN(4, 9),  RCAR_GP_PIN(4, 10),
-	RCAR_GP_PIN(4, 11), RCAR_GP_PIN(4, 12),
-};
-static const unsigned int sdhi3_data4_mux[] = {
-	SD3_DAT0_MARK, SD3_DAT1_MARK,
-	SD3_DAT2_MARK, SD3_DAT3_MARK,
-};
-static const unsigned int sdhi3_data8_pins[] = {
-	/* D[0:7] */
-	RCAR_GP_PIN(4, 9),  RCAR_GP_PIN(4, 10),
-	RCAR_GP_PIN(4, 11), RCAR_GP_PIN(4, 12),
-	RCAR_GP_PIN(4, 13), RCAR_GP_PIN(4, 14),
-	RCAR_GP_PIN(4, 15), RCAR_GP_PIN(4, 16),
-};
-static const unsigned int sdhi3_data8_mux[] = {
-	SD3_DAT0_MARK, SD3_DAT1_MARK,
-	SD3_DAT2_MARK, SD3_DAT3_MARK,
-	SD3_DAT4_MARK, SD3_DAT5_MARK,
-	SD3_DAT6_MARK, SD3_DAT7_MARK,
-};
-static const unsigned int sdhi3_ctrl_pins[] = {
-	/* CLK, CMD */
-	RCAR_GP_PIN(4, 7), RCAR_GP_PIN(4, 8),
-};
-static const unsigned int sdhi3_ctrl_mux[] = {
-	SD3_CLK_MARK, SD3_CMD_MARK,
-};
-static const unsigned int sdhi3_cd_pins[] = {
-	/* CD */
-	RCAR_GP_PIN(4, 15),
-};
-static const unsigned int sdhi3_cd_mux[] = {
-	SD3_CD_MARK,
-};
-static const unsigned int sdhi3_wp_pins[] = {
-	/* WP */
-	RCAR_GP_PIN(4, 16),
-};
-static const unsigned int sdhi3_wp_mux[] = {
-	SD3_WP_MARK,
-};
-static const unsigned int sdhi3_ds_pins[] = {
-	/* DS */
-	RCAR_GP_PIN(4, 17),
-};
-static const unsigned int sdhi3_ds_mux[] = {
-	SD3_DS_MARK,
-};
-
-/* - SSI -------------------------------------------------------------------- */
-static const unsigned int ssi0_data_pins[] = {
-	/* SDATA */
-	RCAR_GP_PIN(6, 2),
-};
-static const unsigned int ssi0_data_mux[] = {
-	SSI_SDATA0_MARK,
-};
-static const unsigned int ssi01239_ctrl_pins[] = {
-	/* SCK, WS */
-	RCAR_GP_PIN(6, 0), RCAR_GP_PIN(6, 1),
-};
-static const unsigned int ssi01239_ctrl_mux[] = {
-	SSI_SCK01239_MARK, SSI_WS01239_MARK,
-};
-static const unsigned int ssi1_data_a_pins[] = {
-	/* SDATA */
-	RCAR_GP_PIN(6, 3),
-};
-static const unsigned int ssi1_data_a_mux[] = {
-	SSI_SDATA1_A_MARK,
-};
-static const unsigned int ssi1_data_b_pins[] = {
-	/* SDATA */
-	RCAR_GP_PIN(5, 12),
-};
-static const unsigned int ssi1_data_b_mux[] = {
-	SSI_SDATA1_B_MARK,
-};
-static const unsigned int ssi1_ctrl_a_pins[] = {
-	/* SCK, WS */
-	RCAR_GP_PIN(6, 26), RCAR_GP_PIN(6, 27),
-};
-static const unsigned int ssi1_ctrl_a_mux[] = {
-	SSI_SCK1_A_MARK, SSI_WS1_A_MARK,
-};
-static const unsigned int ssi1_ctrl_b_pins[] = {
-	/* SCK, WS */
-	RCAR_GP_PIN(6, 4), RCAR_GP_PIN(6, 21),
-};
-static const unsigned int ssi1_ctrl_b_mux[] = {
-	SSI_SCK1_B_MARK, SSI_WS1_B_MARK,
-};
-static const unsigned int ssi2_data_a_pins[] = {
-	/* SDATA */
-	RCAR_GP_PIN(6, 4),
-};
-static const unsigned int ssi2_data_a_mux[] = {
-	SSI_SDATA2_A_MARK,
-};
-static const unsigned int ssi2_data_b_pins[] = {
-	/* SDATA */
-	RCAR_GP_PIN(5, 13),
-};
-static const unsigned int ssi2_data_b_mux[] = {
-	SSI_SDATA2_B_MARK,
-};
-static const unsigned int ssi2_ctrl_a_pins[] = {
-	/* SCK, WS */
-	RCAR_GP_PIN(5, 19), RCAR_GP_PIN(5, 21),
-};
-static const unsigned int ssi2_ctrl_a_mux[] = {
-	SSI_SCK2_A_MARK, SSI_WS2_A_MARK,
-};
-static const unsigned int ssi2_ctrl_b_pins[] = {
-	/* SCK, WS */
-	RCAR_GP_PIN(6, 28), RCAR_GP_PIN(6, 29),
-};
-static const unsigned int ssi2_ctrl_b_mux[] = {
-	SSI_SCK2_B_MARK, SSI_WS2_B_MARK,
-};
-static const unsigned int ssi3_data_pins[] = {
-	/* SDATA */
-	RCAR_GP_PIN(6, 7),
-};
-static const unsigned int ssi3_data_mux[] = {
-	SSI_SDATA3_MARK,
-};
-static const unsigned int ssi34_ctrl_pins[] = {
-	/* SCK, WS */
-	RCAR_GP_PIN(6, 5), RCAR_GP_PIN(6, 6),
-};
-static const unsigned int ssi34_ctrl_mux[] = {
-	SSI_SCK34_MARK, SSI_WS34_MARK,
-};
-static const unsigned int ssi4_data_pins[] = {
-	/* SDATA */
-	RCAR_GP_PIN(6, 10),
-};
-static const unsigned int ssi4_data_mux[] = {
-	SSI_SDATA4_MARK,
-};
-static const unsigned int ssi4_ctrl_pins[] = {
-	/* SCK, WS */
-	RCAR_GP_PIN(6, 8), RCAR_GP_PIN(6, 9),
-};
-static const unsigned int ssi4_ctrl_mux[] = {
-	SSI_SCK4_MARK, SSI_WS4_MARK,
-};
-static const unsigned int ssi5_data_pins[] = {
-	/* SDATA */
-	RCAR_GP_PIN(6, 13),
-};
-static const unsigned int ssi5_data_mux[] = {
-	SSI_SDATA5_MARK,
-};
-static const unsigned int ssi5_ctrl_pins[] = {
-	/* SCK, WS */
-	RCAR_GP_PIN(6, 11), RCAR_GP_PIN(6, 12),
-};
-static const unsigned int ssi5_ctrl_mux[] = {
-	SSI_SCK5_MARK, SSI_WS5_MARK,
-};
-static const unsigned int ssi6_data_pins[] = {
-	/* SDATA */
-	RCAR_GP_PIN(6, 16),
-};
-static const unsigned int ssi6_data_mux[] = {
-	SSI_SDATA6_MARK,
-};
-static const unsigned int ssi6_ctrl_pins[] = {
-	/* SCK, WS */
-	RCAR_GP_PIN(6, 14), RCAR_GP_PIN(6, 15),
-};
-static const unsigned int ssi6_ctrl_mux[] = {
-	SSI_SCK6_MARK, SSI_WS6_MARK,
-};
-static const unsigned int ssi7_data_pins[] = {
-	/* SDATA */
-	RCAR_GP_PIN(6, 19),
-};
-static const unsigned int ssi7_data_mux[] = {
-	SSI_SDATA7_MARK,
-};
-static const unsigned int ssi78_ctrl_pins[] = {
-	/* SCK, WS */
-	RCAR_GP_PIN(6, 17), RCAR_GP_PIN(6, 18),
-};
-static const unsigned int ssi78_ctrl_mux[] = {
-	SSI_SCK78_MARK, SSI_WS78_MARK,
-};
-static const unsigned int ssi8_data_pins[] = {
-	/* SDATA */
-	RCAR_GP_PIN(6, 20),
-};
-static const unsigned int ssi8_data_mux[] = {
-	SSI_SDATA8_MARK,
-};
-static const unsigned int ssi9_data_a_pins[] = {
-	/* SDATA */
-	RCAR_GP_PIN(6, 21),
-};
-static const unsigned int ssi9_data_a_mux[] = {
-	SSI_SDATA9_A_MARK,
-};
-static const unsigned int ssi9_data_b_pins[] = {
-	/* SDATA */
-	RCAR_GP_PIN(5, 14),
-};
-static const unsigned int ssi9_data_b_mux[] = {
-	SSI_SDATA9_B_MARK,
-};
-static const unsigned int ssi9_ctrl_a_pins[] = {
-	/* SCK, WS */
-	RCAR_GP_PIN(5, 15), RCAR_GP_PIN(5, 16),
-};
-static const unsigned int ssi9_ctrl_a_mux[] = {
-	SSI_SCK9_A_MARK, SSI_WS9_A_MARK,
-};
-static const unsigned int ssi9_ctrl_b_pins[] = {
-	/* SCK, WS */
-	RCAR_GP_PIN(6, 30), RCAR_GP_PIN(6, 31),
-};
-static const unsigned int ssi9_ctrl_b_mux[] = {
-	SSI_SCK9_B_MARK, SSI_WS9_B_MARK,
-};
-
-/* - USB0 ------------------------------------------------------------------- */
-static const unsigned int usb0_pins[] = {
-	/* PWEN, OVC */
-	RCAR_GP_PIN(6, 24), RCAR_GP_PIN(6, 25),
-};
-static const unsigned int usb0_mux[] = {
-	USB0_PWEN_MARK, USB0_OVC_MARK,
-};
-/* - USB1 ------------------------------------------------------------------- */
-static const unsigned int usb1_pins[] = {
-	/* PWEN, OVC */
-	RCAR_GP_PIN(6, 26), RCAR_GP_PIN(6, 27),
-};
-static const unsigned int usb1_mux[] = {
-	USB1_PWEN_MARK, USB1_OVC_MARK,
-};
-/* - USB2 ------------------------------------------------------------------- */
-static const unsigned int usb2_pins[] = {
-	/* PWEN, OVC */
-	RCAR_GP_PIN(6, 14), RCAR_GP_PIN(6, 15),
-};
-static const unsigned int usb2_mux[] = {
-	USB2_PWEN_MARK, USB2_OVC_MARK,
-};
-
-static const struct sh_pfc_pin_group pinmux_groups[] = {
-	SH_PFC_PIN_GROUP(audio_clk_a_a),
-	SH_PFC_PIN_GROUP(audio_clk_a_b),
-	SH_PFC_PIN_GROUP(audio_clk_a_c),
-	SH_PFC_PIN_GROUP(audio_clk_b_a),
-	SH_PFC_PIN_GROUP(audio_clk_b_b),
-	SH_PFC_PIN_GROUP(audio_clk_c_a),
-	SH_PFC_PIN_GROUP(audio_clk_c_b),
-	SH_PFC_PIN_GROUP(audio_clkout_a),
-	SH_PFC_PIN_GROUP(audio_clkout_b),
-	SH_PFC_PIN_GROUP(audio_clkout_c),
-	SH_PFC_PIN_GROUP(audio_clkout_d),
-	SH_PFC_PIN_GROUP(audio_clkout1_a),
-	SH_PFC_PIN_GROUP(audio_clkout1_b),
-	SH_PFC_PIN_GROUP(audio_clkout2_a),
-	SH_PFC_PIN_GROUP(audio_clkout2_b),
-	SH_PFC_PIN_GROUP(audio_clkout3_a),
-	SH_PFC_PIN_GROUP(audio_clkout3_b),
-	SH_PFC_PIN_GROUP(avb_link),
-	SH_PFC_PIN_GROUP(avb_magic),
-	SH_PFC_PIN_GROUP(avb_phy_int),
-	SH_PFC_PIN_GROUP(avb_mdc),
-	SH_PFC_PIN_GROUP(avb_mii),
-	SH_PFC_PIN_GROUP(avb_avtp_pps),
-	SH_PFC_PIN_GROUP(avb_avtp_match_a),
-	SH_PFC_PIN_GROUP(avb_avtp_capture_a),
-	SH_PFC_PIN_GROUP(avb_avtp_match_b),
-	SH_PFC_PIN_GROUP(avb_avtp_capture_b),
-	SH_PFC_PIN_GROUP(can0_data_a),
-	SH_PFC_PIN_GROUP(can0_data_b),
-	SH_PFC_PIN_GROUP(can1_data),
-	SH_PFC_PIN_GROUP(can_clk),
-	SH_PFC_PIN_GROUP(canfd0_data_a),
-	SH_PFC_PIN_GROUP(canfd0_data_b),
-	SH_PFC_PIN_GROUP(canfd1_data),
-	SH_PFC_PIN_GROUP(drif0_ctrl_a),
-	SH_PFC_PIN_GROUP(drif0_data0_a),
-	SH_PFC_PIN_GROUP(drif0_data1_a),
-	SH_PFC_PIN_GROUP(drif0_ctrl_b),
-	SH_PFC_PIN_GROUP(drif0_data0_b),
-	SH_PFC_PIN_GROUP(drif0_data1_b),
-	SH_PFC_PIN_GROUP(drif0_ctrl_c),
-	SH_PFC_PIN_GROUP(drif0_data0_c),
-	SH_PFC_PIN_GROUP(drif0_data1_c),
-	SH_PFC_PIN_GROUP(drif1_ctrl_a),
-	SH_PFC_PIN_GROUP(drif1_data0_a),
-	SH_PFC_PIN_GROUP(drif1_data1_a),
-	SH_PFC_PIN_GROUP(drif1_ctrl_b),
-	SH_PFC_PIN_GROUP(drif1_data0_b),
-	SH_PFC_PIN_GROUP(drif1_data1_b),
-	SH_PFC_PIN_GROUP(drif1_ctrl_c),
-	SH_PFC_PIN_GROUP(drif1_data0_c),
-	SH_PFC_PIN_GROUP(drif1_data1_c),
-	SH_PFC_PIN_GROUP(drif2_ctrl_a),
-	SH_PFC_PIN_GROUP(drif2_data0_a),
-	SH_PFC_PIN_GROUP(drif2_data1_a),
-	SH_PFC_PIN_GROUP(drif2_ctrl_b),
-	SH_PFC_PIN_GROUP(drif2_data0_b),
-	SH_PFC_PIN_GROUP(drif2_data1_b),
-	SH_PFC_PIN_GROUP(drif3_ctrl_a),
-	SH_PFC_PIN_GROUP(drif3_data0_a),
-	SH_PFC_PIN_GROUP(drif3_data1_a),
-	SH_PFC_PIN_GROUP(drif3_ctrl_b),
-	SH_PFC_PIN_GROUP(drif3_data0_b),
-	SH_PFC_PIN_GROUP(drif3_data1_b),
-	SH_PFC_PIN_GROUP(du_rgb666),
-	SH_PFC_PIN_GROUP(du_rgb888),
-	SH_PFC_PIN_GROUP(du_clk_out_0),
-	SH_PFC_PIN_GROUP(du_clk_out_1),
-	SH_PFC_PIN_GROUP(du_sync),
-	SH_PFC_PIN_GROUP(du_oddf),
-	SH_PFC_PIN_GROUP(du_cde),
-	SH_PFC_PIN_GROUP(du_disp),
-	SH_PFC_PIN_GROUP(hscif0_data),
-	SH_PFC_PIN_GROUP(hscif0_clk),
-	SH_PFC_PIN_GROUP(hscif0_ctrl),
-	SH_PFC_PIN_GROUP(hscif1_data_a),
-	SH_PFC_PIN_GROUP(hscif1_clk_a),
-	SH_PFC_PIN_GROUP(hscif1_ctrl_a),
-	SH_PFC_PIN_GROUP(hscif1_data_b),
-	SH_PFC_PIN_GROUP(hscif1_clk_b),
-	SH_PFC_PIN_GROUP(hscif1_ctrl_b),
-	SH_PFC_PIN_GROUP(hscif2_data_a),
-	SH_PFC_PIN_GROUP(hscif2_clk_a),
-	SH_PFC_PIN_GROUP(hscif2_ctrl_a),
-	SH_PFC_PIN_GROUP(hscif2_data_b),
-	SH_PFC_PIN_GROUP(hscif2_clk_b),
-	SH_PFC_PIN_GROUP(hscif2_ctrl_b),
-	SH_PFC_PIN_GROUP(hscif3_data_a),
-	SH_PFC_PIN_GROUP(hscif3_clk),
-	SH_PFC_PIN_GROUP(hscif3_ctrl),
-	SH_PFC_PIN_GROUP(hscif3_data_b),
-	SH_PFC_PIN_GROUP(hscif3_data_c),
-	SH_PFC_PIN_GROUP(hscif3_data_d),
-	SH_PFC_PIN_GROUP(hscif4_data_a),
-	SH_PFC_PIN_GROUP(hscif4_clk),
-	SH_PFC_PIN_GROUP(hscif4_ctrl),
-	SH_PFC_PIN_GROUP(hscif4_data_b),
-	SH_PFC_PIN_GROUP(i2c1_a),
-	SH_PFC_PIN_GROUP(i2c1_b),
-	SH_PFC_PIN_GROUP(i2c2_a),
-	SH_PFC_PIN_GROUP(i2c2_b),
-	SH_PFC_PIN_GROUP(i2c6_a),
-	SH_PFC_PIN_GROUP(i2c6_b),
-	SH_PFC_PIN_GROUP(i2c6_c),
-	SH_PFC_PIN_GROUP(intc_ex_irq0),
-	SH_PFC_PIN_GROUP(intc_ex_irq1),
-	SH_PFC_PIN_GROUP(intc_ex_irq2),
-	SH_PFC_PIN_GROUP(intc_ex_irq3),
-	SH_PFC_PIN_GROUP(intc_ex_irq4),
-	SH_PFC_PIN_GROUP(intc_ex_irq5),
-	SH_PFC_PIN_GROUP(msiof0_clk),
-	SH_PFC_PIN_GROUP(msiof0_sync),
-	SH_PFC_PIN_GROUP(msiof0_ss1),
-	SH_PFC_PIN_GROUP(msiof0_ss2),
-	SH_PFC_PIN_GROUP(msiof0_txd),
-	SH_PFC_PIN_GROUP(msiof0_rxd),
-	SH_PFC_PIN_GROUP(msiof1_clk_a),
-	SH_PFC_PIN_GROUP(msiof1_sync_a),
-	SH_PFC_PIN_GROUP(msiof1_ss1_a),
-	SH_PFC_PIN_GROUP(msiof1_ss2_a),
-	SH_PFC_PIN_GROUP(msiof1_txd_a),
-	SH_PFC_PIN_GROUP(msiof1_rxd_a),
-	SH_PFC_PIN_GROUP(msiof1_clk_b),
-	SH_PFC_PIN_GROUP(msiof1_sync_b),
-	SH_PFC_PIN_GROUP(msiof1_ss1_b),
-	SH_PFC_PIN_GROUP(msiof1_ss2_b),
-	SH_PFC_PIN_GROUP(msiof1_txd_b),
-	SH_PFC_PIN_GROUP(msiof1_rxd_b),
-	SH_PFC_PIN_GROUP(msiof1_clk_c),
-	SH_PFC_PIN_GROUP(msiof1_sync_c),
-	SH_PFC_PIN_GROUP(msiof1_ss1_c),
-	SH_PFC_PIN_GROUP(msiof1_ss2_c),
-	SH_PFC_PIN_GROUP(msiof1_txd_c),
-	SH_PFC_PIN_GROUP(msiof1_rxd_c),
-	SH_PFC_PIN_GROUP(msiof1_clk_d),
-	SH_PFC_PIN_GROUP(msiof1_sync_d),
-	SH_PFC_PIN_GROUP(msiof1_ss1_d),
-	SH_PFC_PIN_GROUP(msiof1_ss2_d),
-	SH_PFC_PIN_GROUP(msiof1_txd_d),
-	SH_PFC_PIN_GROUP(msiof1_rxd_d),
-	SH_PFC_PIN_GROUP(msiof1_clk_e),
-	SH_PFC_PIN_GROUP(msiof1_sync_e),
-	SH_PFC_PIN_GROUP(msiof1_ss1_e),
-	SH_PFC_PIN_GROUP(msiof1_ss2_e),
-	SH_PFC_PIN_GROUP(msiof1_txd_e),
-	SH_PFC_PIN_GROUP(msiof1_rxd_e),
-	SH_PFC_PIN_GROUP(msiof1_clk_f),
-	SH_PFC_PIN_GROUP(msiof1_sync_f),
-	SH_PFC_PIN_GROUP(msiof1_ss1_f),
-	SH_PFC_PIN_GROUP(msiof1_ss2_f),
-	SH_PFC_PIN_GROUP(msiof1_txd_f),
-	SH_PFC_PIN_GROUP(msiof1_rxd_f),
-	SH_PFC_PIN_GROUP(msiof1_clk_g),
-	SH_PFC_PIN_GROUP(msiof1_sync_g),
-	SH_PFC_PIN_GROUP(msiof1_ss1_g),
-	SH_PFC_PIN_GROUP(msiof1_ss2_g),
-	SH_PFC_PIN_GROUP(msiof1_txd_g),
-	SH_PFC_PIN_GROUP(msiof1_rxd_g),
-	SH_PFC_PIN_GROUP(msiof2_clk_a),
-	SH_PFC_PIN_GROUP(msiof2_sync_a),
-	SH_PFC_PIN_GROUP(msiof2_ss1_a),
-	SH_PFC_PIN_GROUP(msiof2_ss2_a),
-	SH_PFC_PIN_GROUP(msiof2_txd_a),
-	SH_PFC_PIN_GROUP(msiof2_rxd_a),
-	SH_PFC_PIN_GROUP(msiof2_clk_b),
-	SH_PFC_PIN_GROUP(msiof2_sync_b),
-	SH_PFC_PIN_GROUP(msiof2_ss1_b),
-	SH_PFC_PIN_GROUP(msiof2_ss2_b),
-	SH_PFC_PIN_GROUP(msiof2_txd_b),
-	SH_PFC_PIN_GROUP(msiof2_rxd_b),
-	SH_PFC_PIN_GROUP(msiof2_clk_c),
-	SH_PFC_PIN_GROUP(msiof2_sync_c),
-	SH_PFC_PIN_GROUP(msiof2_ss1_c),
-	SH_PFC_PIN_GROUP(msiof2_ss2_c),
-	SH_PFC_PIN_GROUP(msiof2_txd_c),
-	SH_PFC_PIN_GROUP(msiof2_rxd_c),
-	SH_PFC_PIN_GROUP(msiof2_clk_d),
-	SH_PFC_PIN_GROUP(msiof2_sync_d),
-	SH_PFC_PIN_GROUP(msiof2_ss1_d),
-	SH_PFC_PIN_GROUP(msiof2_ss2_d),
-	SH_PFC_PIN_GROUP(msiof2_txd_d),
-	SH_PFC_PIN_GROUP(msiof2_rxd_d),
-	SH_PFC_PIN_GROUP(msiof3_clk_a),
-	SH_PFC_PIN_GROUP(msiof3_sync_a),
-	SH_PFC_PIN_GROUP(msiof3_ss1_a),
-	SH_PFC_PIN_GROUP(msiof3_ss2_a),
-	SH_PFC_PIN_GROUP(msiof3_txd_a),
-	SH_PFC_PIN_GROUP(msiof3_rxd_a),
-	SH_PFC_PIN_GROUP(msiof3_clk_b),
-	SH_PFC_PIN_GROUP(msiof3_sync_b),
-	SH_PFC_PIN_GROUP(msiof3_ss1_b),
-	SH_PFC_PIN_GROUP(msiof3_ss2_b),
-	SH_PFC_PIN_GROUP(msiof3_txd_b),
-	SH_PFC_PIN_GROUP(msiof3_rxd_b),
-	SH_PFC_PIN_GROUP(msiof3_clk_c),
-	SH_PFC_PIN_GROUP(msiof3_sync_c),
-	SH_PFC_PIN_GROUP(msiof3_txd_c),
-	SH_PFC_PIN_GROUP(msiof3_rxd_c),
-	SH_PFC_PIN_GROUP(msiof3_clk_d),
-	SH_PFC_PIN_GROUP(msiof3_sync_d),
-	SH_PFC_PIN_GROUP(msiof3_ss1_d),
-	SH_PFC_PIN_GROUP(msiof3_txd_d),
-	SH_PFC_PIN_GROUP(msiof3_rxd_d),
-	SH_PFC_PIN_GROUP(pwm0),
-	SH_PFC_PIN_GROUP(pwm1_a),
-	SH_PFC_PIN_GROUP(pwm1_b),
-	SH_PFC_PIN_GROUP(pwm2_a),
-	SH_PFC_PIN_GROUP(pwm2_b),
-	SH_PFC_PIN_GROUP(pwm3_a),
-	SH_PFC_PIN_GROUP(pwm3_b),
-	SH_PFC_PIN_GROUP(pwm4_a),
-	SH_PFC_PIN_GROUP(pwm4_b),
-	SH_PFC_PIN_GROUP(pwm5_a),
-	SH_PFC_PIN_GROUP(pwm5_b),
-	SH_PFC_PIN_GROUP(pwm6_a),
-	SH_PFC_PIN_GROUP(pwm6_b),
-	SH_PFC_PIN_GROUP(qspi0_ctrl),
-	SH_PFC_PIN_GROUP(qspi0_data2),
-	SH_PFC_PIN_GROUP(qspi0_data4),
-	SH_PFC_PIN_GROUP(qspi1_ctrl),
-	SH_PFC_PIN_GROUP(qspi1_data2),
-	SH_PFC_PIN_GROUP(qspi1_data4),
-	SH_PFC_PIN_GROUP(sata0_devslp_a),
-	SH_PFC_PIN_GROUP(sata0_devslp_b),
-	SH_PFC_PIN_GROUP(scif0_data),
-	SH_PFC_PIN_GROUP(scif0_clk),
-	SH_PFC_PIN_GROUP(scif0_ctrl),
-	SH_PFC_PIN_GROUP(scif1_data_a),
-	SH_PFC_PIN_GROUP(scif1_clk),
-	SH_PFC_PIN_GROUP(scif1_ctrl),
-	SH_PFC_PIN_GROUP(scif1_data_b),
-	SH_PFC_PIN_GROUP(scif2_data_a),
-	SH_PFC_PIN_GROUP(scif2_clk),
-	SH_PFC_PIN_GROUP(scif2_data_b),
-	SH_PFC_PIN_GROUP(scif3_data_a),
-	SH_PFC_PIN_GROUP(scif3_clk),
-	SH_PFC_PIN_GROUP(scif3_ctrl),
-	SH_PFC_PIN_GROUP(scif3_data_b),
-	SH_PFC_PIN_GROUP(scif4_data_a),
-	SH_PFC_PIN_GROUP(scif4_clk_a),
-	SH_PFC_PIN_GROUP(scif4_ctrl_a),
-	SH_PFC_PIN_GROUP(scif4_data_b),
-	SH_PFC_PIN_GROUP(scif4_clk_b),
-	SH_PFC_PIN_GROUP(scif4_ctrl_b),
-	SH_PFC_PIN_GROUP(scif4_data_c),
-	SH_PFC_PIN_GROUP(scif4_clk_c),
-	SH_PFC_PIN_GROUP(scif4_ctrl_c),
-	SH_PFC_PIN_GROUP(scif5_data),
-	SH_PFC_PIN_GROUP(scif5_clk),
-	SH_PFC_PIN_GROUP(scif_clk_a),
-	SH_PFC_PIN_GROUP(scif_clk_b),
-	SH_PFC_PIN_GROUP(sdhi0_data1),
-	SH_PFC_PIN_GROUP(sdhi0_data4),
-	SH_PFC_PIN_GROUP(sdhi0_ctrl),
-	SH_PFC_PIN_GROUP(sdhi0_cd),
-	SH_PFC_PIN_GROUP(sdhi0_wp),
-	SH_PFC_PIN_GROUP(sdhi1_data1),
-	SH_PFC_PIN_GROUP(sdhi1_data4),
-	SH_PFC_PIN_GROUP(sdhi1_ctrl),
-	SH_PFC_PIN_GROUP(sdhi1_cd),
-	SH_PFC_PIN_GROUP(sdhi1_wp),
-	SH_PFC_PIN_GROUP(sdhi2_data1),
-	SH_PFC_PIN_GROUP(sdhi2_data4),
-	SH_PFC_PIN_GROUP(sdhi2_data8),
-	SH_PFC_PIN_GROUP(sdhi2_ctrl),
-	SH_PFC_PIN_GROUP(sdhi2_cd_a),
-	SH_PFC_PIN_GROUP(sdhi2_wp_a),
-	SH_PFC_PIN_GROUP(sdhi2_cd_b),
-	SH_PFC_PIN_GROUP(sdhi2_wp_b),
-	SH_PFC_PIN_GROUP(sdhi2_ds),
-	SH_PFC_PIN_GROUP(sdhi3_data1),
-	SH_PFC_PIN_GROUP(sdhi3_data4),
-	SH_PFC_PIN_GROUP(sdhi3_data8),
-	SH_PFC_PIN_GROUP(sdhi3_ctrl),
-	SH_PFC_PIN_GROUP(sdhi3_cd),
-	SH_PFC_PIN_GROUP(sdhi3_wp),
-	SH_PFC_PIN_GROUP(sdhi3_ds),
-	SH_PFC_PIN_GROUP(ssi0_data),
-	SH_PFC_PIN_GROUP(ssi01239_ctrl),
-	SH_PFC_PIN_GROUP(ssi1_data_a),
-	SH_PFC_PIN_GROUP(ssi1_data_b),
-	SH_PFC_PIN_GROUP(ssi1_ctrl_a),
-	SH_PFC_PIN_GROUP(ssi1_ctrl_b),
-	SH_PFC_PIN_GROUP(ssi2_data_a),
-	SH_PFC_PIN_GROUP(ssi2_data_b),
-	SH_PFC_PIN_GROUP(ssi2_ctrl_a),
-	SH_PFC_PIN_GROUP(ssi2_ctrl_b),
-	SH_PFC_PIN_GROUP(ssi3_data),
-	SH_PFC_PIN_GROUP(ssi34_ctrl),
-	SH_PFC_PIN_GROUP(ssi4_data),
-	SH_PFC_PIN_GROUP(ssi4_ctrl),
-	SH_PFC_PIN_GROUP(ssi5_data),
-	SH_PFC_PIN_GROUP(ssi5_ctrl),
-	SH_PFC_PIN_GROUP(ssi6_data),
-	SH_PFC_PIN_GROUP(ssi6_ctrl),
-	SH_PFC_PIN_GROUP(ssi7_data),
-	SH_PFC_PIN_GROUP(ssi78_ctrl),
-	SH_PFC_PIN_GROUP(ssi8_data),
-	SH_PFC_PIN_GROUP(ssi9_data_a),
-	SH_PFC_PIN_GROUP(ssi9_data_b),
-	SH_PFC_PIN_GROUP(ssi9_ctrl_a),
-	SH_PFC_PIN_GROUP(ssi9_ctrl_b),
-	SH_PFC_PIN_GROUP(usb0),
-	SH_PFC_PIN_GROUP(usb1),
-	SH_PFC_PIN_GROUP(usb2),
-};
-
-static const char * const audio_clk_groups[] = {
-	"audio_clk_a_a",
-	"audio_clk_a_b",
-	"audio_clk_a_c",
-	"audio_clk_b_a",
-	"audio_clk_b_b",
-	"audio_clk_c_a",
-	"audio_clk_c_b",
-	"audio_clkout_a",
-	"audio_clkout_b",
-	"audio_clkout_c",
-	"audio_clkout_d",
-	"audio_clkout1_a",
-	"audio_clkout1_b",
-	"audio_clkout2_a",
-	"audio_clkout2_b",
-	"audio_clkout3_a",
-	"audio_clkout3_b",
-};
+	PINMUX_IPSR_GPSR(IP6_7_4,	D6),
+	PINMUX_IPSR_MSEL(IP6_7_4,	MSIOF2_RXD_B,		SEL_MSIOF2_1),
+	PINMUX_IPSR_GPSR(IP6_7_4,	VI4_DATA22),
+	PINMUX_IPSR_GPSR(IP6_7_4,	VI5_DATA6),
 
-static const char * const avb_groups[] = {
-	"avb_link",
-	"avb_magic",
-	"avb_phy_int",
-	"avb_mdc",
-	"avb_mii",
-	"avb_avtp_pps",
-	"avb_avtp_match_a",
-	"avb_avtp_capture_a",
-	"avb_avtp_match_b",
-	"avb_avtp_capture_b",
-};
+	PINMUX_IPSR_GPSR(IP6_11_8,	D7),
+	PINMUX_IPSR_MSEL(IP6_11_8,	MSIOF2_TXD_B,		SEL_MSIOF2_1),
+	PINMUX_IPSR_GPSR(IP6_11_8,	VI4_DATA23),
+	PINMUX_IPSR_GPSR(IP6_11_8,	VI5_DATA7),
 
-static const char * const can0_groups[] = {
-	"can0_data_a",
-	"can0_data_b",
-};
+	PINMUX_IPSR_GPSR(IP6_15_12,	D8),
+	PINMUX_IPSR_GPSR(IP6_15_12,	LCDOUT0),
+	PINMUX_IPSR_MSEL(IP6_15_12,	MSIOF2_SCK_D,		SEL_MSIOF2_3),
+	PINMUX_IPSR_MSEL(IP6_15_12,	SCK4_C,			SEL_SCIF4_2),
+	PINMUX_IPSR_MSEL(IP6_15_12,	VI4_DATA0_A,		SEL_VIN4_0),
+	PINMUX_IPSR_GPSR(IP6_15_12,	DU_DR0),
 
-static const char * const can1_groups[] = {
-	"can1_data",
-};
+	PINMUX_IPSR_GPSR(IP6_19_16,	D9),
+	PINMUX_IPSR_GPSR(IP6_19_16,	LCDOUT1),
+	PINMUX_IPSR_MSEL(IP6_19_16,	MSIOF2_SYNC_D,		SEL_MSIOF2_3),
+	PINMUX_IPSR_MSEL(IP6_19_16,	VI4_DATA1_A,		SEL_VIN4_0),
+	PINMUX_IPSR_GPSR(IP6_19_16,	DU_DR1),
 
-static const char * const can_clk_groups[] = {
-	"can_clk",
-};
+	PINMUX_IPSR_GPSR(IP6_23_20,	D10),
+	PINMUX_IPSR_GPSR(IP6_23_20,	LCDOUT2),
+	PINMUX_IPSR_MSEL(IP6_23_20,	MSIOF2_RXD_D,		SEL_MSIOF2_3),
+	PINMUX_IPSR_MSEL(IP6_23_20,	HRX3_B,			SEL_HSCIF3_1),
+	PINMUX_IPSR_MSEL(IP6_23_20,	VI4_DATA2_A,		SEL_VIN4_0),
+	PINMUX_IPSR_MSEL(IP6_23_20,	CTS4_N_C,		SEL_SCIF4_2),
+	PINMUX_IPSR_GPSR(IP6_23_20,	DU_DR2),
 
-static const char * const canfd0_groups[] = {
-	"canfd0_data_a",
-	"canfd0_data_b",
-};
+	PINMUX_IPSR_GPSR(IP6_27_24,	D11),
+	PINMUX_IPSR_GPSR(IP6_27_24,	LCDOUT3),
+	PINMUX_IPSR_MSEL(IP6_27_24,	MSIOF2_TXD_D,		SEL_MSIOF2_3),
+	PINMUX_IPSR_MSEL(IP6_27_24,	HTX3_B,			SEL_HSCIF3_1),
+	PINMUX_IPSR_MSEL(IP6_27_24,	VI4_DATA3_A,		SEL_VIN4_0),
+	PINMUX_IPSR_MSEL(IP6_27_24,	RTS4_N_TANS_C,		SEL_SCIF4_2),
+	PINMUX_IPSR_GPSR(IP6_27_24,	DU_DR3),
 
-static const char * const canfd1_groups[] = {
-	"canfd1_data",
-};
+	PINMUX_IPSR_GPSR(IP6_31_28,	D12),
+	PINMUX_IPSR_GPSR(IP6_31_28,	LCDOUT4),
+	PINMUX_IPSR_MSEL(IP6_31_28,	MSIOF2_SS1_D,		SEL_MSIOF2_3),
+	PINMUX_IPSR_MSEL(IP6_31_28,	RX4_C,			SEL_SCIF4_2),
+	PINMUX_IPSR_MSEL(IP6_31_28,	VI4_DATA4_A,		SEL_VIN4_0),
+	PINMUX_IPSR_GPSR(IP6_31_28,	DU_DR4),
 
-static const char * const drif0_groups[] = {
-	"drif0_ctrl_a",
-	"drif0_data0_a",
-	"drif0_data1_a",
-	"drif0_ctrl_b",
-	"drif0_data0_b",
-	"drif0_data1_b",
-	"drif0_ctrl_c",
-	"drif0_data0_c",
-	"drif0_data1_c",
-};
+	/* IPSR7 */
+	PINMUX_IPSR_GPSR(IP7_3_0,	D13),
+	PINMUX_IPSR_GPSR(IP7_3_0,	LCDOUT5),
+	PINMUX_IPSR_MSEL(IP7_3_0,	MSIOF2_SS2_D,		SEL_MSIOF2_3),
+	PINMUX_IPSR_MSEL(IP7_3_0,	TX4_C,			SEL_SCIF4_2),
+	PINMUX_IPSR_MSEL(IP7_3_0,	VI4_DATA5_A,		SEL_VIN4_0),
+	PINMUX_IPSR_GPSR(IP7_3_0,	DU_DR5),
 
-static const char * const drif1_groups[] = {
-	"drif1_ctrl_a",
-	"drif1_data0_a",
-	"drif1_data1_a",
-	"drif1_ctrl_b",
-	"drif1_data0_b",
-	"drif1_data1_b",
-	"drif1_ctrl_c",
-	"drif1_data0_c",
-	"drif1_data1_c",
-};
+	PINMUX_IPSR_GPSR(IP7_7_4,	D14),
+	PINMUX_IPSR_GPSR(IP7_7_4,	LCDOUT6),
+	PINMUX_IPSR_MSEL(IP7_7_4,	MSIOF3_SS1_A,		SEL_MSIOF3_0),
+	PINMUX_IPSR_MSEL(IP7_7_4,	HRX3_C,			SEL_HSCIF3_2),
+	PINMUX_IPSR_MSEL(IP7_7_4,	VI4_DATA6_A,		SEL_VIN4_0),
+	PINMUX_IPSR_GPSR(IP7_7_4,	DU_DR6),
+	PINMUX_IPSR_MSEL(IP7_7_4,	SCL6_C,			SEL_I2C6_2),
 
-static const char * const drif2_groups[] = {
-	"drif2_ctrl_a",
-	"drif2_data0_a",
-	"drif2_data1_a",
-	"drif2_ctrl_b",
-	"drif2_data0_b",
-	"drif2_data1_b",
-};
+	PINMUX_IPSR_GPSR(IP7_11_8,	D15),
+	PINMUX_IPSR_GPSR(IP7_11_8,	LCDOUT7),
+	PINMUX_IPSR_MSEL(IP7_11_8,	MSIOF3_SS2_A,		SEL_MSIOF3_0),
+	PINMUX_IPSR_MSEL(IP7_11_8,	HTX3_C,			SEL_HSCIF3_2),
+	PINMUX_IPSR_MSEL(IP7_11_8,	VI4_DATA7_A,		SEL_VIN4_0),
+	PINMUX_IPSR_GPSR(IP7_11_8,	DU_DR7),
+	PINMUX_IPSR_MSEL(IP7_11_8,	SDA6_C,			SEL_I2C6_2),
 
-static const char * const drif3_groups[] = {
-	"drif3_ctrl_a",
-	"drif3_data0_a",
-	"drif3_data1_a",
-	"drif3_ctrl_b",
-	"drif3_data0_b",
-	"drif3_data1_b",
-};
+	PINMUX_IPSR_GPSR(IP7_15_12,	FSCLKST),
 
-static const char * const du_groups[] = {
-	"du_rgb666",
-	"du_rgb888",
-	"du_clk_out_0",
-	"du_clk_out_1",
-	"du_sync",
-	"du_oddf",
-	"du_cde",
-	"du_disp",
-};
+	PINMUX_IPSR_GPSR(IP7_19_16,	SD0_CLK),
+	PINMUX_IPSR_MSEL(IP7_19_16,	MSIOF1_SCK_E,		SEL_MSIOF1_4),
+	PINMUX_IPSR_MSEL(IP7_19_16,	STP_OPWM_0_B,		SEL_SSP1_0_1),
 
-static const char * const hscif0_groups[] = {
-	"hscif0_data",
-	"hscif0_clk",
-	"hscif0_ctrl",
-};
+	PINMUX_IPSR_GPSR(IP7_23_20,	SD0_CMD),
+	PINMUX_IPSR_MSEL(IP7_23_20,	MSIOF1_SYNC_E,		SEL_MSIOF1_4),
+	PINMUX_IPSR_MSEL(IP7_23_20,	STP_IVCXO27_0_B,	SEL_SSP1_0_1),
 
-static const char * const hscif1_groups[] = {
-	"hscif1_data_a",
-	"hscif1_clk_a",
-	"hscif1_ctrl_a",
-	"hscif1_data_b",
-	"hscif1_clk_b",
-	"hscif1_ctrl_b",
-};
+	PINMUX_IPSR_GPSR(IP7_27_24,	SD0_DAT0),
+	PINMUX_IPSR_MSEL(IP7_27_24,	MSIOF1_RXD_E,		SEL_MSIOF1_4),
+	PINMUX_IPSR_MSEL(IP7_27_24,	TS_SCK0_B,		SEL_TSIF0_1),
+	PINMUX_IPSR_MSEL(IP7_27_24,	STP_ISCLK_0_B,		SEL_SSP1_0_1),
 
-static const char * const hscif2_groups[] = {
-	"hscif2_data_a",
-	"hscif2_clk_a",
-	"hscif2_ctrl_a",
-	"hscif2_data_b",
-	"hscif2_clk_b",
-	"hscif2_ctrl_b",
-};
+	PINMUX_IPSR_GPSR(IP7_31_28,	SD0_DAT1),
+	PINMUX_IPSR_MSEL(IP7_31_28,	MSIOF1_TXD_E,		SEL_MSIOF1_4),
+	PINMUX_IPSR_MSEL(IP7_31_28,	TS_SPSYNC0_B,		SEL_TSIF0_1),
+	PINMUX_IPSR_MSEL(IP7_31_28,	STP_ISSYNC_0_B,		SEL_SSP1_0_1),
 
-static const char * const hscif3_groups[] = {
-	"hscif3_data_a",
-	"hscif3_clk",
-	"hscif3_ctrl",
-	"hscif3_data_b",
-	"hscif3_data_c",
-	"hscif3_data_d",
-};
+	/* IPSR8 */
+	PINMUX_IPSR_GPSR(IP8_3_0,	SD0_DAT2),
+	PINMUX_IPSR_MSEL(IP8_3_0,	MSIOF1_SS1_E,		SEL_MSIOF1_4),
+	PINMUX_IPSR_MSEL(IP8_3_0,	TS_SDAT0_B,		SEL_TSIF0_1),
+	PINMUX_IPSR_MSEL(IP8_3_0,	STP_ISD_0_B,		SEL_SSP1_0_1),
 
-static const char * const hscif4_groups[] = {
-	"hscif4_data_a",
-	"hscif4_clk",
-	"hscif4_ctrl",
-	"hscif4_data_b",
-};
+	PINMUX_IPSR_GPSR(IP8_7_4,	SD0_DAT3),
+	PINMUX_IPSR_MSEL(IP8_7_4,	MSIOF1_SS2_E,		SEL_MSIOF1_4),
+	PINMUX_IPSR_MSEL(IP8_7_4,	TS_SDEN0_B,		SEL_TSIF0_1),
+	PINMUX_IPSR_MSEL(IP8_7_4,	STP_ISEN_0_B,		SEL_SSP1_0_1),
 
-static const char * const i2c1_groups[] = {
-	"i2c1_a",
-	"i2c1_b",
-};
+	PINMUX_IPSR_GPSR(IP8_11_8,	SD1_CLK),
+	PINMUX_IPSR_MSEL(IP8_11_8,	MSIOF1_SCK_G,		SEL_MSIOF1_6),
+	PINMUX_IPSR_MSEL(IP8_11_8,	SIM0_CLK_A,		SEL_SIMCARD_0),
 
-static const char * const i2c2_groups[] = {
-	"i2c2_a",
-	"i2c2_b",
-};
+	PINMUX_IPSR_GPSR(IP8_15_12,	SD1_CMD),
+	PINMUX_IPSR_MSEL(IP8_15_12,	MSIOF1_SYNC_G,		SEL_MSIOF1_6),
+	PINMUX_IPSR_MSEL(IP8_15_12,	NFCE_N_B,		SEL_NDF_1),
+	PINMUX_IPSR_MSEL(IP8_15_12,	SIM0_D_A,		SEL_SIMCARD_0),
+	PINMUX_IPSR_MSEL(IP8_15_12,	STP_IVCXO27_1_B,	SEL_SSP1_1_1),
 
-static const char * const i2c6_groups[] = {
-	"i2c6_a",
-	"i2c6_b",
-	"i2c6_c",
-};
+	PINMUX_IPSR_GPSR(IP8_19_16,	SD1_DAT0),
+	PINMUX_IPSR_GPSR(IP8_19_16,	SD2_DAT4),
+	PINMUX_IPSR_MSEL(IP8_19_16,	MSIOF1_RXD_G,		SEL_MSIOF1_6),
+	PINMUX_IPSR_MSEL(IP8_19_16,	NFWP_N_B,		SEL_NDF_1),
+	PINMUX_IPSR_MSEL(IP8_19_16,	TS_SCK1_B,		SEL_TSIF1_1),
+	PINMUX_IPSR_MSEL(IP8_19_16,	STP_ISCLK_1_B,		SEL_SSP1_1_1),
 
-static const char * const intc_ex_groups[] = {
-	"intc_ex_irq0",
-	"intc_ex_irq1",
-	"intc_ex_irq2",
-	"intc_ex_irq3",
-	"intc_ex_irq4",
-	"intc_ex_irq5",
-};
+	PINMUX_IPSR_GPSR(IP8_23_20,	SD1_DAT1),
+	PINMUX_IPSR_GPSR(IP8_23_20,	SD2_DAT5),
+	PINMUX_IPSR_MSEL(IP8_23_20,	MSIOF1_TXD_G,		SEL_MSIOF1_6),
+	PINMUX_IPSR_MSEL(IP8_23_20,	NFDATA14_B,		SEL_NDF_1),
+	PINMUX_IPSR_MSEL(IP8_23_20,	TS_SPSYNC1_B,		SEL_TSIF1_1),
+	PINMUX_IPSR_MSEL(IP8_23_20,	STP_ISSYNC_1_B,		SEL_SSP1_1_1),
 
-static const char * const msiof0_groups[] = {
-	"msiof0_clk",
-	"msiof0_sync",
-	"msiof0_ss1",
-	"msiof0_ss2",
-	"msiof0_txd",
-	"msiof0_rxd",
-};
+	PINMUX_IPSR_GPSR(IP8_27_24,	SD1_DAT2),
+	PINMUX_IPSR_GPSR(IP8_27_24,	SD2_DAT6),
+	PINMUX_IPSR_MSEL(IP8_27_24,	MSIOF1_SS1_G,		SEL_MSIOF1_6),
+	PINMUX_IPSR_MSEL(IP8_27_24,	NFDATA15_B,		SEL_NDF_1),
+	PINMUX_IPSR_MSEL(IP8_27_24,	TS_SDAT1_B,		SEL_TSIF1_1),
+	PINMUX_IPSR_MSEL(IP8_27_24,	STP_ISD_1_B,		SEL_SSP1_1_1),
 
-static const char * const msiof1_groups[] = {
-	"msiof1_clk_a",
-	"msiof1_sync_a",
-	"msiof1_ss1_a",
-	"msiof1_ss2_a",
-	"msiof1_txd_a",
-	"msiof1_rxd_a",
-	"msiof1_clk_b",
-	"msiof1_sync_b",
-	"msiof1_ss1_b",
-	"msiof1_ss2_b",
-	"msiof1_txd_b",
-	"msiof1_rxd_b",
-	"msiof1_clk_c",
-	"msiof1_sync_c",
-	"msiof1_ss1_c",
-	"msiof1_ss2_c",
-	"msiof1_txd_c",
-	"msiof1_rxd_c",
-	"msiof1_clk_d",
-	"msiof1_sync_d",
-	"msiof1_ss1_d",
-	"msiof1_ss2_d",
-	"msiof1_txd_d",
-	"msiof1_rxd_d",
-	"msiof1_clk_e",
-	"msiof1_sync_e",
-	"msiof1_ss1_e",
-	"msiof1_ss2_e",
-	"msiof1_txd_e",
-	"msiof1_rxd_e",
-	"msiof1_clk_f",
-	"msiof1_sync_f",
-	"msiof1_ss1_f",
-	"msiof1_ss2_f",
-	"msiof1_txd_f",
-	"msiof1_rxd_f",
-	"msiof1_clk_g",
-	"msiof1_sync_g",
-	"msiof1_ss1_g",
-	"msiof1_ss2_g",
-	"msiof1_txd_g",
-	"msiof1_rxd_g",
-};
+	PINMUX_IPSR_GPSR(IP8_31_28,	SD1_DAT3),
+	PINMUX_IPSR_GPSR(IP8_31_28,	SD2_DAT7),
+	PINMUX_IPSR_MSEL(IP8_31_28,	MSIOF1_SS2_G,		SEL_MSIOF1_6),
+	PINMUX_IPSR_MSEL(IP8_31_28,	NFRB_N_B,		SEL_NDF_1),
+	PINMUX_IPSR_MSEL(IP8_31_28,	TS_SDEN1_B,		SEL_TSIF1_1),
+	PINMUX_IPSR_MSEL(IP8_31_28,	STP_ISEN_1_B,		SEL_SSP1_1_1),
 
-static const char * const msiof2_groups[] = {
-	"msiof2_clk_a",
-	"msiof2_sync_a",
-	"msiof2_ss1_a",
-	"msiof2_ss2_a",
-	"msiof2_txd_a",
-	"msiof2_rxd_a",
-	"msiof2_clk_b",
-	"msiof2_sync_b",
-	"msiof2_ss1_b",
-	"msiof2_ss2_b",
-	"msiof2_txd_b",
-	"msiof2_rxd_b",
-	"msiof2_clk_c",
-	"msiof2_sync_c",
-	"msiof2_ss1_c",
-	"msiof2_ss2_c",
-	"msiof2_txd_c",
-	"msiof2_rxd_c",
-	"msiof2_clk_d",
-	"msiof2_sync_d",
-	"msiof2_ss1_d",
-	"msiof2_ss2_d",
-	"msiof2_txd_d",
-	"msiof2_rxd_d",
-};
+	/* IPSR9 */
+	PINMUX_IPSR_GPSR(IP9_3_0,	SD2_CLK),
+	PINMUX_IPSR_GPSR(IP9_3_0,	NFDATA8),
 
-static const char * const msiof3_groups[] = {
-	"msiof3_clk_a",
-	"msiof3_sync_a",
-	"msiof3_ss1_a",
-	"msiof3_ss2_a",
-	"msiof3_txd_a",
-	"msiof3_rxd_a",
-	"msiof3_clk_b",
-	"msiof3_sync_b",
-	"msiof3_ss1_b",
-	"msiof3_ss2_b",
-	"msiof3_txd_b",
-	"msiof3_rxd_b",
-	"msiof3_clk_c",
-	"msiof3_sync_c",
-	"msiof3_txd_c",
-	"msiof3_rxd_c",
-	"msiof3_clk_d",
-	"msiof3_sync_d",
-	"msiof3_ss1_d",
-	"msiof3_txd_d",
-	"msiof3_rxd_d",
-};
+	PINMUX_IPSR_GPSR(IP9_7_4,	SD2_CMD),
+	PINMUX_IPSR_GPSR(IP9_7_4,	NFDATA9),
 
-static const char * const pwm0_groups[] = {
-	"pwm0",
-};
+	PINMUX_IPSR_GPSR(IP9_11_8,	SD2_DAT0),
+	PINMUX_IPSR_GPSR(IP9_11_8,	NFDATA10),
 
-static const char * const pwm1_groups[] = {
-	"pwm1_a",
-	"pwm1_b",
-};
+	PINMUX_IPSR_GPSR(IP9_15_12,	SD2_DAT1),
+	PINMUX_IPSR_GPSR(IP9_15_12,	NFDATA11),
 
-static const char * const pwm2_groups[] = {
-	"pwm2_a",
-	"pwm2_b",
-};
+	PINMUX_IPSR_GPSR(IP9_19_16,	SD2_DAT2),
+	PINMUX_IPSR_GPSR(IP9_19_16,	NFDATA12),
 
-static const char * const pwm3_groups[] = {
-	"pwm3_a",
-	"pwm3_b",
-};
+	PINMUX_IPSR_GPSR(IP9_23_20,	SD2_DAT3),
+	PINMUX_IPSR_GPSR(IP9_23_20,	NFDATA13),
 
-static const char * const pwm4_groups[] = {
-	"pwm4_a",
-	"pwm4_b",
-};
+	PINMUX_IPSR_GPSR(IP9_27_24,	SD2_DS),
+	PINMUX_IPSR_GPSR(IP9_27_24,	NFALE),
+	PINMUX_IPSR_GPSR(IP9_27_24,	SATA_DEVSLP_B),
 
-static const char * const pwm5_groups[] = {
-	"pwm5_a",
-	"pwm5_b",
-};
+	PINMUX_IPSR_GPSR(IP9_31_28,	SD3_CLK),
+	PINMUX_IPSR_GPSR(IP9_31_28,	NFWE_N),
 
-static const char * const pwm6_groups[] = {
-	"pwm6_a",
-	"pwm6_b",
-};
+	/* IPSR10 */
+	PINMUX_IPSR_GPSR(IP10_3_0,	SD3_CMD),
+	PINMUX_IPSR_GPSR(IP10_3_0,	NFRE_N),
 
-static const char * const qspi0_groups[] = {
-	"qspi0_ctrl",
-	"qspi0_data2",
-	"qspi0_data4",
-};
+	PINMUX_IPSR_GPSR(IP10_7_4,	SD3_DAT0),
+	PINMUX_IPSR_GPSR(IP10_7_4,	NFDATA0),
 
-static const char * const qspi1_groups[] = {
-	"qspi1_ctrl",
-	"qspi1_data2",
-	"qspi1_data4",
-};
+	PINMUX_IPSR_GPSR(IP10_11_8,	SD3_DAT1),
+	PINMUX_IPSR_GPSR(IP10_11_8,	NFDATA1),
 
-static const char * const sata0_groups[] = {
-	"sata0_devslp_a",
-	"sata0_devslp_b",
-};
+	PINMUX_IPSR_GPSR(IP10_15_12,	SD3_DAT2),
+	PINMUX_IPSR_GPSR(IP10_15_12,	NFDATA2),
 
-static const char * const scif0_groups[] = {
-	"scif0_data",
-	"scif0_clk",
-	"scif0_ctrl",
-};
+	PINMUX_IPSR_GPSR(IP10_19_16,	SD3_DAT3),
+	PINMUX_IPSR_GPSR(IP10_19_16,	NFDATA3),
 
-static const char * const scif1_groups[] = {
-	"scif1_data_a",
-	"scif1_clk",
-	"scif1_ctrl",
-	"scif1_data_b",
-};
+	PINMUX_IPSR_GPSR(IP10_23_20,	SD3_DAT4),
+	PINMUX_IPSR_MSEL(IP10_23_20,	SD2_CD_A,		SEL_SDHI2_0),
+	PINMUX_IPSR_GPSR(IP10_23_20,	NFDATA4),
 
-static const char * const scif2_groups[] = {
-	"scif2_data_a",
-	"scif2_clk",
-	"scif2_data_b",
-};
+	PINMUX_IPSR_GPSR(IP10_27_24,	SD3_DAT5),
+	PINMUX_IPSR_MSEL(IP10_27_24,	SD2_WP_A,		SEL_SDHI2_0),
+	PINMUX_IPSR_GPSR(IP10_27_24,	NFDATA5),
 
-static const char * const scif3_groups[] = {
-	"scif3_data_a",
-	"scif3_clk",
-	"scif3_ctrl",
-	"scif3_data_b",
-};
+	PINMUX_IPSR_GPSR(IP10_31_28,	SD3_DAT6),
+	PINMUX_IPSR_GPSR(IP10_31_28,	SD3_CD),
+	PINMUX_IPSR_GPSR(IP10_31_28,	NFDATA6),
 
-static const char * const scif4_groups[] = {
-	"scif4_data_a",
-	"scif4_clk_a",
-	"scif4_ctrl_a",
-	"scif4_data_b",
-	"scif4_clk_b",
-	"scif4_ctrl_b",
-	"scif4_data_c",
-	"scif4_clk_c",
-	"scif4_ctrl_c",
-};
+	/* IPSR11 */
+	PINMUX_IPSR_GPSR(IP11_3_0,	SD3_DAT7),
+	PINMUX_IPSR_GPSR(IP11_3_0,	SD3_WP),
+	PINMUX_IPSR_GPSR(IP11_3_0,	NFDATA7),
+
+	PINMUX_IPSR_GPSR(IP11_7_4,	SD3_DS),
+	PINMUX_IPSR_GPSR(IP11_7_4,	NFCLE),
+
+	PINMUX_IPSR_GPSR(IP11_11_8,	SD0_CD),
+	PINMUX_IPSR_MSEL(IP11_11_8,	SCL2_B,			SEL_I2C2_1),
+	PINMUX_IPSR_MSEL(IP11_11_8,	SIM0_RST_A,		SEL_SIMCARD_0),
+
+	PINMUX_IPSR_GPSR(IP11_15_12,	SD0_WP),
+	PINMUX_IPSR_MSEL(IP11_15_12,	SDA2_B,			SEL_I2C2_1),
+
+	PINMUX_IPSR_GPSR(IP11_19_16,	SD1_CD),
+	PINMUX_IPSR_MSEL(IP11_19_16,	SIM0_CLK_B,		SEL_SIMCARD_1),
+
+	PINMUX_IPSR_GPSR(IP11_23_20,	SD1_WP),
+	PINMUX_IPSR_MSEL(IP11_23_20,	SIM0_D_B,		SEL_SIMCARD_1),
+
+	PINMUX_IPSR_GPSR(IP11_27_24,	SCK0),
+	PINMUX_IPSR_MSEL(IP11_27_24,	HSCK1_B,		SEL_HSCIF1_1),
+	PINMUX_IPSR_MSEL(IP11_27_24,	MSIOF1_SS2_B,		SEL_MSIOF1_1),
+	PINMUX_IPSR_MSEL(IP11_27_24,	AUDIO_CLKC_B,		SEL_ADG_C_1),
+	PINMUX_IPSR_MSEL(IP11_27_24,	SDA2_A,			SEL_I2C2_0),
+	PINMUX_IPSR_MSEL(IP11_27_24,	SIM0_RST_B,		SEL_SIMCARD_1),
+	PINMUX_IPSR_MSEL(IP11_27_24,	STP_OPWM_0_C,		SEL_SSP1_0_2),
+	PINMUX_IPSR_MSEL(IP11_27_24,	RIF0_CLK_B,		SEL_DRIF0_1),
+	PINMUX_IPSR_GPSR(IP11_27_24,	ADICHS2),
+	PINMUX_IPSR_MSEL(IP11_27_24,	SCK5_B,			SEL_SCIF5_1),
+
+	PINMUX_IPSR_GPSR(IP11_31_28,	RX0),
+	PINMUX_IPSR_MSEL(IP11_31_28,	HRX1_B,			SEL_HSCIF1_1),
+	PINMUX_IPSR_MSEL(IP11_31_28,	TS_SCK0_C,		SEL_TSIF0_2),
+	PINMUX_IPSR_MSEL(IP11_31_28,	STP_ISCLK_0_C,		SEL_SSP1_0_2),
+	PINMUX_IPSR_MSEL(IP11_31_28,	RIF0_D0_B,		SEL_DRIF0_1),
 
-static const char * const scif5_groups[] = {
-	"scif5_data",
-	"scif5_clk",
-};
+	/* IPSR12 */
+	PINMUX_IPSR_GPSR(IP12_3_0,	TX0),
+	PINMUX_IPSR_MSEL(IP12_3_0,	HTX1_B,			SEL_HSCIF1_1),
+	PINMUX_IPSR_MSEL(IP12_3_0,	TS_SPSYNC0_C,		SEL_TSIF0_2),
+	PINMUX_IPSR_MSEL(IP12_3_0,	STP_ISSYNC_0_C,		SEL_SSP1_0_2),
+	PINMUX_IPSR_MSEL(IP12_3_0,	RIF0_D1_B,		SEL_DRIF0_1),
+
+	PINMUX_IPSR_GPSR(IP12_7_4,	CTS0_N),
+	PINMUX_IPSR_MSEL(IP12_7_4,	HCTS1_N_B,		SEL_HSCIF1_1),
+	PINMUX_IPSR_MSEL(IP12_7_4,	MSIOF1_SYNC_B,		SEL_MSIOF1_1),
+	PINMUX_IPSR_MSEL(IP12_7_4,	TS_SPSYNC1_C,		SEL_TSIF1_2),
+	PINMUX_IPSR_MSEL(IP12_7_4,	STP_ISSYNC_1_C,		SEL_SSP1_1_2),
+	PINMUX_IPSR_MSEL(IP12_7_4,	RIF1_SYNC_B,		SEL_DRIF1_1),
+	PINMUX_IPSR_GPSR(IP12_7_4,	AUDIO_CLKOUT_C),
+	PINMUX_IPSR_GPSR(IP12_7_4,	ADICS_SAMP),
+
+	PINMUX_IPSR_GPSR(IP12_11_8,	RTS0_N_TANS),
+	PINMUX_IPSR_MSEL(IP12_11_8,	HRTS1_N_B,		SEL_HSCIF1_1),
+	PINMUX_IPSR_MSEL(IP12_11_8,	MSIOF1_SS1_B,		SEL_MSIOF1_1),
+	PINMUX_IPSR_MSEL(IP12_11_8,	AUDIO_CLKA_B,		SEL_ADG_A_1),
+	PINMUX_IPSR_MSEL(IP12_11_8,	SCL2_A,			SEL_I2C2_0),
+	PINMUX_IPSR_MSEL(IP12_11_8,	STP_IVCXO27_1_C,	SEL_SSP1_1_2),
+	PINMUX_IPSR_MSEL(IP12_11_8,	RIF0_SYNC_B,		SEL_DRIF0_1),
+	PINMUX_IPSR_GPSR(IP12_11_8,	ADICHS1),
+
+	PINMUX_IPSR_MSEL(IP12_15_12,	RX1_A,			SEL_SCIF1_0),
+	PINMUX_IPSR_MSEL(IP12_15_12,	HRX1_A,			SEL_HSCIF1_0),
+	PINMUX_IPSR_MSEL(IP12_15_12,	TS_SDAT0_C,		SEL_TSIF0_2),
+	PINMUX_IPSR_MSEL(IP12_15_12,	STP_ISD_0_C,		SEL_SSP1_0_2),
+	PINMUX_IPSR_MSEL(IP12_15_12,	RIF1_CLK_C,		SEL_DRIF1_2),
+
+	PINMUX_IPSR_MSEL(IP12_19_16,	TX1_A,			SEL_SCIF1_0),
+	PINMUX_IPSR_MSEL(IP12_19_16,	HTX1_A,			SEL_HSCIF1_0),
+	PINMUX_IPSR_MSEL(IP12_19_16,	TS_SDEN0_C,		SEL_TSIF0_2),
+	PINMUX_IPSR_MSEL(IP12_19_16,	STP_ISEN_0_C,		SEL_SSP1_0_2),
+	PINMUX_IPSR_MSEL(IP12_19_16,	RIF1_D0_C,		SEL_DRIF1_2),
+
+	PINMUX_IPSR_GPSR(IP12_23_20,	CTS1_N),
+	PINMUX_IPSR_MSEL(IP12_23_20,	HCTS1_N_A,		SEL_HSCIF1_0),
+	PINMUX_IPSR_MSEL(IP12_23_20,	MSIOF1_RXD_B,		SEL_MSIOF1_1),
+	PINMUX_IPSR_MSEL(IP12_23_20,	TS_SDEN1_C,		SEL_TSIF1_2),
+	PINMUX_IPSR_MSEL(IP12_23_20,	STP_ISEN_1_C,		SEL_SSP1_1_2),
+	PINMUX_IPSR_MSEL(IP12_23_20,	RIF1_D0_B,		SEL_DRIF1_1),
+	PINMUX_IPSR_GPSR(IP12_23_20,	ADIDATA),
+
+	PINMUX_IPSR_GPSR(IP12_27_24,	RTS1_N_TANS),
+	PINMUX_IPSR_MSEL(IP12_27_24,	HRTS1_N_A,		SEL_HSCIF1_0),
+	PINMUX_IPSR_MSEL(IP12_27_24,	MSIOF1_TXD_B,		SEL_MSIOF1_1),
+	PINMUX_IPSR_MSEL(IP12_27_24,	TS_SDAT1_C,		SEL_TSIF1_2),
+	PINMUX_IPSR_MSEL(IP12_27_24,	STP_ISD_1_C,		SEL_SSP1_1_2),
+	PINMUX_IPSR_MSEL(IP12_27_24,	RIF1_D1_B,		SEL_DRIF1_1),
+	PINMUX_IPSR_GPSR(IP12_27_24,	ADICHS0),
+
+	PINMUX_IPSR_GPSR(IP12_31_28,	SCK2),
+	PINMUX_IPSR_MSEL(IP12_31_28,	SCIF_CLK_B,		SEL_SCIF1_1),
+	PINMUX_IPSR_MSEL(IP12_31_28,	MSIOF1_SCK_B,		SEL_MSIOF1_1),
+	PINMUX_IPSR_MSEL(IP12_31_28,	TS_SCK1_C,		SEL_TSIF1_2),
+	PINMUX_IPSR_MSEL(IP12_31_28,	STP_ISCLK_1_C,		SEL_SSP1_1_2),
+	PINMUX_IPSR_MSEL(IP12_31_28,	RIF1_CLK_B,		SEL_DRIF1_1),
+	PINMUX_IPSR_GPSR(IP12_31_28,	ADICLK),
 
-static const char * const scif_clk_groups[] = {
-	"scif_clk_a",
-	"scif_clk_b",
-};
+	/* IPSR13 */
+	PINMUX_IPSR_MSEL(IP13_3_0,	TX2_A,			SEL_SCIF2_0),
+	PINMUX_IPSR_MSEL(IP13_3_0,	SD2_CD_B,		SEL_SDHI2_1),
+	PINMUX_IPSR_MSEL(IP13_3_0,	SCL1_A,			SEL_I2C1_0),
+	PINMUX_IPSR_MSEL(IP13_3_0,	FMCLK_A,		SEL_FM_0),
+	PINMUX_IPSR_MSEL(IP13_3_0,	RIF1_D1_C,		SEL_DRIF1_2),
+	PINMUX_IPSR_GPSR(IP13_3_0,	FSO_CFE_0_N),
+
+	PINMUX_IPSR_MSEL(IP13_7_4,	RX2_A,			SEL_SCIF2_0),
+	PINMUX_IPSR_MSEL(IP13_7_4,	SD2_WP_B,		SEL_SDHI2_1),
+	PINMUX_IPSR_MSEL(IP13_7_4,	SDA1_A,			SEL_I2C1_0),
+	PINMUX_IPSR_MSEL(IP13_7_4,	FMIN_A,			SEL_FM_0),
+	PINMUX_IPSR_MSEL(IP13_7_4,	RIF1_SYNC_C,		SEL_DRIF1_2),
+	PINMUX_IPSR_GPSR(IP13_7_4,	FSO_CFE_1_N),
+
+	PINMUX_IPSR_GPSR(IP13_11_8,	HSCK0),
+	PINMUX_IPSR_MSEL(IP13_11_8,	MSIOF1_SCK_D,		SEL_MSIOF1_3),
+	PINMUX_IPSR_MSEL(IP13_11_8,	AUDIO_CLKB_A,		SEL_ADG_B_0),
+	PINMUX_IPSR_MSEL(IP13_11_8,	SSI_SDATA1_B,		SEL_SSI_1),
+	PINMUX_IPSR_MSEL(IP13_11_8,	TS_SCK0_D,		SEL_TSIF0_3),
+	PINMUX_IPSR_MSEL(IP13_11_8,	STP_ISCLK_0_D,		SEL_SSP1_0_3),
+	PINMUX_IPSR_MSEL(IP13_11_8,	RIF0_CLK_C,		SEL_DRIF0_2),
+	PINMUX_IPSR_MSEL(IP13_11_8,	RX5_B,			SEL_SCIF5_1),
+
+	PINMUX_IPSR_GPSR(IP13_15_12,	HRX0),
+	PINMUX_IPSR_MSEL(IP13_15_12,	MSIOF1_RXD_D,		SEL_MSIOF1_3),
+	PINMUX_IPSR_MSEL(IP13_15_12,	SSI_SDATA2_B,		SEL_SSI_1),
+	PINMUX_IPSR_MSEL(IP13_15_12,	TS_SDEN0_D,		SEL_TSIF0_3),
+	PINMUX_IPSR_MSEL(IP13_15_12,	STP_ISEN_0_D,		SEL_SSP1_0_3),
+	PINMUX_IPSR_MSEL(IP13_15_12,	RIF0_D0_C,		SEL_DRIF0_2),
+
+	PINMUX_IPSR_GPSR(IP13_19_16,	HTX0),
+	PINMUX_IPSR_MSEL(IP13_19_16,	MSIOF1_TXD_D,		SEL_MSIOF1_3),
+	PINMUX_IPSR_MSEL(IP13_19_16,	SSI_SDATA9_B,		SEL_SSI_1),
+	PINMUX_IPSR_MSEL(IP13_19_16,	TS_SDAT0_D,		SEL_TSIF0_3),
+	PINMUX_IPSR_MSEL(IP13_19_16,	STP_ISD_0_D,		SEL_SSP1_0_3),
+	PINMUX_IPSR_MSEL(IP13_19_16,	RIF0_D1_C,		SEL_DRIF0_2),
+
+	PINMUX_IPSR_GPSR(IP13_23_20,	HCTS0_N),
+	PINMUX_IPSR_MSEL(IP13_23_20,	RX2_B,			SEL_SCIF2_1),
+	PINMUX_IPSR_MSEL(IP13_23_20,	MSIOF1_SYNC_D,		SEL_MSIOF1_3),
+	PINMUX_IPSR_MSEL(IP13_23_20,	SSI_SCK9_A,		SEL_SSI_0),
+	PINMUX_IPSR_MSEL(IP13_23_20,	TS_SPSYNC0_D,		SEL_TSIF0_3),
+	PINMUX_IPSR_MSEL(IP13_23_20,	STP_ISSYNC_0_D,		SEL_SSP1_0_3),
+	PINMUX_IPSR_MSEL(IP13_23_20,	RIF0_SYNC_C,		SEL_DRIF0_2),
+	PINMUX_IPSR_GPSR(IP13_23_20,	AUDIO_CLKOUT1_A),
+
+	PINMUX_IPSR_GPSR(IP13_27_24,	HRTS0_N),
+	PINMUX_IPSR_MSEL(IP13_27_24,	TX2_B,			SEL_SCIF2_1),
+	PINMUX_IPSR_MSEL(IP13_27_24,	MSIOF1_SS1_D,		SEL_MSIOF1_3),
+	PINMUX_IPSR_MSEL(IP13_27_24,	SSI_WS9_A,		SEL_SSI_0),
+	PINMUX_IPSR_MSEL(IP13_27_24,	STP_IVCXO27_0_D,	SEL_SSP1_0_3),
+	PINMUX_IPSR_MSEL(IP13_27_24,	BPFCLK_A,		SEL_FM_0),
+	PINMUX_IPSR_GPSR(IP13_27_24,	AUDIO_CLKOUT2_A),
+
+	PINMUX_IPSR_GPSR(IP13_31_28,	MSIOF0_SYNC),
+	PINMUX_IPSR_GPSR(IP13_31_28,	AUDIO_CLKOUT_A),
+	PINMUX_IPSR_MSEL(IP13_31_28,	TX5_B,			SEL_SCIF5_1),
+	PINMUX_IPSR_MSEL(IP13_31_28,	BPFCLK_D,		SEL_FM_3),
 
-static const char * const sdhi0_groups[] = {
-	"sdhi0_data1",
-	"sdhi0_data4",
-	"sdhi0_ctrl",
-	"sdhi0_cd",
-	"sdhi0_wp",
-};
+	/* IPSR14 */
+	PINMUX_IPSR_GPSR(IP14_3_0,	MSIOF0_SS1),
+	PINMUX_IPSR_MSEL(IP14_3_0,	RX5_A,			SEL_SCIF5_0),
+	PINMUX_IPSR_MSEL(IP14_3_0,	NFWP_N_A,		SEL_NDF_0),
+	PINMUX_IPSR_MSEL(IP14_3_0,	AUDIO_CLKA_C,		SEL_ADG_A_2),
+	PINMUX_IPSR_MSEL(IP14_3_0,	SSI_SCK2_A,		SEL_SSI_0),
+	PINMUX_IPSR_MSEL(IP14_3_0,	STP_IVCXO27_0_C,	SEL_SSP1_0_2),
+	PINMUX_IPSR_GPSR(IP14_3_0,	AUDIO_CLKOUT3_A),
+	PINMUX_IPSR_MSEL(IP14_3_0,	TCLK1_B,		SEL_TIMER_TMU_1),
+
+	PINMUX_IPSR_GPSR(IP14_7_4,	MSIOF0_SS2),
+	PINMUX_IPSR_MSEL(IP14_7_4,	TX5_A,			SEL_SCIF5_0),
+	PINMUX_IPSR_MSEL(IP14_7_4,	MSIOF1_SS2_D,		SEL_MSIOF1_3),
+	PINMUX_IPSR_MSEL(IP14_7_4,	AUDIO_CLKC_A,		SEL_ADG_C_0),
+	PINMUX_IPSR_MSEL(IP14_7_4,	SSI_WS2_A,		SEL_SSI_0),
+	PINMUX_IPSR_MSEL(IP14_7_4,	STP_OPWM_0_D,		SEL_SSP1_0_3),
+	PINMUX_IPSR_GPSR(IP14_7_4,	AUDIO_CLKOUT_D),
+	PINMUX_IPSR_MSEL(IP14_7_4,	SPEEDIN_B,		SEL_SPEED_PULSE_1),
+
+	PINMUX_IPSR_GPSR(IP14_11_8,	MLB_CLK),
+	PINMUX_IPSR_MSEL(IP14_11_8,	MSIOF1_SCK_F,		SEL_MSIOF1_5),
+	PINMUX_IPSR_MSEL(IP14_11_8,	SCL1_B,			SEL_I2C1_1),
+
+	PINMUX_IPSR_GPSR(IP14_15_12,	MLB_SIG),
+	PINMUX_IPSR_MSEL(IP14_15_12,	RX1_B,			SEL_SCIF1_1),
+	PINMUX_IPSR_MSEL(IP14_15_12,	MSIOF1_SYNC_F,		SEL_MSIOF1_5),
+	PINMUX_IPSR_MSEL(IP14_15_12,	SDA1_B,			SEL_I2C1_1),
+
+	PINMUX_IPSR_GPSR(IP14_19_16,	MLB_DAT),
+	PINMUX_IPSR_MSEL(IP14_19_16,	TX1_B,			SEL_SCIF1_1),
+	PINMUX_IPSR_MSEL(IP14_19_16,	MSIOF1_RXD_F,		SEL_MSIOF1_5),
+
+	PINMUX_IPSR_GPSR(IP14_23_20,	SSI_SCK01239),
+	PINMUX_IPSR_MSEL(IP14_23_20,	MSIOF1_TXD_F,		SEL_MSIOF1_5),
+
+	PINMUX_IPSR_GPSR(IP14_27_24,	SSI_WS01239),
+	PINMUX_IPSR_MSEL(IP14_27_24,	MSIOF1_SS1_F,		SEL_MSIOF1_5),
+
+	PINMUX_IPSR_GPSR(IP14_31_28,	SSI_SDATA0),
+	PINMUX_IPSR_MSEL(IP14_31_28,	MSIOF1_SS2_F,		SEL_MSIOF1_5),
 
-static const char * const sdhi1_groups[] = {
-	"sdhi1_data1",
-	"sdhi1_data4",
-	"sdhi1_ctrl",
-	"sdhi1_cd",
-	"sdhi1_wp",
-};
+	/* IPSR15 */
+	PINMUX_IPSR_MSEL(IP15_3_0,	SSI_SDATA1_A,		SEL_SSI_0),
+
+	PINMUX_IPSR_MSEL(IP15_7_4,	SSI_SDATA2_A,		SEL_SSI_0),
+	PINMUX_IPSR_MSEL(IP15_7_4,	SSI_SCK1_B,		SEL_SSI_1),
+
+	PINMUX_IPSR_GPSR(IP15_11_8,	SSI_SCK34),
+	PINMUX_IPSR_MSEL(IP15_11_8,	MSIOF1_SS1_A,		SEL_MSIOF1_0),
+	PINMUX_IPSR_MSEL(IP15_11_8,	STP_OPWM_0_A,		SEL_SSP1_0_0),
+
+	PINMUX_IPSR_GPSR(IP15_15_12,	SSI_WS34),
+	PINMUX_IPSR_MSEL(IP15_15_12,	HCTS2_N_A,		SEL_HSCIF2_0),
+	PINMUX_IPSR_MSEL(IP15_15_12,	MSIOF1_SS2_A,		SEL_MSIOF1_0),
+	PINMUX_IPSR_MSEL(IP15_15_12,	STP_IVCXO27_0_A,	SEL_SSP1_0_0),
+
+	PINMUX_IPSR_GPSR(IP15_19_16,	SSI_SDATA3),
+	PINMUX_IPSR_MSEL(IP15_19_16,	HRTS2_N_A,		SEL_HSCIF2_0),
+	PINMUX_IPSR_MSEL(IP15_19_16,	MSIOF1_TXD_A,		SEL_MSIOF1_0),
+	PINMUX_IPSR_MSEL(IP15_19_16,	TS_SCK0_A,		SEL_TSIF0_0),
+	PINMUX_IPSR_MSEL(IP15_19_16,	STP_ISCLK_0_A,		SEL_SSP1_0_0),
+	PINMUX_IPSR_MSEL(IP15_19_16,	RIF0_D1_A,		SEL_DRIF0_0),
+	PINMUX_IPSR_MSEL(IP15_19_16,	RIF2_D0_A,		SEL_DRIF2_0),
+
+	PINMUX_IPSR_GPSR(IP15_23_20,	SSI_SCK4),
+	PINMUX_IPSR_MSEL(IP15_23_20,	HRX2_A,			SEL_HSCIF2_0),
+	PINMUX_IPSR_MSEL(IP15_23_20,	MSIOF1_SCK_A,		SEL_MSIOF1_0),
+	PINMUX_IPSR_MSEL(IP15_23_20,	TS_SDAT0_A,		SEL_TSIF0_0),
+	PINMUX_IPSR_MSEL(IP15_23_20,	STP_ISD_0_A,		SEL_SSP1_0_0),
+	PINMUX_IPSR_MSEL(IP15_23_20,	RIF0_CLK_A,		SEL_DRIF0_0),
+	PINMUX_IPSR_MSEL(IP15_23_20,	RIF2_CLK_A,		SEL_DRIF2_0),
+
+	PINMUX_IPSR_GPSR(IP15_27_24,	SSI_WS4),
+	PINMUX_IPSR_MSEL(IP15_27_24,	HTX2_A,			SEL_HSCIF2_0),
+	PINMUX_IPSR_MSEL(IP15_27_24,	MSIOF1_SYNC_A,		SEL_MSIOF1_0),
+	PINMUX_IPSR_MSEL(IP15_27_24,	TS_SDEN0_A,		SEL_TSIF0_0),
+	PINMUX_IPSR_MSEL(IP15_27_24,	STP_ISEN_0_A,		SEL_SSP1_0_0),
+	PINMUX_IPSR_MSEL(IP15_27_24,	RIF0_SYNC_A,		SEL_DRIF0_0),
+	PINMUX_IPSR_MSEL(IP15_27_24,	RIF2_SYNC_A,		SEL_DRIF2_0),
+
+	PINMUX_IPSR_GPSR(IP15_31_28,	SSI_SDATA4),
+	PINMUX_IPSR_MSEL(IP15_31_28,	HSCK2_A,		SEL_HSCIF2_0),
+	PINMUX_IPSR_MSEL(IP15_31_28,	MSIOF1_RXD_A,		SEL_MSIOF1_0),
+	PINMUX_IPSR_MSEL(IP15_31_28,	TS_SPSYNC0_A,		SEL_TSIF0_0),
+	PINMUX_IPSR_MSEL(IP15_31_28,	STP_ISSYNC_0_A,		SEL_SSP1_0_0),
+	PINMUX_IPSR_MSEL(IP15_31_28,	RIF0_D0_A,		SEL_DRIF0_0),
+	PINMUX_IPSR_MSEL(IP15_31_28,	RIF2_D1_A,		SEL_DRIF2_0),
 
-static const char * const sdhi2_groups[] = {
-	"sdhi2_data1",
-	"sdhi2_data4",
-	"sdhi2_data8",
-	"sdhi2_ctrl",
-	"sdhi2_cd_a",
-	"sdhi2_wp_a",
-	"sdhi2_cd_b",
-	"sdhi2_wp_b",
-	"sdhi2_ds",
-};
+	/* IPSR16 */
+	PINMUX_IPSR_GPSR(IP16_3_0,	SSI_SCK6),
+	PINMUX_IPSR_GPSR(IP16_3_0,	USB2_PWEN),
+	PINMUX_IPSR_MSEL(IP16_3_0,	SIM0_RST_D,		SEL_SIMCARD_3),
+
+	PINMUX_IPSR_GPSR(IP16_7_4,	SSI_WS6),
+	PINMUX_IPSR_GPSR(IP16_7_4,	USB2_OVC),
+	PINMUX_IPSR_MSEL(IP16_7_4,	SIM0_D_D,		SEL_SIMCARD_3),
+
+	PINMUX_IPSR_GPSR(IP16_11_8,	SSI_SDATA6),
+	PINMUX_IPSR_MSEL(IP16_11_8,	SIM0_CLK_D,		SEL_SIMCARD_3),
+	PINMUX_IPSR_GPSR(IP16_11_8,	SATA_DEVSLP_A),
+
+	PINMUX_IPSR_GPSR(IP16_15_12,	SSI_SCK78),
+	PINMUX_IPSR_MSEL(IP16_15_12,	HRX2_B,			SEL_HSCIF2_1),
+	PINMUX_IPSR_MSEL(IP16_15_12,	MSIOF1_SCK_C,		SEL_MSIOF1_2),
+	PINMUX_IPSR_MSEL(IP16_15_12,	TS_SCK1_A,		SEL_TSIF1_0),
+	PINMUX_IPSR_MSEL(IP16_15_12,	STP_ISCLK_1_A,		SEL_SSP1_1_0),
+	PINMUX_IPSR_MSEL(IP16_15_12,	RIF1_CLK_A,		SEL_DRIF1_0),
+	PINMUX_IPSR_MSEL(IP16_15_12,	RIF3_CLK_A,		SEL_DRIF3_0),
+
+	PINMUX_IPSR_GPSR(IP16_19_16,	SSI_WS78),
+	PINMUX_IPSR_MSEL(IP16_19_16,	HTX2_B,			SEL_HSCIF2_1),
+	PINMUX_IPSR_MSEL(IP16_19_16,	MSIOF1_SYNC_C,		SEL_MSIOF1_2),
+	PINMUX_IPSR_MSEL(IP16_19_16,	TS_SDAT1_A,		SEL_TSIF1_0),
+	PINMUX_IPSR_MSEL(IP16_19_16,	STP_ISD_1_A,		SEL_SSP1_1_0),
+	PINMUX_IPSR_MSEL(IP16_19_16,	RIF1_SYNC_A,		SEL_DRIF1_0),
+	PINMUX_IPSR_MSEL(IP16_19_16,	RIF3_SYNC_A,		SEL_DRIF3_0),
+
+	PINMUX_IPSR_GPSR(IP16_23_20,	SSI_SDATA7),
+	PINMUX_IPSR_MSEL(IP16_23_20,	HCTS2_N_B,		SEL_HSCIF2_1),
+	PINMUX_IPSR_MSEL(IP16_23_20,	MSIOF1_RXD_C,		SEL_MSIOF1_2),
+	PINMUX_IPSR_MSEL(IP16_23_20,	TS_SDEN1_A,		SEL_TSIF1_0),
+	PINMUX_IPSR_MSEL(IP16_23_20,	STP_ISEN_1_A,		SEL_SSP1_1_0),
+	PINMUX_IPSR_MSEL(IP16_23_20,	RIF1_D0_A,		SEL_DRIF1_0),
+	PINMUX_IPSR_MSEL(IP16_23_20,	RIF3_D0_A,		SEL_DRIF3_0),
+	PINMUX_IPSR_MSEL(IP16_23_20,	TCLK2_A,		SEL_TIMER_TMU_0),
+
+	PINMUX_IPSR_GPSR(IP16_27_24,	SSI_SDATA8),
+	PINMUX_IPSR_MSEL(IP16_27_24,	HRTS2_N_B,		SEL_HSCIF2_1),
+	PINMUX_IPSR_MSEL(IP16_27_24,	MSIOF1_TXD_C,		SEL_MSIOF1_2),
+	PINMUX_IPSR_MSEL(IP16_27_24,	TS_SPSYNC1_A,		SEL_TSIF1_0),
+	PINMUX_IPSR_MSEL(IP16_27_24,	STP_ISSYNC_1_A,		SEL_SSP1_1_0),
+	PINMUX_IPSR_MSEL(IP16_27_24,	RIF1_D1_A,		SEL_DRIF1_0),
+	PINMUX_IPSR_MSEL(IP16_27_24,	RIF3_D1_A,		SEL_DRIF3_0),
+
+	PINMUX_IPSR_MSEL(IP16_31_28,	SSI_SDATA9_A,		SEL_SSI_0),
+	PINMUX_IPSR_MSEL(IP16_31_28,	HSCK2_B,		SEL_HSCIF2_1),
+	PINMUX_IPSR_MSEL(IP16_31_28,	MSIOF1_SS1_C,		SEL_MSIOF1_2),
+	PINMUX_IPSR_MSEL(IP16_31_28,	HSCK1_A,		SEL_HSCIF1_0),
+	PINMUX_IPSR_MSEL(IP16_31_28,	SSI_WS1_B,		SEL_SSI_1),
+	PINMUX_IPSR_GPSR(IP16_31_28,	SCK1),
+	PINMUX_IPSR_MSEL(IP16_31_28,	STP_IVCXO27_1_A,	SEL_SSP1_1_0),
+	PINMUX_IPSR_GPSR(IP16_31_28,	SCK5_A),
 
-static const char * const sdhi3_groups[] = {
-	"sdhi3_data1",
-	"sdhi3_data4",
-	"sdhi3_data8",
-	"sdhi3_ctrl",
-	"sdhi3_cd",
-	"sdhi3_wp",
-	"sdhi3_ds",
-};
+	/* IPSR17 */
+	PINMUX_IPSR_MSEL(IP17_3_0,	AUDIO_CLKA_A,		SEL_ADG_A_0),
+	PINMUX_IPSR_GPSR(IP17_3_0,	CC5_OSCOUT),
+
+	PINMUX_IPSR_MSEL(IP17_7_4,	AUDIO_CLKB_B,		SEL_ADG_B_1),
+	PINMUX_IPSR_MSEL(IP17_7_4,	SCIF_CLK_A,		SEL_SCIF1_0),
+	PINMUX_IPSR_MSEL(IP17_7_4,	STP_IVCXO27_1_D,	SEL_SSP1_1_3),
+	PINMUX_IPSR_MSEL(IP17_7_4,	REMOCON_A,		SEL_REMOCON_0),
+	PINMUX_IPSR_MSEL(IP17_7_4,	TCLK1_A,		SEL_TIMER_TMU_0),
+
+	PINMUX_IPSR_GPSR(IP17_11_8,	USB0_PWEN),
+	PINMUX_IPSR_MSEL(IP17_11_8,	SIM0_RST_C,		SEL_SIMCARD_2),
+	PINMUX_IPSR_MSEL(IP17_11_8,	TS_SCK1_D,		SEL_TSIF1_3),
+	PINMUX_IPSR_MSEL(IP17_11_8,	STP_ISCLK_1_D,		SEL_SSP1_1_3),
+	PINMUX_IPSR_MSEL(IP17_11_8,	BPFCLK_B,		SEL_FM_1),
+	PINMUX_IPSR_MSEL(IP17_11_8,	RIF3_CLK_B,		SEL_DRIF3_1),
+	PINMUX_IPSR_MSEL(IP17_11_8,	HSCK2_C,		SEL_HSCIF2_2),
+
+	PINMUX_IPSR_GPSR(IP17_15_12,	USB0_OVC),
+	PINMUX_IPSR_MSEL(IP17_15_12,	SIM0_D_C,		SEL_SIMCARD_2),
+	PINMUX_IPSR_MSEL(IP17_15_12,	TS_SDAT1_D,		SEL_TSIF1_3),
+	PINMUX_IPSR_MSEL(IP17_15_12,	STP_ISD_1_D,		SEL_SSP1_1_3),
+	PINMUX_IPSR_MSEL(IP17_15_12,	RIF3_SYNC_B,		SEL_DRIF3_1),
+	PINMUX_IPSR_MSEL(IP17_15_12,	HRX2_C,			SEL_HSCIF2_2),
+
+	PINMUX_IPSR_GPSR(IP17_19_16,	USB1_PWEN),
+	PINMUX_IPSR_MSEL(IP17_19_16,	SIM0_CLK_C,		SEL_SIMCARD_2),
+	PINMUX_IPSR_MSEL(IP17_19_16,	SSI_SCK1_A,		SEL_SSI_0),
+	PINMUX_IPSR_MSEL(IP17_19_16,	TS_SCK0_E,		SEL_TSIF0_4),
+	PINMUX_IPSR_MSEL(IP17_19_16,	STP_ISCLK_0_E,		SEL_SSP1_0_4),
+	PINMUX_IPSR_MSEL(IP17_19_16,	FMCLK_B,		SEL_FM_1),
+	PINMUX_IPSR_MSEL(IP17_19_16,	RIF2_CLK_B,		SEL_DRIF2_1),
+	PINMUX_IPSR_MSEL(IP17_19_16,	SPEEDIN_A,		SEL_SPEED_PULSE_0),
+	PINMUX_IPSR_MSEL(IP17_19_16,	HTX2_C,			SEL_HSCIF2_2),
+
+	PINMUX_IPSR_GPSR(IP17_23_20,	USB1_OVC),
+	PINMUX_IPSR_MSEL(IP17_23_20,	MSIOF1_SS2_C,		SEL_MSIOF1_2),
+	PINMUX_IPSR_MSEL(IP17_23_20,	SSI_WS1_A,		SEL_SSI_0),
+	PINMUX_IPSR_MSEL(IP17_23_20,	TS_SDAT0_E,		SEL_TSIF0_4),
+	PINMUX_IPSR_MSEL(IP17_23_20,	STP_ISD_0_E,		SEL_SSP1_0_4),
+	PINMUX_IPSR_MSEL(IP17_23_20,	FMIN_B,			SEL_FM_1),
+	PINMUX_IPSR_MSEL(IP17_23_20,	RIF2_SYNC_B,		SEL_DRIF2_1),
+	PINMUX_IPSR_MSEL(IP17_23_20,	REMOCON_B,		SEL_REMOCON_1),
+	PINMUX_IPSR_MSEL(IP17_23_20,	HCTS2_N_C,		SEL_HSCIF2_2),
+
+	PINMUX_IPSR_GPSR(IP17_27_24,	USB30_PWEN),
+	PINMUX_IPSR_GPSR(IP17_27_24,	AUDIO_CLKOUT_B),
+	PINMUX_IPSR_MSEL(IP17_27_24,	SSI_SCK2_B,		SEL_SSI_1),
+	PINMUX_IPSR_MSEL(IP17_27_24,	TS_SDEN1_D,		SEL_TSIF1_3),
+	PINMUX_IPSR_MSEL(IP17_27_24,	STP_ISEN_1_D,		SEL_SSP1_1_2),
+	PINMUX_IPSR_MSEL(IP17_27_24,	STP_OPWM_0_E,		SEL_SSP1_0_4),
+	PINMUX_IPSR_MSEL(IP17_27_24,	RIF3_D0_B,		SEL_DRIF3_1),
+	PINMUX_IPSR_MSEL(IP17_27_24,	TCLK2_B,		SEL_TIMER_TMU_1),
+	PINMUX_IPSR_GPSR(IP17_27_24,	TPU0TO0),
+	PINMUX_IPSR_MSEL(IP17_27_24,	BPFCLK_C,		SEL_FM_2),
+	PINMUX_IPSR_MSEL(IP17_27_24,	HRTS2_N_C,		SEL_HSCIF2_2),
+
+	PINMUX_IPSR_GPSR(IP17_31_28,	USB30_OVC),
+	PINMUX_IPSR_GPSR(IP17_31_28,	AUDIO_CLKOUT1_B),
+	PINMUX_IPSR_MSEL(IP17_31_28,	SSI_WS2_B,		SEL_SSI_1),
+	PINMUX_IPSR_MSEL(IP17_31_28,	TS_SPSYNC1_D,		SEL_TSIF1_3),
+	PINMUX_IPSR_MSEL(IP17_31_28,	STP_ISSYNC_1_D,		SEL_SSP1_1_3),
+	PINMUX_IPSR_MSEL(IP17_31_28,	STP_IVCXO27_0_E,	SEL_SSP1_0_4),
+	PINMUX_IPSR_MSEL(IP17_31_28,	RIF3_D1_B,		SEL_DRIF3_1),
+	PINMUX_IPSR_GPSR(IP17_31_28,	FSO_TOE_N),
+	PINMUX_IPSR_GPSR(IP17_31_28,	TPU0TO1),
+
+	/* IPSR18 */
+	PINMUX_IPSR_GPSR(IP18_3_0,	USB3_PWEN),
+	PINMUX_IPSR_GPSR(IP18_3_0,	AUDIO_CLKOUT2_B),
+	PINMUX_IPSR_MSEL(IP18_3_0,	SSI_SCK9_B,		SEL_SSI_1),
+	PINMUX_IPSR_MSEL(IP18_3_0,	TS_SDEN0_E,		SEL_TSIF0_4),
+	PINMUX_IPSR_MSEL(IP18_3_0,	STP_ISEN_0_E,		SEL_SSP1_0_4),
+	PINMUX_IPSR_MSEL(IP18_3_0,	RIF2_D0_B,		SEL_DRIF2_1),
+	PINMUX_IPSR_GPSR(IP18_3_0,	TPU0TO2),
+	PINMUX_IPSR_MSEL(IP18_3_0,	FMCLK_C,		SEL_FM_2),
+	PINMUX_IPSR_MSEL(IP18_3_0,	FMCLK_D,		SEL_FM_3),
+
+	PINMUX_IPSR_GPSR(IP18_7_4,	USB3_OVC),
+	PINMUX_IPSR_GPSR(IP18_7_4,	AUDIO_CLKOUT3_B),
+	PINMUX_IPSR_MSEL(IP18_7_4,	SSI_WS9_B,		SEL_SSI_1),
+	PINMUX_IPSR_MSEL(IP18_7_4,	TS_SPSYNC0_E,		SEL_TSIF0_4),
+	PINMUX_IPSR_MSEL(IP18_7_4,	STP_ISSYNC_0_E,		SEL_SSP1_0_4),
+	PINMUX_IPSR_MSEL(IP18_7_4,	RIF2_D1_B,		SEL_DRIF2_1),
+	PINMUX_IPSR_GPSR(IP18_7_4,	TPU0TO3),
+	PINMUX_IPSR_MSEL(IP18_7_4,	FMIN_C,			SEL_FM_2),
+	PINMUX_IPSR_MSEL(IP18_7_4,	FMIN_D,			SEL_FM_3),
 
-static const char * const ssi_groups[] = {
-	"ssi0_data",
-	"ssi01239_ctrl",
-	"ssi1_data_a",
-	"ssi1_data_b",
-	"ssi1_ctrl_a",
-	"ssi1_ctrl_b",
-	"ssi2_data_a",
-	"ssi2_data_b",
-	"ssi2_ctrl_a",
-	"ssi2_ctrl_b",
-	"ssi3_data",
-	"ssi34_ctrl",
-	"ssi4_data",
-	"ssi4_ctrl",
-	"ssi5_data",
-	"ssi5_ctrl",
-	"ssi6_data",
-	"ssi6_ctrl",
-	"ssi7_data",
-	"ssi78_ctrl",
-	"ssi8_data",
-	"ssi9_data_a",
-	"ssi9_data_b",
-	"ssi9_ctrl_a",
-	"ssi9_ctrl_b",
+/*
+ * Static pins can not be muxed between different functions but
+ * still needs a mark entry in the pinmux list. Add each static
+ * pin to the list without an associated function. The sh-pfc
+ * core will do the right thing and skip trying to mux then pin
+ * while still applying configuration to it
+ */
+#define FM(x)	PINMUX_DATA(x##_MARK, 0),
+	PINMUX_STATIC
+#undef FM
 };
 
-static const char * const usb0_groups[] = {
-	"usb0",
-};
+/*
+ * R8A7795 has 8 banks with 32 PGIOS in each => 256 GPIOs.
+ * Physical layout rows: A - AW, cols: 1 - 39.
+ */
+#define ROW_GROUP_A(r) ('Z' - 'A' + 1 + (r))
+#define PIN_NUMBER(r, c) (((r) - 'A') * 39 + (c) + 300)
+#define PIN_A_NUMBER(r, c) PIN_NUMBER(ROW_GROUP_A(r), c)
+
+static const struct sh_pfc_pin pinmux_pins[] = {
+	PINMUX_GPIO_GP_ALL(),
 
-static const char * const usb1_groups[] = {
-	"usb1",
+	/*
+	 * Pins not associated with a GPIO port.
+	 *
+	 * The pin positions are different between different r8a7795
+	 * packages, all that is needed for the pfc driver is a unique
+	 * number for each pin. To this end use the pin layout from
+	 * R-Car H3SiP to calculate a unique number for each pin.
+	 */
+	SH_PFC_PIN_NAMED_CFG('A',  8, AVB_TX_CTL, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('A',  9, AVB_MDIO, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('A', 12, AVB_TXCREFCLK, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('A', 13, AVB_RD0, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('A', 14, AVB_RD2, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('A', 16, AVB_RX_CTL, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('A', 17, AVB_TD2, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('A', 18, AVB_TD0, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('A', 19, AVB_TXC, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('B', 13, AVB_RD1, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('B', 14, AVB_RD3, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('B', 17, AVB_TD3, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('B', 18, AVB_TD1, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('B', 19, AVB_RXC, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('C',  1, PRESETOUT#, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('F',  1, CLKOUT, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('H', 37, MLB_REF, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('V',  3, QSPI1_SPCLK, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('V',  5, QSPI1_SSL, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('V',  6, RPC_WP#, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('V',  7, RPC_RESET#, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('W',  3, QSPI0_SPCLK, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('Y',  3, QSPI0_SSL, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('Y',  6, QSPI0_IO2, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('Y',  7, RPC_INT#, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('B'),  4, QSPI0_MISO_IO1, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('B'),  6, QSPI0_IO3, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  3, QSPI1_IO3, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  5, QSPI0_MOSI_IO0, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  7, QSPI1_MOSI_IO0, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 38, FSCLKST#, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 39, EXTALR, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  4, QSPI1_IO2, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  5, QSPI1_MISO_IO1, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  7, DU_DOTCLKIN0, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  8, DU_DOTCLKIN1, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  7, DU_DOTCLKIN2, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  8, DU_DOTCLKIN3, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 26, TRST#, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 29, TDI, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 30, TMS, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 27, TCK, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 28, TDO, SH_PFC_PIN_CFG_DRIVE_STRENGTH),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 30, ASEBRK, CFG_FLAGS),
 };
 
-static const char * const usb2_groups[] = {
-	"usb2",
+static const struct sh_pfc_pin_group pinmux_groups[] = {
 };
 
 static const struct sh_pfc_function pinmux_functions[] = {
-	SH_PFC_FUNCTION(audio_clk),
-	SH_PFC_FUNCTION(avb),
-	SH_PFC_FUNCTION(can0),
-	SH_PFC_FUNCTION(can1),
-	SH_PFC_FUNCTION(can_clk),
-	SH_PFC_FUNCTION(canfd0),
-	SH_PFC_FUNCTION(canfd1),
-	SH_PFC_FUNCTION(drif0),
-	SH_PFC_FUNCTION(drif1),
-	SH_PFC_FUNCTION(drif2),
-	SH_PFC_FUNCTION(drif3),
-	SH_PFC_FUNCTION(du),
-	SH_PFC_FUNCTION(hscif0),
-	SH_PFC_FUNCTION(hscif1),
-	SH_PFC_FUNCTION(hscif2),
-	SH_PFC_FUNCTION(hscif3),
-	SH_PFC_FUNCTION(hscif4),
-	SH_PFC_FUNCTION(i2c1),
-	SH_PFC_FUNCTION(i2c2),
-	SH_PFC_FUNCTION(i2c6),
-	SH_PFC_FUNCTION(intc_ex),
-	SH_PFC_FUNCTION(msiof0),
-	SH_PFC_FUNCTION(msiof1),
-	SH_PFC_FUNCTION(msiof2),
-	SH_PFC_FUNCTION(msiof3),
-	SH_PFC_FUNCTION(pwm0),
-	SH_PFC_FUNCTION(pwm1),
-	SH_PFC_FUNCTION(pwm2),
-	SH_PFC_FUNCTION(pwm3),
-	SH_PFC_FUNCTION(pwm4),
-	SH_PFC_FUNCTION(pwm5),
-	SH_PFC_FUNCTION(pwm6),
-	SH_PFC_FUNCTION(qspi0),
-	SH_PFC_FUNCTION(qspi1),
-	SH_PFC_FUNCTION(sata0),
-	SH_PFC_FUNCTION(scif0),
-	SH_PFC_FUNCTION(scif1),
-	SH_PFC_FUNCTION(scif2),
-	SH_PFC_FUNCTION(scif3),
-	SH_PFC_FUNCTION(scif4),
-	SH_PFC_FUNCTION(scif5),
-	SH_PFC_FUNCTION(scif_clk),
-	SH_PFC_FUNCTION(sdhi0),
-	SH_PFC_FUNCTION(sdhi1),
-	SH_PFC_FUNCTION(sdhi2),
-	SH_PFC_FUNCTION(sdhi3),
-	SH_PFC_FUNCTION(ssi),
-	SH_PFC_FUNCTION(usb0),
-	SH_PFC_FUNCTION(usb1),
-	SH_PFC_FUNCTION(usb2),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
@@ -5041,46 +2033,54 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		IP16_3_0 }
 	},
 	{ PINMUX_CFG_REG("IPSR17", 0xe6060244, 32, 4) {
-		/* IP17_31_28 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP17_27_24 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP17_23_20 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP17_19_16 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP17_15_12 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP17_11_8  */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+		IP17_31_28
+		IP17_27_24
+		IP17_23_20
+		IP17_19_16
+		IP17_15_12
+		IP17_11_8
 		IP17_7_4
 		IP17_3_0 }
 	},
+	{ PINMUX_CFG_REG("IPSR18", 0xe6060248, 32, 4) {
+		/* IP18_31_28 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+		/* IP18_27_24 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+		/* IP18_23_20 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+		/* IP18_19_16 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+		/* IP18_15_12 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+		/* IP18_11_8  */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+		IP18_7_4
+		IP18_3_0 }
+	},
 #undef F_
 #undef FM
 
 #define F_(x, y)	x,
 #define FM(x)		FN_##x,
 	{ PINMUX_CFG_REG_VAR("MOD_SEL0", 0xe6060500, 32,
-			     1, 2, 2, 3, 1, 1, 2, 1, 1, 1,
-			     2, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 2, 1) {
-		0, 0, /* RESERVED 31 */
-		MOD_SEL0_30_29
+			     3, 2, 3, 1, 1, 1, 1, 1, 2, 1,
+			     1, 2, 1, 1, 1, 2, 2, 1, 2, 3) {
+		MOD_SEL0_31_30_29
 		MOD_SEL0_28_27
 		MOD_SEL0_26_25_24
 		MOD_SEL0_23
 		MOD_SEL0_22
-		MOD_SEL0_21_20
+		MOD_SEL0_21
+		MOD_SEL0_20
 		MOD_SEL0_19
-		MOD_SEL0_18
-		MOD_SEL0_17
-		MOD_SEL0_16_15
-		MOD_SEL0_14
-		MOD_SEL0_13
+		MOD_SEL0_18_17
+		MOD_SEL0_16
+		0, 0, /* RESERVED 15 */
+		MOD_SEL0_14_13
 		MOD_SEL0_12
 		MOD_SEL0_11
 		MOD_SEL0_10
-		MOD_SEL0_9
-		MOD_SEL0_8
+		MOD_SEL0_9_8
 		MOD_SEL0_7_6
-		MOD_SEL0_5_4
-		MOD_SEL0_3
-		MOD_SEL0_2_1
-		0, 0, /* RESERVED 0 */ }
+		MOD_SEL0_5
+		MOD_SEL0_4_3
+		/* RESERVED 2, 1, 0 */
+		0, 0, 0, 0, 0, 0, 0, 0 }
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL1", 0xe6060504, 32,
 			     2, 3, 1, 2, 3, 1, 1, 2, 1,
@@ -5110,22 +2110,22 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL1_0 }
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL2", 0xe6060508, 32,
-			     1, 1, 1, 1, 4, 4, 4,
-			     4, 4, 4, 1, 2, 1) {
+			     1, 1, 1, 2, 1, 3, 1, 1, 1, 1, 1, 1, 1,
+			     4, 4, 4, 3, 1) {
 		MOD_SEL2_31
 		MOD_SEL2_30
 		MOD_SEL2_29
-		/* RESERVED 28 */
+		MOD_SEL2_28_27
+		MOD_SEL2_26
+		MOD_SEL2_25_24_23
+		MOD_SEL2_22
+		MOD_SEL2_21
+		MOD_SEL2_20
+		MOD_SEL2_19
+		MOD_SEL2_18
+		MOD_SEL2_17
+		/* RESERVED 16 */
 		0, 0,
-		/* RESERVED 27, 26, 25, 24 */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		/* RESERVED 23, 22, 21, 20 */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		/* RESERVED 19, 18, 17, 16 */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
 		/* RESERVED 15, 14, 13, 12 */
 		0, 0, 0, 0, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0,
@@ -5135,10 +2135,8 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		/* RESERVED 7, 6, 5, 4 */
 		0, 0, 0, 0, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0,
-		/* RESERVED 3 */
-		0, 0,
-		/* RESERVED 2, 1 */
-		0, 0, 0, 0,
+		/* RESERVED 3, 2, 1 */
+		0, 0, 0, 0, 0, 0, 0, 0,
 		MOD_SEL2_0 }
 	},
 	{ },
@@ -5387,8 +2385,8 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 		{ RCAR_GP_PIN(6, 27), 20, 3 },	/* USB1_OVC */
 		{ RCAR_GP_PIN(6, 28), 16, 3 },	/* USB30_PWEN */
 		{ RCAR_GP_PIN(6, 29), 12, 3 },	/* USB30_OVC */
-		{ RCAR_GP_PIN(6, 30),  8, 3 },	/* USB31_PWEN */
-		{ RCAR_GP_PIN(6, 31),  4, 3 },	/* USB31_OVC */
+		{ RCAR_GP_PIN(6, 30),  8, 3 },	/* USB3_PWEN */
+		{ RCAR_GP_PIN(6, 31),  4, 3 },	/* USB3_OVC */
 	} },
 	{ },
 };
@@ -5618,8 +2616,8 @@ static const struct sh_pfc_bias_info bias_info[] = {
 	{ RCAR_GP_PIN(5, 21),    PU5,  1 },	/* MSIOF0_SS2 */
 	{ RCAR_GP_PIN(5, 20),    PU5,  0 },	/* MSIOF0_TXD */
 
-	{ RCAR_GP_PIN(6, 31),    PU6,  6 },	/* USB31_OVC */
-	{ RCAR_GP_PIN(6, 30),    PU6,  5 },	/* USB31_PWEN */
+	{ RCAR_GP_PIN(6, 31),    PU6,  6 },	/* USB3_OVC */
+	{ RCAR_GP_PIN(6, 30),    PU6,  5 },	/* USB3_PWEN */
 	{ RCAR_GP_PIN(6, 29),    PU6,  4 },	/* USB30_OVC */
 	{ RCAR_GP_PIN(6, 28),    PU6,  3 },	/* USB30_PWEN */
 	{ RCAR_GP_PIN(6, 27),    PU6,  2 },	/* USB1_OVC */
@@ -5676,14 +2674,28 @@ static void r8a7795_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
 	sh_pfc_write_reg(pfc, PUEN + reg, 32, enable);
 }
 
+static const struct soc_device_attribute r8a7795es1[] = {
+	{ .soc_id = "r8a7795", .revision = "ES1.*" },
+	{ /* sentinel */ }
+};
+
+static int r8a7795_pinmux_init(struct sh_pfc *pfc)
+{
+	if (soc_device_match(r8a7795es1))
+		pfc->info = &r8a7795es1_pinmux_info;
+
+	return 0;
+}
+
 static const struct sh_pfc_soc_operations r8a7795_pinmux_ops = {
+	.init = r8a7795_pinmux_init,
 	.pin_to_pocctrl = r8a7795_pin_to_pocctrl,
 	.get_bias = r8a7795_pinmux_get_bias,
 	.set_bias = r8a7795_pinmux_set_bias,
 };
 
 const struct sh_pfc_soc_info r8a7795_pinmux_info = {
-	.name = "r8a77950_pfc",
+	.name = "r8a77951_pfc",
 	.ops = &r8a7795_pinmux_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795es1.c
similarity index 99%
copy from drivers/pinctrl/sh-pfc/pfc-r8a7795.c
copy to drivers/pinctrl/sh-pfc/pfc-r8a7795es1.c
index 3d1c32cca16a0398..081efda9a2806f30 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795es1.c
@@ -1,5 +1,5 @@
 /*
- * R8A7795 processor support - PFC hardware block.
+ * R8A7795 ES1.x processor support - PFC hardware block.
  *
  * Copyright (C) 2015  Renesas Electronics Corporation
  *
@@ -5393,7 +5393,8 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 	{ },
 };
 
-static int r8a7795_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
+static int r8a7795es1_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
+				     u32 *pocctrl)
 {
 	int bit = -EINVAL;
 
@@ -5627,8 +5628,8 @@ static const struct sh_pfc_bias_info bias_info[] = {
 	{ RCAR_GP_PIN(6, 25),    PU6,  0 },	/* USB0_OVC */
 };
 
-static unsigned int r8a7795_pinmux_get_bias(struct sh_pfc *pfc,
-					    unsigned int pin)
+static unsigned int r8a7795es1_pinmux_get_bias(struct sh_pfc *pfc,
+					       unsigned int pin)
 {
 	const struct sh_pfc_bias_info *info;
 	u32 reg;
@@ -5649,8 +5650,8 @@ static unsigned int r8a7795_pinmux_get_bias(struct sh_pfc *pfc,
 		return PIN_CONFIG_BIAS_PULL_DOWN;
 }
 
-static void r8a7795_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
-				   unsigned int bias)
+static void r8a7795es1_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
+				       unsigned int bias)
 {
 	const struct sh_pfc_bias_info *info;
 	u32 enable, updown;
@@ -5676,15 +5677,15 @@ static void r8a7795_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
 	sh_pfc_write_reg(pfc, PUEN + reg, 32, enable);
 }
 
-static const struct sh_pfc_soc_operations r8a7795_pinmux_ops = {
-	.pin_to_pocctrl = r8a7795_pin_to_pocctrl,
-	.get_bias = r8a7795_pinmux_get_bias,
-	.set_bias = r8a7795_pinmux_set_bias,
+static const struct sh_pfc_soc_operations r8a7795es1_pinmux_ops = {
+	.pin_to_pocctrl = r8a7795es1_pin_to_pocctrl,
+	.get_bias = r8a7795es1_pinmux_get_bias,
+	.set_bias = r8a7795es1_pinmux_set_bias,
 };
 
-const struct sh_pfc_soc_info r8a7795_pinmux_info = {
+const struct sh_pfc_soc_info r8a7795es1_pinmux_info = {
 	.name = "r8a77950_pfc",
-	.ops = &r8a7795_pinmux_ops,
+	.ops = &r8a7795es1_pinmux_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index e42cc7a8d10ee75c..f31eb6c1e87df8b8 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -267,6 +267,7 @@ extern const struct sh_pfc_soc_info r8a7792_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7793_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7794_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7795_pinmux_info;
+extern const struct sh_pfc_soc_info r8a7795es1_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7796_pinmux_info;
 extern const struct sh_pfc_soc_info sh7203_pinmux_info;
 extern const struct sh_pfc_soc_info sh7264_pinmux_info;
-- 
2.7.4

