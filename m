From: Michael Heimpold <mhei@heimpold.de>
Subject: Re: [PATCH] gpiolib: trim userspace representation of "value" to
 0/1
Date: Thu, 27 Mar 2014 07:48:51 +0000
Message-ID: <20140327074851.Horde.Bd6lZcHF3HwqgdzjVC2TZw3@www.mhei.heimpold.org>
References: <1395875378-28592-1-git-send-email-mhei@heimpold.de>
 <CAAVeFu+g-m8HFxEdXddRDu8uZAHAu=Ega4vCEcO=JLCrQuCuxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.219]:62644 "EHLO
	mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751524AbaC0Hsy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Mar 2014 03:48:54 -0400
In-Reply-To: <CAAVeFu+g-m8HFxEdXddRDu8uZAHAu=Ega4vCEcO=JLCrQuCuxw@mail.gmail.com>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org


Zitat von Alexandre Courbot <gnurou@gmail.com>:

> On Thu, Mar 27, 2014 at 8:09 AM, Michael Heimpold <mhei@heimpold.de> wrote:
>> According to Documentation/gpio/sysfs.txt:
>>   ...
>>   "value" ... reads as either 0 (low) or 1 (high).
>>
>> Since some gpio implementations return non-zero if GPIO is set
>> but not 1, filter the return value to fit the documentation.
>>
>> Signed-off-by: Michael Heimpold <mhei@heimpold.de>
>> ---
>>  drivers/gpio/gpiolib.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index 50c4922..45aa695 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -376,7 +376,7 @@ static ssize_t gpio_value_show(struct device *dev,
>>         if (!test_bit(FLAG_EXPORT, &desc->flags))
>>                 status = -EIO;
>>         else
>> -               status = sprintf(buf, "%d\n",  
>> gpiod_get_value_cansleep(desc));
>> +               status = sprintf(buf, "%d\n",  
>> !!gpiod_get_value_cansleep(desc));
>
> Patch 23600969ff137cf4c3bc9098f77e381de334e3f7 ("gpio: clamp returned
> values to the boolean range") in -next already takes care of this at a
> lower level, so I don't expect this to be needed?

Ah... seems I missed this patch, so yes we do not need this one.
Sorry for the noise.

Regards,
Michael



