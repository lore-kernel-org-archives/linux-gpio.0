From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 2/5] gpio: 104-idi-48: Remove unnecessary driver_data set
Date: Mon, 30 Jan 2017 09:39:47 -0500
Message-ID: <a3c84725727c68514768b52d003b6b3ef2ce6558.1485786703.git.vilhelm.gray@gmail.com>
References: <cover.1485786703.git.vilhelm.gray@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yb0-f195.google.com ([209.85.213.195]:35298 "EHLO
        mail-yb0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753611AbdA3Oj5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 09:39:57 -0500
In-Reply-To: <cover.1485786703.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>

Setting driver_data was necessary to access private data in the
idi_48_remove function. Now that the idi_48_remove function is gone,
driver_data is no longer used. This patch removes the relevant code.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-104-idi-48.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index eafbf053f3e8..dc100dff6e13 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -246,8 +246,6 @@ static int idi_48_probe(struct device *dev, unsigned int id)
 	spin_lock_init(&idi48gpio->lock);
 	spin_lock_init(&idi48gpio->ack_lock);
 
-	dev_set_drvdata(dev, idi48gpio);
-
 	err = devm_gpiochip_add_data(dev, &idi48gpio->chip, idi48gpio);
 	if (err) {
 		dev_err(dev, "GPIO registering failed (%d)\n", err);
-- 
2.11.0

