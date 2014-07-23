From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: zynq: Take bank offset into account when
 reporting a IRQ
Date: Wed, 23 Jul 2014 16:22:59 +0200
Message-ID: <CACRpkdZQrh4sq6H8RSrSUk+vwu1akbs5CCKcMjs4uYfrhhTJnA@mail.gmail.com>
References: <1405677133-8706-1-git-send-email-lars@metafoo.de>
	<CAAVeFuLmLnbnnW50ne77SNAUwbu4pF=jycQ0_7ZgBH+i2uegHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:36760 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756556AbaGWOXA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Jul 2014 10:23:00 -0400
Received: by mail-oa0-f48.google.com with SMTP id m1so1686748oag.35
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2014 07:22:59 -0700 (PDT)
In-Reply-To: <CAAVeFuLmLnbnnW50ne77SNAUwbu4pF=jycQ0_7ZgBH+i2uegHA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michal Simek <michal.simek@xilinx.com>, Harini Katakam <harini.katakam@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Jul 19, 2014 at 6:14 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Fri, Jul 18, 2014 at 6:52 PM, Lars-Peter Clausen <lars@metafoo.de> wrote:

>> +static int zynq_gpio_get_bank_offset(unsigned int bank)
>> +{
>> +       switch (bank) {
>> +       case 0:
>> +               return ZYNQ_GPIO_BANK0_PIN_MIN;
>> +       case 1:
>> +               return ZYNQ_GPIO_BANK1_PIN_MIN;
>> +       case 2:
>> +               return ZYNQ_GPIO_BANK2_PIN_MIN;
>> +       case 3:
>> +               return ZYNQ_GPIO_BANK3_PIN_MIN;
>> +       default:
>> +               /* We'll never get here */
>> +               return -1;
>> +       }
>> +}
>
> Wouldn't this be handled better by a simple, static array? I.e.
>
> static int zynq_gpio_bank_offset[] = {
>         ZYNQ_GPIO_BANK0_PIN_MIN,
>         ZYNQ_GPIO_BANK1_PIN_MIN,
>         ZYNQ_GPIO_BANK2_PIN_MIN,
>         ZYNQ_GPIO_BANK3_PIN_MIN
> };
>
> ...
>
>         int bank offset = zynq_gpio_bank_offset(bank_num);

I agree, Lars-Peter can  you please rewrite the patch to do it this way instead.

Yours,
Linus Walleij
