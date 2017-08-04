From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: check ops->pin_config_set in pinconf_set_config()
Date: Fri,  4 Aug 2017 11:59:32 +0900
Message-ID: <1501815572-2792-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:21640 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751845AbdHDDAD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2017 23:00:03 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

pinconf_set_config() is called by pinctrl_gpio_set_config().
If a GPIO driver is backed by a pinctrl driver and it does not
support .pin_config_set() hook, it causes NULL pointer dereference.

Fixes: 15381bc7c7f5 ("pinctrl: Allow configuration of pins from gpiolib based drivers")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/pinconf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index 92f363793f35..d3fe14394b73 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -205,7 +205,7 @@ int pinconf_set_config(struct pinctrl_dev *pctldev, unsigned pin,
 	const struct pinconf_ops *ops;
 
 	ops = pctldev->desc->confops;
-	if (!ops)
+	if (!ops || !ops->pin_config_set)
 		return -ENOTSUPP;
 
 	return ops->pin_config_set(pctldev, pin, configs, nconfigs);
-- 
2.7.4

