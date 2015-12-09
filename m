From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 057/182] gpio: sch: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:22:30 +0100
Message-ID: <1449667350-32482-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:34697 "EHLO
	mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754526AbbLINWf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:22:35 -0500
Received: by lffu14 with SMTP id u14so34121925lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:22:33 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-sch.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
index a8a333ade9aa..5314ee4b947d 100644
--- a/drivers/gpio/gpio-sch.c
+++ b/drivers/gpio/gpio-sch.c
@@ -41,8 +41,6 @@ struct sch_gpio {
 	unsigned short resume_base;
 };
 
-#define to_sch_gpio(gc)	container_of(gc, struct sch_gpio, chip)
-
 static unsigned sch_gpio_offset(struct sch_gpio *sch, unsigned gpio,
 				unsigned reg)
 {
@@ -65,7 +63,7 @@ static unsigned sch_gpio_bit(struct sch_gpio *sch, unsigned gpio)
 
 static int sch_gpio_reg_get(struct gpio_chip *gc, unsigned gpio, unsigned reg)
 {
-	struct sch_gpio *sch = to_sch_gpio(gc);
+	struct sch_gpio *sch = gpiochip_get_data(gc);
 	unsigned short offset, bit;
 	u8 reg_val;
 
@@ -80,7 +78,7 @@ static int sch_gpio_reg_get(struct gpio_chip *gc, unsigned gpio, unsigned reg)
 static void sch_gpio_reg_set(struct gpio_chip *gc, unsigned gpio, unsigned reg,
 			     int val)
 {
-	struct sch_gpio *sch = to_sch_gpio(gc);
+	struct sch_gpio *sch = gpiochip_get_data(gc);
 	unsigned short offset, bit;
 	u8 reg_val;
 
@@ -97,7 +95,7 @@ static void sch_gpio_reg_set(struct gpio_chip *gc, unsigned gpio, unsigned reg,
 
 static int sch_gpio_direction_in(struct gpio_chip *gc, unsigned gpio_num)
 {
-	struct sch_gpio *sch = to_sch_gpio(gc);
+	struct sch_gpio *sch = gpiochip_get_data(gc);
 
 	spin_lock(&sch->lock);
 	sch_gpio_reg_set(gc, gpio_num, GIO, 1);
@@ -112,7 +110,7 @@ static int sch_gpio_get(struct gpio_chip *gc, unsigned gpio_num)
 
 static void sch_gpio_set(struct gpio_chip *gc, unsigned gpio_num, int val)
 {
-	struct sch_gpio *sch = to_sch_gpio(gc);
+	struct sch_gpio *sch = gpiochip_get_data(gc);
 
 	spin_lock(&sch->lock);
 	sch_gpio_reg_set(gc, gpio_num, GLV, val);
@@ -122,7 +120,7 @@ static void sch_gpio_set(struct gpio_chip *gc, unsigned gpio_num, int val)
 static int sch_gpio_direction_out(struct gpio_chip *gc, unsigned gpio_num,
 				  int val)
 {
-	struct sch_gpio *sch = to_sch_gpio(gc);
+	struct sch_gpio *sch = gpiochip_get_data(gc);
 
 	spin_lock(&sch->lock);
 	sch_gpio_reg_set(gc, gpio_num, GIO, 0);
@@ -217,7 +215,7 @@ static int sch_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, sch);
 
-	return gpiochip_add(&sch->chip);
+	return gpiochip_add_data(&sch->chip, sch);
 }
 
 static int sch_gpio_remove(struct platform_device *pdev)
-- 
2.4.3

