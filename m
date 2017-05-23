From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: crystalcove: Do not write regular gpio registers
 for virtual GPIOs
Date: Tue, 23 May 2017 10:03:38 +0200
Message-ID: <CACRpkdY_77AfrD0yrBWffY8_rEyacfa+RrmEJeW-vktk9C+4jw@mail.gmail.com>
References: <20170513123953.22142-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:36220 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759927AbdEWIDk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2017 04:03:40 -0400
Received: by mail-io0-f173.google.com with SMTP id o12so92599879iod.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2017 01:03:39 -0700 (PDT)
In-Reply-To: <20170513123953.22142-1-hdegoede@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Aaron Lu <aaron.lu@intel.com>

On Sat, May 13, 2017 at 2:39 PM, Hans de Goede <hdegoede@redhat.com> wrote:

> The Crystal Cove PMIC has 16 real GPIOs but the ACPI code for devices
> with this PMIC may address up to 95 GPIOs, these extra GPIOs are
> called virtual GPIOs and are used by the ACPI code as a method of
> accessing various non GPIO bits of PMIC.
>
> Commit dcdc3018d635 ("gpio: crystalcove: support virtual GPIO") added
> dummy support for these to avoid a bunch of ACPI errors, but instead of
> ignoring writes / reads to them by doing:
>
> if (gpio >= CRYSTALCOVE_GPIO_NUM)
>         return 0;
>
> It accidentally introduced the following wrong check:
>
> if (gpio > CRYSTALCOVE_VGPIO_NUM)
>         return 0;
>
> Which means that attempts by the ACPI code to access these gpios
> causes some arbitrary gpio to get touched through for example
> GPIO1P0CTLO + gpionr % 8.
>
> Since we do support input/output (but not interrupts) on the 0x5e
> virtual GPIO, this commit makes to_reg return -ENOTSUPP for unsupported
> virtual GPIOs so as to not have to check for (gpio >= CRYSTALCOVE_GPIO_NUM
> && gpio != 0x5e) everywhere and to make it easier to add support for more
> virtual GPIOs in the future.
>
> It then adds a check for to_reg returning an error to all callers where
> this may happen fixing the ACPI code accessing virtual GPIOs accidentally
> causing changes to real GPIOs.
>
> Cc: Aaron Lu <aaron.lu@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Patch applied for fixes with Andy's review tag and
the suggested Fixes: tag.

Yours,
Linus Walleij
