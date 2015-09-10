From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a7791/r8a7793: Correct SCIFB1_B SCK MOD_SEL value
Date: Thu, 10 Sep 2015 14:17:03 +0200
Message-ID: <1441887423-18743-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:48074 "EHLO
	michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752893AbbIJMRC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Sep 2015 08:17:02 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

When using serial port SCIFB1_B, transmit works, but nothing is
received.

Receive fails because the SCIFB1_SCK_B settings configure the wrong
value for the sel_scifb1 field in the Module Select Register (MOD_SEL),
due to an ambiguity in the R-Car M2-W and M2-N datasheets.

Tested on r8a7791/koelsch using pins 53 (TXD) and 72 (RXD) on EXIO
Connector A.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Against next-20150910.

s/PINMUX_IPSR_MODSEL_DATA/PINMUX_IPSR_MSEL/ to apply on
renesas-drivers-2015-09-08-v4.2.

 drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
index ee41eb10ef3636d7..622841954f4b9ab4 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
@@ -889,7 +889,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_DATA(IP2_2_0, DACK1),
 	PINMUX_IPSR_MODSEL_DATA(IP2_2_0, SCIFA1_TXD_C, SEL_SCIFA1_2),
 	PINMUX_IPSR_MODSEL_DATA(IP2_2_0, SCIFB1_TXD_C, SEL_SCIFB1_2),
-	PINMUX_IPSR_MODSEL_DATA(IP2_2_0, SCIFB1_SCK_B, SEL_SCIFB1_0),
+	PINMUX_IPSR_MODSEL_DATA(IP2_2_0, SCIFB1_SCK_B, SEL_SCIFB1_1),
 	PINMUX_IPSR_DATA(IP2_2_0, A20),
 	PINMUX_IPSR_MODSEL_DATA(IP2_4_3, SPCLK, SEL_QSP_0),
 	PINMUX_IPSR_DATA(IP2_6_5, A21),
-- 
1.9.1

