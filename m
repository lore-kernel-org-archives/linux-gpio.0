From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH] gpiolib: add desc validation to gpiod_set_transitory()
Date: Thu, 21 Dec 2017 18:37:35 +0200
Message-ID: <20171221163735.6143-1-vz@mleia.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mleia.com ([178.79.152.223]:44570 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752244AbdLUQhi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Dec 2017 11:37:38 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

The gpiod_set_transitory() function is publicly exported, and
it is expected from it to be ready for usage with optional GPIOs
on consumer's side.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 drivers/gpio/gpiolib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6e19385..a34ea9d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2546,6 +2546,7 @@ int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
 	int gpio;
 	int rc;
 
+	VALIDATE_DESC(desc);
 	/*
 	 * Handle FLAG_TRANSITORY first, enabling queries to gpiolib for
 	 * persistence state.
-- 
2.10.2

