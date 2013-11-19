From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v1.2] gpiolib: append SFI helpers for GPIO API
Date: Tue, 19 Nov 2013 18:27:14 +0900
Message-ID: <528B2EF2.5010104@nvidia.com>
References: <1370440690-21898-1-git-send-email-andriy.shevchenko@linux.intel.com> <CACRpkdaP+tkJn8jcR_RaCz_c6hk66F8qde2KRiCzNyyLWUkgjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:4893 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751141Ab3KSJ1T (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2013 04:27:19 -0500
In-Reply-To: <CACRpkdaP+tkJn8jcR_RaCz_c6hk66F8qde2KRiCzNyyLWUkgjw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On 11/19/2013 06:24 PM, Linus Walleij wrote:
> On Wed, Jun 5, 2013 at 3:58 PM, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>
>> To support some (legacy) firmwares and platforms let's make life easier for
>> their customers.
>>
>> This patch extracts SFI GPIO API from arch/x86/platform/mrst/mrst.c.
>>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> So since this patch was ACKed the world has changed a bit and now
> I want new changes (or maybe I was tired and not paying enough
> attention at the time).
>
> (...)
>> +int sfi_get_gpio_by_name(const char *name)
>> +{
>> +       struct sfi_gpio_table_entry *pentry = sfi_gpio_table;
>> +       int i;
>> +
>> +       if (!pentry)
>> +               return -EINVAL;
>> +
>> +       for (i = 0; i < sfi_gpio_num_entry; i++, pentry++) {
>> +               if (!strncmp(name, pentry->pin_name, SFI_NAME_LEN))
>> +                       return pentry->pin_no;
>> +       }
>> +
>> +       return -ENODEV;
>> +}
>> +EXPORT_SYMBOL_GPL(sfi_get_gpio_by_name);
>
> Last merge window we merged the GPIO descriptor API and this
> is now the recommended way to handle GPIOs and it is also
> deployed into the ACPI and DT implementations.
>
> So I'd like the signature of this function changed to return
> a GPIO descriptor rather than an int so we don't stockpile more
> stuff to refactor.
>
> i.e.:
> struct gpio_desc *sfi_get_gpio_by_name(const char *name);
>
>   --- /dev/null
>> +++ b/include/linux/sfi_gpio.h
>
> Maybe that header could move to <linux/gpio/sfi.h> instead.
> Alexandre what do you think?

Agreed - all the GPIO drivers into drivers/gpio, all the headers into 
include/linux/gpio. Logical. :)

Alex.

