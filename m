From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] gpio: dwapb: Use "stride" rather than "size" for register distance
Date: Mon, 12 Feb 2018 11:11:24 +0100
Message-ID: <20180212101125.7890-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:42946 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933650AbeBLKLb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Feb 2018 05:11:31 -0500
Received: by mail-lf0-f68.google.com with SMTP id w10so6903181lfc.9
        for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2018 02:11:30 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Hoan Tran <hotran@apm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

This terminology is more precise. Also cut the stride calculation
in the preprocessor, it confuses more than it helps when reading
the driver.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-dwapb.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 6730c6642ce3..677988f21369 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -53,9 +53,9 @@
 #define GPIO_EXT_PORTD		0x5c
 
 #define DWAPB_MAX_PORTS		4
-#define GPIO_EXT_PORT_SIZE	(GPIO_EXT_PORTB - GPIO_EXT_PORTA)
-#define GPIO_SWPORT_DR_SIZE	(GPIO_SWPORTB_DR - GPIO_SWPORTA_DR)
-#define GPIO_SWPORT_DDR_SIZE	(GPIO_SWPORTB_DDR - GPIO_SWPORTA_DDR)
+#define GPIO_EXT_PORT_STRIDE	0x04 /* register stride 32 bits */
+#define GPIO_SWPORT_DR_STRIDE	0x0c /* register stride 3*32 bits */
+#define GPIO_SWPORT_DDR_STRIDE	0x0c /* register stride 3*32 bits */
 
 #define GPIO_REG_OFFSET_V2	1
 
@@ -476,10 +476,10 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 		return -ENOMEM;
 #endif
 
-	dat = gpio->regs + GPIO_EXT_PORTA + (pp->idx * GPIO_EXT_PORT_SIZE);
-	set = gpio->regs + GPIO_SWPORTA_DR + (pp->idx * GPIO_SWPORT_DR_SIZE);
+	dat = gpio->regs + GPIO_EXT_PORTA + (pp->idx * GPIO_EXT_PORT_STRIDE);
+	set = gpio->regs + GPIO_SWPORTA_DR + (pp->idx * GPIO_SWPORT_DR_STRIDE);
 	dirout = gpio->regs + GPIO_SWPORTA_DDR +
-		(pp->idx * GPIO_SWPORT_DDR_SIZE);
+		(pp->idx * GPIO_SWPORT_DDR_STRIDE);
 
 	err = bgpio_init(&port->gc, gpio->dev, 4, dat, set, NULL, dirout,
 			 NULL, 0);
@@ -710,13 +710,13 @@ static int dwapb_gpio_suspend(struct device *dev)
 
 		BUG_ON(!ctx);
 
-		offset = GPIO_SWPORTA_DDR + idx * GPIO_SWPORT_DDR_SIZE;
+		offset = GPIO_SWPORTA_DDR + idx * GPIO_SWPORT_DDR_STRIDE;
 		ctx->dir = dwapb_read(gpio, offset);
 
-		offset = GPIO_SWPORTA_DR + idx * GPIO_SWPORT_DR_SIZE;
+		offset = GPIO_SWPORTA_DR + idx * GPIO_SWPORT_DR_STRIDE;
 		ctx->data = dwapb_read(gpio, offset);
 
-		offset = GPIO_EXT_PORTA + idx * GPIO_EXT_PORT_SIZE;
+		offset = GPIO_EXT_PORTA + idx * GPIO_EXT_PORT_STRIDE;
 		ctx->ext = dwapb_read(gpio, offset);
 
 		/* Only port A can provide interrupts */
@@ -753,13 +753,13 @@ static int dwapb_gpio_resume(struct device *dev)
 
 		BUG_ON(!ctx);
 
-		offset = GPIO_SWPORTA_DR + idx * GPIO_SWPORT_DR_SIZE;
+		offset = GPIO_SWPORTA_DR + idx * GPIO_SWPORT_DR_STRIDE;
 		dwapb_write(gpio, offset, ctx->data);
 
-		offset = GPIO_SWPORTA_DDR + idx * GPIO_SWPORT_DDR_SIZE;
+		offset = GPIO_SWPORTA_DDR + idx * GPIO_SWPORT_DDR_STRIDE;
 		dwapb_write(gpio, offset, ctx->dir);
 
-		offset = GPIO_EXT_PORTA + idx * GPIO_EXT_PORT_SIZE;
+		offset = GPIO_EXT_PORTA + idx * GPIO_EXT_PORT_STRIDE;
 		dwapb_write(gpio, offset, ctx->ext);
 
 		/* Only port A can provide interrupts */
-- 
2.14.3

