From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Mon, 2 Nov 2015 11:00:39 +0100
Message-ID: <20151102100039.GD8676@localhost>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <20151024175331.GA22220@pengutronix.de>
 <CACRpkdYZD1AQ6AM1PP_P7Yn5zzytXH-VxonrT1tkQ_Jyjbtp7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:35935 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751310AbbKBKAe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2015 05:00:34 -0500
Received: by lbjm5 with SMTP id m5so84430121lbj.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2015 02:00:32 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkdYZD1AQ6AM1PP_P7Yn5zzytXH-VxonrT1tkQ_Jyjbtp7g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Markus Pargmann <mpa@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Fri, Oct 30, 2015 at 03:40:50PM +0100, Linus Walleij wrote:
> On Sat, Oct 24, 2015 at 7:53 PM, Markus Pargmann <mpa@pengutronix.de> wrote:
> 
> >> How to identify and manipulate individual GPIO lines from this
> >> ABI is a *LATER* *QUESTION*, this is the bare essentials for
> >> getting there: basic operations on the gpiochip device level.
> >
> > Does this include identifying GPIO lines independent of gpiochips? I
> > think that is a use-case as well.
> 
> My view is that we will NOT support any such GPIO lines.
> 
> The new API requires that everyone use gpiolib properly for all their
> GPIOs if they want to use them from userspace.
> 
> We have cases with gpiochips with a single GPIO line, so I don't
> see why we can't require that.

I think Markus question was how to *identify* lines independent of
gpiochips. That is given a line name how do we find the corresponding
chip and line (number)?

I know this series does not add such mechanisms, but we need to discuss
this from the start. Do we want user space to iterate over all gpio
chips to search for a line name? Note that this could result in more
than one gpio (chip + offset) being returned (consider hot-pluggable
devices or just dtsi).

Johan
