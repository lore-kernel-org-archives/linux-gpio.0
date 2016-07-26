From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] pinctrl: meson: Drop pinctrl_unregister for devm_ registered device
Date: Tue, 26 Jul 2016 14:51:58 +0000
Message-ID: <1469544718-32001-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:34931 "EHLO
	mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754663AbcGZOwM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2016 10:52:12 -0400
Received: by mail-pf0-f195.google.com with SMTP id h186so114368pfg.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2016 07:52:11 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Wei Yongjun <weiyj.lk@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org

It's not necessary to unregister pin controller device registered
with devm_pinctrl_register() and using pinctrl_unregister() leads
to a double free.

This is detected by Coccinelle semantic patch.

Signed-off-by: Wei Yongjun <weiyj.lk@gmail.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 11623c6..44e69c9 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -727,13 +727,7 @@ static int meson_pinctrl_probe(struct platform_device *pdev)
 		return PTR_ERR(pc->pcdev);
 	}
 
-	ret = meson_gpiolib_register(pc);
-	if (ret) {
-		pinctrl_unregister(pc->pcdev);
-		return ret;
-	}
-
-	return 0;
+	return meson_gpiolib_register(pc);
 }
 
 static struct platform_driver meson_pinctrl_driver = {

