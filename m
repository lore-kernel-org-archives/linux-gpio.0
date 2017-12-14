From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [RFC PATCH 3/7] gpio: gpiolib: save GPIO flags in of_get_named_gpiod_flags
Date: Thu, 14 Dec 2017 15:21:34 +0100
Message-ID: <20171214142138.23008-4-ludovic.desroches@microchip.com>
References: <20171214142138.23008-1-ludovic.desroches@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:11855 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752610AbdLNOXL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Dec 2017 09:23:11 -0500
In-Reply-To: <20171214142138.23008-1-ludovic.desroches@microchip.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>

When we get a GPIO descriptor from the device device, the flags
are updated for the caller to know if the GPIO is active low or
high. After calling of_get_named_gpio_flags the next step is
usually calling gpiod_request which doesn't take flags as a
parameter.
Updating the flags of the GPIO descriptor will allow to configure
the GPIO when it will be requested.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
 drivers/gpio/gpiolib-of.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 4a2b8d3397c7..67b1a7ff1e97 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -97,6 +97,8 @@ struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
 		 __func__, propname, np, index,
 		 PTR_ERR_OR_ZERO(desc));
 
+	gpiod_configure_flags(desc, propname, *flags, 0);
+
 out:
 	of_node_put(gpiospec.np);
 
-- 
2.12.2

