From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: abx500: get rid of unused variable
Date: Thu,  2 Oct 2014 09:33:13 +0200
Message-ID: <1412235193-18743-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:49805 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751082AbaJBHdT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Oct 2014 03:33:19 -0400
Received: by mail-wg0-f48.google.com with SMTP id n12so2298230wgh.19
        for <linux-gpio@vger.kernel.org>; Thu, 02 Oct 2014 00:33:18 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

commit 2fcea6cecbc965b4e02a39537d9d939f5251bbbd
"pinctrl: remove remaining users of gpiochip_remove() retval"
removed the use of the return value from gpiochip_remove()
but missed to delete the dangling "err" variable:

drivers/pinctrl/nomadik/pinctrl-abx500.c:
In function 'abx500_gpio_probe':
drivers/pinctrl/nomadik/pinctrl-abx500.c:1208:11:
warning: unused variable 'err' [-Wunused-variable]

Fix this by getting rid of the dangling variable.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/pinctrl-abx500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index 7df34b70e8b6..080bcf8568c9 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -1206,7 +1206,7 @@ static int abx500_gpio_probe(struct platform_device *pdev)
 	const struct of_device_id *match;
 	struct abx500_pinctrl *pct;
 	unsigned int id = -1;
-	int ret, err;
+	int ret;
 	int i;
 
 	if (!np) {
-- 
1.9.3

