From: Colin King <colin.king@canonical.com>
Subject: [PATCH] gpio: pca953x: initialize ret to zero to avoid returning garbage
Date: Fri,  9 Sep 2016 09:31:54 +0100
Message-ID: <20160909083154.26442-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:56176 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750867AbcIIIdW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2016 04:33:22 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

ret is not initialized so it contains garbage.  Ensure garbage
is not returned in the case that pdata && pdata->teardown is false
by initializing ret to 0.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpio/gpio-pca953x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index cbe2824..52f3d5c 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -845,7 +845,7 @@ static int pca953x_remove(struct i2c_client *client)
 {
 	struct pca953x_platform_data *pdata = dev_get_platdata(&client->dev);
 	struct pca953x_chip *chip = i2c_get_clientdata(client);
-	int ret;
+	int ret = 0;
 
 	if (pdata && pdata->teardown) {
 		ret = pdata->teardown(client, chip->gpio_chip.base,
-- 
2.9.3

