From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/5] gpio: pca954x: fix undefined error code from remove
Date: Fri, 26 Aug 2016 17:25:42 +0200
Message-ID: <20160826152546.604384-2-arnd@arndb.de>
References: <20160826152546.604384-1-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:54404 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751547AbcHZP2k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Aug 2016 11:28:40 -0400
In-Reply-To: <20160826152546.604384-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Phil Reid <preid@electromag.com.au>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

The recent addition of the regulator support has led to the pca953x_remove
function returning uninitialized data when no platform data pointer is
provided, as gcc warns when using -Wmaybe-uninitialized:

drivers/gpio/gpio-pca953x.c: In function 'pca953x_remove':
drivers/gpio/gpio-pca953x.c:860:9: error: 'ret' may be used uninitialized in this function [-Werror=maybe-uninitialized]

This restores the previous behavior, returning 0 on success.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: e23efa311110 ("gpio: pca954x: Add vcc regulator and enable it")
Cc: Phil Reid <preid@electromag.com.au>
---
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org

 drivers/gpio/gpio-pca953x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index cbe2824461eb..b9d31d737dbf 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -853,6 +853,8 @@ static int pca953x_remove(struct i2c_client *client)
 		if (ret < 0)
 			dev_err(&client->dev, "%s failed, %d\n",
 					"teardown", ret);
+	} else {
+		ret = 0;
 	}
 
 	regulator_disable(chip->regulator);
-- 
2.9.0

