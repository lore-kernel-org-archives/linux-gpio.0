From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: wrap Intel pin control drivers in an
 architecture check
Date: Tue, 04 Jul 2017 13:21:13 +0300
Message-ID: <1499163673.22624.248.camel@linux.intel.com>
References: <20170704064947.10792-1-pbrobinson@gmail.com>
         <20170704095459.GB1250@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:59760 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751845AbdGDKVQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 4 Jul 2017 06:21:16 -0400
In-Reply-To: <20170704095459.GB1250@kuha.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Robinson <pbrobinson@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>

On Tue, 2017-07-04 at 12:54 +0300, Heikki Krogerus wrote:
> On Tue, Jul 04, 2017 at 07:49:47AM +0100, Peter Robinson wrote:
> > The Intel pin control drivers are architecture specific so add an if
> > arch
> > to check for X86 or compile test to ensure continued test coverage.
> > 

Sorry, have not seen the original mail.

> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > ---
> >  drivers/pinctrl/intel/Kconfig | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/pinctrl/intel/Kconfig
> > b/drivers/pinctrl/intel/Kconfig
> > index 396830a41127..0c7edc321415 100644
> > --- a/drivers/pinctrl/intel/Kconfig
> > +++ b/drivers/pinctrl/intel/Kconfig
> > @@ -1,6 +1,7 @@
> >  #
> >  # Intel pin control drivers
> >  #
> > +if (X86 || COMPILE_TEST)

And what about ARM et al. architectures?

Instead I would propose to reorganize parent Kconfig to have something
like

if (ARM || COMPILE_TEST)
...ARM stuff...
endif

if (X86 || COMPILE_TEST)
...X86 stuff...
endif

But personally I don't like any of the above. So, what's the issue this
patch is targeting against?

> >  
> >  config PINCTRL_BAYTRAIL
> >  	bool "Intel Baytrail GPIO pin control"
> > @@ -72,3 +73,5 @@ config PINCTRL_SUNRISEPOINT
> >  	  Sunrisepoint is the PCH of Intel Skylake. This pinctrl
> > driver
> >  	  provides an interface that allows configuring of PCH pins
> > and
> >  	  using them as GPIOs.
> > +
> > +endif
> 
> OK by me:
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> 
> Thanks,
> 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
