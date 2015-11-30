From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] pinctrl: sh-pfc: r8a7779: Use PINMUX_SINGLE() instead of raw PINMUX_DATA()
Date: Mon, 30 Nov 2015 14:41:04 +0100
Message-ID: <1448890865-1856-4-git-send-email-geert+renesas@glider.be>
References: <1448890865-1856-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:40554 "EHLO
	xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754246AbbK3NlJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 08:41:09 -0500
In-Reply-To: <1448890865-1856-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7779.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7779.c b/drivers/pinctrl/sh-pfc/pfc-r8a7779.c
index 928eeb02a086d8b8..94bcc674abdd5612 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7779.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7779.c
@@ -609,14 +609,14 @@ enum {
 static const u16 pinmux_data[] = {
 	PINMUX_DATA_GP_ALL(), /* PINMUX_DATA(GP_M_N_DATA, GP_M_N_FN...), */
 
-	PINMUX_DATA(AVS1_MARK, FN_AVS1),
-	PINMUX_DATA(AVS1_MARK, FN_AVS1),
-	PINMUX_DATA(A17_MARK, FN_A17),
-	PINMUX_DATA(A18_MARK, FN_A18),
-	PINMUX_DATA(A19_MARK, FN_A19),
-
-	PINMUX_DATA(USB_PENC0_MARK, FN_USB_PENC0),
-	PINMUX_DATA(USB_PENC1_MARK, FN_USB_PENC1),
+	PINMUX_SINGLE(AVS1),
+	PINMUX_SINGLE(AVS1),
+	PINMUX_SINGLE(A17),
+	PINMUX_SINGLE(A18),
+	PINMUX_SINGLE(A19),
+
+	PINMUX_SINGLE(USB_PENC0),
+	PINMUX_SINGLE(USB_PENC1),
 
 	PINMUX_IPSR_GPSR(IP0_2_0, USB_PENC2),
 	PINMUX_IPSR_MSEL(IP0_2_0, SCK0, SEL_SCIF0_0),
-- 
1.9.1

