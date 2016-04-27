From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: ish-pfc: avoid unused variable warning
Date: Wed, 27 Apr 2016 11:56:49 +0200
Message-ID: <1461751049-2751427-1-git-send-email-arnd@arndb.de>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

After the conversion to devm_pinctrl_register, we get a warning in
sh_pfc_remove when CONFIG_PINCTRL_SH_PFC_GPIO is disabled:

drivers/pinctrl/sh-pfc/core.c: In function 'sh_pfc_remove':
drivers/pinctrl/sh-pfc/core.c:603:17: unused variable 'pfc' [-Werror=unused-variable]
  struct sh_pfc *pfc = platform_get_drvdata(pdev);

This moves the variable definition inside of the same ifdef
that has the only user, to get a clean build again.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 67ec8d7b4846 ("pinctrl: ish-pfc: Use devm_pinctrl_register() for pinctrl registration")
---
 drivers/pinctrl/sh-pfc/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 7ed9c80ba3ed..c9ee31c9952b 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -600,9 +600,9 @@ static int sh_pfc_probe(struct platform_device *pdev)
 
 static int sh_pfc_remove(struct platform_device *pdev)
 {
+#ifdef CONFIG_PINCTRL_SH_PFC_GPIO
 	struct sh_pfc *pfc = platform_get_drvdata(pdev);
 
-#ifdef CONFIG_PINCTRL_SH_PFC_GPIO
 	sh_pfc_unregister_gpiochip(pfc);
 #endif
 
-- 
2.7.0
