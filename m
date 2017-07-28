From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH 3/9] pinctrl: sh-pfc: r8a7795: Fix SCIF_CLK_{A,B} pin's MOD_SEL assignment to MOD_SEL1 bit10
Date: Fri, 28 Jul 2017 20:41:15 +0900
Message-ID: <1501242081-3805-4-git-send-email-ykaneko0929@gmail.com>
References: <1501242081-3805-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35009 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751716AbdG1Llh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jul 2017 07:41:37 -0400
In-Reply-To: <1501242081-3805-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch fixes SCIF_CLK_{A,B} pin's MOD_SEL assignment from MOD_SEL1
bit11 to MOD_SEL1 bit10.

This is a correction to the incorrect implementation of IPSR register
pin assignment for R8A7795 ES2.0 SoC specification of R-Car Gen3 Hardware
User's Manual Rev.0.53E or later.

Fixes: 12f5d9a1dc7f ("pinctrl: sh-pfc: r8a7795: Replace for Renesas R8A7795 ES2.0 SoC")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index cd433fb..37b96b9 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -480,7 +480,7 @@
 #define MOD_SEL1_13		FM(SEL_SCIF3_0)		FM(SEL_SCIF3_1)
 #define MOD_SEL1_12		FM(SEL_SCIF2_0)		FM(SEL_SCIF2_1)
 #define MOD_SEL1_11		FM(SEL_SCIF1_0)		FM(SEL_SCIF1_1)
-#define MOD_SEL1_10		FM(SEL_SATA_0)		FM(SEL_SATA_1)
+#define MOD_SEL1_10		FM(SEL_SCIF_0)		FM(SEL_SCIF_1)
 #define MOD_SEL1_9		FM(SEL_REMOCON_0)	FM(SEL_REMOCON_1)
 #define MOD_SEL1_6		FM(SEL_RCAN0_0)		FM(SEL_RCAN0_1)
 #define MOD_SEL1_5		FM(SEL_PWM6_0)		FM(SEL_PWM6_1)
@@ -1201,7 +1201,7 @@ enum {
 	PINMUX_IPSR_GPSR(IP12_27_24,	ADICHS0),
 
 	PINMUX_IPSR_GPSR(IP12_31_28,	SCK2),
-	PINMUX_IPSR_MSEL(IP12_31_28,	SCIF_CLK_B,		SEL_SCIF1_1),
+	PINMUX_IPSR_MSEL(IP12_31_28,	SCIF_CLK_B,		SEL_SCIF_1),
 	PINMUX_IPSR_MSEL(IP12_31_28,	MSIOF1_SCK_B,		SEL_MSIOF1_1),
 	PINMUX_IPSR_MSEL(IP12_31_28,	TS_SCK1_C,		SEL_TSIF1_2),
 	PINMUX_IPSR_MSEL(IP12_31_28,	STP_ISCLK_1_C,		SEL_SSP1_1_2),
@@ -1416,7 +1416,7 @@ enum {
 	PINMUX_IPSR_GPSR(IP17_3_0,	CC5_OSCOUT),
 
 	PINMUX_IPSR_MSEL(IP17_7_4,	AUDIO_CLKB_B,		SEL_ADG_B_1),
-	PINMUX_IPSR_MSEL(IP17_7_4,	SCIF_CLK_A,		SEL_SCIF1_0),
+	PINMUX_IPSR_MSEL(IP17_7_4,	SCIF_CLK_A,		SEL_SCIF_0),
 	PINMUX_IPSR_MSEL(IP17_7_4,	STP_IVCXO27_1_D,	SEL_SSP1_1_3),
 	PINMUX_IPSR_MSEL(IP17_7_4,	REMOCON_A,		SEL_REMOCON_0),
 	PINMUX_IPSR_MSEL(IP17_7_4,	TCLK1_A,		SEL_TIMER_TMU_0),
-- 
1.9.1

