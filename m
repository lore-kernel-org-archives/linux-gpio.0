From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 0/4] gpio: pxa: integrate with pincontrol
Date: Thu, 10 Dec 2015 08:28:19 +0100
Message-ID: <87lh92kbjg.fsf@belgarion.home>
References: <1448746665-13422-1-git-send-email-robert.jarzmik@free.fr>
	<CACRpkdZ0JZOsU7VuFyeM8akWTKHjksEC3-wB4zrx0NJBRD+agQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:37537 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752465AbbLJH2W (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 02:28:22 -0500
In-Reply-To: <CACRpkdZ0JZOsU7VuFyeM8akWTKHjksEC3-wB4zrx0NJBRD+agQ@mail.gmail.com>
	(Linus Walleij's message of "Wed, 9 Dec 2015 23:58:22 +0100")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Mack <zonque@gmail.com>

Linus Walleij <linus.walleij@linaro.org> writes:

> On Sat, Nov 28, 2015 at 10:37 PM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>
>> Hi Linus, Alexandre and Haojian,
>>
>> This serie aims at several cleanups and improvements in the pxa gpio driver, to
>
> I have concerns about this series.
>
> I am worried that joining the banks into one gpio_chip makes it
> impossible for you GPIOLIB_IRQCHIP. Usually that is possible and
> preferrable when using a chained handler if e.g. one bank has
> one IRQ line.
>
> But overall that depends on how the IRQs map on this hardware.
> Can you describe how the GPIO IRQs work on the PXA27x?
Of course.

For PXA27x, there are 3 interrupts directly connected to the CPU of the SoC,
ie. the primary irq controller :
 - one is only triggered if GPIO0 has a rising/falling edge
 - one is only triggered if GPIO1 has a rising/falling edge
 - the last is triggered if any GPIOn has a rising/falling edge (n >= 2)

The condition to program the rising/falling edge which implies the interrupt to
be asserted is in a GPIO block register, GFER and GRER (1 bit per GPIO).

The fact that the last interrupt (let's call it gpiomux_irq) is triggered by
GPIOs from _all_ the banks makes me believe it's a single IP block, ie. a single
chip.

Now if you have concerns with this, then maybe you can advise another approach,
I'm pretty open. The final goal will be for me :
 - gpio and pinctrl have to cooperate
   - today, with the current state, it's impossible to map pins 0..127 to gpios
     0..127, at least in a device-tree .dts file
   - the GPDR (gpio direction register) shared access bothers me a bit

Cheers.

-- 
Robert
