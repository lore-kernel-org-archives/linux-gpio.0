From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 14/54] gpio: pch: Be sure to clamp return value
Date: Tue, 5 Jan 2016 10:46:06 +0100
Message-ID: <CACRpkdZBpENiiJe7GQE8xZQVZUi8Ehgzn05D0Vy+guuwK+LPVg@mail.gmail.com>
References: <1450794054-22948-1-git-send-email-linus.walleij@linaro.org>
	<20160104104141.14cf44d9@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:33454 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751539AbcAEJqI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2016 04:46:08 -0500
Received: by mail-oi0-f49.google.com with SMTP id y66so271415921oig.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2016 01:46:07 -0800 (PST)
In-Reply-To: <20160104104141.14cf44d9@endymion.delvare>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Daniel Krueger <daniel.krueger@systec-electronic.com>

On Mon, Jan 4, 2016 at 10:41 AM, Jean Delvare <jdelvare@suse.de> wrote:
> On Tue, 22 Dec 2015 15:20:54 +0100, Linus Walleij wrote:
>> As we want gpio_chip .get() calls to be able to return negative
>> error codes and propagate to drivers, we need to go over all
>> drivers and make sure their return values are clamped to [0,1].
>> We do this by using the ret = !!(val) design pattern.
>>
>> Cc: Thierry Reding <treding@nvidia.com>
>> Cc: Daniel Krueger <daniel.krueger@systec-electronic.com>
>> Cc: Jean Delvare <jdelvare@suse.de>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>>  drivers/gpio/gpio-pch.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
>> index af0715f8524b..8c45b74dcf21 100644
>> --- a/drivers/gpio/gpio-pch.c
>> +++ b/drivers/gpio/gpio-pch.c
>> @@ -127,7 +127,7 @@ static int pch_gpio_get(struct gpio_chip *gpio, unsigned nr)
>>  {
>>       struct pch_gpio *chip = container_of(gpio, struct pch_gpio, gpio);
>>
>> -     return ioread32(&chip->reg->pi) & (1 << nr);
>> +     return !!(ioread32(&chip->reg->pi) & (1 << nr));
>>  }
>>
>>  static int pch_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
>
> I would prefer:
>
>         return (ioread32(&chip->reg->pi) >> nr) & 1;
>
> which is faster for the same result.
>
> At x86 assembly level, your approach requires 5 CPU instructions (mov,
> shl, test, setne and movzbl), mine only 2 CPU instructions (shr and
> and.)

I was mainly going over and fixing all drivers with the simplest
pattern I can think of, already merged this as it was a regression
basically, but a patch based on my GPIO devel branch or Linux-next
to fix it the way you want it would be
appreciated.

Yours,
Linus Walleij
