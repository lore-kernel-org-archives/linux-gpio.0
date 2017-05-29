From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Right amount of info in the DT
Date: Mon, 29 May 2017 12:02:00 +0200
Message-ID: <CACRpkdY8Lfum4ahKrmvbtNDn9JZeZ1xi0eAsXdF9-8h4+VKaRA@mail.gmail.com>
References: <29e00f75-9f30-8a6f-c2da-43a59cc1f134@sigmadesigns.com>
 <CACRpkdZ_QmZ=Sjub8DPfHkCkU5m=PYxfWgVPzBCFbYvj-BH4HQ@mail.gmail.com>
 <815d2f8e-2e85-31d7-4f69-b89b7be79d9e@sigmadesigns.com> <CACRpkdY2Q1tcX40C8JLfa110pyMhzpxmJj41RqTt+MOwcoFxyw@mail.gmail.com>
 <d8d9f35c-a901-dc77-646e-ea09836ee9cf@sigmadesigns.com> <CACRpkdaZWh24SSCSeaM3NeLkiLSkyTYzDVkQmzj33=6m4qMraw@mail.gmail.com>
 <0409ece2-dce3-d77f-f8e5-50fe96aaea1a@sigmadesigns.com> <CACRpkdbB9kUaRbm-=1c_kzZ9p2ghh==HNb-8vkGkF3Zrx0rr_Q@mail.gmail.com>
 <42ae4b79-9917-3f9d-8962-d09fbe8c9b1c@sigmadesigns.com> <CACRpkdZg--owpSdpyGUzHKNDS+Wk9juvobGiCNt4vsMEytNPaQ@mail.gmail.com>
 <526a19bc-932a-3f84-eaf7-03c0b67bae2f@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:36780 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750863AbdE2KCD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 06:02:03 -0400
Received: by mail-it0-f54.google.com with SMTP id o5so24579031ith.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 03:02:02 -0700 (PDT)
In-Reply-To: <526a19bc-932a-3f84-eaf7-03c0b67bae2f@sigmadesigns.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thibaud Cornic <thibaud_cornic@sigmadesigns.com>
Cc: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mason <slash.tmp@free.fr>

On Wed, May 24, 2017 at 11:41 AM, Thibaud Cornic
<thibaud_cornic@sigmadesigns.com> wrote:

> Right now, Yves works on the GPIOs, and he'd like to be able to support all the GPIOs of the chip, even those
> which are muxed with the UART/smart card/other IPs pins.
> For example, we have a UART2 IP, which pins can be used as GPIOs or for the UART functionality.
> The registers which toggle the GPIO/UART "mode" of these pins are in the address range of the UART block.

OK I see.

> Does your answer mean that you won't allow any other code than a UART driver to touch those registers?

No.

Your answer seems to reflect an organizational problem though:
https://en.wikipedia.org/wiki/Stovepipe_(organisation)

> Which would mean that to be able to use those pins as GPIOs, Yves must first submit the UART driver and DT node,
> then modify it to somehow expose a GPIO functionality?

What is needed is first a proper DT represenation and second a driver.

I think this:

uart {
    compatible = "...";
    ...
    pinctrl-gpio {
        compatible = "...";
        ...
    };
};

Is going to be the pattern you want to solidify first. Then you can think
about how to engineer the driver(s).

>>> Furthermore, even if I had a driver for a device whose pins can also be GPIOs, say smartcard.
>>> If the driver is built as a module, and has not been yet loaded in, then, since you want the pinctrl
>>> node has a child node, no gpiochip struct could have been registered, and the pins can't be used
>>> as GPIOs. Does this mean that to use the smartcard's pin as GPIOs, the smartcard driver must
>>> absolutely be loaded, even though smartcards are never used?

>> I do not understand this remark. If the GPIOs are provided by the smartcard IP block inside your
>> chip, yes then it makes sense to spawn the GPIO driver as part of the smartcard driver.

> Let's talk about UART instead (as there's no real use case for a dynamic switch of pin usage on the board between
> the smart card and something else).
> The remark is: when the UART driver is loaded, it will start using the pins in the UART mode. And this driver is not
> designed to serve GPIO requests. It seems like a big modification to add this (like a wrapper completely disabling the
> function for which that driver has been written).
> Do we need to do this for all the drivers which control pins which can be used as GPIOs?

There are tons of UART drivers out there asking separate pin control
drivers to provide
them the pins they use.

What you need is to abstract out the pin control portions and let the
UART driver
grab these.

Linux already grabs the "default" pin control setting for any driver
right before
it calls probe() on the driver, see drivers/base/pinctrl.c

The pin control resources need to be created from an orthogonal driver,
whether the addresses used by this driver are in the same range as the
UART is not important, it however seems that it needs to be instantiated
before the UART driver and they can hardly be one and the same. This
is a Linux shortcoming augmented by deferred probe and other mechanisms
such as initcall reordering (shudder).

> I had imagined that the pin controller driver would be the one writing in the "pin mode" registers, wherever they might
> be located,

That is one way to do it. But another way to do it is to instantiate one
pin controller per pin mode register range. Do whatever you think becomes
most elegant.

> and we would add "pin request" calls in the other drivers (UART, smart card) which would tell the pin
> controller to put those pins in the UART/smart card mode, and not allow gpio requests to them.

The "default" mode will be requested automatically. If you need more pin modes,
you need to request them using explicit code.

>> Usually the GPIO hardware is a separate IP block from any others (such as smartcard)
>> so this situation seldom occurs.
>
> Really? I imagine we're not the only company adding muxes to use certain IP pins as GPIOs.

That is usually controlled by a register range specifically dedicated
to pins and GPIOs,
and not intermingled with the register range for the other IP as seems
to be your case.

So they see the "pad ring" as a device. Essentially it is usually constructed by
stacking together control lines to the I/O cells into a register range
just for that
purpose.

Much like so:
https://dflund.se/~triad/papers/pincontrol.pdf

> And those muxes a necessarily placed in those IP blocks, which (depending on the interconnect)
> will force the mux register address to be in the IP address range.

I've heard about this before but noone ever submitted a driver for that.
(I'm sorry you are the first, being first always sucks.)

>> Is you system such that there is an IO range for something like a smart card, and
>> then that IO range also contains registers for reusing some or all pins as GPIO?
>
> Yes exactly. It contains the register to reuse the smart card pins as GPIOs.
> And let's say the ethernet IO range contains the regs to reuse the ethernet pins.

Interesting. That is a first, or a second I heard, or something.

>> Then yes, we usually write a driver for this whole IP block and let it expose a
>>  gpiochip as part of its main function.
>
> On top of my other remarks above, what if the driver is completely standard?

Better to have the pin control driver separate. Sorry if I was wrong about that.

But I don't know whether to:

(A) Try to collect the address ranges from all over the place into one driver.

(B) Try to create one instance of a pin controller per IP

I'd like to see some code in the direction you choose I guess. Either should
work, I just don't know how to do (A) in an elegant manner, nor how to
instantiate (B) in a nice way, so some challenges there.

Yours,
Linus Walleij
