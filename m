From: Michael Brunner <mibru@gmx.de>
Subject: [PATCH] gpio: gpio-kempld: Fix get_direction return value
Date: Mon, 11 May 2015 12:46:49 +0200
Message-ID: <20150511124649.1221e86e@hyperion>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:61908 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751058AbbEKKrB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 11 May 2015 06:47:01 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Jochen Henneberg <jh@henneberg-systemdesign.com>, Michael Brunner <michael.brunner@kontron.com>, Darren Hart <dvhart@linux.intel.com>, Kevin Strasser <kevin.strasser@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>

This patch fixes an inverted return value of the gpio get_direction
function.

The wrong value causes the direction sysfs entry and GPIO debugfs file
to indicate incorrect GPIO direction settings. In some cases it also
prevents setting GPIO output values.

The problem is also present in all other stable kernel versions since
linux-3.12.

Reported-by: Jochen Henneberg <jh@henneberg-systemdesign.com>
Signed-off-by: Michael Brunner <michael.brunner@kontron.com>
---
 drivers/gpio/gpio-kempld.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index 6b8115f..83f281d 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -117,7 +117,7 @@ static int kempld_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 		= container_of(chip, struct kempld_gpio_data, chip);
 	struct kempld_device_data *pld = gpio->pld;
 
-	return kempld_gpio_get_bit(pld, KEMPLD_GPIO_DIR_NUM(offset), offset);
+	return !kempld_gpio_get_bit(pld, KEMPLD_GPIO_DIR_NUM(offset), offset);
 }
 
 static int kempld_gpio_pincount(struct kempld_device_data *pld)
-- 
1.8.5.1
