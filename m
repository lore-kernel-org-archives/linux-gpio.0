From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: wrap Intel pin control drivers in an
 architecture check
Date: Tue, 29 Aug 2017 16:49:20 +0300
Message-ID: <1504014560.25945.145.camel@linux.intel.com>
References: <20170704064947.10792-1-pbrobinson@gmail.com>
         <20170704095459.GB1250@kuha.fi.intel.com>
         <1499163673.22624.248.camel@linux.intel.com>
         <CALeDE9NAsehP8X60BSWP1tcLSX+rD738bd9h9DtyunCz39HSHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:63771 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752218AbdH2NtY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 29 Aug 2017 09:49:24 -0400
In-Reply-To: <CALeDE9NAsehP8X60BSWP1tcLSX+rD738bd9h9DtyunCz39HSHQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>

On Wed, 2017-07-05 at 09:01 +0100, Peter Robinson wrote:
> On Tue, Jul 4, 2017 at 11:21 AM, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, 2017-07-04 at 12:54 +0300, Heikki Krogerus wrote:
> > > On Tue, Jul 04, 2017 at 07:49:47AM +0100, Peter Robinson wrote:

> > > > --- a/drivers/pinctrl/intel/Kconfig
> > > > +++ b/drivers/pinctrl/intel/Kconfig
> > > > @@ -1,6 +1,7 @@
> > > >  #
> > > >  # Intel pin control drivers
> > > >  #
> > > > +if (X86 || COMPILE_TEST)
> > 
> > And what about ARM et al. architectures?
> 
> If you look in the various sub directories you'll see that the various
> arch sub directories have similar for their SoC eg ARCH_SUNXI or
> explicit depends on the SoC achieving the same outcome.

ARM world is too fragmented. I can't take it as a good example.
Most of distros would like to maintain less kernels (ideally one per
architecture). In the above example it's a sub-arch.

Yes, I know that x86 has 3 let's say "sub-arches" which require
different settings to kernel. (None of them makes difference to pin
control case though)

> > Instead I would propose to reorganize parent Kconfig to have
> > something
> > like
> 
> Well they're done in alphabetical and there's appropriate depends
> ARCH_ or SOC_ etc so that those architectures don't randomly pop up in
> configs for other unrelated things, the intel/ one is one of the only
> ones that doesn't do this (hence this patch)
> 
> > if (ARM || COMPILE_TEST)
> > ...ARM stuff...
> > endif
> > 
> > if (X86 || COMPILE_TEST)
> > ...X86 stuff...
> > endif
> > 
> > But personally I don't like any of the above. So, what's the issue
> > this
> > patch is targeting against?
> 
> So that every time (in my case a distro) they don't have to explicitly
> have unrelated "# CONFIG_PINCTRL_CHERRYVIEW is not set" style bits
> through all their configs because it's completely unrelated to the
> platform.

Okay, so, what's wrong with defining big blocks on per ARCH basis as I
pointed above?

ARM, ARM64, X86, etc.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
