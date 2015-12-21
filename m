From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: bcm/cygnys/iproc: fixup rebase issue
Date: Mon, 21 Dec 2015 09:42:17 +0100
Message-ID: <1450687337-16424-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:33998 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750949AbbLUIm1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Dec 2015 03:42:27 -0500
Received: by mail-lf0-f42.google.com with SMTP id y184so106345746lfc.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Dec 2015 00:42:26 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

Somehow this variable name screwed up in some rebase, fixed it.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: Pramod Kumar <pramodku@broadcom.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index 525ea138d9ca..314591a4609b 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -637,7 +637,7 @@ static int iproc_gpio_register_pinconf(struct iproc_gpio *chip)
 	return 0;
 }
 
-static void iproc_gpio_unregister_pinconf(struct cygnus_gpio *chip)
+static void iproc_gpio_unregister_pinconf(struct iproc_gpio *chip)
 {
 	pinctrl_unregister(chip->pctl);
 }
-- 
2.4.3

