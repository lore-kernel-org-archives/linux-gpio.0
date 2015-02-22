From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] pinctrl: lantiq: fix include guard #endif comment
Date: Sun, 22 Feb 2015 19:55:47 +0200
Message-ID: <f1606be069750a7b47de9dcd4a7d5da759143780.1424627747.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:57992 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752192AbbBVR50 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 22 Feb 2015 12:57:26 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: John Crispin <blogic@openwrt.org>, linux-gpio@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/pinctrl/pinctrl-lantiq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-lantiq.h b/drivers/pinctrl/pinctrl-lantiq.h
index c7cfad5527d7..eb89ba045228 100644
--- a/drivers/pinctrl/pinctrl-lantiq.h
+++ b/drivers/pinctrl/pinctrl-lantiq.h
@@ -193,4 +193,4 @@ enum ltq_pin {
 extern int ltq_pinctrl_register(struct platform_device *pdev,
 				   struct ltq_pinmux_info *info);
 extern int ltq_pinctrl_unregister(struct platform_device *pdev);
-#endif	/* __PINCTRL_PXA3XX_H */
+#endif	/* __PINCTRL_LANTIQ_H */
-- 
2.1.4

