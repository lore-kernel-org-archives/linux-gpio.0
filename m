From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 168/182] mfd: ucb1x00: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:48:17 +0100
Message-ID: <1449668897-6498-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:35266 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753092AbbLINsa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:48:30 -0500
Received: by lfdl133 with SMTP id l133so34436011lfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:48:29 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Lee please ACK this so I can take it through the GPIO tree.
---
 drivers/mfd/ucb1x00-core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/ucb1x00-core.c b/drivers/mfd/ucb1x00-core.c
index a6ec7cc0fac6..84d0757b8c5d 100644
--- a/drivers/mfd/ucb1x00-core.c
+++ b/drivers/mfd/ucb1x00-core.c
@@ -28,7 +28,7 @@
 #include <linux/mutex.h>
 #include <linux/mfd/ucb1x00.h>
 #include <linux/pm.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 
 static DEFINE_MUTEX(ucb1x00_mutex);
 static LIST_HEAD(ucb1x00_drivers);
@@ -109,7 +109,7 @@ unsigned int ucb1x00_io_read(struct ucb1x00 *ucb)
 
 static void ucb1x00_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct ucb1x00 *ucb = container_of(chip, struct ucb1x00, gpio);
+	struct ucb1x00 *ucb = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	spin_lock_irqsave(&ucb->io_lock, flags);
@@ -126,7 +126,7 @@ static void ucb1x00_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int ucb1x00_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct ucb1x00 *ucb = container_of(chip, struct ucb1x00, gpio);
+	struct ucb1x00 *ucb = gpiochip_get_data(chip);
 	unsigned val;
 
 	ucb1x00_enable(ucb);
@@ -138,7 +138,7 @@ static int ucb1x00_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 static int ucb1x00_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct ucb1x00 *ucb = container_of(chip, struct ucb1x00, gpio);
+	struct ucb1x00 *ucb = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	spin_lock_irqsave(&ucb->io_lock, flags);
@@ -154,7 +154,7 @@ static int ucb1x00_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 static int ucb1x00_gpio_direction_output(struct gpio_chip *chip, unsigned offset
 		, int value)
 {
-	struct ucb1x00 *ucb = container_of(chip, struct ucb1x00, gpio);
+	struct ucb1x00 *ucb = gpiochip_get_data(chip);
 	unsigned long flags;
 	unsigned old, mask = 1 << offset;
 
@@ -181,7 +181,7 @@ static int ucb1x00_gpio_direction_output(struct gpio_chip *chip, unsigned offset
 
 static int ucb1x00_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct ucb1x00 *ucb = container_of(chip, struct ucb1x00, gpio);
+	struct ucb1x00 *ucb = gpiochip_get_data(chip);
 
 	return ucb->irq_base > 0 ? ucb->irq_base + offset : -ENXIO;
 }
@@ -579,7 +579,7 @@ static int ucb1x00_probe(struct mcp *mcp)
 		ucb->gpio.direction_input = ucb1x00_gpio_direction_input;
 		ucb->gpio.direction_output = ucb1x00_gpio_direction_output;
 		ucb->gpio.to_irq = ucb1x00_to_irq;
-		ret = gpiochip_add(&ucb->gpio);
+		ret = gpiochip_add_data(&ucb->gpio, ucb);
 		if (ret)
 			goto err_gpio_add;
 	} else
-- 
2.4.3

