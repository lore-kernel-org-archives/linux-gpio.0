From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH 2/9] pinctrl: sh-pfc: r8a7795: Fix MOD_SEL2 bit26 to 0x0 when using SCK5_A
Date: Fri, 28 Jul 2017 20:41:14 +0900
Message-ID: <1501242081-3805-3-git-send-email-ykaneko0929@gmail.com>
References: <1501242081-3805-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:36613 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751678AbdG1Llf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jul 2017 07:41:35 -0400
In-Reply-To: <1501242081-3805-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch fixes the implementation incorrect of MOD_SEL2 bit26 value
when SCK5_A pin function is selected for IPSR16 bit[31:28].

This is a correction to the incorrect implementation of MOD_SEL register
pin assignment for R8A7795 ES2.0 SoC specification of R-Car Gen3 Hardware
User's Manual Rev.0.51E or later.

Fixes: 12f5d9a1dc7f ("pinctrl: sh-pfc: r8a7795: Replace for Renesas R8A7795 ES2.0 SoC")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 73507bf..cd433fb 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1409,7 +1409,7 @@ enum {
 	PINMUX_IPSR_MSEL(IP16_31_28,	SSI_WS1_B,		SEL_SSI_1),
 	PINMUX_IPSR_GPSR(IP16_31_28,	SCK1),
 	PINMUX_IPSR_MSEL(IP16_31_28,	STP_IVCXO27_1_A,	SEL_SSP1_1_0),
-	PINMUX_IPSR_GPSR(IP16_31_28,	SCK5_A),
+	PINMUX_IPSR_MSEL(IP16_31_28,	SCK5_A,			SEL_SCIF5_0),
 
 	/* IPSR17 */
 	PINMUX_IPSR_MSEL(IP17_3_0,	AUDIO_CLKA_A,		SEL_ADG_A_0),
-- 
1.9.1

