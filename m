From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: Correct meaning of the GPIO active low flag
Date: Mon, 10 Feb 2014 23:50:40 +0900
Message-ID: <CAAVeFuLx7EdMRXN_f57zy=3MYrSJWk0N6MKkK+PrbAX+ivpJQg@mail.gmail.com>
References: <4298328.sSSAEV5F8t@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vb0-f52.google.com ([209.85.212.52]:38397 "EHLO
	mail-vb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751371AbaBJOvC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2014 09:51:02 -0500
Received: by mail-vb0-f52.google.com with SMTP id p14so4737724vbm.39
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2014 06:51:00 -0800 (PST)
In-Reply-To: <4298328.sSSAEV5F8t@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>

Hi Laurent,

On Mon, Feb 10, 2014 at 11:33 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Hello everybody,
>
> While working on Dt support for a driver that uses GPIO I came to ponder about
> the correct meaning of the GPIO active low flag. I'm bringing the question to
> the mailing list to get feedback.
>
> When a device has an active low input, the fact that the input is active low
> is a property of the device, and thus known to the driver. On the other hand,
> if an inverter is present on the board, that information isn't known to device
> drivers and need to be expressed in DT.
>
> Does the active low flag express the latter only, or both of them ? To ask the
> question differently, should the low flag model the inverter inside the
> device, known to the device driver, effectively moving handling of that
> inverter out of the device driver to the core code, or should it stop at the
> device boundary and only model the board ?

The intent behind the current behavior of the gpiod interface is to
avoid the need for code like this:

        if (pb->enable_gpio_flags & PWM_BACKLIGHT_GPIO_ACTIVE_LOW)
            gpio_set_value(pb->enable_gpio, 0);
        else
            gpio_set_value(pb->enable_gpio, 1);

which could simply be replaced by:

        gpiod_set_value(pb->enable_gpio, 1);

and the GPIO framework will invert the signal if needed according to
the active low property of the GPIO.

This behavior is based on the assumption that the active low flag
represents an inverter present on the board, and thus unknown to the
device driver. Now I just hope this assumption is correct. On the
other hand I'm not sure I would understand the need for it if it were
to model a property of the device, as the driver would be aware of it
anyway, and thus should not need to be told about it explicitly.

> As an example, if my device datasheet states that the reset input is active
> low, an no inverter is present on the GPIO line, should I set the GPIO active
> low flag in DT and set the GPIO value to 1 in software (assuming I use the
> gpiod_* API) to make the reset signal active, or should I set the GPIO active
> high flag in DT and the the GPIO value to 0 in software ?

If your datasheet explicitly states that the reset input is active
low, then this fact should be captured by the compatible property
already (since the active low status is true for each and every
compatible device) and I don't think your node would need to state it
in addition. Unless, of course, there is an inverter on the way.

This is my understanding but let's see what others have to say and
let's also make sure to update the documentation to lift the
ambiguity. :)

Alex.
