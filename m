From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH v2 2/2] gpio: moxart: Avoid forward declaration
Date: Tue, 25 Mar 2014 10:29:01 +0800
Message-ID: <1395714541.5096.1.camel@phoenix>
References: <1395714491.5096.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:43693 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751141AbaCYC3G (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Mar 2014 22:29:06 -0400
Received: by mail-pb0-f43.google.com with SMTP id um1so6304085pbc.30
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2014 19:29:05 -0700 (PDT)
In-Reply-To: <1395714491.5096.0.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, linux-gpio@vger.kernel.org

Slightly adjust the code to avoid forward declaration.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-moxart.c | 43 ++++++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
index 4bd81f9..ccd4570 100644
--- a/drivers/gpio/gpio-moxart.c
+++ b/drivers/gpio/gpio-moxart.c
@@ -33,8 +33,6 @@ struct moxart_gpio_chip {
 	void __iomem *base;
 };
 
-static void moxart_gpio_set(struct gpio_chip *chip, unsigned offset, int value);
-
 static inline struct moxart_gpio_chip *to_moxart_gpio(struct gpio_chip *chip)
 {
 	return container_of(chip, struct moxart_gpio_chip, gpio);
@@ -50,26 +48,6 @@ static void moxart_gpio_free(struct gpio_chip *chip, unsigned offset)
 	pinctrl_free_gpio(offset);
 }
 
-static int moxart_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
-{
-	struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
-	void __iomem *ioaddr = gc->base + GPIO_PIN_DIRECTION;
-
-	writel(readl(ioaddr) & ~BIT(offset), ioaddr);
-	return 0;
-}
-
-static int moxart_gpio_direction_output(struct gpio_chip *chip,
-					unsigned offset, int value)
-{
-	struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
-	void __iomem *ioaddr = gc->base + GPIO_PIN_DIRECTION;
-
-	moxart_gpio_set(chip, offset, value);
-	writel(readl(ioaddr) | BIT(offset), ioaddr);
-	return 0;
-}
-
 static void moxart_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
@@ -81,7 +59,6 @@ static void moxart_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	else
 		reg = reg & ~BIT(offset);
 
-
 	writel(reg, ioaddr);
 }
 
@@ -96,6 +73,26 @@ static int moxart_gpio_get(struct gpio_chip *chip, unsigned offset)
 		return !!(readl(gc->base + GPIO_DATA_IN) & BIT(offset));
 }
 
+static int moxart_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+{
+	struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
+	void __iomem *ioaddr = gc->base + GPIO_PIN_DIRECTION;
+
+	writel(readl(ioaddr) & ~BIT(offset), ioaddr);
+	return 0;
+}
+
+static int moxart_gpio_direction_output(struct gpio_chip *chip,
+					unsigned offset, int value)
+{
+	struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
+	void __iomem *ioaddr = gc->base + GPIO_PIN_DIRECTION;
+
+	moxart_gpio_set(chip, offset, value);
+	writel(readl(ioaddr) | BIT(offset), ioaddr);
+	return 0;
+}
+
 static struct gpio_chip moxart_template_chip = {
 	.label			= "moxart-gpio",
 	.request		= moxart_gpio_request,
-- 
1.8.3.2



