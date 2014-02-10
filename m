From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Correct meaning of the GPIO active low flag
Date: Mon, 10 Feb 2014 18:52:30 +0100
Message-ID: <3858007.V4FxlF8qeO@avalon>
References: <4298328.sSSAEV5F8t@avalon> <52F904B3.2010304@wwwdotorg.org> <52F90507.6030400@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([95.142.166.194]:40868 "EHLO
	perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752274AbaBJRv2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2014 12:51:28 -0500
In-Reply-To: <52F90507.6030400@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

Hi Stephen,

On Monday 10 February 2014 09:57:43 Stephen Warren wrote:
> On 02/10/2014 09:56 AM, Stephen Warren wrote:
> > On 02/10/2014 08:13 AM, Laurent Pinchart wrote:
> >> On Monday 10 February 2014 23:50:40 Alexandre Courbot wrote:
> >>> On Mon, Feb 10, 2014 at 11:33 PM, Laurent Pinchart wrote:
> >>>> Hello everybody,
> >>>> 
> >>>> While working on Dt support for a driver that uses GPIO I came to
> >>>> ponder about the correct meaning of the GPIO active low flag. I'm
> >>>> bringing the question to the mailing list to get feedback.
> >>>> 
> >>>> When a device has an active low input, the fact that the input is
> >>>> active low is a property of the device, and thus known to the driver.
> >>>> On the other hand, if an inverter is present on the board, that
> >>>> information isn't known to device drivers and need to be expressed in
> >>>> DT.
> >>>> 
> >>>> Does the active low flag express the latter only, or both of them ? To
> >>>> ask the question differently, should the low flag model the inverter
> >>>> inside the device, known to the device driver, effectively moving
> >>>> handling of that inverter out of the device driver to the core code, or
> >>>> should it stop at the device boundary and only model the board ?
> >>> 
> >>> The intent behind the current behavior of the gpiod interface is to
> >>> 
> >>> avoid the need for code like this:
> >>>         if (pb->enable_gpio_flags & PWM_BACKLIGHT_GPIO_ACTIVE_LOW)
> >>>             gpio_set_value(pb->enable_gpio, 0);
> >>>         else
> >>>             gpio_set_value(pb->enable_gpio, 1);
> >>> 
> >>> which could simply be replaced by:
> >>>         gpiod_set_value(pb->enable_gpio, 1);
> >>> 
> >>> and the GPIO framework will invert the signal if needed according to
> >>> the active low property of the GPIO.
> >> 
> >> Yes, I had got that so far.
> >> 
> >>> This behavior is based on the assumption that the active low flag
> >>> represents an inverter present on the board, and thus unknown to the
> >>> device driver. Now I just hope this assumption is correct. On the
> >>> other hand I'm not sure I would understand the need for it if it were
> >>> to model a property of the device, as the driver would be aware of it
> >>> anyway, and thus should not need to be told about it explicitly.
> >>> 
> >>>> As an example, if my device datasheet states that the reset input is
> >>>> active low, an no inverter is present on the GPIO line, should I set
> >>>> the GPIO active low flag in DT and set the GPIO value to 1 in software
> >>>> (assuming I use the gpiod_* API) to make the reset signal active, or
> >>>> should I set the GPIO active high flag in DT and the the GPIO value to
> >>>> 0 in software ?
> >>> 
> >>> If your datasheet explicitly states that the reset input is active low,
> >>> then this fact should be captured by the compatible property already
> >>> (since the active low status is true for each and every compatible
> >>> device) and I don't think your node would need to state it in addition.
> >>> Unless, of course, there is an inverter on the way.
> >> 
> >> Just to clarify.
> >> 
> >> Any inverter on the board would of course need to be modeled in DT, using
> >> the active low/high flag. The inverter inside the device is indeed
> >> captured by the compatible property, so I would expect my driver to
> >> assert reset with
> >>
> >> 	gpiod_set_value(dev->reset, 0);
> >> 
> >> and use the active high flag in DT.
> > 
> > I think the flag should represent the physical level of the signal on
> > the board at the device pin. I'm pretty sure that's what's most
> > consistent with existing DT properties.
> 
> (That would have to be the GPIO source device, in order to account for
> any board-induced inversion)

Would that be the physical level at the GPIO source device output to achieve a 
high level at the target device input pin, or the physical level at the GPIO 
source device output to assert the signal at the target device input pin ? The 
first case wouldn't take the receiver device internal inverter into account 
while the second case would. In the second case, how should we handle receiver 
devices that have configurable signal polarities (essentially 
enabling/disabling the internal inverter from a software-controller 
configuration) ?

-- 
Regards,

Laurent Pinchart

