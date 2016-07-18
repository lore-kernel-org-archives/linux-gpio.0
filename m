From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH v6 1/3] x86/platform/p2sb: New Primary to Sideband bridge
 support driver for Intel SOC's
Date: Mon, 18 Jul 2016 11:07:46 -0400
Message-ID: <20160718150746.GF21225@windriver.com>
References: <1468483919-31258-1-git-send-email-jui.nee.tan@intel.com>
 <1468483919-31258-2-git-send-email-jui.nee.tan@intel.com>
 <CAP=VYLrAPm--4x=CWMri4o8cvL23q8spM0q5Z9nOXM5YzpgRTA@mail.gmail.com>
 <0158A29DB680F54A88142ED28D55B1D00826E8AC@PGSMSX107.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:34160 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751320AbcGRPIR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2016 11:08:17 -0400
Content-Disposition: inline
In-Reply-To: <0158A29DB680F54A88142ED28D55B1D00826E8AC@PGSMSX107.gar.corp.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Tan, Jui Nee" <jui.nee.tan@intel.com>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, "ptyser@xes-inc.com" <ptyser@xes-inc.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "Yong, Jonathan" <jonathan.yong@intel.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Voon, Weifeng" <weifeng.voon@intel.com>, "Wan Mohamad, Wan Ahmad Zainie" <wan.ahmad.zainie.wan.mohamad@intel.com>

[RE: [PATCH v6 1/3] x86/platform/p2sb: New Primary to Sideband bridge support driver for Intel SOC's] On 18/07/2016 (Mon 03:35) Tan, Jui Nee wrote:

[...]

> > > +
> > > +       return 0;
> > > +}
> > > +EXPORT_SYMBOL(p2sb_bar);
> > > +
> > > +MODULE_LICENSE("GPL");
> > 
> > ...the above is the only modular "use" that I can find.  So is the
> > tristate bogus?   Without a module_init and a module_exit I am
> > confused....
> > 
> > I just finished an audit of arch/x86 for bogus uses of module.h so I'd like to
> > ensure we don't add more.
> > 
> > Thanks,
> > Paul.
> > --
> > 
> P2SB could be "bool" instead of tristate. 
> My concern is if LPC_ICH built as module and not loaded, P2SB might
> consume memory when P2SB is not being used.
> What do you think? If that's ok for you, my next patch will be something like
> this:
> ...
> config P2SB
> 	bool
> 	depends on PCI

After seeing that this module isn't using an init/exit to allocate and
free resources, I'd initially thought it was linked into part of a
bigger module file, in which case we could just delete the token
MODULE_LICENSE tag (since it adds zero value) and then delete the
module.h include too (but probably use export.h instead).

However, re-examining the Makefile, I see this does look to be used as a
single file module, (but more like a library vs. an active driver), so
the MODULE_LICENSE will be required to keep the kernel happy -- i.e. it
is fine as it was and my apologies for adding confusion.

Thanks,
Paul.
--

> ...
> In p2sb.c, module.h header file will be removed as well.
> Hi Andy, please provide your comments and/or concerns if any. Thanks.
> > > --
> > > 1.9.1
> > >
