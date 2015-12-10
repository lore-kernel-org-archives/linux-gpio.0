From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/4] gpio: pxa: integrate with pincontrol
Date: Thu, 10 Dec 2015 16:02:12 +0100
Message-ID: <CACRpkdZP=3mDWxoX6PRskztoeow41T9RgDyh82NP1=xnY+S1nQ@mail.gmail.com>
References: <1448746665-13422-1-git-send-email-robert.jarzmik@free.fr>
	<CACRpkdZ0JZOsU7VuFyeM8akWTKHjksEC3-wB4zrx0NJBRD+agQ@mail.gmail.com>
	<87lh92kbjg.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:33480 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751265AbbLJPCN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 10:02:13 -0500
Received: by oixx65 with SMTP id x65so47778577oix.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 07:02:13 -0800 (PST)
In-Reply-To: <87lh92kbjg.fsf@belgarion.home>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Mack <zonque@gmail.com>

On Thu, Dec 10, 2015 at 8:28 AM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Linus Walleij <linus.walleij@linaro.org> writes:
>
>> On Sat, Nov 28, 2015 at 10:37 PM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>>
>>> Hi Linus, Alexandre and Haojian,
>>>
>>> This serie aims at several cleanups and improvements in the pxa gpio driver, to
>>
>> I have concerns about this series.
>>
>> I am worried that joining the banks into one gpio_chip makes it
>> impossible for you GPIOLIB_IRQCHIP. Usually that is possible and
>> preferrable when using a chained handler if e.g. one bank has
>> one IRQ line.
>>
>> But overall that depends on how the IRQs map on this hardware.
>> Can you describe how the GPIO IRQs work on the PXA27x?
> Of course.
>
> For PXA27x, there are 3 interrupts directly connected to the CPU of the SoC,
> ie. the primary irq controller :
>  - one is only triggered if GPIO0 has a rising/falling edge
>  - one is only triggered if GPIO1 has a rising/falling edge
>  - the last is triggered if any GPIOn has a rising/falling edge (n >= 2)
>
> The condition to program the rising/falling edge which implies the interrupt to
> be asserted is in a GPIO block register, GFER and GRER (1 bit per GPIO).
>
> The fact that the last interrupt (let's call it gpiomux_irq) is triggered by
> GPIOs from _all_ the banks makes me believe it's a single IP block, ie. a single
> chip.

OK you're probably right. So GPIO0 and 1 are special cases and the
rest a muxed GPIO case. That's sufficiently odd to warrant its own
irqdomain and not use GPIOLIB_IRQCHIP.

I guess I will go ahead and merge this, simply.

> Now if you have concerns with this, then maybe you can advise another approach,
> I'm pretty open. The final goal will be for me :
>  - gpio and pinctrl have to cooperate
>    - today, with the current state, it's impossible to map pins 0..127 to gpios
>      0..127, at least in a device-tree .dts file

OK sounds good.

>    - the GPDR (gpio direction register) shared access bothers me a bit

How is it shared and between what users?

Yours,
Linus Walleij
