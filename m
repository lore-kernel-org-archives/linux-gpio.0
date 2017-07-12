From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/5] pinctrl: sh-pfc: r8a7796: Fix IPSR setting for MSIOF3_SS1_E pin
Date: Wed, 12 Jul 2017 12:31:16 +0200
Message-ID: <1499855477-20818-5-git-send-email-geert+renesas@glider.be>
References: <1499855477-20818-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:54428 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756144AbdGLKbX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jul 2017 06:31:23 -0400
In-Reply-To: <1499855477-20818-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch fixes the IPSR register setting when the MSIOF3_SS1_E pin
function is selected.

This is a correction to the incorrect implementation of IPSR register
pin assignment for R8A7796 SoC specification of R-Car Gen3 Hardware
User's Manual Rev.0.51E or later.

Fixes: f9aece7344bd81ce ("pinctrl: sh-pfc: Initial R8A7796 PFC support")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[geert: Reword]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 6fa1729d784e6df2..0fd96f198b4dfae2 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -645,7 +645,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP0_31_28,	VI4_DATA1_B,		SEL_VIN4_1),
 	PINMUX_IPSR_MSEL(IP0_31_28,	CAN0_RX_B,		SEL_RCAN0_1),
 	PINMUX_IPSR_MSEL(IP0_31_28,	CANFD0_RX_B,		SEL_CANFD0_1),
-	PINMUX_IPSR_MSEL(IP0_27_24,	MSIOF3_SS1_E,		SEL_MSIOF3_4),
+	PINMUX_IPSR_MSEL(IP0_31_28,	MSIOF3_SS1_E,		SEL_MSIOF3_4),
 
 	/* IPSR1 */
 	PINMUX_IPSR_GPSR(IP1_3_0,	IRQ2),
-- 
2.7.4

