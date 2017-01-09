From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/3] gpiolib: Update documentation of struct acpi_gpio_info
Date: Mon,  9 Jan 2017 16:02:27 +0200
Message-ID: <20170109140228.47613-3-andriy.shevchenko@linux.intel.com>
References: <20170109140228.47613-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:65412 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934979AbdAIOCi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Jan 2017 09:02:38 -0500
In-Reply-To: <20170109140228.47613-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Christophe RICARD <christophe.ricard@gmail.com>

It seems the code had been changed, but description left untouched.

Update description of the struct acpi_gpio_info and relative comments
accordingly.

Fixes: commit 52044723cd27 ("ACPI / gpio: Add irq_type when a GPIO is used as an interrupt")
Cc: Christophe RICARD <christophe.ricard@gmail.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 5 ++---
 drivers/gpio/gpiolib.h      | 3 ++-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index a3faefa44f68..9b37a3692b3f 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -416,9 +416,8 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 			agpio->connection_type == ACPI_RESOURCE_GPIO_TYPE_INT;
 
 		/*
-		 * ActiveLow is only specified for GpioInt resource. If
-		 * GpioIo is used then the only way to set the flag is
-		 * to use _DSD "gpios" property.
+		 * Polarity and triggering are only specified for GpioInt
+		 * resource.
 		 * Note: we expect here:
 		 * - ACPI_ACTIVE_LOW == GPIO_ACTIVE_LOW
 		 * - ACPI_ACTIVE_HIGH == GPIO_ACTIVE_HIGH
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index d10eaf520860..2495b7ee1b42 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -76,7 +76,8 @@ struct gpio_device {
 /**
  * struct acpi_gpio_info - ACPI GPIO specific information
  * @gpioint: if %true this GPIO is of type GpioInt otherwise type is GpioIo
- * @active_low: in case of @gpioint, the pin is active low
+ * @polarity: interrupt polarity as provided by ACPI
+ * @triggering: triggering type as provided by ACPI
  */
 struct acpi_gpio_info {
 	bool gpioint;
-- 
2.11.0

