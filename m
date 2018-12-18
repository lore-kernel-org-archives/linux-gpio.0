From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [RFC PATCH v2] regmap: regmap-irq/gpio-max77620: add level-irq
 support
Date: Tue, 18 Dec 2018 11:00:03 +0200
Message-ID: <20181218090003.GE2477@localhost.localdomain>
References: <20181211140555.GA5872@localhost.localdomain>
 <20181213182026.GX10669@sirena.org.uk>
 <20181217084248.GC2477@localhost.localdomain>
 <20181217180722.GG27909@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181217180722.GG27909@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: mazziesaccount@gmail.com, gregkh@linuxfoundation.org, rafael@kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, vladimir_zapolskiy@mentor.com
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 17, 2018 at 06:07:22PM +0000, Mark Brown wrote:
> On Mon, Dec 17, 2018 at 10:42:48AM +0200, Matti Vaittinen wrote:
> > On Thu, Dec 13, 2018 at 06:20:26PM +0000, Mark Brown wrote:
> 
> > > I can't remember and can't find any record of any discussion of it which
> > > is odd, might've been on IRC or something.  Let's just remove it and see
> > > what breaks, since we generally provide the type along with the request
> > > for the interrupt I'm not sure how often the default actually gets used.  
> > > Possibly safer as a second patch though in case there is a good reason
> > > that I missed so we can easily revert it.
> 
> > So how do you see this - should the regmap_add_irq_chip read the current
> > type setting information from HW and populate the cached type values
> > based on the current HW configuration? (I think that would be corect
> > thing to do).
> 
> Yes.

I'll go with this then. I'll try sending the patch removing the default
edge configuration still today.

> 
> > >  It
> > > does look safe to me but it's possible I missed something.  Equally it
> > > only seems to be some quite old Tegra systems using the max77620 so
> > > perhaps mainline usage of affected devices is limited anyway...
> 
> > Right. This makes me wonder if there is some other preferred approach on
> > this... How other drivers are doing the type configurations? Why they
> > are not using regmap-irq? Am I missing something? But what comes to
> > changing the regmap-irq type-setting this is definitely a good news =)
> 
> I suspect a lot of devices lack configurability or have never actually
> done anything where configurability would matter - probably the biggest
> use of regmap-irq is interrupts internal to a chip where there's no real
> need for that, and even where there are GPIOs I'd be surprised if many
> of them were actually used as interrupts rather than dumb outputs or
> something given that most embedded systems have an abundance of GPIOs
> directly on the SoC which are much better.

Thanks for the explanation =) This makes sense.


-- 
Matti Vaittinen
ROHM Semiconductors

~~~ "I don't think so," said Rene Descartes.  Just then, he vanished ~~~
