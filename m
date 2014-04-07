From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH v2] gpio: zevio: Get correct gpio output value
Date: Tue, 08 Apr 2014 07:59:39 +0800
Message-ID: <1396915179.4729.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:48628 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754695AbaDGX7o (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Apr 2014 19:59:44 -0400
Received: by mail-pd0-f169.google.com with SMTP id fp1so179015pdb.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2014 16:59:44 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Gerhard Sittig <gsi@denx.de>, Fabian Vogt <fabian@ritter-vogt.de>, linux-gpio@vger.kernel.org

Read gpio output value from ZEVIO_GPIO_OUTPUT.
The spin_lock is required to ensure the direction is not changed before reading
input/ouput value.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-zevio.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
index 9bf5034..29b0150 100644
--- a/drivers/gpio/gpio-zevio.c
+++ b/drivers/gpio/gpio-zevio.c
@@ -81,9 +81,15 @@ static inline void zevio_gpio_port_set(struct zevio_gpio *c, unsigned pin,
 static int zevio_gpio_get(struct gpio_chip *chip, unsigned pin)
 {
 	struct zevio_gpio *controller = to_zevio_gpio(chip);
+	u32 val, dir;
 
-	/* Only reading allowed, so no spinlock needed */
-	u32 val = zevio_gpio_port_get(controller, pin, ZEVIO_GPIO_INPUT);
+	spin_lock(&controller->lock);
+	dir = zevio_gpio_port_get(controller, pin, ZEVIO_GPIO_DIRECTION);
+	if (dir & BIT(ZEVIO_GPIO_BIT(pin)))
+		val = zevio_gpio_port_get(controller, pin, ZEVIO_GPIO_INPUT);
+	else
+		val = zevio_gpio_port_get(controller, pin, ZEVIO_GPIO_OUTPUT);
+	spin_unlock(&controller->lock);
 
 	return (val >> ZEVIO_GPIO_BIT(pin)) & 0x1;
 }
-- 
1.8.3.2



