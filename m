From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH RFT] gpio: Actually set output state in
 moxart_gpio_direction_output()
Date: Mon, 24 Mar 2014 21:24:41 +0800
Message-ID: <1395667481.4779.3.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:63523 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752902AbaCXNYr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Mar 2014 09:24:47 -0400
Received: by mail-pa0-f48.google.com with SMTP id hz1so5428821pad.7
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2014 06:24:47 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Jonas Jensen <jonas.jensen@gmail.com>, linux-gpio@vger.kernel.org

moxart_gpio_direction_output() ignored the state passed into it. Fix it.
Also slightly adjust the code to avoid forward declaration.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Hi Jonas,
I don't have this h/w. Can you test if this patch works.
Thanks,
Axel
 drivers/gpio/gpio-moxart.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
index 2af9900..ccd4570 100644
--- a/drivers/gpio/gpio-moxart.c
+++ b/drivers/gpio/gpio-moxart.c
@@ -48,25 +48,6 @@ static void moxart_gpio_free(struct gpio_chip *chip, unsigned offset)
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
-	writel(readl(ioaddr) | BIT(offset), ioaddr);
-	return 0;
-}
-
 static void moxart_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
@@ -78,7 +59,6 @@ static void moxart_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	else
 		reg = reg & ~BIT(offset);
 
-
 	writel(reg, ioaddr);
 }
 
@@ -93,6 +73,26 @@ static int moxart_gpio_get(struct gpio_chip *chip, unsigned offset)
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



