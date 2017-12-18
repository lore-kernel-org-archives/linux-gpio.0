From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7794: Add i2c5 pin groups and function
Date: Mon, 18 Dec 2017 18:04:03 +0000
Message-ID: <1513620243-4188-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:49061 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933986AbdLRSGL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Dec 2017 13:06:11 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>

Add i2c5 pin groups and function to r8a7745 PFC driver.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
This patch is based on renesas devel tag renesas-devel-20171218-v4.15-rc4 

 drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
index f133b4f..1640024 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
@@ -2228,6 +2228,35 @@ enum {
 static const unsigned int i2c4_e_mux[] = {
 	I2C4_SCL_E_MARK, I2C4_SDA_E_MARK,
 };
+/* - I2C5 ------------------------------------------------------------------- */
+static const unsigned int i2c5_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(4, 14), RCAR_GP_PIN(4, 15),
+};
+static const unsigned int i2c5_mux[] = {
+	I2C5_SCL_MARK, I2C5_SDA_MARK,
+};
+static const unsigned int i2c5_b_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
+};
+static const unsigned int i2c5_b_mux[] = {
+	I2C5_SCL_B_MARK, I2C5_SDA_B_MARK,
+};
+static const unsigned int i2c5_c_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(4, 31), RCAR_GP_PIN(4, 30),
+};
+static const unsigned int i2c5_c_mux[] = {
+	I2C5_SCL_C_MARK, I2C5_SDA_C_MARK,
+};
+static const unsigned int i2c5_d_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(3, 13), RCAR_GP_PIN(3, 14),
+};
+static const unsigned int i2c5_d_mux[] = {
+	I2C5_SCL_D_MARK, I2C5_SDA_D_MARK,
+};
 /* - INTC ------------------------------------------------------------------- */
 static const unsigned int intc_irq0_pins[] = {
 	/* IRQ0 */
@@ -3821,6 +3850,10 @@ enum {
 	SH_PFC_PIN_GROUP(i2c4_c),
 	SH_PFC_PIN_GROUP(i2c4_d),
 	SH_PFC_PIN_GROUP(i2c4_e),
+	SH_PFC_PIN_GROUP(i2c5),
+	SH_PFC_PIN_GROUP(i2c5_b),
+	SH_PFC_PIN_GROUP(i2c5_c),
+	SH_PFC_PIN_GROUP(i2c5_d),
 	SH_PFC_PIN_GROUP(intc_irq0),
 	SH_PFC_PIN_GROUP(intc_irq1),
 	SH_PFC_PIN_GROUP(intc_irq2),
@@ -4196,6 +4229,13 @@ enum {
 	"i2c4_e",
 };
 
+static const char * const i2c5_groups[] = {
+	"i2c5",
+	"i2c5_b",
+	"i2c5_c",
+	"i2c5_d",
+};
+
 static const char * const intc_groups[] = {
 	"intc_irq0",
 	"intc_irq1",
@@ -4537,6 +4577,7 @@ enum {
 	SH_PFC_FUNCTION(i2c2),
 	SH_PFC_FUNCTION(i2c3),
 	SH_PFC_FUNCTION(i2c4),
+	SH_PFC_FUNCTION(i2c5),
 	SH_PFC_FUNCTION(intc),
 	SH_PFC_FUNCTION(mmc),
 	SH_PFC_FUNCTION(msiof0),
-- 
1.9.1

