From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH v3 2/2] gpio: moxart: Actually set output state in
 moxart_gpio_direction_output()
Date: Tue, 25 Mar 2014 10:44:19 +0800
Message-ID: <1395715459.12999.1.camel@phoenix>
References: <1395715413.12999.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:50711 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750972AbaCYCoY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Mar 2014 22:44:24 -0400
Received: by mail-pd0-f170.google.com with SMTP id v10so6178627pde.29
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2014 19:44:24 -0700 (PDT)
In-Reply-To: <1395715413.12999.0.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, linux-gpio@vger.kernel.org

moxart_gpio_direction_output() ignored the state passed into it. Fix it.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-moxart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
index a19a14d..ccd4570 100644
--- a/drivers/gpio/gpio-moxart.c
+++ b/drivers/gpio/gpio-moxart.c
@@ -88,6 +88,7 @@ static int moxart_gpio_direction_output(struct gpio_chip *chip,
 	struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
 	void __iomem *ioaddr = gc->base + GPIO_PIN_DIRECTION;
 
+	moxart_gpio_set(chip, offset, value);
 	writel(readl(ioaddr) | BIT(offset), ioaddr);
 	return 0;
 }
-- 
1.8.3.2



