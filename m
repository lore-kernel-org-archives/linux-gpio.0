From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 089/182] gpio: fix misleading comment
Date: Wed,  9 Dec 2015 14:29:37 +0100
Message-ID: <1449667777-1776-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:35212 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753984AbbLIN3s (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:29:48 -0500
Received: by lbpu9 with SMTP id u9so29785397lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:29:47 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

We are not relying on container_of() now that we have
gpiochip_get_data().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6d40cf9426d3..c458317a22c7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -684,7 +684,7 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
  * gpiochip, providing an irq domain to translate the local IRQs to
  * global irqs in the gpiolib core, and making sure that the gpiochip
  * is passed as chip data to all related functions. Driver callbacks
- * need to use container_of() to get their local state containers back
+ * need to use gpiochip_get_data() to get their local state containers back
  * from the gpiochip passed as chip data. An irqdomain will be stored
  * in the gpiochip that shall be used by the driver to handle IRQ number
  * translation. The gpiochip will need to be initialized and registered
-- 
2.4.3

