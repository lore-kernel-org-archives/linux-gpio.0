From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [REGRESSION] mux/gpio.c is not able to get any gpio pins
Date: Wed, 17 Jan 2018 14:27:56 +0100
Message-ID: <CACRpkdZ8JYoY4nJe8n8zDaY2Lcu3BRPRpzxkv=v4FC7T2zYdiA@mail.gmail.com>
References: <6c711f96-e412-f7a6-125b-59c61829d802@axentia.se>
 <CACRpkdZ0zDhxrNoAaytpr2cfMxTNZ4zj+U4WcZSQgVReuUQ=9g@mail.gmail.com>
 <69f82f18-8334-1b88-97ee-04f77ea1ee03@axentia.se> <CACRpkdZz1NqRXtNUUPP8cCkLWo4p6SBBqHV0joXOadN40KjYFg@mail.gmail.com>
 <ba2e879c-3b44-e31e-055f-bf7ccd7961aa@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f170.google.com ([209.85.220.170]:34433 "EHLO
        mail-qk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752791AbeAQN16 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jan 2018 08:27:58 -0500
Received: by mail-qk0-f170.google.com with SMTP id b76so25228104qkc.1
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jan 2018 05:27:58 -0800 (PST)
In-Reply-To: <ba2e879c-3b44-e31e-055f-bf7ccd7961aa@axentia.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: Andrew Jeffery <andrew@aj.id.au>, Charles Keepax <ckeepax@opensource.cirrus.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jan 17, 2018 at 11:39 AM, Peter Rosin <peda@axentia.se> wrote:
> On 2018-01-17 10:35, Linus Walleij wrote:

>> I would first try to add the gpio range in the DTS. Then the
>> GPIO core will add the range (the code is in drivers/gpio/gpiolib-of.c)
>> and everything will be happy.
>
> If I, in the above mentioned node, add
>
>                 gpio-ranges = <&ioexp 0 0 8>;
>
> it works.

OK good.

>> Another solution would be to do what Intel does and add a
>> static GPIO range. Since the SX150x doesn't seem very
>> configurable wrt pins-to-gpios mappings, this should be fine.
>
> Adding the below on top of the previous pinctrl/gpiochip reshuffle
> also works (with the dt change reverted, of course).

I think we should probably just do this.

> please state where you want that pinctrl_enable
> call; together with devm_pinctrl_register_and_init (or perhaps
> just use plain old deprecated devm_pinctrl_register), or at the
> end of the probe, after the gpio init block?

Definately before the gpio init, since GPIO is making use
of pin control.

I would put it immediatelt after devm_pinctrl_register_and_init()
unless you need something specific to happen inbetween.

Yours,
Linus Walleij
