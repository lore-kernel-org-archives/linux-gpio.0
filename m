From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Tue, 3 Nov 2015 18:05:02 +0100
Message-ID: <CACRpkdZ5uPt=DwGT4=2VbQyP0Y+b7-3huAvrS7m9o1YxJYwOfw@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<CACRpkdYqsGsYOALT3oQwc7fFho2gNe_=3qJ_cHcEO=YR4HAi8w@mail.gmail.com>
	<20151102101347.GA14066@localhost>
	<3389425.noBYZr9C6e@adelgunde>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:35058 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753264AbbKCRFD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2015 12:05:03 -0500
Received: by obctp1 with SMTP id tp1so17438184obc.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2015 09:05:02 -0800 (PST)
In-Reply-To: <3389425.noBYZr9C6e@adelgunde>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Tue, Nov 3, 2015 at 8:23 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> As an idea: We could use the complete path to create some sort of unique id for
> the device (perhaps hash or something different). This id can be exported as
> device attribute and would allow udev to create some links as known from
> /dev/disk/by-id for example. This would make identifying a single chip quite
> easy for any userspace application and we would avoid having this really long
> path somewhere.

I like this idea.

I'll try to figure out some way to hash the bus name + chip name + label
or something down to a unique ID per-gpiochip.

Yours,
Linus Walleij
