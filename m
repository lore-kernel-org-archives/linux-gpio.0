From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/6] pinctrl: armada-37xx: Add gpio support
Date: Thu, 23 Mar 2017 11:28:55 +0100
Message-ID: <CACRpkdZm9rBN==TrLFw=dMvwnu5URis4eQAG5j8OiSm=1c3EZQ@mail.gmail.com>
References: <20161222172501.16121-1-gregory.clement@free-electrons.com>
 <20161222172501.16121-4-gregory.clement@free-electrons.com>
 <CACRpkdY_68=5oBN3TLs_ohc0gc2=yiG3qizg7MGh4F7Z+-ZzSg@mail.gmail.com> <874lylfrw5.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:37687 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753755AbdCWK25 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2017 06:28:57 -0400
Received: by mail-it0-f48.google.com with SMTP id 190so37538029itm.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2017 03:28:56 -0700 (PDT)
In-Reply-To: <874lylfrw5.fsf@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Terry Zhou <bjzhou@marvell.com>

On Wed, Mar 22, 2017 at 12:54 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:
>  On ven., d=C3=A9c. 30 2016, Linus Walleij <linus.walleij@linaro.org> wro=
te:

>>> +       mask =3D BIT(offset);
>>> +
>>> +       regmap_read(info->regmap, reg, &val);
>>>
>>> +       return (val & mask) =3D=3D 0;
>>
>> Use this:
>>
>> return !(val & mask);
>
> done but I could tou explain the advantage of doing it?

The other controllers do it so makes the code easier to
perceptualize.

>>> +       ret =3D gpiochip_add_pin_range(&info->gpio_chip, dev_name(dev),=
 0,
>>> +                                    pinbase, info->data->nr_pins);
>>> +       if (ret)
>>> +               return ret;
>>
>> Why do you do this?
>>
>> Why not just put the ranges into the device tree? We already support
>> this in the gpiolib core and it is helpful.
>>
>> See Documentation/devicetree/bindings/gpio/gpio.txt
>> and other DTS files for gpio-ranges.
>
> Following your review, I tried to use it but it didn't work for
> me. When the second pin controller was probed then there was collision
> for the gpio number. I tried several combination without any luck.

That sounds like a bug. Are you using dynamic GPIO number
assignments?

Yours,
Linus Walleij
