From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 1/2] gpio: menz127: Drop lock field from struct men_z127_gpio
Date: Wed, 09 Mar 2016 20:38:55 +0800
Message-ID: <1457527135.720.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:35113 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932314AbcCIMjA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2016 07:39:00 -0500
Received: by mail-pa0-f65.google.com with SMTP id fl4so3193626pad.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Mar 2016 04:39:00 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andreas Werner <andreas.werner@men.de>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Current code uses a uninitialized spin lock.
bgpio_init() already initialized a spin lock, so let's switch to use
&gc->bgpio_lock instead and remove the lock from struct men_z127_gpio.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-menz127.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
index a68e199..c5c9599 100644
--- a/drivers/gpio/gpio-menz127.c
+++ b/drivers/gpio/gpio-menz127.c
@@ -37,7 +37,6 @@ struct men_z127_gpio {
 	void __iomem *reg_base;
 	struct mcb_device *mdev;
 	struct resource *mem;
-	spinlock_t lock;
 };
 
 static int men_z127_debounce(struct gpio_chip *gc, unsigned gpio,
@@ -69,7 +68,7 @@ static int men_z127_debounce(struct gpio_chip *gc, unsigned gpio,
 		debounce /= 50;
 	}
 
-	spin_lock(&priv->lock);
+	spin_lock(&gc->bgpio_lock);
 
 	db_en = readl(priv->reg_base + MEN_Z127_DBER);
 
@@ -84,7 +83,7 @@ static int men_z127_debounce(struct gpio_chip *gc, unsigned gpio,
 	writel(db_en, priv->reg_base + MEN_Z127_DBER);
 	writel(db_cnt, priv->reg_base + GPIO_TO_DBCNT_REG(gpio));
 
-	spin_unlock(&priv->lock);
+	spin_unlock(&gc->bgpio_lock);
 
 	return 0;
 }
@@ -97,7 +96,7 @@ static int men_z127_request(struct gpio_chip *gc, unsigned gpio_pin)
 	if (gpio_pin >= gc->ngpio)
 		return -EINVAL;
 
-	spin_lock(&priv->lock);
+	spin_lock(&gc->bgpio_lock);
 	od_en = readl(priv->reg_base + MEN_Z127_ODER);
 
 	if (gpiochip_line_is_open_drain(gc, gpio_pin))
@@ -106,7 +105,7 @@ static int men_z127_request(struct gpio_chip *gc, unsigned gpio_pin)
 		od_en &= ~BIT(gpio_pin);
 
 	writel(od_en, priv->reg_base + MEN_Z127_ODER);
-	spin_unlock(&priv->lock);
+	spin_unlock(&gc->bgpio_lock);
 
 	return 0;
 }
-- 
2.1.4



