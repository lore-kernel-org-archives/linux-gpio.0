From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 5/5] gpio: ws16c48: Remove unnecessary driver_data set
Date: Mon, 30 Jan 2017 09:40:26 -0500
Message-ID: <f1e2648b075174cd37d9f2c85cda878bc3b23cf2.1485786703.git.vilhelm.gray@gmail.com>
References: <cover.1485786703.git.vilhelm.gray@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yb0-f194.google.com ([209.85.213.194]:33325 "EHLO
        mail-yb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753584AbdA3OsL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 09:48:11 -0500
In-Reply-To: <cover.1485786703.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>

Setting driver_data was necessary to access private data in the
ws16c48_remove function. Now that the ws16c48_remove function is gone,
driver_data is no longer used. This patch removes the relevant code.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-ws16c48.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
index 65de20dfbe7a..48b35589b7d6 100644
--- a/drivers/gpio/gpio-ws16c48.c
+++ b/drivers/gpio/gpio-ws16c48.c
@@ -372,8 +372,6 @@ static int ws16c48_probe(struct device *dev, unsigned int id)
 
 	spin_lock_init(&ws16c48gpio->lock);
 
-	dev_set_drvdata(dev, ws16c48gpio);
-
 	err = devm_gpiochip_add_data(dev, &ws16c48gpio->chip, ws16c48gpio);
 	if (err) {
 		dev_err(dev, "GPIO registering failed (%d)\n", err);
-- 
2.11.0

