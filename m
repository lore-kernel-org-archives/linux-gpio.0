From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 1/5] gpio: 104-dio-48e: Remove unnecessary driver_data set
Date: Mon, 30 Jan 2017 09:39:37 -0500
Message-ID: <6842aabe11583bddfd5f241841ad9776f5dfe07e.1485786703.git.vilhelm.gray@gmail.com>
References: <cover.1485786703.git.vilhelm.gray@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yb0-f195.google.com ([209.85.213.195]:36242 "EHLO
        mail-yb0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753585AbdA3Oj5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 09:39:57 -0500
In-Reply-To: <cover.1485786703.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>

Setting driver_data was necessary to access private data in the
dio48e_remove function. Now that the dio48e_remove function is gone,
driver_data is no longer used. This patch removes the relevant code.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-104-dio-48e.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index 221243f17d4e..b6b0378166c4 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -369,8 +369,6 @@ static int dio48e_probe(struct device *dev, unsigned int id)
 
 	spin_lock_init(&dio48egpio->lock);
 
-	dev_set_drvdata(dev, dio48egpio);
-
 	err = devm_gpiochip_add_data(dev, &dio48egpio->chip, dio48egpio);
 	if (err) {
 		dev_err(dev, "GPIO registering failed (%d)\n", err);
-- 
2.11.0

