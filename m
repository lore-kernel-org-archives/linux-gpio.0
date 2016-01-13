From: Peter Hung <hpeter@gmail.com>
Subject: Re: [PATCH 2/2] gpio-f7188x: filter non-export gpio for F81866
Date: Wed, 13 Jan 2016 10:03:55 +0800
Message-ID: <5695B08B.1090200@gmail.com>
References: <1452584499-13939-1-git-send-email-hpeter+linux_kernel@gmail.com>
 <1452584499-13939-3-git-send-email-hpeter+linux_kernel@gmail.com>
 <CAHp75VctumwyOtLpqyCB3ABUu8ktwhN94POGdtS4Ug7cnuayEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:32938 "EHLO
	mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751849AbcAMCDy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jan 2016 21:03:54 -0500
In-Reply-To: <CAHp75VctumwyOtLpqyCB3ABUu8ktwhN94POGdtS4Ug7cnuayEg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, tom_tsai@fintek.com.tw, Peter H <peter_hong@fintek.com.tw>, Peter Hung <hpeter+linux_kernel@gmail.com>

Hi Andy,

Andy Shevchenko =E6=96=BC 2016/1/12 =E4=B8=8B=E5=8D=88 05:33 =E5=AF=AB=E9=
=81=93:
> On Tue, Jan 12, 2016 at 9:41 AM, Peter Hung <hpeter@gmail.com> wrote:
>> Dont export gpios which not enabled by motherboard manufacturer.
>
> 'Do not' or 'Don't'.
>
> Perhaps 'GPIOs'.
>
> 'which are not enabled'

OK.

>> +#define F81866_PORT_SEL_REG    0x27
>> +#define F81866_MULTI_FUN1_REG  0x28
>> +#define F81866_MULTI_FUN3_REG  0x29
>> +#define F81866_MULTI_FUN4_REG  0x2B
>> +#define F81866_GPIO_EN_REG     0x2C
>> +
>
> Move this before IDs block.

OK.


>> +static inline void superio_mask_outb(int base, int reg, int mask, i=
nt val)
>
> Usually we named such as _update or _update_bits.
> superio_update()

OK

>> +static int f81866_verify_gpioset(int base, int set)
>
> =E2=80=A6_gpio_verify() looks more suitable to the existing scheme.

OK

>> +                * manufacturer.
>> +                */
>> +               if (sio->type =3D=3D f81866 && f81866_verify_gpioset=
(sio->addr, i))
>> +                       continue;
>> +
>> +               dev_dbg(&pdev->dev, "%s: register GPIO%xx set\n", __=
func__,
>
> %x ?

Sorry for misunderstand. This section will print debug message as GPIO3=
x
set if GPIO3 set enabled, so I used %xx.

We are discussing about the patch with maintainer. It maybe drop if
don't need filter.

Thanks for your advices.
--=20
With Best Regards,
Peter Hung
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
