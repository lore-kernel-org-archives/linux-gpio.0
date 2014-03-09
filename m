From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v4] gpio: Driver for SYSCON-based GPIOs
Date: Sat, 8 Mar 2014 21:01:06 -0800
Message-ID: <20140309050106.GA12045@quad.lixom.net>
References: <1389632203-22806-1-git-send-email-shc_work@mail.ru>
 <20140225190923.fdd969463717061aea582551@mail.ru>
 <CACRpkdbc5SZYC-1eC=er+HmBxp6a77Nwzr46Vv7BFk882TRLDg@mail.gmail.com>
 <1394002983.39681225@f309.i.mail.ru>
 <CACRpkda+r2ptR06LrAPX0dZFOou6pce88kXdSFXad55Vx=vDYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pb0-f54.google.com ([209.85.160.54]:35577 "EHLO
	mail-pb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750699AbaCIFBD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Mar 2014 00:01:03 -0500
Received: by mail-pb0-f54.google.com with SMTP id ma3so5893759pbc.13
        for <linux-gpio@vger.kernel.org>; Sat, 08 Mar 2014 21:01:02 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkda+r2ptR06LrAPX0dZFOou6pce88kXdSFXad55Vx=vDYg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Shiyan <shc_work@mail.ru>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Fri, Mar 07, 2014 at 11:46:13AM +0800, Linus Walleij wrote:
> On Wed, Mar 5, 2014 at 3:03 PM, Alexander Shiyan <shc_work@mail.ru> wrote:
> 
> > I think that Olof meant to completely remove the concept of "syscon" from the
> > DT description.
> > This can be done by changing the compatibility string with "cirrus,clps711x-mctrl-gpio"
> > for my case and hide "syscon" in the internal structure of the driver to use the
> > syscon_regmap_lookup_by_compatible() function.
> > If so, then I'll make the next version.
> 
> OK sounds like a plan.

Yep, agreed. Syscon as a term is a linux-side construct, and not something we
should necessarily have carry over in mindings and DT names.


-Olof
