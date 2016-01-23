From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: pxa: export pxa2xx_pinctrl_init()
Date: Sun, 24 Jan 2016 04:25:13 +0900
Message-ID: <1453577113-14423-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg010.nifty.com ([202.248.44.36]:43284 "EHLO
	conuserg010-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753554AbcAWT0V (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Jan 2016 14:26:21 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Haojian Zhuang <haojian.zhuang@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Daniel Mack <daniel@zonque.org>, linux-arm-kernel@lists.infradead.org

Building pinctrl-pxa27x.c as a module causes a link error:

ERROR: "pxa2xx_pinctrl_init" [drivers/pinctrl/pxa/pinctrl-pxa27x.ko] undefined!

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/pxa/pinctrl-pxa2xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pxa/pinctrl-pxa2xx.c b/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
index d90e205..216f227 100644
--- a/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
+++ b/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
@@ -426,6 +426,7 @@ int pxa2xx_pinctrl_init(struct platform_device *pdev,
 
 	return 0;
 }
+EXPORT_SYMBOL(pxa2xx_pinctrl_init);
 
 int pxa2xx_pinctrl_exit(struct platform_device *pdev)
 {
-- 
1.9.1

