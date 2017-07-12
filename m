From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH 03/14] pinctrl: sh-pfc: r8a7796: Fix MOD_SEL2 bit26 to 0x0 when using SCK5_A
Date: Thu, 13 Jul 2017 01:55:36 +0900
Message-ID: <1499878547-3452-4-git-send-email-ykaneko0929@gmail.com>
References: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35680 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932083AbdGLQ4U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jul 2017 12:56:20 -0400
In-Reply-To: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch fixes the implementation incorrect of MOD_SEL2 bit26 value
when SCK5_A pin function is selected for IPSR16 bit[31:28].

This is a correction to the incorrect implementation of MOD_SEL register
pin assignment for R8A7796 SoC specification of R-Car Gen3 Hardware
User's Manual Rev.0.51E or later.

Fixes: f9aece7344bd ("pinctrl: sh-pfc: Initial R8A7796 PFC support")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 87f21d7b..4d070c2 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -1410,7 +1410,7 @@ enum {
 	PINMUX_IPSR_MSEL(IP16_31_28,	SSI_WS1_B,		SEL_SSI_1),
 	PINMUX_IPSR_GPSR(IP16_31_28,	SCK1),
 	PINMUX_IPSR_MSEL(IP16_31_28,	STP_IVCXO27_1_A,	SEL_SSP1_1_0),
-	PINMUX_IPSR_GPSR(IP16_31_28,	SCK5_A),
+	PINMUX_IPSR_MSEL(IP16_31_28,	SCK5_A,			SEL_SCIF5_0),
 
 	/* IPSR17 */
 	PINMUX_IPSR_MSEL(IP17_3_0,	AUDIO_CLKA_A,		SEL_ADG_A_0),
-- 
1.9.1

