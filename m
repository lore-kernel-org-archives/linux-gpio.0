From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 0/2] gpio: acpi: acpi_dev_gpio_irq_get: ignore the
 status of unselected irqs
Date: Mon, 13 Mar 2017 19:23:44 +0200
Message-ID: <1489425824.20145.223.camel@linux.intel.com>
References: <20170310205846.16530-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:65149 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753287AbdCMR0s (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Mar 2017 13:26:48 -0400
In-Reply-To: <20170310205846.16530-1-hdegoede@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org

On Fri, 2017-03-10 at 21:58 +0100, Hans de Goede wrote:
> Hi All,
> 
> While trying to get a driver working for a device where I want to
> only use the irq in the acpi resources with index 1, and we do not
> have a driver for the gpiochip with the irq with index 0 yet,
> I hit this problem that acpi_dev_gpio_irq_get will bail with
> -EPROBE_DEFER because it cannot get a gpio_desc for index 0,
> this really should not be a problem when asking for index 1
> and this series fixes this.
> 
> Note these patches apply on top of the gpiolib acpi work
> Andy Shevchenko has been doing and as such may not apply
> cleanly on top of current master / next.

I will incorporate slightly different version of this (due to changes
happened) into my branch. Please verify if everything is okay.

P.S. I'm going to push an updated branch within couple of hours.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
