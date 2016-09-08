From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/3] pinctrl: sh-pfc: r8a7794: Implement voltage switching for SDHI
Date: Thu,  8 Sep 2016 13:36:48 +0200
Message-ID: <1473334608-24638-4-git-send-email-horms+renesas@verge.net.au>
References: <1473334608-24638-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49450 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757839AbcIHLg6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2016 07:36:58 -0400
In-Reply-To: <1473334608-24638-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Simon Horman <horms+renesas@verge.net.au>

All the SHDIs can operate with either 3.3V or 1.8V signals, depending
on negotiation with the card.

Based on work by Wolfram Sang for the r8a7790.

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
index 8bc2cf0c594e..c02b367837b7 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
@@ -22,7 +22,9 @@
 	PORT_GP_32(3, fn, sfx),						\
 	PORT_GP_32(4, fn, sfx),						\
 	PORT_GP_28(5, fn, sfx),						\
-	PORT_GP_26(6, fn, sfx)
+	PORT_GP_CFG_24(6, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),		\
+	PORT_GP_1(6, 24, fn, sfx),					\
+	PORT_GP_1(6, 25, fn, sfx)
 
 enum {
 	PINMUX_RESERVED = 0,
@@ -5160,8 +5162,38 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	{ },
 };
 
+static int r8a7794_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
+{
+	if (pin < RCAR_GP_PIN(6, 0) || pin > RCAR_GP_PIN(6, 23))
+		return -EINVAL;
+
+	*pocctrl = 0xe606006c;
+
+	/* GP6_16-23 -> bits 31-24 of pocctrl
+	 * GP6_06    -> bit  23    of pocctrl
+	 * GP6_00-05 -> bits 22-17 of pocctrl
+	 * GP6_07    -> bit  16    of pocctrl
+	 * GP6_14    -> bit  15    of pocctrl
+	 * GP6_08-13 -> bits 14-09 of pocctrl
+	 * GP6_15    -> bit  08    of pocctrl
+	 */
+	if (pin == RCAR_GP_PIN(6, 6) || pin == RCAR_GP_PIN(6, 14))
+		return 31 - 2 - (pin & 0x1f);
+	else if (pin == RCAR_GP_PIN(6, 7) || pin == RCAR_GP_PIN(6, 15))
+		return 31 - 8 - (pin & 0x1f);
+	else if (pin < RCAR_GP_PIN(6, 14))
+		return 31 - 9 - (pin & 0x1f);
+	else
+		return 31 + 16 - (pin & 0x1f);
+}
+
+static const struct sh_pfc_soc_operations r8a7794_pinmux_ops = {
+	.pin_to_pocctrl = r8a7794_pin_to_pocctrl,
+};
+
 const struct sh_pfc_soc_info r8a7794_pinmux_info = {
 	.name = "r8a77940_pfc",
+	.ops = &r8a7794_pinmux_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
-- 
2.7.0.rc3.207.g0ac5344

