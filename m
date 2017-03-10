From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 0/2] gpio: acpi: acpi_dev_gpio_irq_get: ignore the status of unselected irqs
Date: Fri, 10 Mar 2017 21:58:44 +0100
Message-ID: <20170310205846.16530-1-hdegoede@redhat.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:44316 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750897AbdCJU6u (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 Mar 2017 15:58:50 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org

Hi All,

While trying to get a driver working for a device where I want to
only use the irq in the acpi resources with index 1, and we do not
have a driver for the gpiochip with the irq with index 0 yet,
I hit this problem that acpi_dev_gpio_irq_get will bail with
-EPROBE_DEFER because it cannot get a gpio_desc for index 0,
this really should not be a problem when asking for index 1
and this series fixes this.

Note these patches apply on top of the gpiolib acpi work
Andy Shevchenko has been doing and as such may not apply
cleanly on top of current master / next.

Regards,

Hans

