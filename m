From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v6 1/3] x86/platform/p2sb: New Primary to Sideband
 bridge support driver for Intel SOC's
Date: Thu, 08 Sep 2016 15:35:35 +0300
Message-ID: <1473338135.11323.99.camel@linux.intel.com>
References: <1468483919-31258-1-git-send-email-jui.nee.tan@intel.com>
         <1468483919-31258-2-git-send-email-jui.nee.tan@intel.com>
         <CAP=VYLrAPm--4x=CWMri4o8cvL23q8spM0q5Z9nOXM5YzpgRTA@mail.gmail.com>
         <0158A29DB680F54A88142ED28D55B1D00826E8AC@PGSMSX107.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0158A29DB680F54A88142ED28D55B1D00826E8AC@PGSMSX107.gar.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Tan, Jui Nee" <jui.nee.tan@intel.com>, "Gortmaker, Paul (Wind River)" <paul.gortmaker@windriver.com>
Cc: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, "ptyser@xes-inc.com" <ptyser@xes-inc.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "Yong, Jonathan" <jonathan.yong@intel.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Voon, Weifeng" <weifeng.voon@intel.com>, "Wan Mohamad, Wan Ahmad Zainie" <wan.ahmad.zainie.wan.mohamad@intel.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, 2016-07-18 at 03:35 +0000, Tan, Jui Nee wrote:
> 
> > 
> > +
> > > +MODULE_LICENSE("GPL");
> > 
> > ...the above is the only modular "use" that I can find.  So is the
> > tristate bogus?   Without a module_init and a module_exit I am
> > confused....
> > 
> > I just finished an audit of arch/x86 for bogus uses of module.h so
> > I'd like to
> > ensure we don't add more.

It's a library that can be used as module. My concern is memory
footprint of non-used libraries and modules. I prefer to let module be
tristate until it's proved that it can't be.

> P2SB could be "bool" instead of tristate. 
> My concern is if LPC_ICH built as module and not loaded, P2SB might
> consume memory when P2SB is not being used.
> What do you think? If that's ok for you, my next patch will be
> something like
> this:
> ...
> config P2SB
> 	bool
> 	depends on PCI
> ...
> In p2sb.c, module.h header file will be removed as well.
> Hi Andy, please provide your comments and/or concerns if any. Thanks.


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
