From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] gpio: aspeed: Remove dependence on GPIOF_* macros
Date: Thu,  2 Feb 2017 14:58:17 +1030
Message-ID: <20170202042817.8033-1-andrew@aj.id.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57848 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750842AbdBBE3Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2017 23:29:16 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org

1736f75d35e47409ad776273133d0f558a4c8253 is a (v2) patch which had
unresolved review comments[1]. Address the comments by removing the use
of macros from the consumer header (this patch represents the diff
between v2 and v3[2]).

[1] https://lkml.org/lkml/2017/1/26/337
[2] https://lkml.org/lkml/2017/1/26/786

Fixes: 1736f75d35e4 ("gpio: aspeed: Add banks Y, Z, AA, AB and AC")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---

Note: This should be applied to pinctrl/devel where the linked GPIO patches
have landed. See discussion at https://lkml.org/lkml/2017/2/1/390

 drivers/gpio/gpio-aspeed.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 6e4b278a82f1..fb16cc771c0d 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -15,7 +15,6 @@
 #include <linux/io.h>
 #include <linux/spinlock.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
 #include <linux/gpio/driver.h>
 #include <linux/pinctrl/consumer.h>
 
@@ -259,10 +258,10 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	u32 val;
 
 	if (!have_input(gpio, offset))
-		return GPIOF_DIR_OUT;
+		return 0;
 
 	if (!have_output(gpio, offset))
-		return GPIOF_DIR_IN;
+		return 1;
 
 	spin_lock_irqsave(&gpio->lock, flags);
 
-- 
2.9.3

