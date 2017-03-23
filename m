From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 3/6] pinctrl: armada-37xx: Add gpio support
Date: Thu, 23 Mar 2017 15:47:38 +0100
Message-ID: <87efxodp85.fsf@free-electrons.com>
References: <20161222172501.16121-1-gregory.clement@free-electrons.com>
        <20161222172501.16121-4-gregory.clement@free-electrons.com>
        <CACRpkdY_68=5oBN3TLs_ohc0gc2=yiG3qizg7MGh4F7Z+-ZzSg@mail.gmail.com>
        <874lylfrw5.fsf@free-electrons.com>
        <CACRpkdZm9rBN==TrLFw=dMvwnu5URis4eQAG5j8OiSm=1c3EZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:42501 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751256AbdCWOrk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2017 10:47:40 -0400
In-Reply-To: <CACRpkdZm9rBN==TrLFw=dMvwnu5URis4eQAG5j8OiSm=1c3EZQ@mail.gmail.com>
        (Linus Walleij's message of "Thu, 23 Mar 2017 11:28:55 +0100")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Terry Zhou <bjzhou@marvell.com>

Hi Linus,
 
 On jeu., mars 23 2017, Linus Walleij <linus.walleij@linaro.org> wrote:


>>>> +       ret = gpiochip_add_pin_range(&info->gpio_chip, dev_name(dev), 0,
>>>> +                                    pinbase, info->data->nr_pins);
>>>> +       if (ret)
>>>> +               return ret;
>>>
>>> Why do you do this?
>>>
>>> Why not just put the ranges into the device tree? We already support
>>> this in the gpiolib core and it is helpful.
>>>
>>> See Documentation/devicetree/bindings/gpio/gpio.txt
>>> and other DTS files for gpio-ranges.
>>
>> Following your review, I tried to use it but it didn't work for
>> me. When the second pin controller was probed then there was collision
>> for the gpio number. I tried several combination without any luck.
>
> That sounds like a bug. Are you using dynamic GPIO number
> assignments?

I managed to use it, the issue was that I register the gpio before the
pinctrl. The call to gpiochip_add_pin_range() was done before both
registration in my initial call so it was not a problem. When I switched
to the gpio-ranges, this call was done from the gpiochip_add_data(), and
in this case it has tt be called after devm_pinctrl_register().

So I am about sending a new version using gpio-ranges.

Thanks,

Gregory

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
