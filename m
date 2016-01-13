From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: CP2105 GPIO Pins
Date: Wed, 13 Jan 2016 15:58:24 +0100
Message-ID: <CACRpkda_qbxeeFW4XdoJqaN_-wyB2cgHcLjr8XUDtdZBv+MvRw@mail.gmail.com>
References: <568F9A17.809@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:32942 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751052AbcAMO6Z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jan 2016 09:58:25 -0500
Received: by mail-ob0-f174.google.com with SMTP id is5so56824529obc.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jan 2016 06:58:25 -0800 (PST)
In-Reply-To: <568F9A17.809@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.co.uk>, Johan Hovold <johan@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

(Adding Johan Hovold, serial-usb-maintainer)

On Fri, Jan 8, 2016 at 12:14 PM, Martyn Welch
<martyn.welch@collabora.co.uk> wrote:

> I'm working on adding support to the cp210x driver for the optional GPIO
> pins available on Silicon Labs CP2105 USB to serial bridge.

Do you have a data sheet?

> Some hardware implementation details have got me wondering how best to
> provide support through the GPIO framework.
>
> The device has 5 pins that can be GPIO. The pins that provide these GPIO are
> muxed with serial control signals of the 2 serial ports the device provides,
> though the GPIO is enabled by default.

I don't get it? Do you mean that the two serial ports will be able on
some serial port pins and then *also* on these extra pins in this
case, or do you mean that this is the only way for the serial
lines to get out of the chip?

In any case, multiplexing is really a task for the pin control
framework, if you desire to switch this muxing at runtime.

If you don't ever want to change the muxing from the default, just don't
implement muxing and us it as-is.

> The GPIO pins can be configured as either push-pull or open-drain, with a
> internal weak pullup. The pins are open-drain by default. There is no
> explicit "input" mode, though it is possible to sense the state of the pin
> independent of the state being driven.

OK so no high impedance input state?

These modes are better controlled by pin control, but if you
have only these modes, the GPIO subsystem will suffice.

> Configuration of the muxing and GPIO mode is stored in one-time programmable
> PROM built into the chip and can't be changed at runtime.

OK no runtime muxing then.

> The muxing is done for all pins associated with a port in one go. I think I
> can determine at runtime when pins are used as serial control signals, so
> currently have the pins split into 2 banks (each bank providing the GPIO
> from pins associated with a port).
>
> I believe I can also determine when pins are configured as push-pull or
> open-drain. Pins configured as push-pull clearly can't be used as inputs.
> Pins in open-drain mode, if not internally pulled to ground, could be used
> as an input.

OK how do you determine this then?

Isn't it possible to read/query the PROM about the settings?

> I can allow open-drain pins to be configured as input (and arrange for the
> pin to not be pulled low when it is), but the GPIO documentation suggests
> that the output state of GPIO should be able to be set prior to switching
> between input and output mode.

I don't think there is such a rule. We cannot dictate how hardware
works. Seems like good hardware design, but it is really not our
pick.

> This could be achieved by storing a bit masks
> of values and directions, however this would require locking to avoid race
> conditions and the documentation also suggests that locking should be
> avoided in the get, set and direction functions, so that the drivers can be
> used by and -RT kernel (I appreciate this a USB device, so less likely to be
> used in a real time context).

I don't quite get this. The talk about the RT kernel is about irqchips.
This adapter doesn't support interrupts does it?

For gpio_chips, see the flag .can_sleep.

> If such a scheme really isn't suitable, alternatively the pins could be
> output only, with the user still being able to sense the pin state as long
> as the pin is not set to pull the pin low. The disadvantage of not allowing
> the pins to be configured as input is that users will (ironically) not be
> able to use one of the pins with the "GPIOF_OPEN_DRAIN" flag set as this
> attempts to set the pin as input instead of a high state.
> "GPIOF_OPEN_SOURCE" is broken on this hardware either way.

I think this problem goes away if you look closely.

Yours,
Linus Walleij
