From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 2/2] gpio: menz127: Drop *mdev field from struct
 men_z127_gpio
Date: Wed, 09 Mar 2016 20:39:57 +0800
Message-ID: <1457527197.720.2.camel@ingics.com>
References: <1457527135.720.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33689 "EHLO
	mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932411AbcCIMkD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2016 07:40:03 -0500
Received: by mail-pf0-f195.google.com with SMTP id 129so792243pfw.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Mar 2016 04:40:01 -0800 (PST)
In-Reply-To: <1457527135.720.1.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andreas Werner <andreas.werner@men.de>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

No need to store *medv in struct men_z127_gpio.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-menz127.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
index c5c9599..d979f4b 100644
--- a/drivers/gpio/gpio-menz127.c
+++ b/drivers/gpio/gpio-menz127.c
@@ -35,7 +35,6 @@
 struct men_z127_gpio {
 	struct gpio_chip gc;
 	void __iomem *reg_base;
-	struct mcb_device *mdev;
 	struct resource *mem;
 };
 
@@ -43,7 +42,7 @@ static int men_z127_debounce(struct gpio_chip *gc, unsigned gpio,
 			     unsigned debounce)
 {
 	struct men_z127_gpio *priv = gpiochip_get_data(gc);
-	struct device *dev = &priv->mdev->dev;
+	struct device *dev = gc->parent;
 	unsigned int rnd;
 	u32 db_en, db_cnt;
 
@@ -135,7 +134,6 @@ static int men_z127_probe(struct mcb_device *mdev,
 		goto err_release;
 	}
 
-	men_z127_gpio->mdev = mdev;
 	mcb_set_drvdata(mdev, men_z127_gpio);
 
 	ret = bgpio_init(&men_z127_gpio->gc, &mdev->dev, 4,
-- 
2.1.4



