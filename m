From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] ACPI / gpio: do not fall back to parsing _CRS when we get a
 deferral
Date: Thu, 23 Mar 2017 13:21:38 -0700
Message-ID: <20170323202138.GA11912@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:34705 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752299AbdCWUVm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2017 16:21:42 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

If, while locating GPIOs by name, we get probe deferral, we should
immediately report it to caller rather than trying to fall back to parsing
unnamed GPIOs from _CRS block.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-acpi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index a3faefa44f68..d3f9f028a37b 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -572,8 +572,10 @@ struct gpio_desc *acpi_find_gpio(struct device *dev,
 		}
 
 		desc = acpi_get_gpiod_by_index(adev, propname, idx, &info);
-		if (!IS_ERR(desc) || (PTR_ERR(desc) == -EPROBE_DEFER))
+		if (!IS_ERR(desc))
 			break;
+		if (PTR_ERR(desc) == -EPROBE_DEFER)
+			return ERR_CAST(desc);
 	}
 
 	/* Then from plain _CRS GPIOs */
-- 
2.12.1.500.gab5fba24ee-goog


-- 
Dmitry
