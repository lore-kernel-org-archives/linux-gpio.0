From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 162/182] mfd: dm355evm_msp: switch to gpiochip_add_data()
Date: Wed,  9 Dec 2015 14:47:29 +0100
Message-ID: <1449668849-6213-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:34520 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753083AbbLINre (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:47:34 -0500
Received: by lbbcs9 with SMTP id cs9so30219264lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:47:33 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>

We're planning to remove the gpiochip_add() function to swith
to gpiochip_add_data() with NULL for data argument.

Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Lee please ACK this so I can take it through the GPIO tree.
---
 drivers/mfd/dm355evm_msp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/dm355evm_msp.c b/drivers/mfd/dm355evm_msp.c
index bc90efe01b59..d2c9a0dda531 100644
--- a/drivers/mfd/dm355evm_msp.c
+++ b/drivers/mfd/dm355evm_msp.c
@@ -260,7 +260,7 @@ static int add_children(struct i2c_client *client)
 
 	/* GPIO-ish stuff */
 	dm355evm_msp_gpio.parent = &client->dev;
-	status = gpiochip_add(&dm355evm_msp_gpio);
+	status = gpiochip_add_data(&dm355evm_msp_gpio, NULL);
 	if (status < 0)
 		return status;
 
-- 
2.4.3

