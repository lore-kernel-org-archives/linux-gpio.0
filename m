From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH 2/2] gpiolib: assign chip owner to dev->driver->owner if not set
Date: Thu, 25 Jun 2015 20:30:51 +0300
Message-ID: <1435253451-19817-2-git-send-email-grygorii.strashko@ti.com>
References: <1435253451-19817-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:56613 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751978AbbFYRa7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 25 Jun 2015 13:30:59 -0400
In-Reply-To: <1435253451-19817-1-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Sekhar Nori <nsekhar@ti.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, Johan Hovold <johan@kernel.org>

Assign GPIO chip owner field to chip->dev->driver->owner if it was not
configured by GPIO driver.

Cc: Johan Hovold <johan@kernel.org>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
Hi,

 There is also one positive additional side effect:
 lines like below can be removed from a lot of GPIO
 drivers
	rdc321x_gpio_dev->chip.owner = THIS_MODULE;

 drivers/gpio/gpiolib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9b1d247..d51af5d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -287,6 +287,9 @@ int gpiochip_add(struct gpio_chip *chip)
 	INIT_LIST_HEAD(&chip->pin_ranges);
 #endif
 
+	if (!chip->owner && chip->dev && chip->dev->driver)
+		chip->owner = chip->dev->driver->owner;
+
 	of_gpiochip_add(chip);
 	acpi_gpiochip_add(chip);
 
-- 
2.4.4

