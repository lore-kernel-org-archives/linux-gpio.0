From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v1] usb: phy: generic: migrate to gpio_desc
Date: Mon, 1 Dec 2014 13:01:32 +0900
Message-ID: <CAAVeFuKHFTuMYS4G468YoCZ-JgaT3zV8ObZ6AHcg06H0yVBgig@mail.gmail.com>
References: <1415535787-21868-1-git-send-email-robert.jarzmik@free.fr>
 <20141121154358.GF7508@saruman> <CACRpkdZtwYb77ytGiadFnZAUOkr8y_HPQoM3vmXBc+N6dszAJw@mail.gmail.com>
 <87bnno1lbj.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:41488 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752326AbaLAEBx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Nov 2014 23:01:53 -0500
In-Reply-To: <87bnno1lbj.fsf@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>, Felipe Balbi <balbi@ti.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Dec 1, 2014 at 5:32 AM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Linus Walleij <linus.walleij@linaro.org> writes:
>
>> This definately make things better so:
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Thanks.
>
>> One comment though:
>>
>>>>       if (dev->of_node) {
>> (...)
>>>> +             nop->gpiod_reset = devm_gpiod_get(dev, "reset-gpios");
>>>> +             err = PTR_ERR(nop->gpiod_reset);
>>>>       } else if (pdata) {
>> (...)
>>>> +             err = devm_gpio_request_one(dev, pdata->gpio_reset, 0,
>>>> +                                         dev_name(dev));
>>>> +             if (!err)
>>>> +                     nop->gpiod_reset = gpio_to_desc(pdata->gpio_reset);
>>>> +     }
>
>> So a next step would be to add support for getting the
>> devm_gpiod_get(dev, "reset-gpios"); outside of the if (dev->of_node)
>> clause, and possibly convert the board files for affected
>> platforms to use descriptors, if they will not be replaced by
>> device tree only.
>
> OK, if we were to do this, is there a way to build a static platform data with a
> gpio descriptor ?
> Ie. can I write something like :
> struct generic_phy_pdata {
>         struct gpio_desc *reset_gpio;
> };
>
> And in machine code :
> static struct generic_phy_pdata usb_phy __initdata {
>        .reset_gpio = XXX(19),
> };
>
> What should "XXX" be like to describe reset_gpio as a ACTIVE_HIGH gpio number 19
> ?

I think what you want to do is explained in the "Platform Data"
section of Documentation/gpio/board.txt
