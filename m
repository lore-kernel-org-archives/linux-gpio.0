From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3] regmap: regmap-irq/gpio-max77620: add level-irq
 support
Date: Thu, 3 Jan 2019 17:20:08 +0000
Message-ID: <20190103172008.GO16508@imbe.wolfsonmicro.main>
References: <20181218115931.GA21253@localhost.localdomain>
 <CAMuHMdUbXeuemACL+GGx0HFjn2oKUb2UbDUKJedzCrm8JDfNaA@mail.gmail.com>
 <20181227073531.GA2461@localhost.localdomain>
 <20181227075648.GB2461@localhost.localdomain>
 <20181228080533.GC2461@localhost.localdomain>
 <20181231191127.GL1846@sirena.org.uk>
 <20190102074251.GA8865@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190102074251.GA8865@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, mazziesaccount@gmail.com, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, Greg KH <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 02, 2019 at 09:42:51AM +0200, Matti Vaittinen wrote:
> On Mon, Dec 31, 2018 at 07:11:27PM +0000, Mark Brown wrote:
> > On Fri, Dec 28, 2018 at 10:05:33AM +0200, Matti Vaittinen wrote:
> > 
> > > Last night - just when I was about to get some sleep - it stroke me. I
> > > think the correct thing to do would be leaving the irq_set_type to NULL
> > > for those IRQ chips which do not support type setting. If we do that,
> > > then the irq core will take care of situations where user requests type
> > > setting but the chip does not support it. Which means the regmap-irq
> > > would be no different from any other irq chip where type setting is not
> > > supported.
> > 
> > Yes, this is the best fix - let the framework handle things properly.
> > We'll need a second set of operations and to select which to use based
> > on having type information but that's fine.
> > 
> > > So at the cost of removing "const" from regmap_irq_chip we could do:
> > 
> > ...
> > 
> > > Mark, Geert, what do you think? (And maybe same for the .irq_set_wake -
> > > but I did omit this as I have never looked at the wake functionality
> > > before).
> > 
> > We need a separate struct as otherwise if there's multiple devices with
> > regmap irq_chip implementations then they'll collide with each other
> 
> Right. I must admit I didn't notice this! I was about to make a nasty
> error there...
> 

Looking at the code I think it just copies the struct anyway,
basically using it as a template so I think this should be fine.

> > you're probably right that we need to do the same thing for the wake
> > configuration.  I'll still look at applying your patch as a temporary
> > fix though.
> 
> Thanks Mark. I try to cook a patch with copying of struct irq_chip still
> at this week but I wont rush it (I have some other topics under work) as
> the regression should be fixed by the other patch.
> 

Just to check that is this patch here:

https://lore.kernel.org/lkml/20181227084443.GA23991@localhost.localdomain/

Just want to check what will be applied so I know it will fix the
regression I am seeing as well.

Thanks,
Charles
