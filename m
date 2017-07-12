From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH 09/14] pinctrl: sh-pfc: r8a7796: Fix MOD_SEL register pin assignment for TCLK{1,2}_{A,B} pins group
Date: Thu, 13 Jul 2017 01:55:42 +0900
Message-ID: <1499878547-3452-10-git-send-email-ykaneko0929@gmail.com>
References: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch fixes to set MOD_SEL2 bit19 when using TCLK2_A pin function is
selected for IPSR16 bit[23:20] or using TCLK2_B pin function is selected
for IPSR17 bit[27:24].

This is a correction to the incorrect implementation of MOD_SEL register
pin assignment for R8A7796 SoC specification of R-Car Gen3 Hardware
User's Manual Rev.0.51E or later.

Fixes: f9aece7344bd ("pinctrl: sh-pfc: Initial R8A7796 PFC support")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 866cbe4..84f8f78 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -1393,7 +1393,7 @@ enum {
 	PINMUX_IPSR_MSEL(IP16_23_20,	STP_ISEN_1_A,		SEL_SSP1_1_0),
 	PINMUX_IPSR_MSEL(IP16_23_20,	RIF1_D0_A,		SEL_DRIF1_0),
 	PINMUX_IPSR_MSEL(IP16_23_20,	RIF3_D0_A,		SEL_DRIF3_0),
-	PINMUX_IPSR_MSEL(IP16_23_20,	TCLK2_A,		SEL_TIMER_TMU_0),
+	PINMUX_IPSR_MSEL(IP16_23_20,	TCLK2_A,		SEL_TIMER_TMU2_0),
 
 	PINMUX_IPSR_GPSR(IP16_27_24,	SSI_SDATA8),
 	PINMUX_IPSR_MSEL(IP16_27_24,	HRTS2_N_B,		SEL_HSCIF2_1),
@@ -1464,7 +1464,7 @@ enum {
 	PINMUX_IPSR_MSEL(IP17_27_24,	STP_ISEN_1_D,		SEL_SSP1_1_3),
 	PINMUX_IPSR_MSEL(IP17_27_24,	STP_OPWM_0_E,		SEL_SSP1_0_4),
 	PINMUX_IPSR_MSEL(IP17_27_24,	RIF3_D0_B,		SEL_DRIF3_1),
-	PINMUX_IPSR_MSEL(IP17_27_24,	TCLK2_B,		SEL_TIMER_TMU_1),
+	PINMUX_IPSR_MSEL(IP17_27_24,	TCLK2_B,		SEL_TIMER_TMU2_1),
 	PINMUX_IPSR_GPSR(IP17_27_24,	TPU0TO0),
 	PINMUX_IPSR_MSEL(IP17_27_24,	BPFCLK_C,		SEL_FM_2),
 	PINMUX_IPSR_MSEL(IP17_27_24,	HRTS2_N_C,		SEL_HSCIF2_2),
-- 
1.9.1
