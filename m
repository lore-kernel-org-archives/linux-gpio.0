From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Thu, 5 Nov 2015 15:11:48 +0100
Message-ID: <CACRpkdZsNNdFcJHdPoW=kyOJ0ONS6_sHX18CPwYcQybQ9pSx2g@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<CACRpkdYqsGsYOALT3oQwc7fFho2gNe_=3qJ_cHcEO=YR4HAi8w@mail.gmail.com>
	<20151102101347.GA14066@localhost>
	<3389425.noBYZr9C6e@adelgunde>
	<20151103120605.GA18098@localhost>
	<CACRpkdaQYDk4s9b79xh+vL-3SFYp5GN3KpjgsSshzF0E+1-r5A@mail.gmail.com>
	<20151105094015.GC7561@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:34678 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1032504AbbKEOLt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2015 09:11:49 -0500
Received: by oies6 with SMTP id s6so5083648oie.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2015 06:11:49 -0800 (PST)
In-Reply-To: <20151105094015.GC7561@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Markus Pargmann <mpa@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Thu, Nov 5, 2015 at 10:40 AM, Johan Hovold <johan@kernel.org> wrote:
> On Tue, Nov 03, 2015 at 06:18:42PM +0100, Linus Walleij wrote:

>> It'd be nice if devices could be uniquely identified in the chardev alone
>> I think, then we don't need to much reliance on external assumptions
>> and traversing sysfs somehow for more info.
>
> Point is that this is not a gpio-specific problem. Userspace needs to
> deal with this for any resource it wants to access (e.g. i2c or spi).

Yeah let's see what others have to say.

> And you should be able to use libudev for tree-traversal without actually
> using udevd, right?

Well libudev depends on libsystemd and is using it's subcomponent
sd-device to traverse sysfs. It's a pretty fat dependency for a
space-constrained embedded system, and the source code is not
maintained outside systemd anymore, leading to an
all-or-nothing approach it seems to me.

I don't think it used to be like that but it is like that now...

Yours,
Linus Walleij
