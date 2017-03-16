From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: acpi: Ignore -EPROBE_DEFER for unselected gpioints
Date: Thu, 16 Mar 2017 15:48:21 +0100
Message-ID: <CACRpkda+z+5mQGgZTvT=dF3qUz1-axMCZyP7OCUDMfR9H8OrCg@mail.gmail.com>
References: <20170313220421.27314-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:37873 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753277AbdCPOsp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Mar 2017 10:48:45 -0400
Received: by mail-it0-f49.google.com with SMTP id g138so46232136itb.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Mar 2017 07:48:32 -0700 (PDT)
In-Reply-To: <20170313220421.27314-1-hdegoede@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
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

Patch applied with Mika's ACK.

Yours,
Linus Walleij
