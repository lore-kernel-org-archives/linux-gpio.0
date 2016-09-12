From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 1/3] pinctrl: sh-pfc: Add PORT_GP_24 helper macro
Date: Mon, 12 Sep 2016 09:36:33 +0200
Message-ID: <1473665795-7418-2-git-send-email-horms+renesas@verge.net.au>
References: <1473665795-7418-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33305 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755743AbcILHgz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2016 03:36:55 -0400
In-Reply-To: <1473665795-7418-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>

This follows the style of existing PORT_GP_X macros and
will be used by a follow-up patch for the r8a7791 SoC.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v2
* Rebase
---
 drivers/pinctrl/sh-pfc/sh_pfc.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index c24067edcec4..2345421103db 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -422,9 +422,13 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 	PORT_GP_CFG_1(bank, 22, fn, sfx, cfg)
 #define PORT_GP_23(bank, fn, sfx)	PORT_GP_CFG_23(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_26(bank, fn, sfx, cfg)				\
+#define PORT_GP_CFG_24(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_23(bank, fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 23, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 23, fn, sfx, cfg)
+#define PORT_GP_24(bank, fn, sfx)	PORT_GP_CFG_24(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_26(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_24(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 24, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 25, fn, sfx, cfg)
 #define PORT_GP_26(bank, fn, sfx)	PORT_GP_CFG_26(bank, fn, sfx, 0)
-- 
2.7.0.rc3.207.g0ac5344

