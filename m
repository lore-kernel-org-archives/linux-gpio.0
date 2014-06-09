From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/4] ARM: mach-s5p: get rid of all <mach/gpio.h> headers
Date: Mon, 09 Jun 2014 14:11:10 +0200
Message-ID: <8986317.PJZ13jmgds@wuerfel>
References: <1401888838-3126-1-git-send-email-linus.walleij@linaro.org> <4544212.mqY6dSouMv@wuerfel> <CACRpkdZMwLv1rHS+mSAT4YP3F0VUtt9E-u3p89a-YzRRFbugGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:61844 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932586AbaFIMLX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jun 2014 08:11:23 -0400
In-Reply-To: <CACRpkdZMwLv1rHS+mSAT4YP3F0VUtt9E-u3p89a-YzRRFbugGQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Monday 09 June 2014 13:36:33 Linus Walleij wrote:
> On Wed, Jun 4, 2014 at 3:58 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Wednesday 04 June 2014 15:33:56 Linus Walleij wrote:
> >> This renames all the local <mach/gpio.h> headers in the S5P platforms
> >> to <mach/gpio-samsung.h> indicating a scope local to this platform,
> >> and cuts the implicit inclusion of <mach/gpio.h> from <linux/gpio.h>
> >> by removing the use of NEED_MACH_GPIO_H from all S5P variants.
> >>
> >> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Hmm, this patch will obviously clash with the removal of S5p64xx
> > and s5pc100.
> 
> So it is happening? I was actually expecting that to happen in
> v3.14 or so and now I finally lost my patience 

I do expect it for 3.17.

> > It shouldn't be hard to resolve the conflict when we
> > merge both into arm-soc/next/cleanup,
> 
> First come, first serve. I will send my pull request at the end
> of the merge window I hope. If removal comes first, I'll rebase.
> 

Ok, fine with me.

	Arnd
