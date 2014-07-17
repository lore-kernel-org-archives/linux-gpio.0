From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] gpio: Add support for GPIOF_ACTIVE_LOW to gpio_request_one
Date: Wed, 16 Jul 2014 23:37:48 -0700
Message-ID: <53C76F3C.6090104@roeck-us.net>
References: <1405552260-30511-1-git-send-email-linux@roeck-us.net> <CAAVeFuLtUpKKVWAvJ-bw_b36jYFhrzaWeswnJKyehbwn=6y+4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.205]:49579 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751802AbaGQGhu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Jul 2014 02:37:50 -0400
In-Reply-To: <CAAVeFuLtUpKKVWAvJ-bw_b36jYFhrzaWeswnJKyehbwn=6y+4Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On 07/16/2014 11:09 PM, Alexandre Courbot wrote:
> On Thu, Jul 17, 2014 at 8:11 AM, Guenter Roeck <linux@roeck-us.net> wrote:
>> The gpio include file and the gpio documentation declare and document
>> GPIOF_ACTIVE_LOW as one of the flags to be passed to gpio_request_one
>> and related functions. However, the flag is not evaluated or used.
>>
>> Check the flag in gpio_request_one and set the gpio internal flag
>> FLAG_ACTIVE_LOW if it is set.
>
> What is the point since the integer GPIO API has no clue of the
> active-low status of a GPIO? It is only used by the gpiod and sysfs
> interfaces.
>

One can use gpio_request_one() to export a gpio pin to user space from
the kernel. That code path does use the flag, as you point out yourself above.

One could also argue that the integer gpio API _should_ support this as well,
but that is a different question.

Guenter

>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   drivers/gpio/gpiolib.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index 2ebc907..43d9e34 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -1842,6 +1842,9 @@ int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
>>          if (flags & GPIOF_OPEN_SOURCE)
>>                  set_bit(FLAG_OPEN_SOURCE, &desc->flags);
>>
>> +       if (flags & GPIOF_ACTIVE_LOW)
>> +               set_bit(FLAG_ACTIVE_LOW, &desc->flags);
>> +
>>          if (flags & GPIOF_DIR_IN)
>>                  err = gpiod_direction_input(desc);
>>          else
>> --
>> 1.9.1
>>
>
>

