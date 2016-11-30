From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] gpio: htc-egpio: read output value from cache
Date: Wed, 30 Nov 2016 10:09:28 +0100
Message-ID: <1480496968-5829-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:35151 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757264AbcK3JJd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2016 04:09:33 -0500
Received: by mail-lf0-f41.google.com with SMTP id b14so141524315lfg.2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2016 01:09:32 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

When the hardware is in output mode, reading the value from the
hardware is not giving the correct value back. Instead read the
value from the cache so we get the right value.

Suggested-by: Russell King <linux@arm.linux.org.uk>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-htc-egpio.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index 27af52850927..271356effb2e 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -160,10 +160,14 @@ static int egpio_get(struct gpio_chip *chip, unsigned offset)
 	bit   = egpio_bit(ei, offset);
 	reg   = egpio->reg_start + egpio_pos(ei, offset);
 
-	value = egpio_readw(ei, reg);
-	pr_debug("readw(%p + %x) = %x\n",
-			ei->base_addr, reg << ei->bus_shift, value);
-	return !!(value & bit);
+	if (test_bit(offset, &egpio->is_out)) {
+		return !!(egpio->cached_values & (1 << offset));
+	} else {
+		value = egpio_readw(ei, reg);
+		pr_debug("readw(%p + %x) = %x\n",
+			 ei->base_addr, reg << ei->bus_shift, value);
+		return !!(value & bit);
+	}
 }
 
 static int egpio_direction_input(struct gpio_chip *chip, unsigned offset)
-- 
2.7.4

