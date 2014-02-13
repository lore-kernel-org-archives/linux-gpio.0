From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Correct meaning of the GPIO active low flag
Date: Thu, 13 Feb 2014 15:43:27 +0100
Message-ID: <7178755.iaUGSV8r4q@avalon>
References: <4298328.sSSAEV5F8t@avalon> <1848152.lIn8ApGfEn@avalon> <52FBA65D.8060405@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([95.142.166.194]:34214 "EHLO
	perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751001AbaBMOmV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Feb 2014 09:42:21 -0500
In-Reply-To: <52FBA65D.8060405@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

Hi Stephen,

On Wednesday 12 February 2014 09:50:37 Stephen Warren wrote:
> On 02/10/2014 04:21 PM, Laurent Pinchart wrote:
> > On Monday 10 February 2014 16:04:30 Stephen Warren wrote:
> >> On 02/10/2014 10:52 AM, Laurent Pinchart wrote:
> >>> On Monday 10 February 2014 09:57:43 Stephen Warren wrote:
> >>>> On 02/10/2014 09:56 AM, Stephen Warren wrote:
> >> ...
> >> 
> >>>>> I think the flag should represent the physical level of the signal on
> >>>>> the board at the device pin. I'm pretty sure that's what's most
> >>>>> consistent with existing DT properties.
> >>>> 
> >>>> (That would have to be the GPIO source device, in order to account for
> >>>> any board-induced inversion)
> >>> 
> >>> Would that be the physical level at the GPIO source device output to
> >>> achieve a high level at the target device input pin, or the physical
> >>> level at the GPIO source device output to assert the signal at the
> >>> target device input pin ? The first case wouldn't take the receiver
> >>> device internal inverter into account while the second case would. In
> >>> the second case, how should we handle receiver devices that have
> >>> configurable signal polarities (essentially enabling/disabling the
> >>> internal inverter from a software-controller configuration) ?
> >> 
> >> I would expect the flag to represent the physical level that achieves (or
> >> represents, for inputs) a logically asserted value at the device.
> > 
> > I assume you mean "the physical level at the GPIO controller output".
> 
> Yes.
> 
> >> I don't think we should make the level flag influence any kind of
> >> configurable level within the device; that's a separate orthogonal, but
> >> related, concept. It'd be best if the DT binding for the device either
> >> (a) provided a separate property to configure that, or (b) picked a
> >> single one of the configurable values, and documented that all DTs
> >> should assume that value.
> > 
> > Agreed. I've phrased my question incorrectly though.
> > 
> > My concern with devices that have configurable input polarities is that
> > the
> 
> s/input/output/ I assume?

No, I mean input. Think about video vertical/horizontal sync inputs, they 
usually have configurable polarities on the receiver side. In that case the 
physical level at the GPIO controller output that achieves a logically 
asserted value at the device depends on how the device is configured at 
runtime.

Moving the input's internal inverter out of the GPIO flag would solve this 
problem in that the flag would instead represent the physical level at the 
GPIO controller output that achieves a high level at the device (option 'a').

That might be considered counterintuitive though. The other option ('b') I can 
think of is the one I mentioned, representing "the physical level at the GPIO 
controller output that achieves (or represents, for inputs) a logically 
asserted value at the device, for the default configuration of the device" 
with the default configuration of the device defined in the DT bindings.

Option 'b' is more complex in the sense that it requires expressing more 
information in the DT bindings.

> > "physical level [at the GPIO controller output] that achieves (or
> > represents, for inputs) a logically asserted value at the device" depends
> > on runtime configuration of the device, and is thus ill-defined.
> 
> I think for DT, we can define what the runtime state must be, as I mentioned
> above.
> 
> > We could consider that the flag represents the physical level at the GPIO
> > controller output that achieves (or represents, for inputs) a logically
> > asserted value at the device, for the default configuration of the device.
> > The default configuration of the device would then need to be defined.
> > I'm unsure whether the default configuration should be constant, or could
> > depend on other DT properties.
> 
> Either would work, so long as the exact meaning of the DT content was well-
> defined, and statically defined.

-- 
Regards,

Laurent Pinchart

