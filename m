From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] pinctrl: sh-pfc: r8a7796: Add voltage switch operations for SDHI
Date: Thu,  8 Sep 2016 13:57:33 +0200
Message-ID: <1473335853-32102-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49725 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932308AbcIHL5n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2016 07:57:43 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>

This patch supports the {get,set}_io_voltage operations of SDHI.

This operates the POCCTRL0 register on R8A7796 SoC and makes 1.8v/3.3v
voltage switch.

Based on work by Takeshi Kihara and Wolfram Sang.

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index f8ab74dd0506..dc9b671ccf2e 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -23,8 +23,12 @@
 	PORT_GP_16(0, fn, sfx),						\
 	PORT_GP_29(1, fn, sfx),						\
 	PORT_GP_15(2, fn, sfx),						\
-	PORT_GP_16(3, fn, sfx),						\
-	PORT_GP_18(4, fn, sfx),						\
+	PORT_GP_CFG_12(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),		\
+	PORT_GP_1(3, 12, fn, sfx),					\
+	PORT_GP_1(3, 13, fn, sfx),					\
+	PORT_GP_1(3, 14, fn, sfx),					\
+	PORT_GP_1(3, 15, fn, sfx),					\
+	PORT_GP_CFG_18(4, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),		\
 	PORT_GP_26(5, fn, sfx),						\
 	PORT_GP_32(6, fn, sfx),						\
 	PORT_GP_4(7, fn, sfx)
@@ -2627,8 +2631,28 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	{ },
 };
 
+static int r8a7796_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
+{
+	int bit = -EINVAL;
+
+	*pocctrl = 0xe6060380;
+
+	if (pin >= RCAR_GP_PIN(3, 0) && pin <= RCAR_GP_PIN(3, 11))
+		bit = pin & 0x1f;
+
+	if (pin >= RCAR_GP_PIN(4, 0) && pin <= RCAR_GP_PIN(4, 17))
+		bit = (pin & 0x1f) + 12;
+
+	return bit;
+}
+
+static const struct sh_pfc_soc_operations r8a7796_pinmux_ops = {
+	.pin_to_pocctrl = r8a7796_pin_to_pocctrl,
+};
+
 const struct sh_pfc_soc_info r8a7796_pinmux_info = {
 	.name = "r8a77960_pfc",
+	.ops = &r8a7796_pinmux_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
-- 
2.7.0.rc3.207.g0ac5344

