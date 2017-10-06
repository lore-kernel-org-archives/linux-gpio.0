From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7795: add newlines for better diff view
Date: Fri,  6 Oct 2017 12:37:25 +0200
Message-ID: <20171006103725.13804-1-wsa+renesas@sang-engineering.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:42778 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751369AbdJFKh2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Oct 2017 06:37:28 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>

Be consistent with the newlines after structs. This makes diffs a lot
easier to parse when comparing with other SoCs/versions.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index ccfc96c4d28c3d..105b564e39c1b2 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1678,6 +1678,7 @@ static const unsigned int audio_clkout2_b_pins[] = {
 static const unsigned int audio_clkout2_b_mux[] = {
 	AUDIO_CLKOUT2_B_MARK,
 };
+
 static const unsigned int audio_clkout3_a_pins[] = {
 	/* CLKOUT3 */
 	RCAR_GP_PIN(5, 19),
@@ -2967,6 +2968,7 @@ static const unsigned int msiof3_rxd_d_pins[] = {
 static const unsigned int msiof3_rxd_d_mux[] = {
 	MSIOF3_RXD_D_MARK,
 };
+
 static const unsigned int msiof3_clk_e_pins[] = {
 	/* SCK */
 	RCAR_GP_PIN(2, 3),
-- 
2.11.0

