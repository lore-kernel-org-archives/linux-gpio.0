From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH 4/9] gpio: Add 'name' to the gpio descriptor struct
Date: Fri, 17 Jul 2015 11:32:45 +0200
Message-ID: <1437125570-28623-5-git-send-email-mpa@pengutronix.de>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:42316 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757310AbbGQJdd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2015 05:33:33 -0400
In-Reply-To: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>

The latest gpio hogging mechanism assigns each gpio a 'line-name' in the
devicetree. The 'name' field is different from the 'label' field.
'label' is only used for requested GPIOs to describe its current use by
driver or userspace.

The 'name' field describes the GPIO itself, not the use. This is most
likely identical to the label in the schematic on the GPIO line and
should help to find this particular GPIO.

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 drivers/gpio/gpiolib.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index bf343004b008..78e634d1c719 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -89,7 +89,10 @@ struct gpio_desc {
 #define FLAG_USED_AS_IRQ 9	/* GPIO is connected to an IRQ */
 #define FLAG_IS_HOGGED	11	/* GPIO is hogged */
 
+	/* Connection label */
 	const char		*label;
+	/* Name of the GPIO */
+	const char		*name;
 };
 
 int gpiod_request(struct gpio_desc *desc, const char *label);
-- 
2.1.4

