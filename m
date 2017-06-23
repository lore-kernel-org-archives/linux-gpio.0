From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] gpio: acpi: Skip _AEI entries without a handler rather then aborting the scan
Date: Fri, 23 Jun 2017 09:26:13 +0200
Message-ID: <20170623072613.3768-1-hdegoede@redhat.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:50992 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753611AbdFWH0h (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Jun 2017 03:26:37 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org

acpi_walk_resources will stop as soon as the callback passed in returns
an error status. On a x86 tablet I have the first GpioInt in the _AEI
resource list has no handler defined in the DSDT, causing
acpi_walk_resources to abort scanning the rest of the resource list,
which does define valid ACPI GPIO events.

This commit changes the return for not finding a handler from
AE_BAD_PARAMETER to AE_OK so that the rest of the resource list will
get scanned normally in case of missing event handlers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpio/gpiolib-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 5b77248666fa..fd53e9ada7dd 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -201,7 +201,7 @@ static acpi_status acpi_gpiochip_request_interrupt(struct acpi_resource *ares,
 			handler = acpi_gpio_irq_handler_evt;
 	}
 	if (!handler)
-		return AE_BAD_PARAMETER;
+		return AE_OK;
 
 	pin = acpi_gpiochip_pin_to_gpio_offset(chip->gpiodev, pin);
 	if (pin < 0)
-- 
2.13.0

