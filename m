From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: pxa2xx: export symbols
Date: Wed,  9 Mar 2016 09:11:49 +0700
Message-ID: <1457489509-5680-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:33247 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750799AbcCICMK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2016 21:12:10 -0500
Received: by mail-pa0-f42.google.com with SMTP id fl4so26281165pad.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2016 18:12:09 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

The pxa2xxx fails some automated builds because of unexported
symbols.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pxa/pinctrl-pxa2xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pxa/pinctrl-pxa2xx.c b/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
index d90e205cf809..f553313bc2ef 100644
--- a/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
+++ b/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
@@ -426,6 +426,7 @@ int pxa2xx_pinctrl_init(struct platform_device *pdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(pxa2xx_pinctrl_init);
 
 int pxa2xx_pinctrl_exit(struct platform_device *pdev)
 {
@@ -434,3 +435,4 @@ int pxa2xx_pinctrl_exit(struct platform_device *pdev)
 	pinctrl_unregister(pctl->pctl_dev);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(pxa2xx_pinctrl_exit);
-- 
2.4.3

