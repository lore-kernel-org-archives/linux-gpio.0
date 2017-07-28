From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH 5/9] pinctrl: sh-pfc: r8a7795: Fix NFDATA{0..13} and NF{ALE,CLE,WE_N,RE_N} pin function definitions
Date: Fri, 28 Jul 2017 20:41:17 +0900
Message-ID: <1501242081-3805-6-git-send-email-ykaneko0929@gmail.com>
References: <1501242081-3805-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1501242081-3805-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch fixes the implementation incorrect of IPSR register value
definitions for NFDATA{0..13} and NF{ALE,CLE,WE_N,RE_N} pins function.

This is a correction to the incorrect implementation of IPSR register pin
assignment of the specifications updated for R8A7795 ES2.0 SoC in R-Car
Gen3 Hardware User's Manual Rev.0.53E.

Fixes: 12f5d9a1dc7f ("pinctrl: sh-pfc: r8a7795: Replace for Renesas R8A7795 ES2.0 SoC")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 3272713..945d123 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -285,24 +285,24 @@
 #define IP8_23_20	FM(SD1_DAT1)		FM(SD2_DAT5)	FM(MSIOF1_TXD_G)	FM(NFDATA14_B)			F_(0, 0)	FM(TS_SPSYNC1_B)FM(STP_ISSYNC_1_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP8_27_24	FM(SD1_DAT2)		FM(SD2_DAT6)	FM(MSIOF1_SS1_G)	FM(NFDATA15_B)			F_(0, 0)	FM(TS_SDAT1_B)	FM(STP_ISD_1_B)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP8_31_28	FM(SD1_DAT3)		FM(SD2_DAT7)	FM(MSIOF1_SS2_G)	FM(NFRB_N_B)			F_(0, 0)	FM(TS_SDEN1_B)	FM(STP_ISEN_1_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP9_3_0		FM(SD2_CLK)		F_(0, 0)	F_(0, 0)		FM(NFDATA8)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP9_7_4		FM(SD2_CMD)		F_(0, 0)	F_(0, 0)		FM(NFDATA9)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP9_11_8	FM(SD2_DAT0)		F_(0, 0)	F_(0, 0)		FM(NFDATA10)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP9_15_12	FM(SD2_DAT1)		F_(0, 0)	F_(0, 0)		FM(NFDATA11)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP9_19_16	FM(SD2_DAT2)		F_(0, 0)	F_(0, 0)		FM(NFDATA12)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP9_23_20	FM(SD2_DAT3)		F_(0, 0)	F_(0, 0)		FM(NFDATA13)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP9_27_24	FM(SD2_DS)		F_(0, 0)	F_(0, 0)		FM(NFALE)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	FM(SATA_DEVSLP_B)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP9_31_28	FM(SD3_CLK)		F_(0, 0)	F_(0, 0)		FM(NFWE_N)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP10_3_0	FM(SD3_CMD)		F_(0, 0)	F_(0, 0)		FM(NFRE_N)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP10_7_4	FM(SD3_DAT0)		F_(0, 0)	F_(0, 0)		FM(NFDATA0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP10_11_8	FM(SD3_DAT1)		F_(0, 0)	F_(0, 0)		FM(NFDATA1)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP10_15_12	FM(SD3_DAT2)		F_(0, 0)	F_(0, 0)		FM(NFDATA2)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP10_19_16	FM(SD3_DAT3)		F_(0, 0)	F_(0, 0)		FM(NFDATA3)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP10_23_20	FM(SD3_DAT4)		FM(SD2_CD_A)	F_(0, 0)		FM(NFDATA4)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP10_27_24	FM(SD3_DAT5)		FM(SD2_WP_A)	F_(0, 0)		FM(NFDATA5)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP10_31_28	FM(SD3_DAT6)		FM(SD3_CD)	F_(0, 0)		FM(NFDATA6)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP11_3_0	FM(SD3_DAT7)		FM(SD3_WP)	F_(0, 0)		FM(NFDATA7)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP11_7_4	FM(SD3_DS)		F_(0, 0)	F_(0, 0)		FM(NFCLE)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP9_3_0		FM(SD2_CLK)		F_(0, 0)	FM(NFDATA8)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP9_7_4		FM(SD2_CMD)		F_(0, 0)	FM(NFDATA9)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP9_11_8	FM(SD2_DAT0)		F_(0, 0)	FM(NFDATA10)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP9_15_12	FM(SD2_DAT1)		F_(0, 0)	FM(NFDATA11)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP9_19_16	FM(SD2_DAT2)		F_(0, 0)	FM(NFDATA12)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP9_23_20	FM(SD2_DAT3)		F_(0, 0)	FM(NFDATA13)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP9_27_24	FM(SD2_DS)		F_(0, 0)	FM(NFALE)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	FM(SATA_DEVSLP_B)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP9_31_28	FM(SD3_CLK)		F_(0, 0)	FM(NFWE_N)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP10_3_0	FM(SD3_CMD)		F_(0, 0)	FM(NFRE_N)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP10_7_4	FM(SD3_DAT0)		F_(0, 0)	FM(NFDATA0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP10_11_8	FM(SD3_DAT1)		F_(0, 0)	FM(NFDATA1)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP10_15_12	FM(SD3_DAT2)		F_(0, 0)	FM(NFDATA2)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP10_19_16	FM(SD3_DAT3)		F_(0, 0)	FM(NFDATA3)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP10_23_20	FM(SD3_DAT4)		FM(SD2_CD_A)	FM(NFDATA4)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP10_27_24	FM(SD3_DAT5)		FM(SD2_WP_A)	FM(NFDATA5)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP10_31_28	FM(SD3_DAT6)		FM(SD3_CD)	FM(NFDATA6)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP11_3_0	FM(SD3_DAT7)		FM(SD3_WP)	FM(NFDATA7)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP11_7_4	FM(SD3_DS)		F_(0, 0)	FM(NFCLE)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP11_11_8	FM(SD0_CD)		F_(0, 0)	FM(NFDATA14_A)		F_(0, 0)			FM(SCL2_B)	FM(SIM0_RST_A)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IPSRx */		/* 0 */			/* 1 */		/* 2 */			/* 3 */				/* 4 */		/* 5 */		/* 6 */			/* 7 */		/* 8 */			/* 9 */		/* A */		/* B */		/* C - F */
-- 
1.9.1
