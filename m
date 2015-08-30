From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] gpio: sx150x: Remove unnecessary MODULE_ALIAS()
Date: Sun, 30 Aug 2015 23:58:44 +0200
Message-ID: <1440971924-15571-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:32952 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751794AbbH3V65 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 30 Aug 2015 17:58:57 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

The driver has a I2C device id table that is used to create the module
aliases and also "sx150x" isn't a supported I2C id, so it's never used.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 drivers/gpio/gpio-sx150x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index 458d9d7952b8..9c6b96707c9f 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -706,4 +706,3 @@ module_exit(sx150x_exit);
 MODULE_AUTHOR("Gregory Bean <gbean@codeaurora.org>");
 MODULE_DESCRIPTION("Driver for Semtech SX150X I2C GPIO Expanders");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("i2c:sx150x");
-- 
2.4.3

