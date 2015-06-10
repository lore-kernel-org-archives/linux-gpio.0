From: Hanjun Guo <hanjun.guo@linaro.org>
Subject: [PATCH] GPIO / ACPI: export acpi_gpiochip_request(free)_interrupts for module use
Date: Wed, 10 Jun 2015 17:12:07 +0800
Message-ID: <1433927527-9980-1-git-send-email-hanjun.guo@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:36550 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933207AbbFJJMh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2015 05:12:37 -0400
Received: by pdjm12 with SMTP id m12so33675050pdj.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2015 02:12:37 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Y Vo <yvo@apm.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Hanjun Guo <hanjun.guo@linaro.org>

acpi_gpiochip_request(free)_interrupts can be used for modules,
so export them. This also fixs a compile error when xgene-sb
configured as kernel module.

Fixes: 733cf014f020 "gpio: xgene: add ACPI support for APM X-Gene GPIO standby driver"
Signed-off-by: Hanjun Guo <hanjun.guo@linaro.org>
---
 drivers/gpio/gpiolib-acpi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 19b99d0..980a996 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -307,6 +307,7 @@ void acpi_gpiochip_request_interrupts(struct gpio_chip *chip)
 	acpi_walk_resources(handle, "_AEI",
 			    acpi_gpiochip_request_interrupt, acpi_gpio);
 }
+EXPORT_SYMBOL_GPL(acpi_gpiochip_request_interrupts);
 
 /**
  * acpi_gpiochip_free_interrupts() - Free GPIO ACPI event interrupts.
@@ -346,6 +347,7 @@ void acpi_gpiochip_free_interrupts(struct gpio_chip *chip)
 		kfree(event);
 	}
 }
+EXPORT_SYMBOL_GPL(acpi_gpiochip_free_interrupts);
 
 int acpi_dev_add_driver_gpios(struct acpi_device *adev,
 			      const struct acpi_gpio_mapping *gpios)
-- 
1.9.1

