From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7745: Implement voltage switching for SDHI
Date: Fri, 13 Oct 2017 15:49:15 +0100
Message-ID: <1507906155-9712-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:53034 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753231AbdJMOt4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Oct 2017 10:49:56 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>

Voltage switching is the same as on the r8a7794.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
This patch has been tested against sh-pfc-for-v-4.14 as well as
Linux next tag next-20171012.

 drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
index a0ed220..333a3470 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
@@ -5097,6 +5097,7 @@ static int r8a7794_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *poc
 #ifdef CONFIG_PINCTRL_PFC_R8A7745
 const struct sh_pfc_soc_info r8a7745_pinmux_info = {
 	.name = "r8a77450_pfc",
+	.ops = &r8a7794_pinmux_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
-- 
1.9.1

