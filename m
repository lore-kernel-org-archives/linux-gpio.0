From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH 10/14] pinctrl: sh-pfc: r8a7796: Fix to delete FSCLKST pin and IPSR7 bit[15:12] register definitions
Date: Thu, 13 Jul 2017 01:55:43 +0900
Message-ID: <1499878547-3452-11-git-send-email-ykaneko0929@gmail.com>
References: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch fixes the macro definitions of FSCLKST pins function and IPSR7
bit[15:12] register deleted.

This is a correction because IPSR register specification for R8A7796 SoC
was changed in R-Car Gen3 Hardware User's Manual Rev.0.53E or later.

Fixes: f9aece7344bd ("pinctrl: sh-pfc: Initial R8A7796 PFC support")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 84f8f78..cec3a8a 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -278,7 +278,6 @@
 #define IP7_3_0		FM(D13)			FM(LCDOUT5)	FM(MSIOF2_SS2_D)	FM(TX4_C)			FM(VI4_DATA5_A)	F_(0, 0)	FM(DU_DR5)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_7_4		FM(D14)			FM(LCDOUT6)	FM(MSIOF3_SS1_A)	FM(HRX3_C)			FM(VI4_DATA6_A)	F_(0, 0)	FM(DU_DR6)		FM(SCL6_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_11_8	FM(D15)			FM(LCDOUT7)	FM(MSIOF3_SS2_A)	FM(HTX3_C)			FM(VI4_DATA7_A)	F_(0, 0)	FM(DU_DR7)		FM(SDA6_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP7_15_12	FM(FSCLKST)		F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_19_16	FM(SD0_CLK)		F_(0, 0)	FM(MSIOF1_SCK_E)	F_(0, 0)			F_(0, 0)	F_(0, 0)	FM(STP_OPWM_0_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_23_20	FM(SD0_CMD)		F_(0, 0)	FM(MSIOF1_SYNC_E)	F_(0, 0)			F_(0, 0)	F_(0, 0)	FM(STP_IVCXO27_0_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_27_24	FM(SD0_DAT0)		F_(0, 0)	FM(MSIOF1_RXD_E)	F_(0, 0)			F_(0, 0)	FM(TS_SCK0_B)	FM(STP_ISCLK_0_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -419,7 +418,7 @@
 FM(IP4_3_0)	IP4_3_0		FM(IP5_3_0)	IP5_3_0		FM(IP6_3_0)	IP6_3_0		FM(IP7_3_0)	IP7_3_0 \
 FM(IP4_7_4)	IP4_7_4		FM(IP5_7_4)	IP5_7_4		FM(IP6_7_4)	IP6_7_4		FM(IP7_7_4)	IP7_7_4 \
 FM(IP4_11_8)	IP4_11_8	FM(IP5_11_8)	IP5_11_8	FM(IP6_11_8)	IP6_11_8	FM(IP7_11_8)	IP7_11_8 \
-FM(IP4_15_12)	IP4_15_12	FM(IP5_15_12)	IP5_15_12	FM(IP6_15_12)	IP6_15_12	FM(IP7_15_12)	IP7_15_12 \
+FM(IP4_15_12)	IP4_15_12	FM(IP5_15_12)	IP5_15_12	FM(IP6_15_12)	IP6_15_12 \
 FM(IP4_19_16)	IP4_19_16	FM(IP5_19_16)	IP5_19_16	FM(IP6_19_16)	IP6_19_16	FM(IP7_19_16)	IP7_19_16 \
 FM(IP4_23_20)	IP4_23_20	FM(IP5_23_20)	IP5_23_20	FM(IP6_23_20)	IP6_23_20	FM(IP7_23_20)	IP7_23_20 \
 FM(IP4_27_24)	IP4_27_24	FM(IP5_27_24)	IP5_27_24	FM(IP6_27_24)	IP6_27_24	FM(IP7_27_24)	IP7_27_24 \
@@ -990,8 +989,6 @@ enum {
 	PINMUX_IPSR_GPSR(IP7_11_8,	DU_DR7),
 	PINMUX_IPSR_MSEL(IP7_11_8,	SDA6_C,			SEL_I2C6_2),
 
-	PINMUX_IPSR_GPSR(IP7_15_12,	FSCLKST),
-
 	PINMUX_IPSR_GPSR(IP7_19_16,	SD0_CLK),
 	PINMUX_IPSR_MSEL(IP7_19_16,	MSIOF1_SCK_E,		SEL_MSIOF1_4),
 	PINMUX_IPSR_MSEL(IP7_19_16,	STP_OPWM_0_B,		SEL_SSP1_0_1),
@@ -4927,7 +4924,7 @@ enum {
 		IP7_27_24
 		IP7_23_20
 		IP7_19_16
-		IP7_15_12
+		/* IP7_15_12 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 		IP7_11_8
 		IP7_7_4
 		IP7_3_0 }
-- 
1.9.1
