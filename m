From: jmondi <jacopo@jmondi.org>
Subject: Re: linux-next regression caused by "gpiolib: request the gpio
 before querying its direction"
Date: Wed, 30 Aug 2017 18:24:40 +0200
Message-ID: <20170830162440.GE1863@w540>
References: <20170830112424.7a3a7c36@windsurf.lan>
 <3cce6903-d167-1bfc-38b4-1fdd7b3ff24b@codeaurora.org>
 <87ziah2m3f.fsf@free-electrons.com>
 <20170830161730.41919554@windsurf.lan>
 <442accaa-15a0-4efb-4e5c-cebca7140213@codeaurora.org>
 <20170830163255.4e7c1422@windsurf.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:44349 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751405AbdH3QYq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Aug 2017 12:24:46 -0400
Content-Disposition: inline
In-Reply-To: <20170830163255.4e7c1422@windsurf.lan>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Timur Tabi <timur@codeaurora.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine =?utf-8?Q?T=C3=A9nart?= <antoine.tenart@free-electrons.com>, =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>

Hello,

On Wed, Aug 30, 2017 at 04:32:55PM +0200, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 30 Aug 2017 09:22:55 -0500, Timur Tabi wrote:
>
> > No, that's it.  The question is, what exactly should the 'request'
> > function do?  Should it be modifying the hardware to satisfy the
> > request?  When I wrote my patch, I assumed that it wouldn't.  I thought
> > that request simply answered the question, "can I touch this GPIO"?
>
> No, it also muxes the pin in GPIO, and you can see the "reference"
> implementation pinctrl-single also does it.
>
> Let's see what Linus W. has to say about the semantic of the "request"
> operation.
>
> But if we change the semantic of "request" to no longer mux the hardware
> as GPIO, then you will also have regressions, because there are plenty
> of GPIOs that are requested, but not explicitly muxed as GPIOs in the
> DT, precisely because today requesting a GPIO is sufficient to have it
> re-muxed as GPIO at the pinctrl level.

Just to point out one of Renesas' pin controller devices seems to
suffer from the same problem, introduced by Timur's commit

https://www.spinics.net/lists/linux-renesas-soc/msg17647.html

This is indeed caused by the "request" introduced by the above said
commit, that in rza1 pincontroller, actually muxes the requested
pin as GPIO.

Reverting that commit solves all the issues in our case too.

Thanks
   j
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
