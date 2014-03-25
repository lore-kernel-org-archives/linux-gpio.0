From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH v3 1/2] gpio: moxart: Avoid forward declaration
Date: Tue, 25 Mar 2014 10:43:33 +0800
Message-ID: <1395715413.12999.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:55501 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750972AbaCYCni (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Mar 2014 22:43:38 -0400
Received: by mail-pd0-f178.google.com with SMTP id x10so6176589pdj.9
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2014 19:43:37 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Jonas Jensen <jonas.jensen@gmail.com>, linux-gpio@vger.kernel.org

Slightly adjust the code to avoid forward declaration as we need to call
moxart_gpio_set() in moxart_gpio_direction_output() to properly set the
output state.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-moxart.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
index 2af9900..a19a14d 100644
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
 
@@ -93,6 +73,25 @@ static int moxart_gpio_get(struct gpio_chip *chip, unsigned offset)
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
+	writel(readl(ioaddr) | BIT(offset), ioaddr);
+	return 0;
+}
+
 static struct gpio_chip moxart_template_chip = {
 	.label			= "moxart-gpio",
 	.request		= moxart_gpio_request,
-- 
1.8.3.2



