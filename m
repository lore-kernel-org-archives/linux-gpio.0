From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Fri, 6 Nov 2015 11:21:21 +0100
Message-ID: <20151106102121.GF22538@localhost>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <CACRpkdYqsGsYOALT3oQwc7fFho2gNe_=3qJ_cHcEO=YR4HAi8w@mail.gmail.com>
 <20151102101347.GA14066@localhost>
 <3389425.noBYZr9C6e@adelgunde>
 <20151103120605.GA18098@localhost>
 <CACRpkdaQYDk4s9b79xh+vL-3SFYp5GN3KpjgsSshzF0E+1-r5A@mail.gmail.com>
 <20151105094015.GC7561@localhost>
 <CACRpkdZsNNdFcJHdPoW=kyOJ0ONS6_sHX18CPwYcQybQ9pSx2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:36115 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1032054AbbKFKVN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2015 05:21:13 -0500
Received: by lbblt2 with SMTP id lt2so35467442lbb.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2015 02:21:12 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkdZsNNdFcJHdPoW=kyOJ0ONS6_sHX18CPwYcQybQ9pSx2g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Markus Pargmann <mpa@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Thu, Nov 05, 2015 at 03:11:48PM +0100, Linus Walleij wrote:
> On Thu, Nov 5, 2015 at 10:40 AM, Johan Hovold <johan@kernel.org> wrote:
> > On Tue, Nov 03, 2015 at 06:18:42PM +0100, Linus Walleij wrote:
> 
> >> It'd be nice if devices could be uniquely identified in the chardev alone
> >> I think, then we don't need to much reliance on external assumptions
> >> and traversing sysfs somehow for more info.
> >
> > Point is that this is not a gpio-specific problem. Userspace needs to
> > deal with this for any resource it wants to access (e.g. i2c or spi).
> 
> Yeah let's see what others have to say.
> 
> > And you should be able to use libudev for tree-traversal without actually
> > using udevd, right?
> 
> Well libudev depends on libsystemd and is using it's subcomponent
> sd-device to traverse sysfs. It's a pretty fat dependency for a
> space-constrained embedded system, and the source code is not
> maintained outside systemd anymore, leading to an
> all-or-nothing approach it seems to me.

Seems to me like you're trying to solve a user-space problem in the
kernel. Even the network-device links you mentioned is something that
udev provides.

> I don't think it used to be like that but it is like that now...

Yeah, I'm not using the latest and greatest, but the libudev0 182 I took
a look at has no such dependencies and the lib seemed reasonably small
(40k).

IIRC there has been discussions about a standalone (mdev) version of it
as well.

Johan
