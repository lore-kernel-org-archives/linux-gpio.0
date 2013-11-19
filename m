From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1.2] gpiolib: append SFI helpers for GPIO API
Date: Tue, 19 Nov 2013 10:24:22 +0100
Message-ID: <CACRpkdaP+tkJn8jcR_RaCz_c6hk66F8qde2KRiCzNyyLWUkgjw@mail.gmail.com>
References: <1370440690-21898-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:38359 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751869Ab3KSJYX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2013 04:24:23 -0500
Received: by mail-ob0-f173.google.com with SMTP id gq1so3184830obb.4
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2013 01:24:23 -0800 (PST)
In-Reply-To: <1370440690-21898-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Wed, Jun 5, 2013 at 3:58 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> To support some (legacy) firmwares and platforms let's make life easier for
> their customers.
>
> This patch extracts SFI GPIO API from arch/x86/platform/mrst/mrst.c.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

So since this patch was ACKed the world has changed a bit and now
I want new changes (or maybe I was tired and not paying enough
attention at the time).

(...)
> +int sfi_get_gpio_by_name(const char *name)
> +{
> +       struct sfi_gpio_table_entry *pentry = sfi_gpio_table;
> +       int i;
> +
> +       if (!pentry)
> +               return -EINVAL;
> +
> +       for (i = 0; i < sfi_gpio_num_entry; i++, pentry++) {
> +               if (!strncmp(name, pentry->pin_name, SFI_NAME_LEN))
> +                       return pentry->pin_no;
> +       }
> +
> +       return -ENODEV;
> +}
> +EXPORT_SYMBOL_GPL(sfi_get_gpio_by_name);

Last merge window we merged the GPIO descriptor API and this
is now the recommended way to handle GPIOs and it is also
deployed into the ACPI and DT implementations.

So I'd like the signature of this function changed to return
a GPIO descriptor rather than an int so we don't stockpile more
stuff to refactor.

i.e.:
struct gpio_desc *sfi_get_gpio_by_name(const char *name);

 --- /dev/null
> +++ b/include/linux/sfi_gpio.h

Maybe that header could move to <linux/gpio/sfi.h> instead.
Alexandre what do you think?

Yours,
Linus Walleij
