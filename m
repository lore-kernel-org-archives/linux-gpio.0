From: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Subject: Re: [PATCH] gpio: take in account the active low flag when
 configuring the gpio as an ouput
Date: Tue, 11 Feb 2014 09:06:09 +0100
Message-ID: <CACh+v5Nj+qAD4LHXfX5=Ww_v5N9vvm=O_r29X3H1dKseeafauQ@mail.gmail.com>
References: <1392044614-6837-1-git-send-email-jjhiblot@traphandler.com>
	<CAAVeFuJ6BP4JnVb6qD1DYXqPQ3zBKw8hb+xLqcmUjktOxAjdGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 11.mo1.mail-out.ovh.net ([188.165.48.29]:46917 "EHLO
	mo1.mail-out.ovh.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750903AbaBKJYI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2014 04:24:08 -0500
Received: from mail170.ha.ovh.net (gw6.ovh.net [213.251.189.206])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 7CC7DFFCF4D
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2014 09:13:10 +0100 (CET)
In-Reply-To: <CAAVeFuJ6BP4JnVb6qD1DYXqPQ3zBKw8hb+xLqcmUjktOxAjdGA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Richard Genoud <richard.genoud@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Alexandre,

I somehow missed this one. Forget about my patch then.

Jean-Jacques

2014-02-11 5:22 GMT+01:00 Alexandre Courbot <gnurou@gmail.com>:
> On Tue, Feb 11, 2014 at 12:03 AM, Jean-Jacques Hiblot
> <jjhiblot@traphandler.com> wrote:
>> The initial value of the gpio is passed to gpiod_direction_output. Currently
>> this value is the raw value of the GPIO line, but it should be the logical
>> value.
>
> I think we have a patch that already does this:
>
> http://www.kernelhub.org/?msg=390263&p=2
>
> Linus said it would be merged for 3.15, but I am not seeing it in -next. Linus?
>
>>
>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
>> ---
>>  drivers/gpio/gpiolib.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index 4e10b10..111a1f1 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -1751,6 +1751,9 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
>>                 return -EINVAL;
>>         }
>>
>> +       if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
>> +               value = !value;
>> +
>>         /* GPIOs used for IRQs shall not be set as output */
>>         if (test_bit(FLAG_USED_AS_IRQ, &desc->flags)) {
>>                 gpiod_err(desc,
>> --
>> 1.8.5.3
>>
