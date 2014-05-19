From: Yegor Yefremov <yegorslists@googlemail.com>
Subject: Re: sysfs: wait for GPIO interrupt
Date: Mon, 19 May 2014 12:54:30 +0200
Message-ID: <CAGm1_kuLPC__09jEJyVmjNyYOEygZCz5nNF5aTPO=WMA55xg+A@mail.gmail.com>
References: <CAGm1_kuKvjAguez85MKWk+gw5T4-oa8thHEao6Rz0nES-woYiA@mail.gmail.com>
 <CABxcv=k7QTiNWNbHTLFKkjHdgk9o9xB4E4uq75wuKyvXYhqWMQ@mail.gmail.com>
 <CACRpkdZU+P_8NK_YX6aqcp5WtbAzgv7V73Uzj0_RxAQaQgaDzg@mail.gmail.com>
 <CAGm1_kuZGs0=hzPwUs7aC34PQVn7pL2r7V_rdbwXAtwCHxXBkA@mail.gmail.com>
 <CABxcv=m8go203DcdAy6kdQm0=vOo9TxFSKKdt1bwDMbW_72W-g@mail.gmail.com>
 <CACRpkdZcDQPKxehZkPjeJ5yGsHPs_xvDu0Mn5UgE-azCi4m=-Q@mail.gmail.com> <CABxcv=nev4vuD9VAwZvcZJX9VXJa5czeF=8Zr1yaVV=oa5GZ8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:46711 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754370AbaESKyw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 19 May 2014 06:54:52 -0400
Received: by mail-lb0-f171.google.com with SMTP id 10so3876365lbg.16
        for <linux-gpio@vger.kernel.org>; Mon, 19 May 2014 03:54:50 -0700 (PDT)
In-Reply-To: <CABxcv=nev4vuD9VAwZvcZJX9VXJa5czeF=8Zr1yaVV=oa5GZ8w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, jack@embed.me.uk

On Fri, May 16, 2014 at 7:28 PM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:
> Hello Linus,
>
> Thanks a lot for your explanations.
>
> On Fri, May 16, 2014 at 6:43 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Wed, May 14, 2014 at 11:32 AM, Javier Martinez Canillas
>> <javier@dowhile0.org> wrote:
>>
>>> If Linus agrees that a better GPIO interface that model the GPIO
>>> operations can be developed using a set of ioctl commands or netlink
>>> sockets I'll be very glad to help with the implementation.
>>
>> That needs to be discussed with the wider kernel community and will
>> be a quite daunting task. But if you have the geist, do go ahead. Involved
>> people would include Grant Likely and Greg Kroah-Hartmann.
>>
>
> If the correct approach is to drive the hardware using the GPIO from
> the kernel then I think that is better to not add another interface
> that can be (ab)used from user-space.
>
> It would be nice if Yegor can give more details about the device that
> are using those GPIO and what he wants to achieve from user-space to
> see if an existing device driver can be used or in any case if a
> generic driver can be written like is done for GPIO leds, keys, etc.

Let's take VScom Alekto 2 (http://www.visionsystems.de/produkte/6820.html).

It has a combi RS232/422/485 driver IC, that has 4 configuration
inputs to set one of the desired modes. These pins are connected via
GPIOs (SoC GPIOs or i2c GPIO expander doesn't matter). The user can
configure these option at run-time. Now he can make it via sysfs by
exporting these GPIOs, setting them to output and changing their
values. What would be the proper kernel driver/interface for this
purpose.

It also has an IO connector with configurable inputs and outputs. The
problem here it has somewhat complicated structure, because you can
switch direction of the IO pins but this involves enabling/disabling
some hardware ICs. The whole mechanism is  hidden from user through a
library, but the library itself is still using sysfs.

As for simple designs where the direction of the pins is fixed the
keys driver can be used for inputs, what were the proper driver for
outputs (relays etc.)?

>>> On a related note I see that people are asking how they can mux a SoC
>>> pin in GPIO mode in order to use the GPIO sysfs interface. For example
>>> take a look to this thread [0].
>>
>> Pin control shall be handled in the kernel.
>>
>>> When OMAP was not using pinctrl-single but a custom driver for pin
>>> configuration there was a debugfs interface
>>> (/sys/kernel/debug/omap_mux) that allowed to change the pin mux setup.
>>
>> If people want to do crazy stuff from userspace and they use
>> debugfs for that, they should be aware what the rules of debugfs
>> is: it is *NOT* an ABI! We may break that just because we feel
>> like it.
>>
>
> Yeah, that interface was not secure either since iirc you could change
> any padconf setup hence making devices that relied on a certain pin
> mux mode to not work anymore.
>
>> There are no plans for a proper userspace interface for pin control,
>> if that is desired an even bigger undertaking than moving GPIOs to
>> ioctl():s etc will be needed.
>>
>> But here, too, I think the real answer is: edit device tree files.
>>
>
> Perfect, as I said on a previous email it can be done by editing the
> device tree file, I just wanted to double check with you if that was
> the suggested approach for doing this.
>
> Yegor, it seems you got your answer :-)

Yegor
