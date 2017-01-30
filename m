From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 4/5] gpio: gpio-mm: Remove unnecessary driver_data set
Date: Mon, 30 Jan 2017 09:40:15 -0500
Message-ID: <3c48d9bd3035ba5e983e520518e7a310342d9d30.1485786703.git.vilhelm.gray@gmail.com>
References: <cover.1485786703.git.vilhelm.gray@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yb0-f194.google.com ([209.85.213.194]:35628 "EHLO
        mail-yb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932125AbdA3OrL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 09:47:11 -0500
In-Reply-To: <cover.1485786703.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>

Setting driver_data was necessary to access private data in the
gpiomm_remove function. Now that the gpiomm_remove function is gone,
driver_data is no longer used. This patch removes the relevant code.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-gpio-mm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-gpio-mm.c b/drivers/gpio/gpio-gpio-mm.c
index 393c8f9cf30d..60017425b49f 100644
--- a/drivers/gpio/gpio-gpio-mm.c
+++ b/drivers/gpio/gpio-gpio-mm.c
@@ -261,8 +261,6 @@ static int gpiomm_probe(struct device *dev, unsigned int id)
 
 	spin_lock_init(&gpiommgpio->lock);
 
-	dev_set_drvdata(dev, gpiommgpio);
-
 	err = devm_gpiochip_add_data(dev, &gpiommgpio->chip, gpiommgpio);
 	if (err) {
 		dev_err(dev, "GPIO registering failed (%d)\n", err);
-- 
2.11.0

