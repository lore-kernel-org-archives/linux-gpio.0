From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Correct meaning of the GPIO active low flag
Date: Wed, 19 Feb 2014 01:19:18 +0100
Message-ID: <5983335.g0elTNb4ho@avalon>
References: <4298328.sSSAEV5F8t@avalon> <1774231.xdMd4d6ShW@avalon> <53039F46.1010604@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([95.142.166.194]:45146 "EHLO
	perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750966AbaBSASJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2014 19:18:09 -0500
In-Reply-To: <53039F46.1010604@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

Hi Stephen,

On Tuesday 18 February 2014 10:58:30 Stephen Warren wrote:
> On 02/14/2014 05:20 PM, Laurent Pinchart wrote:
> > On Friday 14 February 2014 17:07:32 Stephen Warren wrote:
> ...
> 
> >> Oh, if you're talking about fiddling around at run-time, then that's
> >> just something the driver has to deal with internally. In that case,
> >> let's just make the GPIO active-high in DT. When the driver programs the
> >> device into whatever mode requires it to be active-low, the driver needs
> >> to be written to set that GPIO value correctly. I don't think DT has any
> >> influence on this at all, since DT is about a static setup, whereas your
> >> use-case is dynamic.
> > 
> > Except that there could be an inverter, which would need to be expressed
> > in DT.
> 
> Of course, but that statement doesn't invalidate anything I said.
> 
> > I propose wording the documentation as follows.
> > 
> > The GPIO polarity flag should represent the physical level that achieves
> > (or represents, for inputs) a logically asserted value at the device.
> > When the device signal polarity is dynamically configurable (as opposed
> > to the statically configured case where the polarity is set based on DT
> > properties only) the flag should bet set to the polarity required by the
> > default logically asserted value, and that default logically asserted
> > value should be documented in the device DT bindings.
> 
> To me, that wording:
> 
> a) Doesn't explicitly state that the GPIO specifier should contain the
> level at the GPIO controller rather than at the device.
> 
> b) Implies that devices with configurable polarity should derive the
> polarity from the GPIO specifier, whereas in fact this is exactly what
> we don't want.
> 
> How about:
> 
> The GPIO specifier's polarity flag should represent the physical level
> at the GPIO controller that achieves (or represents, for inputs) a
> logically asserted value at the device. Note that if the board inverts
> the signal between the GPIO controller and device, then the GPIO
> specifier will represent the opposite physical level than signal at the
> device's.

"Note that" sounds to me like we're introducing an exception. I would replace 
it with "In particular,". Apart from that your proposal looks perfect to me. 
Thanks a lot for coping with my constant nitpicking on this issue :-) Would 
you like to submit a documentation patch ?

> When the device's signal polarity is configurable, the binding for the
> device must either:
> 
> a) Define a single static polarity for the signal, with the expectation
> that any software using that binding would statically program the device
> to use that signal polarity.
> 
> The static choice of polarity may be either:
> 
> a1) Defined statically by the DT binding itself.
> 
> or:
> 
> a2) Dictated by a binding-specific DT property.
> 
> In particular, the polarity cannot be derived from the GPIO specifier,
> since that would prevent the DT from separately representing the two
> orthogonal concepts of: configurable signal polarity in the device, and
> possible board-level signal inversion.
> 
> or:
> 
> b) Pick a single option for device signal polarity, and document this
> choice in the binding. The GPIO specifier should represent the polarity
> of the signal (at the GPIO controller) assuming that the device is
> configured for this particular signal polarity choice. If the software
> chooses to program the device to generate or receive a signal of the
> opposite polarity, software will be responsible for correctly
> interpreting (inverting) the GPIO signal at the GPIO controller.

-- 
Regards,

Laurent Pinchart

