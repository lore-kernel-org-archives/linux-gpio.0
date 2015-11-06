From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] gpiolib: tighten up ACPI legacy gpio lookups
Date: Fri, 6 Nov 2015 00:25:34 -0800
Message-ID: <CAKdAkRSwLBtqUqEj+6gY5vDz5_UJQs=ruUnFfxQQyhDZgxQjyg@mail.gmail.com>
References: <20151105193838.GA33410@dtor-ws>
	<20151106080814.GS1509@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:34721 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757237AbbKFIZf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2015 03:25:35 -0500
In-Reply-To: <20151106080814.GS1509@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Johan Hovold <johan@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "Tirdea, Irina" <irina.tirdea@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On Fri, Nov 6, 2015 at 12:08 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Thu, Nov 05, 2015 at 11:38:38AM -0800, Dmitry Torokhov wrote:
>> We should not fall back to the legacy unnamed gpio lookup style if the
>> driver requests gpios with different names, because we'll give out the same
>> gpio twice. Let's keep track of the names that were used for the device and
>> only do the fallback for the first name used.
>>
>> Also disable fallback to _CRS gpios if ACPI device has DT-like
>> properties or driver-supplied gpio mappings.
>
> Thanks for taking care of this!
>
>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> ---
>>
>> This version incorporates changes suggested by Mika Westerberg in
>> response to the draft patch I posted in Goodix thread.
>>
>>  drivers/gpio/gpiolib.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 47 insertions(+)
>>
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index a18f00f..9631ee8 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -1841,6 +1841,50 @@ static struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
>>       return desc;
>>  }
>>
>> +struct acpi_gpio_lookup {
>> +     struct list_head node;
>> +     struct acpi_device *adev;
>> +     const char *con_id;
>> +};
>> +
>> +static DEFINE_MUTEX(acpi_gpio_lookup_lock);
>> +static LIST_HEAD(acpi_gpio_lookup_list);
>> +
>> +static bool acpi_can_fallback_to_crs(struct acpi_device *adev,
>> +                                  const char *con_id)
>> +{
>> +     struct acpi_gpio_lookup *l, *lookup = NULL;
>> +
>> +     /* Never fallback if the device has properties */
>> +     if (adev->data.properties || adev->driver_gpios)
>> +             return false;
>
> I missed the fact that struct acpi_device is declared in
> <acpi/acpi_bus.h> so we can't use the two fields directly here when
> !CONFIG_ACPI. Sorry about that.
>
> Do you think we can just add
>
> #ifdef CONFIG_ACPI
>
> #endif
>
> around the above check?
>
> Alternatively we could add an inline function to drivers/gpio/gpiolib.h
> like:
>
> #ifdef CONFIG_ACPI
> static inline bool acpi_gpio_has_properties(struct acpi_device *adev)
> {
>         return adev->data.properties || adev->driver_gpios;
> }
> #else
> static inline bool acpi_gpio_has_properties(struct acpi_device *adev)
> {
>         return false;
> }
> #endif
>

I wonder if I should move acpi_can_fallback_to_crs() into
gpiolib-acpi.c and provide a stub for it...

Thanks.

-- 
Dmitry
