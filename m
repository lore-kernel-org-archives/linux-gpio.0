From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] gpio: Add support for GPIOF_ACTIVE_LOW to gpio_request_one
Date: Thu, 17 Jul 2014 07:34:11 -0700
Message-ID: <53C7DEE3.6060107@roeck-us.net>
References: <1405552260-30511-1-git-send-email-linux@roeck-us.net> <CAAVeFuLtUpKKVWAvJ-bw_b36jYFhrzaWeswnJKyehbwn=6y+4Q@mail.gmail.com> <53C76F3C.6090104@roeck-us.net> <CAAVeFuKC19AK8BjM7OBm=FWm0ua5YJXoGRkpOvM1TWkz9yOZ5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.205]:51937 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932930AbaGQOeN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Jul 2014 10:34:13 -0400
In-Reply-To: <CAAVeFuKC19AK8BjM7OBm=FWm0ua5YJXoGRkpOvM1TWkz9yOZ5Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On 07/17/2014 12:26 AM, Alexandre Courbot wrote:
> On Thu, Jul 17, 2014 at 3:37 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 07/16/2014 11:09 PM, Alexandre Courbot wrote:
>>>
>>> On Thu, Jul 17, 2014 at 8:11 AM, Guenter Roeck <linux@roeck-us.net> wrote:
>>>>
>>>> The gpio include file and the gpio documentation declare and document
>>>> GPIOF_ACTIVE_LOW as one of the flags to be passed to gpio_request_one
>>>> and related functions. However, the flag is not evaluated or used.
>>>>
>>>> Check the flag in gpio_request_one and set the gpio internal flag
>>>> FLAG_ACTIVE_LOW if it is set.
>>>
>>>
>>> What is the point since the integer GPIO API has no clue of the
>>> active-low status of a GPIO? It is only used by the gpiod and sysfs
>>> interfaces.
>>>
>>
>> One can use gpio_request_one() to export a gpio pin to user space from
>> the kernel. That code path does use the flag, as you point out yourself
>> above.
>
> Ok, in that case I suppose it makes sense.
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>
>> One could also argue that the integer gpio API _should_ support this as
>> well,
>> but that is a different question.
>
> Probably not going to happen. The integer GPIO interface is deprecated
> and users who need new features should seriously consider switching to
> gpiod.
>

The new API is unfortunately not equivalent to the old one. For example,
if I understand correctly, gpiod_get is expected to be used instead of
gpio_request_one. That may work nicely in a world with full DT or ACPI
support, but doesn't work as well otherwise unless one drops the notion
of using platform specific drivers built as modules (gpiod_add_lookup_table
is not exported, and there is no remove function).

Specifically, I don't see an easy way to convert mdio-gpio to use the new
model, and that driver could really use support for an API which supports
active-low pins. And even if gpiod_add_lookup_table was supported,
converting a driver like this would be a major pain. Sure, it would be
all easy if there would be a gpiod equivalent to gpio_request_one and
gpio_request_array, but that is not the case. This makes converting
drivers from the old to the new model challenging enough that I suspect
that it won't really happen.

Guenter

