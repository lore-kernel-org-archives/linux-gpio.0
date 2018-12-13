From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a77990: Fix IOCTRL reg state after s2ram on R-Car E3
Date: Thu, 13 Dec 2018 17:20:27 +0100
Message-ID: <20181213162027.13137-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Due to an interaction with commit 9f2b76a2db3c4387 ("pinctrl: sh-pfc:
r8a77990: Add R8A774C0 PFC support"), the state of the I/O Control
Registers is saved/restored during s2ram on RZ/G2E, but not on R-Car E3.
Hence on R-Car E3, SDHI voltage state is lost after system resume.

Fix this by registering the I/O Control Registers on R-Car E3, too.

Fixes: 33847a71373cd6ae ("pinctrl: sh-pfc: r8a77990: Add voltage switch operations for SDHI")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued as a fix in sh-pfc-for-v4.21.

 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 784d4400c3e0e7ea..d5b7a83e8b614370 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -5017,6 +5017,7 @@ const struct sh_pfc_soc_info r8a77990_pinmux_info = {
 
 	.cfg_regs = pinmux_config_regs,
 	.bias_regs = pinmux_bias_regs,
+	.ioctrl_regs = pinmux_ioctrl_regs,
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
-- 
2.17.1
