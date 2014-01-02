From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] gpio: xtensa: depend on HAVE_XTENSA_GPIO32
Date: Thu, 2 Jan 2014 20:00:41 +0200
Message-ID: <20140102180041.GI6589@tarshish>
References: <70c25715a89328b38e636f5f1f84ca34e4590d58.1387177140.git.baruch@tkos.co.il>
 <CACRpkdZ7+=KDskPWDWsS--74DRyW+7_gzX7gpPu1EvkiWXkNMA@mail.gmail.com>
 <20140102121842.GB6589@tarshish>
 <CACRpkdakv+Ht+fvxWyAzbUqO2hfJKX=94FwA5SNakx5FcbA+yA@mail.gmail.com>
 <20140102133333.GF6589@tarshish>
 <CACRpkdYcFJA1tDzS3yh3yhMGFG15Db0B5eg=fxPuxrLFKxyqHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:44556 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751210AbaABSAs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 2 Jan 2014 13:00:48 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdYcFJA1tDzS3yh3yhMGFG15Db0B5eg=fxPuxrLFKxyqHw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-xtensa@linux-xtensa.org

Hi Linus,

On Thu, Jan 02, 2014 at 06:04:57PM +0100, Linus Walleij wrote:
> On Thu, Jan 2, 2014 at 2:33 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Thu, Jan 02, 2014 at 02:21:12PM +0100, Linus Walleij wrote:
> >> On Thu, Jan 2, 2014 at 1:18 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> >> > On Thu, Jan 02, 2014 at 01:07:24PM +0100, Linus Walleij wrote:
> >> >> On Mon, Dec 16, 2013 at 8:05 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> >> >>
> >> >> > Prevent build failure when the selected variant does not support GPIO32.
> >> >> >
> >> >> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> >> >> (...)
> >> >> > +config HAVE_XTENSA_GPIO32
> >> >> > +       bool
> >> >> > +
> >> >> >  config GPIO_XTENSA
> >> >> >         bool "Xtensa GPIO32 support"
> >> >> >         depends on XTENSA
> >> >> > +       depends on HAVE_XTENSA_GPIO32
> >> >>
> >> >> This is just a tautology, you don't need a helper bool
> >> >> for this.
> >> >>
> >> >> Instead just select GPIO_XTENSA from your affected
> >> >> platforms.
> >> >
> >> > But then you force this driver on all users. Why not leave the option to
> >> > disable this driver when the user needs direct access to this hardware, or
> >> > just wants to remove unused code?
> >>
> >> Hmm you're right. But if the build fails on !XTENSA, can you not
> >> put a
> >>
> >> depends on XTENSA_VARIANT_FSF || XTENSA_VARIANT_DC232B || XTENSA_VARIANT_DC233C
> >>
> >> Into drivers/gpio/Kconfig?
> >>
> >> It's a simple oneliner...
> >
> > IMO, having a 'select HAVE_XTENSA_GPIO32' in arch/xtensa/Kconfig would makes
> > it clear that this is something to consider when adding another Xtensa
> > variant. Also, this dependency line might (hopefully will) become quite long.
> > But if you object I'll change that.
> 
> I have no strong opinion on this, I would leave that decision to the
> Xtensa maintainer.

The xtensa co-maintainer, Max Filippov, has already acked v2 of this patch.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
