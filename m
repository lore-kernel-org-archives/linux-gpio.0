From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: f7188x: fix edit mistake
Date: Mon, 18 Apr 2016 13:32:49 +0200
Message-ID: <1460979169-14368-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34487 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752158AbcDRLc4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Apr 2016 07:32:56 -0400
Received: by mail-lf0-f49.google.com with SMTP id j11so212671083lfb.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 Apr 2016 04:32:55 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

Fix a typo causing a build regression.

Fixes: f90c6bdb690b ("gpio: f7188x: use the new open drain callback")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-f7188x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index 58674ff75097..05aa538c3767 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -328,7 +328,7 @@ static int f7188x_gpio_set_single_ended(struct gpio_chip *chip,
 		data &= ~BIT(offset);
 	else
 		data |= BIT(offset);
-	superio_outb(sio->addr, gpio_data_mode(bank->regbase), data);
+	superio_outb(sio->addr, gpio_out_mode(bank->regbase), data);
 
 	superio_exit(sio->addr);
 	return 0;
-- 
2.4.3

