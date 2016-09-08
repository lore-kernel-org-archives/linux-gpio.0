From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/3] pinctrl: sh-pfc: Add PORT_GP_24 helper macro
Date: Thu,  8 Sep 2016 13:36:46 +0200
Message-ID: <1473334608-24638-2-git-send-email-horms+renesas@verge.net.au>
References: <1473334608-24638-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1473334608-24638-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Simon Horman <horms+renesas@verge.net.au>
List-Id: linux-gpio@vger.kernel.org

This follows the style of existing PORT_GP_X macros and
will be used by a follow-up patch for the r8a7791 SoC.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/pinctrl/sh-pfc/sh_pfc.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 5e966c09434d..de91b5f247c0 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -399,11 +399,15 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 	PORT_GP_CFG_1(bank, 16, fn, sfx, cfg), PORT_GP_CFG_1(bank, 17, fn, sfx, cfg)
 #define PORT_GP_18(bank, fn, sfx)	PORT_GP_CFG_18(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_26(bank, fn, sfx, cfg)						\
+#define PORT_GP_CFG_24(bank, fn, sfx, cfg)						\
 	PORT_GP_CFG_18(bank, fn, sfx, cfg),						\
 	PORT_GP_CFG_1(bank, 18, fn, sfx, cfg), PORT_GP_CFG_1(bank, 19, fn, sfx, cfg),	\
 	PORT_GP_CFG_1(bank, 20, fn, sfx, cfg), PORT_GP_CFG_1(bank, 21, fn, sfx, cfg),	\
-	PORT_GP_CFG_1(bank, 22, fn, sfx, cfg), PORT_GP_CFG_1(bank, 23, fn, sfx, cfg),	\
+	PORT_GP_CFG_1(bank, 22, fn, sfx, cfg), PORT_GP_CFG_1(bank, 23, fn, sfx, cfg)
+#define PORT_GP_24(bank, fn, sfx)	PORT_GP_CFG_24(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_26(bank, fn, sfx, cfg)						\
+	PORT_GP_CFG_24(bank, fn, sfx, cfg),						\
 	PORT_GP_CFG_1(bank, 24, fn, sfx, cfg), PORT_GP_CFG_1(bank, 25, fn, sfx, cfg)
 #define PORT_GP_26(bank, fn, sfx)	PORT_GP_CFG_26(bank, fn, sfx, 0)
 
-- 
2.7.0.rc3.207.g0ac5344
