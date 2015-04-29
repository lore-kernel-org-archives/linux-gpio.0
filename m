From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: [PATCH 2/4] gpio: gpio-generic: add flag to read out output value from reg_set
Date: Wed, 29 Apr 2015 18:34:59 +0300
Message-ID: <1430321701-13758-3-git-send-email-vladimir_zapolskiy@mentor.com>
References: <1430321701-13758-1-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:52594 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753589AbbD2Pfj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Apr 2015 11:35:39 -0400
In-Reply-To: <1430321701-13758-1-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org

The change introduces BGPIOF_READ_OUTPUT_REG_SET flag for gpio-generic
GPIO chip implementation, which allows to get correct configured value
from reg_set register, input value is still get from reg_dat.

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/gpio/gpio-generic.c     |   22 +++++++++++++++++++---
 include/linux/basic_mmio_gpio.h |    1 +
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index 3f90be8..83258b6 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -135,6 +135,17 @@ static unsigned long bgpio_pin2mask_be(struct bgpio_chip *bgc,
 	return 1 << (bgc->bits - 1 - pin);
 }
 
+static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct bgpio_chip *bgc = to_bgpio_chip(gc);
+	unsigned long pinmask = bgc->pin2mask(bgc, gpio);
+
+	if (bgc->dir & pinmask)
+		return bgc->read_reg(bgc->reg_set) & pinmask;
+	else
+		return bgc->read_reg(bgc->reg_dat) & pinmask;
+}
+
 static int bgpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct bgpio_chip *bgc = to_bgpio_chip(gc);
@@ -416,7 +427,8 @@ static int bgpio_setup_accessors(struct device *dev,
 static int bgpio_setup_io(struct bgpio_chip *bgc,
 			  void __iomem *dat,
 			  void __iomem *set,
-			  void __iomem *clr)
+			  void __iomem *clr,
+			  unsigned long flags)
 {
 
 	bgc->reg_dat = dat;
@@ -437,7 +449,11 @@ static int bgpio_setup_io(struct bgpio_chip *bgc,
 		bgc->gc.set_multiple = bgpio_set_multiple;
 	}
 
-	bgc->gc.get = bgpio_get;
+	if (!(flags & BGPIOF_UNREADABLE_REG_SET) &&
+	    (flags & BGPIOF_READ_OUTPUT_REG_SET))
+		bgc->gc.get = bgpio_get_set;
+	else
+		bgc->gc.get = bgpio_get;
 
 	return 0;
 }
@@ -500,7 +516,7 @@ int bgpio_init(struct bgpio_chip *bgc, struct device *dev,
 	bgc->gc.ngpio = bgc->bits;
 	bgc->gc.request = bgpio_request;
 
-	ret = bgpio_setup_io(bgc, dat, set, clr);
+	ret = bgpio_setup_io(bgc, dat, set, clr, flags);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/basic_mmio_gpio.h b/include/linux/basic_mmio_gpio.h
index 0e97856..14eea94 100644
--- a/include/linux/basic_mmio_gpio.h
+++ b/include/linux/basic_mmio_gpio.h
@@ -74,5 +74,6 @@ int bgpio_init(struct bgpio_chip *bgc, struct device *dev,
 #define BGPIOF_UNREADABLE_REG_SET	BIT(1) /* reg_set is unreadable */
 #define BGPIOF_UNREADABLE_REG_DIR	BIT(2) /* reg_dir is unreadable */
 #define BGPIOF_BIG_ENDIAN_BYTE_ORDER	BIT(3)
+#define BGPIOF_READ_OUTPUT_REG_SET     BIT(4) /* reg_set stores output value */
 
 #endif /* __BASIC_MMIO_GPIO_H */
-- 
1.7.10.4

