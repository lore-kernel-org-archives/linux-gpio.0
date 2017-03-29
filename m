From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] ACPI / gpio: do not fall back to parsing _CRS when we get
 a deferral
Date: Wed, 29 Mar 2017 18:33:22 +0200
Message-ID: <8eb1f4c1-61b2-1670-9ee2-086e2ea15cda@redhat.com>
References: <20170323202138.GA11912@dtor-ws>
 <1490713442.708.33.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:62318 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752264AbdC2Qd0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Mar 2017 12:33:26 -0400
In-Reply-To: <1490713442.708.33.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

HI,

On 28-03-17 17:04, Andy Shevchenko wrote:
> On Thu, 2017-03-23 at 13:21 -0700, Dmitry Torokhov wrote:
>> If, while locating GPIOs by name, we get probe deferral, we should
>> immediately report it to caller rather than trying to fall back to
>> parsing
>> unnamed GPIOs from _CRS block.
>
> +Cc: Hans.
>
> Hans, do have any objections on this? Would you ideally give your
> Tested-by?

Looks good to me and also does not seem to break anything on my test
devices, so:

Acked-and-Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


>
>>
>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> ---
>>  drivers/gpio/gpiolib-acpi.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
>> index a3faefa44f68..d3f9f028a37b 100644
>> --- a/drivers/gpio/gpiolib-acpi.c
>> +++ b/drivers/gpio/gpiolib-acpi.c
>> @@ -572,8 +572,10 @@ struct gpio_desc *acpi_find_gpio(struct device
>> *dev,
>>  		}
>>
>>  		desc = acpi_get_gpiod_by_index(adev, propname, idx,
>> &info);
>> -		if (!IS_ERR(desc) || (PTR_ERR(desc) ==
>> -EPROBE_DEFER))
>> +		if (!IS_ERR(desc))
>>  			break;
>> +		if (PTR_ERR(desc) == -EPROBE_DEFER)
>> +			return ERR_CAST(desc);
>>  	}
>>
>>  	/* Then from plain _CRS GPIOs */
>> --
>> 2.12.1.500.gab5fba24ee-goog
>>
>>
>
