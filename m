From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH] gpio: 104-idio-16: Return IRQ_NONE if all relevant GPIO
 lines are masked
Date: Wed, 20 Jan 2016 13:20:46 -0500
Message-ID: <20160120182046.GA25463@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f174.google.com ([209.85.160.174]:32833 "EHLO
	mail-yk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934679AbcATSUx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Jan 2016 13:20:53 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

If the irq_mask member has a value of 0, then interrupts are disabled on
the device. Therefore, IRQ_NONE should be returned if the irq_mask
member is 0.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-104-idio-16.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 4d69b50..09fe032 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -175,6 +175,9 @@ static irqreturn_t idio_16_irq_handler(int irq, void *dev_id)
 	struct gpio_chip *const chip = &idio16gpio->chip;
 	int gpio;
 
+	if (!idio16gpio->irq_mask)
+		return IRQ_NONE;
+
 	for_each_set_bit(gpio, &idio16gpio->irq_mask, chip->ngpio)
 		generic_handle_irq(irq_find_mapping(chip->irqdomain, gpio));
 
-- 
2.4.10

