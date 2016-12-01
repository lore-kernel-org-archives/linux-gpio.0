From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] pinctrl: sh-pfc: r8a7793: Implement voltage switching for SDHI
Date: Thu,  1 Dec 2016 14:21:07 +0100
Message-ID: <1480598467-14197-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47060 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755792AbcLAN1u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Dec 2016 08:27:50 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa+renesas@sang-engineering.com>

Voltage switching is the same as on the r8a7791.

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on sh-pfc-for-v4.10-tag2
---
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
index 7ca37c3019ab..e8de975b3a58 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
@@ -6455,6 +6455,7 @@ const struct sh_pfc_soc_info r8a7791_pinmux_info = {
 #ifdef CONFIG_PINCTRL_PFC_R8A7793
 const struct sh_pfc_soc_info r8a7793_pinmux_info = {
 	.name = "r8a77930_pfc",
+	.ops = &r8a7791_pinmux_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
-- 
2.7.0.rc3.207.g0ac5344

