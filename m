From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: dwapb: fix bgpio usage
Date: Fri, 20 Oct 2017 12:29:51 +0200
Message-ID: <20171020102951.6305-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:43455 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752172AbdJTKb4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Oct 2017 06:31:56 -0400
Received: by mail-lf0-f67.google.com with SMTP id a16so12671609lfk.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2017 03:31:55 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Hoan Tran <hotran@apm.com>, Alan Tull <atull@kernel.org>

The DW APB GPIO driver uses the generic GPIO library gpio-mmio,
and initialize the flags as "false", which should be 0.

When no flags are given, the native endianness is used to access
the MMIO registers, and the pin2mask() call can simply be
converted to a BIT() call, as per the default pin2mask()
implementation in gpio-mmio.c.

Cc: Hoan Tran <hotran@apm.com>
Cc: Alan Tull <atull@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-dwapb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index d782ad195c89..6730c6642ce3 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -320,7 +320,7 @@ static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
 	struct dwapb_gpio_port *port = gpiochip_get_data(gc);
 	struct dwapb_gpio *gpio = port->gpio;
 	unsigned long flags, val_deb;
-	unsigned long mask = gc->pin2mask(gc, offset);
+	unsigned long mask = BIT(offset);
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
 
@@ -482,7 +482,7 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 		(pp->idx * GPIO_SWPORT_DDR_SIZE);
 
 	err = bgpio_init(&port->gc, gpio->dev, 4, dat, set, NULL, dirout,
-			 NULL, false);
+			 NULL, 0);
 	if (err) {
 		dev_err(gpio->dev, "failed to init gpio chip for port%d\n",
 			port->idx);
-- 
2.13.6

