From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 2/3] pinctrl: sh-pfc: r8a7791: Implement voltage switching for SDHI
Date: Mon, 12 Sep 2016 09:36:34 +0200
Message-ID: <1473665795-7418-3-git-send-email-horms+renesas@verge.net.au>
References: <1473665795-7418-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33305 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756798AbcILHg4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2016 03:36:56 -0400
In-Reply-To: <1473665795-7418-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa+renesas@sang-engineering.com>

All the SHDIs can operate with either 3.3V or 1.8V signals, depending
on negotiation with the card.

Based on work by Wolfram Sang for the r8a7790.

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2
* Correct comment above CPU_ALL_PORT
---
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
index 0c1a60c9a844..7ca37c3019ab 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
@@ -13,6 +13,10 @@
 
 #include "sh_pfc.h"
 
+/*
+ * Pins 0-23 assigned to GPIO bank 6 can be used for SD interfaces in
+ * which case they support both 3.3V and 1.8V signalling.
+ */
 #define CPU_ALL_PORT(fn, sfx)						\
 	PORT_GP_32(0, fn, sfx),						\
 	PORT_GP_26(1, fn, sfx),						\
@@ -20,7 +24,15 @@
 	PORT_GP_32(3, fn, sfx),						\
 	PORT_GP_32(4, fn, sfx),						\
 	PORT_GP_32(5, fn, sfx),						\
-	PORT_GP_32(6, fn, sfx),						\
+	PORT_GP_CFG_24(6, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),		\
+	PORT_GP_1(6, 24, fn, sfx),					\
+	PORT_GP_1(6, 25, fn, sfx),					\
+	PORT_GP_1(6, 26, fn, sfx),					\
+	PORT_GP_1(6, 27, fn, sfx),					\
+	PORT_GP_1(6, 28, fn, sfx),					\
+	PORT_GP_1(6, 29, fn, sfx),					\
+	PORT_GP_1(6, 30, fn, sfx),					\
+	PORT_GP_1(6, 31, fn, sfx),					\
 	PORT_GP_26(7, fn, sfx)
 
 enum {
@@ -6404,9 +6416,24 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	{ },
 };
 
+static int r8a7791_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
+{
+	if (pin < RCAR_GP_PIN(6, 0) || pin > RCAR_GP_PIN(6, 23))
+		return -EINVAL;
+
+	*pocctrl = 0xe606008c;
+
+	return 31 - (pin & 0x1f);
+}
+
+static const struct sh_pfc_soc_operations r8a7791_pinmux_ops = {
+	.pin_to_pocctrl = r8a7791_pin_to_pocctrl,
+};
+
 #ifdef CONFIG_PINCTRL_PFC_R8A7791
 const struct sh_pfc_soc_info r8a7791_pinmux_info = {
 	.name = "r8a77910_pfc",
+	.ops = &r8a7791_pinmux_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
-- 
2.7.0.rc3.207.g0ac5344

