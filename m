From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH RFT] gpio: ath79: Fix the logic to clear offset bit of
 AR71XX_GPIO_REG_OE register
Date: Tue, 08 Dec 2015 23:01:07 +0800
Message-ID: <1449586867.5555.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:35171 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965072AbbLHPBN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2015 10:01:13 -0500
Received: by pacej9 with SMTP id ej9so13290959pac.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Dec 2015 07:01:12 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alban Bedel <albeu@free.fr>, linux-gpio@vger.kernel.org

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-ath79.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index e5827a5..5eaea8b 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -113,7 +113,7 @@ static int ar934x_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 		__raw_writel(BIT(offset), ctrl->base + AR71XX_GPIO_REG_CLEAR);
 
 	__raw_writel(
-		__raw_readl(ctrl->base + AR71XX_GPIO_REG_OE) & BIT(offset),
+		__raw_readl(ctrl->base + AR71XX_GPIO_REG_OE) & ~BIT(offset),
 		ctrl->base + AR71XX_GPIO_REG_OE);
 
 	spin_unlock_irqrestore(&ctrl->lock, flags);
-- 
2.1.4



