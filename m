From: Michael Trimarchi <michael@amarulasolutions.com>
Subject: Re: BGPIOF_READ_OUTPUT_REG_SET problem
Date: Thu, 17 Dec 2015 10:04:43 +0100
Message-ID: <CAOf5uwm=Q7v0_wFEVzoZmF0fOM16q2NMu8PzPoaNTbkJT1+hNw@mail.gmail.com>
References: <20151216140456.GA20121@panicking>
	<CACRpkda1amCEXiUTrCEYxJgeCDx4jWi3Ka25fELaGTjimAuFjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:33458 "EHLO
	mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752450AbbLQJEo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Dec 2015 04:04:44 -0500
Received: by mail-io0-f173.google.com with SMTP id 186so49162854iow.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Dec 2015 01:04:44 -0800 (PST)
In-Reply-To: <CACRpkda1amCEXiUTrCEYxJgeCDx4jWi3Ka25fELaGTjimAuFjA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi


On Thu, Dec 17, 2015 at 10:00 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Wed, Dec 16, 2015 at 3:05 PM, Michael Trimarchi
> <michael@amarulasolutions.com> wrote:
>
>> I have get a problem using gpio and imx6q freescale architecture. I don't
>> really understand how should work your change and I have done a quick
>> fix for me. Can you explain what was the idea?
>>
>> Michael
>>
>> diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
>> index a3f0753..f9c6ff7 100644
>> --- a/drivers/gpio/gpio-generic.c
>> +++ b/drivers/gpio/gpio-generic.c
>> @@ -139,11 +139,14 @@ static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
>>  {
>>         struct bgpio_chip *bgc = to_bgpio_chip(gc);
>>         unsigned long pinmask = bgc->pin2mask(bgc, gpio);
>> +       unsigned long reg;
>>
>>         if (bgc->dir & pinmask)
>> -               return bgc->read_reg(bgc->reg_set) & pinmask;
>> +               reg = bgc->read_reg(bgc->reg_set) & pinmask;
>>         else
>> -               return bgc->read_reg(bgc->reg_dat) & pinmask;
>> +               reg = bgc->read_reg(bgc->reg_dat) & pinmask;
>> +
>> +       return !!(reg &  bgc->pin2mask(bgc, gpio));
>>  }
>
> This looks identical to this fix I have queued for fixes:
> https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git/commit/?h=fixes&id=21f2856498ff09a03ebc8f9ff7581451a221d81b
>

Good, so I can confirm that it's urgent

Michael

> Yours,
> Linus Walleij



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
