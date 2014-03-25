From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH v2 1/2] gpio: moxart: Actually set output state in
 moxart_gpio_direction_output()
Date: Tue, 25 Mar 2014 10:28:11 +0800
Message-ID: <1395714491.5096.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:44957 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751141AbaCYC2Q (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Mar 2014 22:28:16 -0400
Received: by mail-pa0-f45.google.com with SMTP id kl14so6290524pab.18
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2014 19:28:16 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Jonas Jensen <jonas.jensen@gmail.com>, linux-gpio@vger.kernel.org

moxart_gpio_direction_output() ignored the state passed into it. Fix it.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-moxart.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
index 2af9900..4bd81f9 100644
--- a/drivers/gpio/gpio-moxart.c
+++ b/drivers/gpio/gpio-moxart.c
@@ -33,6 +33,8 @@ struct moxart_gpio_chip {
 	void __iomem *base;
 };
 
+static void moxart_gpio_set(struct gpio_chip *chip, unsigned offset, int value);
+
 static inline struct moxart_gpio_chip *to_moxart_gpio(struct gpio_chip *chip)
 {
 	return container_of(chip, struct moxart_gpio_chip, gpio);
@@ -63,6 +65,7 @@ static int moxart_gpio_direction_output(struct gpio_chip *chip,
 	struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
 	void __iomem *ioaddr = gc->base + GPIO_PIN_DIRECTION;
 
+	moxart_gpio_set(chip, offset, value);
 	writel(readl(ioaddr) | BIT(offset), ioaddr);
 	return 0;
 }
-- 
1.8.3.2



