From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Correct meaning of the GPIO active low flag
Date: Mon, 10 Feb 2014 16:13:48 +0100
Message-ID: <4393209.8DixYUVG1z@avalon>
References: <4298328.sSSAEV5F8t@avalon> <CAAVeFuLx7EdMRXN_f57zy=3MYrSJWk0N6MKkK+PrbAX+ivpJQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([95.142.166.194]:40004 "EHLO
	perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751449AbaBJPMr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2014 10:12:47 -0500
In-Reply-To: <CAAVeFuLx7EdMRXN_f57zy=3MYrSJWk0N6MKkK+PrbAX+ivpJQg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>

Hi Alexander,

Thank you for your quick answer.

On Monday 10 February 2014 23:50:40 Alexandre Courbot wrote:
> On Mon, Feb 10, 2014 at 11:33 PM, Laurent Pinchart wrote:
> > Hello everybody,
> > 
> > While working on Dt support for a driver that uses GPIO I came to ponder
> > about the correct meaning of the GPIO active low flag. I'm bringing the
> > question to the mailing list to get feedback.
> > 
> > When a device has an active low input, the fact that the input is active
> > low is a property of the device, and thus known to the driver. On the
> > other hand, if an inverter is present on the board, that information
> > isn't known to device drivers and need to be expressed in DT.
> > 
> > Does the active low flag express the latter only, or both of them ? To ask
> > the question differently, should the low flag model the inverter inside
> > the device, known to the device driver, effectively moving handling of
> > that inverter out of the device driver to the core code, or should it
> > stop at the device boundary and only model the board ?
> 
> The intent behind the current behavior of the gpiod interface is to
> avoid the need for code like this:
> 
>         if (pb->enable_gpio_flags & PWM_BACKLIGHT_GPIO_ACTIVE_LOW)
>             gpio_set_value(pb->enable_gpio, 0);
>         else
>             gpio_set_value(pb->enable_gpio, 1);
> 
> which could simply be replaced by:
> 
>         gpiod_set_value(pb->enable_gpio, 1);
> 
> and the GPIO framework will invert the signal if needed according to
> the active low property of the GPIO.

Yes, I had got that so far.

> This behavior is based on the assumption that the active low flag
> represents an inverter present on the board, and thus unknown to the
> device driver. Now I just hope this assumption is correct. On the
> other hand I'm not sure I would understand the need for it if it were
> to model a property of the device, as the driver would be aware of it
> anyway, and thus should not need to be told about it explicitly.
> 
> > As an example, if my device datasheet states that the reset input is
> > active low, an no inverter is present on the GPIO line, should I set the
> > GPIO active low flag in DT and set the GPIO value to 1 in software
> > (assuming I use the gpiod_* API) to make the reset signal active, or
> > should I set the GPIO active high flag in DT and the the GPIO value to 0
> > in software ?
> 
> If your datasheet explicitly states that the reset input is active low, then
> this fact should be captured by the compatible property already (since the
> active low status is true for each and every compatible device) and I don't
> think your node would need to state it in addition. Unless, of course, there
> is an inverter on the way.

Just to clarify.

Any inverter on the board would of course need to be modeled in DT, using the 
active low/high flag. The inverter inside the device is indeed captured by the 
compatible property, so I would expect my driver to assert reset with

	gpiod_set_value(dev->reset, 0);

and use the active high flag in DT. This will result in a low level on the 
reset pin, asserting the reset. If an inverter is then present on the board, 
the active low flag would be specified in DT, resulting in a high level on the 
input of the inverter and a low level on the reset pin, without any change to 
the driver.

I think this is my preferred way of operation, as opposed to calling

	gpiod_set_value(dev->reset, 1);

in the driver and setting the active low flag in DT when no inverter is 
present on the board and the active high flag when an inverter is present.

Now, this should be documented, and device drivers will likely need to be 
reviewed. I'm pretty sure most devices with active low inputs currently use 
the active low flag in DT, in contradiction with the above.

> This is my understanding but let's see what others have to say and let's
> also make sure to update the documentation to lift the ambiguity. :)

-- 
Regards,

Laurent Pinchart

