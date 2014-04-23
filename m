From: Axel Lin <axel.lin@ingics.com>
Subject: Re: [PATCH 1/2] gpio: rdc321x: Fix off-by-one for ngpio setting
Date: Wed, 23 Apr 2014 22:00:25 +0800
Message-ID: <CAFRkauAB9qDrMBsg4aP=bHbAfufuesc2=K7D2XBvDAQUJ=oF+Q@mail.gmail.com>
References: <1397196885.12922.2.camel@phoenix>
	<CACRpkdYU7QjQz76c7N07LSowEcXak6dT0G0VpuCTWPzGdAgPqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qg0-f41.google.com ([209.85.192.41]:43642 "EHLO
	mail-qg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751921AbaDWOAe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Apr 2014 10:00:34 -0400
Received: by mail-qg0-f41.google.com with SMTP id j107so278214qga.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2014 07:00:33 -0700 (PDT)
In-Reply-To: <CACRpkdYU7QjQz76c7N07LSowEcXak6dT0G0VpuCTWPzGdAgPqA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Florian Fainelli <florian@openwrt.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

2014-04-23 21:25 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:
> On Fri, Apr 11, 2014 at 8:14 AM, Axel Lin <axel.lin@ingics.com> wrote:
>
>> The valid gpio is GPIO0 ~ GPIO58, so ngpio should be RDC321X_MAX_GPIO + 1.
>>
>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> (...)
>> -       rdc321x_gpio_dev->chip.ngpio = pdata->max_gpios;
>> +       rdc321x_gpio_dev->chip.ngpio = pdata->max_gpios + 1;
>
> This is counter-intuitive. "max_gpios" should be a name for the
> maximum number of gpios right? Not the maximum number of
> GPIOs minus one!
>
> It is better to patch include/linux/mfd/rdc321x.h:
>
> -#define RDC321X_MAX_GPIO    58
> +#define RDC321X_MAX_GPIO    59
Hi Linus,

I'm wondering if it is better to define RDC321X_NUM_GPIO  (59) rather
than RDC321X_MAX_GPIO.
How do you think?

Regards,
Axel
