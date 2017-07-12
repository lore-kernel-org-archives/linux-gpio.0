From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH 02/14] pinctrl: sh-pfc: r8a7796: Fix IPSR register setting when MSIOF3_SS1_E pin was selected
Date: Thu, 13 Jul 2017 01:55:35 +0900
Message-ID: <1499878547-3452-3-git-send-email-ykaneko0929@gmail.com>
References: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:34674 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753959AbdGLQ4N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jul 2017 12:56:13 -0400
In-Reply-To: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch fixes to set IPSR register when using MSIOF3_SS1_E pin function
is selected.

This is a correction to the incorrect implementation of IPSR register
pin assignment for R8A7796 SoC specification of R-Car Gen3 Hardware
User's Manual Rev.0.51E or later.

Fixes: f9aece7344bd ("pinctrl: sh-pfc: Initial R8A7796 PFC support")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index b2fb66f..87f21d7b 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -645,7 +645,7 @@ enum {
 	PINMUX_IPSR_MSEL(IP0_31_28,	VI4_DATA1_B,		SEL_VIN4_1),
 	PINMUX_IPSR_MSEL(IP0_31_28,	CAN0_RX_B,		SEL_RCAN0_1),
 	PINMUX_IPSR_MSEL(IP0_31_28,	CANFD0_RX_B,		SEL_CANFD0_1),
-	PINMUX_IPSR_MSEL(IP0_27_24,	MSIOF3_SS1_E,		SEL_MSIOF3_4),
+	PINMUX_IPSR_MSEL(IP0_31_28,	MSIOF3_SS1_E,		SEL_MSIOF3_4),
 
 	/* IPSR1 */
 	PINMUX_IPSR_GPSR(IP1_3_0,	IRQ2),
-- 
1.9.1

