From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 2/3] pinctrl: sh-pfc: r8a7795: add support for voltage switching
Date: Mon,  6 Jun 2016 18:08:26 +0200
Message-ID: <1465229307-1961-3-git-send-email-wsa@the-dreams.de>
References: <1465229307-1961-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1465229307-1961-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 44632b1a5c978c..33be5d56e3162a 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -17,8 +17,12 @@
 	PORT_GP_CFG_16(0, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
 	PORT_GP_CFG_28(1, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
 	PORT_GP_CFG_15(2, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
-	PORT_GP_CFG_16(3, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
-	PORT_GP_CFG_18(4, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
+	PORT_GP_CFG_12(3, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_IO_VOLTAGE),	\
+	PORT_GP_CFG_1(3, 12, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
+	PORT_GP_CFG_1(3, 13, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
+	PORT_GP_CFG_1(3, 14, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
+	PORT_GP_CFG_1(3, 15, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
+	PORT_GP_CFG_18(4, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_IO_VOLTAGE),	\
 	PORT_GP_CFG_26(5, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
 	PORT_GP_CFG_32(6, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
 	PORT_GP_CFG_4(7, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH)
@@ -4765,8 +4769,28 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 	{ },
 };
 
+static int r8a7795_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
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
+static const struct sh_pfc_soc_operations r8a7795_pinmux_ops = {
+	.pin_to_pocctrl = r8a7795_pin_to_pocctrl,
+};
+
 const struct sh_pfc_soc_info r8a7795_pinmux_info = {
 	.name = "r8a77950_pfc",
+	.ops = &r8a7795_pinmux_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
-- 
2.8.1
