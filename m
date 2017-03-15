From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: acpi: Ignore -EPROBE_DEFER for unselected gpioints
Date: Wed, 15 Mar 2017 11:31:36 +0100
Message-ID: <CACRpkdb68FrQdx2TL2cRybCWLPvaDjcPNk3VZWGEeAeCWZwBQg@mail.gmail.com>
References: <20170313220421.27314-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:34485 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751195AbdCOKbi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2017 06:31:38 -0400
Received: by mail-io0-f180.google.com with SMTP id b140so17088070iof.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2017 03:31:38 -0700 (PDT)
In-Reply-To: <20170313220421.27314-1-hdegoede@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Mar 13, 2017 at 11:04 PM, Hans de Goede <hdegoede@redhat.com> wrote:

> When acpi_dev_gpio_irq_get gets called with an index of say 2, it should
> not care if acpi_get_gpiod for index 0 or 1 returns -EPROBE_DEFER.
>
> This allows drivers which request a gpioint with index > 0 to function
> if there is no gpiochip driver (loaded) for gpioints with a lower index.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I am dependent on Mika and Rafael to review ACPI/GPIO patches,
maybe I should just put in a special entry to MAINTAINERS for
this file... anyway let's see what they say.

Yours,
Linus Walleij
