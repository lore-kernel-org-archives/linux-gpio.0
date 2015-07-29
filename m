From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/9] gpiolib: Add GPIO name support
Date: Wed, 29 Jul 2015 11:23:10 +0200
Message-ID: <CACRpkdYV=MDcEmsknuAXghGe_PcnqCQdvK2AQd8N28g7weGtFA@mail.gmail.com>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
	<CACRpkdY=SLGyrcvWT355b3Z+pBwb9gPzVcieD8mOn=zdyJ1mFw@mail.gmail.com>
	<20150728141619.GP28535@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:36266 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750985AbbG2JXL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jul 2015 05:23:11 -0400
Received: by obnw1 with SMTP id w1so2839078obn.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2015 02:23:10 -0700 (PDT)
In-Reply-To: <20150728141619.GP28535@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Markus Pargmann <mpa@pengutronix.de>, Alexandre Courbot <acourbot@nvidia.com>, Grant Likely <grant.likely@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On Tue, Jul 28, 2015 at 4:16 PM, Johan Hovold <johan@kernel.org> wrote:

> That said, this is a step along the lines that we have discussed in the
> past. Adding pin functions (line names) to generic pin nodes in DT makes
> sense, but we need to think through the details first. For example:
>
>  - Should we allow duplicate pin functions (line names)? We need to
>    consider not just on-chip controllers, but also hot-pluggable
>    controllers and device-tree overlays.

I guess the typical example is if we have two identical GPIO
expanders. We have this with arch/arm/boot/dts/ste-nomadik-nhk15.dts
for example.

With this scheme, they will simply have to name their lines
uniquely for things to work since /sys/class/gpio is a flat
space, not hierarchic per-gpiochip (as would be preferred,
should this be sane to maintain).

>  - Should we allow initial configurations to be specified and still
>    allow (some) pins to be requested later ("soft" hogging)?

That is a key idea in this patch set.

Maybe we need a "userspace hog" to mark these specifically as
not used by the operating system. (Bringing me back to my
tirade about people doing stupid things in userspace just because
they don't know about all the nice GPIO stuff in the kernel.)

>  - Should we specify pin directionality? I've suggested elsewhere that
>    adding such limitations (e.g. as a mask) may make sense in cases were
>    changing pin direction is known to cause damage.

We have the flag jamming IRQ lines to be input, but input-only
and output-only seems reasonable for hogs in reaction to the
current "input", "output-low" and "output-high" properties.

Could be a separate patch though.

>  - What would a new gpio interface look like?

Yeah :/ people are scared of adding chardevs it seems.

I think they are kind of nice, the biggest problem seems to be
totally confused userspace with udev and mdev and none of
them ever knows about new stuff and people get problems
becuase of old rootfs:es.

Yours,
Linus Walleij
