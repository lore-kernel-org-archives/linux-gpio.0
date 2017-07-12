From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a7791: Add missing mmc_data8_b pin group
Date: Wed, 12 Jul 2017 13:58:33 +0200
Message-ID: <1499860713-27650-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:41148 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756497AbdGLL6h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jul 2017 07:58:37 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Chris Paterson <chris.paterson2@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Pins D6 and D7 of the MMC interface can be muxed to two different sets
of pins, but currently only one set is supported.
Add a pin group for the alternative set to fix this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v4.14.

 drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
index 4c5ffbd75be77148..10bd35f8c894c58e 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
@@ -2589,6 +2589,17 @@ static const unsigned int mmc_data8_mux[] = {
 	MMC_D0_MARK, MMC_D1_MARK, MMC_D2_MARK, MMC_D3_MARK,
 	MMC_D4_MARK, MMC_D5_MARK, MMC_D6_MARK, MMC_D7_MARK,
 };
+static const unsigned int mmc_data8_b_pins[] = {
+	/* D[0:7] */
+	RCAR_GP_PIN(6, 18), RCAR_GP_PIN(6, 19),
+	RCAR_GP_PIN(6, 20), RCAR_GP_PIN(6, 21),
+	RCAR_GP_PIN(6, 22), RCAR_GP_PIN(6, 23),
+	RCAR_GP_PIN(6, 6), RCAR_GP_PIN(6, 7),
+};
+static const unsigned int mmc_data8_b_mux[] = {
+	MMC_D0_MARK, MMC_D1_MARK, MMC_D2_MARK, MMC_D3_MARK,
+	MMC_D4_MARK, MMC_D5_MARK, MMC_D6_B_MARK, MMC_D7_B_MARK,
+};
 static const unsigned int mmc_ctrl_pins[] = {
 	/* CLK, CMD */
 	RCAR_GP_PIN(6, 16), RCAR_GP_PIN(6, 17),
@@ -4420,7 +4431,7 @@ static const unsigned int vin2_clk_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[341];
+	struct sh_pfc_pin_group common[342];
 	struct sh_pfc_pin_group r8a779x[9];
 } pinmux_groups = {
 	.common = {
@@ -4523,6 +4534,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(mmc_data1),
 		SH_PFC_PIN_GROUP(mmc_data4),
 		SH_PFC_PIN_GROUP(mmc_data8),
+		SH_PFC_PIN_GROUP(mmc_data8_b),
 		SH_PFC_PIN_GROUP(mmc_ctrl),
 		SH_PFC_PIN_GROUP(msiof0_clk),
 		SH_PFC_PIN_GROUP(msiof0_sync),
@@ -4955,6 +4967,7 @@ static const char * const mmc_groups[] = {
 	"mmc_data1",
 	"mmc_data4",
 	"mmc_data8",
+	"mmc_data8_b",
 	"mmc_ctrl",
 };
 
-- 
2.7.4

