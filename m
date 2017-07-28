From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH 1/9] pinctrl: sh-pfc: r8a7795: Fix MOD_SEL1 bit[25:24] to 0x3 when using STP_ISEN_1_D
Date: Fri, 28 Jul 2017 20:41:13 +0900
Message-ID: <1501242081-3805-2-git-send-email-ykaneko0929@gmail.com>
References: <1501242081-3805-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1501242081-3805-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch fixes the implementation incorrect of MOD_SEL1 bit[25:24]
value when STP_ISEN_1_D pin function is selected for IPSR17 bit[27:24].

This is a correction to the incorrect implementation of MOD_SEL register
pin assignment for R8A7795 SoC specification of R-Car Gen3 Hardware
User's Manual Rev.0.51E or later.

Fixes: 0b0ffc96dbe3 ("pinctrl: sh-pfc: Initial R8A7795 PFC support)
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 1656295..73507bf 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1460,7 +1460,7 @@ enum {
 	PINMUX_IPSR_GPSR(IP17_27_24,	AUDIO_CLKOUT_B),
 	PINMUX_IPSR_MSEL(IP17_27_24,	SSI_SCK2_B,		SEL_SSI_1),
 	PINMUX_IPSR_MSEL(IP17_27_24,	TS_SDEN1_D,		SEL_TSIF1_3),
-	PINMUX_IPSR_MSEL(IP17_27_24,	STP_ISEN_1_D,		SEL_SSP1_1_2),
+	PINMUX_IPSR_MSEL(IP17_27_24,	STP_ISEN_1_D,		SEL_SSP1_1_3),
 	PINMUX_IPSR_MSEL(IP17_27_24,	STP_OPWM_0_E,		SEL_SSP1_0_4),
 	PINMUX_IPSR_MSEL(IP17_27_24,	RIF3_D0_B,		SEL_DRIF3_1),
 	PINMUX_IPSR_MSEL(IP17_27_24,	TCLK2_B,		SEL_TIMER_TMU_1),
-- 
1.9.1
