From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] gpio: xtensa: depend on HAVE_XTENSA_GPIO32
Date: Thu, 2 Jan 2014 14:18:42 +0200
Message-ID: <20140102121842.GB6589@tarshish>
References: <70c25715a89328b38e636f5f1f84ca34e4590d58.1387177140.git.baruch@tkos.co.il>
 <CACRpkdZ7+=KDskPWDWsS--74DRyW+7_gzX7gpPu1EvkiWXkNMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:44270 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750782AbaABMSs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 2 Jan 2014 07:18:48 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdZ7+=KDskPWDWsS--74DRyW+7_gzX7gpPu1EvkiWXkNMA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-xtensa@linux-xtensa.org

Hi Linus,

On Thu, Jan 02, 2014 at 01:07:24PM +0100, Linus Walleij wrote:
> On Mon, Dec 16, 2013 at 8:05 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> 
> > Prevent build failure when the selected variant does not support GPIO32.
> >
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> (...)
> 
> >  config XTENSA_VARIANT_FSF
> >         bool "fsf - default (not generic) configuration"
> >         select MMU
> > +       select HAVE_XTENSA_GPIO32
> 
> (...)
> > +config HAVE_XTENSA_GPIO32
> > +       bool
> > +
> >  config GPIO_XTENSA
> >         bool "Xtensa GPIO32 support"
> >         depends on XTENSA
> > +       depends on HAVE_XTENSA_GPIO32
> 
> This is just a tautology, you don't need a helper bool
> for this.
> 
> Instead just select GPIO_XTENSA from your affected
> platforms.

But then you force this driver on all users. Why not leave the option to 
disable this driver when the user needs direct access to this hardware, or 
just wants to remove unused code?

> The patch only needs to hit arch/arm/mach-xtensa/Kconfig.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
