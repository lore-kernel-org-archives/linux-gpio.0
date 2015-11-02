From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Mon, 2 Nov 2015 11:16:43 +0100
Message-ID: <20151102101643.GB14066@localhost>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <20151024184253.GC22220@pengutronix.de>
 <CACRpkdYiQ=eQpUNspRH27x=9soExn-Mx5Rhc7USqAk7g5DNG_A@mail.gmail.com>
 <3839397.mYWtgokiUO@wuerfel>
 <CACRpkdaO7XT+V4bbKE9Vzx+B4rLHXC+YhoX_UdxKSvypQUJZ0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:35087 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751310AbbKBKQi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2015 05:16:38 -0500
Received: by lbbes7 with SMTP id es7so84596269lbb.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2015 02:16:36 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkdaO7XT+V4bbKE9Vzx+B4rLHXC+YhoX_UdxKSvypQUJZ0A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Markus Pargmann <mpa@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Sun, Nov 01, 2015 at 10:37:28AM +0100, Linus Walleij wrote:
> On Fri, Oct 30, 2015 at 11:54 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> 
> > For character devices, udev has a complex set of (user-overridable) rules
> > to derive one or more stable name(s) from the sysfs attributes.
> 
> OK I'll go read these I think.
> 
> Doesn't help much with Busybox' mdev though, which I recently discussed
> with Greg and turns out to need a rewrite :/

Just stick to the bus unique names (e.g. gpiochip7) rather than try to
come up with udev rules to rename these. Look at the USB path I just
posted for an example of what you'd need to parse and encode.

Johan
