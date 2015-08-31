From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: gpiolib: use devm_* API to simplify driver code
Date: Mon, 31 Aug 2015 14:16:54 +0900
Message-ID: <CAAVeFuJJ_vv=3B1VgWQq+2PdfVkzbWON-c83RyoGZr2k0BW87A@mail.gmail.com>
References: <1440417930-15876-1-git-send-email-van.freenix@gmail.com> <55DC2997.9030705@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:35797 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750812AbbHaFRO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2015 01:17:14 -0400
In-Reply-To: <55DC2997.9030705@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Peng Fan <van.freenix@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Aug 25, 2015 at 5:38 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> On 08/24/2015 03:05 PM, Peng Fan wrote:
>>
>> Use devm_* API to simplify driver code.
>>
>> Signed-off-by: Peng Fan <van.freenix@gmail.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Alexandre Courbot <gnurou@gmail.com>
>
>  ---
>>
>>   drivers/gpio/gpiolib.c | 11 +++++------
>>   1 file changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index 6bc612b..f9470b0 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -243,7 +243,8 @@ int gpiochip_add(struct gpio_chip *chip)
>>         int             base = chip->base;
>>         struct gpio_desc *descs;
>>
>> -       descs = kcalloc(chip->ngpio, sizeof(descs[0]), GFP_KERNEL);
>> +       descs = devm_kcalloc(chip->dev, chip->ngpio, sizeof(descs[0]),
>> +                            GFP_KERNEL);
>
>
> ^ above will not work for every one as NOT all GPIO drivers
> implemented using dev/drv model, so chip->dev could be not set
> (at least it was true when I've checked it last time).

AFAICT that is still true as of today.
