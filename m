From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [RFC 1/2] gpio: make the GPIOs shareable
Date: Mon, 3 Feb 2014 18:27:46 +0900
Message-ID: <CAAVeFuL9ru0vL7S_caUGRLxPmag+enyCboYXMg+TVd3weZqrKw@mail.gmail.com>
References: <1391011876-7207-1-git-send-email-jjhiblot@traphandler.com> <1391011876-7207-2-git-send-email-jjhiblot@traphandler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vb0-f42.google.com ([209.85.212.42]:57200 "EHLO
	mail-vb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751941AbaBCJ2H (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Feb 2014 04:28:07 -0500
Received: by mail-vb0-f42.google.com with SMTP id i3so4593742vbh.29
        for <linux-gpio@vger.kernel.org>; Mon, 03 Feb 2014 01:28:06 -0800 (PST)
In-Reply-To: <1391011876-7207-2-git-send-email-jjhiblot@traphandler.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Jean-Jacques,

Sorry for taking so much time to reply, I had to go through the AT91
thread several times to (hopefully) get a clear idea of what you need.

On Thu, Jan 30, 2014 at 1:11 AM, Jean-Jacques Hiblot
<jjhiblot@traphandler.com> wrote:
> The patch implements a new requesting scheme for GPIOs that allow a gpio to be
> requested more than once.
>
> This new request scheme is:
> * only 1 user can request a GPIO with a full control over the direction of the
>   GPIO. Full control means being able to configure the gpio as an input or as
>   an ouput.
> * several users can request a GPIO with a limited control over the direction.
>   Limited control means: the gpio can be configured as an input if someone
>   doesn't have a full control of the direction. It can't be never be configured
>   as an output.
> * a GPIO used as an interrupt source can't be configured as an output.

So if I understand correctly (correct me if I don't), the problem is
that you need to be able to read the value of a GPIO that is currently
being used as an interrupt source. One example of this happening is
the touchscreen node of arch/arm/boot/dts/imx28-tx28.dts:

        touchscreen: tsc2007@48 {
                ...
                interrupt-parent = <&gpio3>;
                interrupts = <20 0>;
                pendown-gpio = <&gpio3 20 1>;
        };

While you are at it, you also want to allow a GPIO to be requested
several times as long as these requests are not conflicting (which is
a generalization of your initial need). This should probably be
considered dangerous for the integer-based interface, but with gpiod
GPIOs are now assigned by platform files or firmware, so this sounds
much more legitimate in this context.

> To achieve this, a unique gpio_desc is returned by gpiod_request. The old
> gpio_desc is replaced by a gpio_hw_desc. Integer name space is still supported
> and a gpio requested by its number is requested with full direction control.
>
> This patch is for RFC only. I feel that the API change need to be discussed
> before going further. Also there are probably some race conditions that are
> more important to fix now than when a gpio was an exclusive property.

If I understand your goals correctly, I believe they can be reached by
a simpler solution. For your initial problem the
at91_gpio_irq_domain_xlate() should obtain a GPIO descriptor and call
gpiod_lock_as_irq() on it. This will allow the GPIO from being
requested as input later. Currently it is not possible to obtain a
GPIO descriptor outside of gpiod_get() (which will request the GPIO at
the same time), but it should be acceptable to consider that the
holder of a gpio_chip * (either the GPIO driver itself, or in your
case the AT91 pinctrl driver) is priviledged and can get access to any
of the chip's descriptor through a new driver function (we already
discussed doing so in https://lkml.org/lkml/2013/10/8/823 ).

As for the multiple-consumer case, couldn't we avoid the complexity
introduced by the different kinds of descriptors by simply using read
and write reference counters in each GPIO descriptor? Basically a call
to gpiod_get() would always return the corresponding descriptor as
this means the GPIO is mapped. But when attempting to set the
direction, the reference counters are checked to confirm that this
would not put the GPIO into one of the forbidden cases (e.g. no write
if FLAG_USED_AS_IRQ is set, only one writer, but as many readers as we
want). This sounds like it could be implemented much more succintly,
and should (IIUC) do what you wanted.

But I feel like I might be missing the whole point of your initiative,
so please let me know what I did not get. :)

Alex.
