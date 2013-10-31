From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: tb10x: Set output value before setting direction to
 output
Date: Thu, 31 Oct 2013 11:23:46 +0800
Message-ID: <1383189826.21285.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:65081 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751182Ab3JaDan (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2013 23:30:43 -0400
Received: by mail-pb0-f53.google.com with SMTP id up7so2288451pbc.40
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2013 20:30:42 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Christian Ruppert <christian.ruppert@abilis.com>, Kumar Gala <galak@codeaurora.org>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, linux-gpio@vger.kernel.org

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-tb10x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index a0391bc..9116cdf 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -132,6 +132,7 @@ static int tb10x_gpio_direction_out(struct gpio_chip *chip,
 	int mask = BIT(offset);
 	int val = TB10X_GPIO_DIR_OUT << offset;
 
+	tb10x_gpio_set(chip, offset, value);
 	tb10x_set_bits(tb10x_gpio, OFFSET_TO_REG_DDR, mask, val);
 
 	return 0;
-- 
1.8.1.2



