From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 3/3] pinctrl: sh-pfc: r8a7794: Implement voltage switching for SDHI
Date: Mon, 12 Sep 2016 09:36:35 +0200
Message-ID: <1473665795-7418-4-git-send-email-horms+renesas@verge.net.au>
References: <1473665795-7418-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1473665795-7418-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-Id: linux-gpio@vger.kernel.org

All the SHDIs can operate with either 3.3V or 1.8V signals, depending
on negotiation with the card.

Based on work by Wolfram Sang for the r8a7790.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2
* Use switch statement
---
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
index 8bc2cf0c594e..ed734f560c84 100644
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
@@ -5160,8 +5162,32 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	{ },
 };
 
+static int r8a7794_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
+{
+	*pocctrl = 0xe606006c;
+
+	switch (pin & 0x1f) {
+	case 6: return 23;
+	case 7: return 16;
+	case 14: return 15;
+	case 15: return 8;
+	case 0 ... 5:
+	case 8 ... 13:
+		return 22 - (pin & 0x1f);
+	case 16 ... 23:
+		return 47 - (pin & 0x1f);
+	}
+
+	return -EINVAL;
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
