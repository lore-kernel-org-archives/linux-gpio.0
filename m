From: Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: Re: [PATCH] gpio-pca953x: Support NXP PCAL9555A with Agile I/O
Date: Mon, 27 Jul 2015 14:37:09 +0200
Message-ID: <20150727123709.GA2601@pqgruber.com>
References: <1435858426-19623-1-git-send-email-clemens.gruber@pqgruber.com>
 <1435858426-19623-2-git-send-email-clemens.gruber@pqgruber.com>
 <CACRpkdbVQwkLfVdXyuWr4gOezeNcuFHHb5A2VLBwOnHb=k0o5Q@mail.gmail.com>
 <20150716135202.GA2328@pqgruber.com>
 <CACRpkdZAugG66rz8ouH+n=QvpkMC9RCfbXuavJY615=frwc2Gg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:59659 "EHLO
	mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751347AbbG0MhM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2015 08:37:12 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZAugG66rz8ouH+n=QvpkMC9RCfbXuavJY615=frwc2Gg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Mon, Jul 27, 2015 at 12:07:14PM +0200, Linus Walleij wrote:
> OK so should we not do this change and always use the latched IRQs if
> available on the hardware? I don't see why we would need a device tree
> property for this.
> 
> I would more think something like, if the compatible string is so and
> so, our hardware supports latching, and then we just use it. That is more
> helpful than adding extra flags.

Sounds good, if somebody does not want latching, he can just specify the pca9555
compatible string. Then, no GPIO_INPUT_LATCH flag is necessary.

> I'd say mask off all IRQs in probe and mask them on selectively as the
> irqchip portions request IRQs. Should work, right?

I think so, yes. I'll give it a try!

> OK so implement it on a first-come-first-served order.
> 
> Add a bool open_drain state to your state container, set it to true
> when the first consumer requests open drain, but noone else has
> yet requested any pins. So logic:
> 
> request(req_open_drain):
>    if (req_open_drain && any_pins_requested && !state->open_drain)
>        print_verbose_error
>    if (!any_pins_requested)
>        state->open_drain = true;
>    increase_requested_pins
>    ...
> 
> So the API should assume we can request this per-pin (since such controllers
> exist) and then the driver will impose this limitation for the PCA953x
> and deny consumers to configure conflicting modes.

OK, will do!

> 
> Too keep track of how many pins are currently requested you can use
> a bitmask or <linux/kref.h> if you want to be fancy but I think some simple
> solution should be OK.

Thank you very much for your feedback.

I'll come back with a RFC patch series.

> 
> Yours,
> Linus Walleij

Regards,
Clemens Gruber
