From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 3/5] gpio: 104-idio-16: Remove unnecessary driver_data set
Date: Mon, 30 Jan 2017 09:39:57 -0500
Message-ID: <2c89ad9a9c55346e1187c05bca5eac62ce0df0ac.1485786703.git.vilhelm.gray@gmail.com>
References: <cover.1485786703.git.vilhelm.gray@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yb0-f194.google.com ([209.85.213.194]:35361 "EHLO
        mail-yb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932170AbdA3OkE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 09:40:04 -0500
In-Reply-To: <cover.1485786703.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>

Setting driver_data was necessary to access private data in the
idio_16_remove function. Now that the idio_16_remove function is gone,
driver_data is no longer used. This patch removes the relevant code.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-104-idio-16.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 01a091e17614..67068b61b90b 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -242,8 +242,6 @@ static int idio_16_probe(struct device *dev, unsigned int id)
 
 	spin_lock_init(&idio16gpio->lock);
 
-	dev_set_drvdata(dev, idio16gpio);
-
 	err = devm_gpiochip_add_data(dev, &idio16gpio->chip, idio16gpio);
 	if (err) {
 		dev_err(dev, "GPIO registering failed (%d)\n", err);
-- 
2.11.0

