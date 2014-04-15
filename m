From: Axel Lin <axel.lin@ingics.com>
Subject: Re: [PATCH] gpio: kempld: Fix autoloading of module
Date: Wed, 16 Apr 2014 07:46:04 +0800
Message-ID: <CAFRkauBCtx2VvwX0R+HKLa9fiER6FbNzC0RaTkJvqosKRdRy5g@mail.gmail.com>
References: <1397277918.29335.1.camel@phoenix>
	<5349709B.6030004@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qc0-f179.google.com ([209.85.216.179]:36428 "EHLO
	mail-qc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750885AbaDOXqF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Apr 2014 19:46:05 -0400
Received: by mail-qc0-f179.google.com with SMTP id m20so11146801qcx.38
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2014 16:46:04 -0700 (PDT)
In-Reply-To: <5349709B.6030004@roeck-us.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Brunner <michael.brunner@kontron.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

2014-04-13 0:58 GMT+08:00 Guenter Roeck <linux@roeck-us.net>:
> On 04/11/2014 09:45 PM, Axel Lin wrote:
>>
>> Make the module alias match the platform device name, so gpio-kempld
>> module
>> should now autoload correctly.
>>
>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>> ---
>>   drivers/gpio/gpio-kempld.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
>> index c6d8817..ebe1023 100644
>> --- a/drivers/gpio/gpio-kempld.c
>> +++ b/drivers/gpio/gpio-kempld.c
>> @@ -216,4 +216,4 @@ module_platform_driver(kempld_gpio_driver);
>>   MODULE_DESCRIPTION("KEM PLD GPIO Driver");
>>   MODULE_AUTHOR("Michael Brunner <michael.brunner@kontron.com>");
>>   MODULE_LICENSE("GPL");
>> -MODULE_ALIAS("platform:gpio-kempld");
>> +MODULE_ALIAS("platform:kempld-gpio");
>>
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>
> Wonder though if the module alias is necessary in the first place,
> as the driver is instantiated from the mfd driver.

The mfd driver calls mfd_add_devices() to add kempld-gpio device.
In the case if kempld-gpio driver is built as a module and not yet
be loaded to the system, the module alias is required to make module
autoloading work.

Regards,
Axel
