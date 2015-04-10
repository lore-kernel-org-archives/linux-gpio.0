From: Axel Lin <axel.lin@ingics.com>
Subject: Re: [RFT][PATCH 2/2] gpio: bcm-kona: Implement get_direction callback
Date: Sat, 11 Apr 2015 07:13:48 +0800
Message-ID: <CAFRkauCN9HQhcO+rhxUmqb=weYnup2CxxBgEBTMswUrOpkeErw@mail.gmail.com>
References: <1428629325.5384.1.camel@phoenix>
	<1428629414.5384.2.camel@phoenix>
	<5527F6AE.9010502@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f42.google.com ([209.85.215.42]:34639 "EHLO
	mail-la0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756496AbbDJXNu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Apr 2015 19:13:50 -0400
Received: by laat2 with SMTP id t2so23272140laa.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2015 16:13:48 -0700 (PDT)
In-Reply-To: <5527F6AE.9010502@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list@broadcom.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

2015-04-11 0:13 GMT+08:00 Ray Jui <rjui@broadcom.com>:
> Hi Axel,
>
> On 4/9/2015 6:30 PM, Axel Lin wrote:
>> Implement gpio_chip's get_direction() callback, that lets other drivers get
>> particular GPIOs direction using gpiod_get_direction().
>>
>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>> ---
>>  drivers/gpio/gpio-bcm-kona.c | 24 ++++++++++++++----------
>>  1 file changed, 14 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
>> index 632352d..3649ed5 100644
>> --- a/drivers/gpio/gpio-bcm-kona.c
>> +++ b/drivers/gpio/gpio-bcm-kona.c
>> @@ -129,6 +129,14 @@ static int bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
>>       return 0;
>>  }
>>
>> +static int bcm_kona_gpio_get_dir(struct gpio_chip *chip, unsigned gpio)
>> +{
>> +     struct bcm_kona_gpio *kona_gpio = to_kona_gpio(chip);
>> +     void __iomem *reg_base = kona_gpio->reg_base;
>> +
>> +     return readl(reg_base + GPIO_CONTROL(gpio)) & GPIO_GPCTR0_IOTR_MASK;
>
> You are making assumption of actual values of GPIOF_DIR_IN and
> GPIOF_DIR_OUT. I think it would be better to return GPIOF_DIR_IN or
> GPIOF_DIR_OUT based on the register readling.

Yes, it's because GPIO_GPCTR0_IOTR_CMD_INPUT == GPIOF_DIR_IN and
GPIO_GPCTR0_IOTR_CMD_0UTPUT == GPIOF_DIR_OUT.

I can change it to below if you prefer, but current patch is shorter
and logically exactly the same.

if (readl(reg_base + GPIO_CONTROL(gpio)) & GPIO_GPCTR0_IOTR_MASK)
        return GPIOF_DIR_IN;
else
        return GPIOF_DIR_OUT;

>
> In addition, with your change, when bcm_kona_gpio_get_dir is called
> within bcm_kona_gpio_set and bcm_kona_gpio_get, it's protected by the
> kona_gpio->lock spinlock. But no lock protection while being invoked
> through the upper layer get_direction callback.

It is because bcm_kona_gpio_get_dir is a single register read.
In bcm_kona_gpio_set/bcm_kona_gpio_get, the lock is to ensure
read/write to both the DIR and LEVEL registers so we won't set/get
wrong level value in wrong DIR status.

Regards,
Axel
