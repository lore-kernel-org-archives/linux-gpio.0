From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [RFC PATCH v2] regmap: regmap-irq/gpio-max77620: add level-irq
 support
Date: Mon, 17 Dec 2018 10:42:48 +0200
Message-ID: <20181217084248.GC2477@localhost.localdomain>
References: <20181211140555.GA5872@localhost.localdomain>
 <20181213182026.GX10669@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181213182026.GX10669@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: mazziesaccount@gmail.com, gregkh@linuxfoundation.org, rafael@kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, vladimir_zapolskiy@mentor.com, matti.vaittinen@fi.rohmeurope.com
List-Id: linux-gpio@vger.kernel.org

Hello Mark,

On Thu, Dec 13, 2018 at 06:20:26PM +0000, Mark Brown wrote:
> On Tue, Dec 11, 2018 at 04:05:55PM +0200, Matti Vaittinen wrote:
> 
> > One specific question hit me while doing this. Why does the regmap-irq
> > core do default trigger type configuration? I did leave this in the
> > patch - but to me it is strange. For me it would be unexpected that the
> > HW default trigger level is changed by common code. I would understand
> > if change was done by some board specific code, or code specific to a
> > chip - but 'core' doing this seems wrong to me. Should it be removed?
> 
> I can't remember and can't find any record of any discussion of it which
> is odd, might've been on IRC or something.  Let's just remove it and see
> what breaks, since we generally provide the type along with the request
> for the interrupt I'm not sure how often the default actually gets used.  
> Possibly safer as a second patch though in case there is a good reason
> that I missed so we can easily revert it.

So how do you see this - should the regmap_add_irq_chip read the current
type setting information from HW and populate the cached type values
based on the current HW configuration? (I think that would be corect
thing to do).

> Unfortunately this also collides with a change I applied earlier on from
> Bartosz which supports chips that use masks instead of a separate type
> register to handle types so it'll need respinning, sorry about that.

No problem - I'll fetch the latest changes from regulator tree and see
how to fit this in. It may be this will be done after the holidays
though - I'm not sure how my schedules are during the next few weeks...
Besides I have also this "main IRQ status" -thing ongoing.

>  It
> does look safe to me but it's possible I missed something.  Equally it
> only seems to be some quite old Tegra systems using the max77620 so
> perhaps mainline usage of affected devices is limited anyway...

Right. This makes me wonder if there is some other preferred approach on
this... How other drivers are doing the type configurations? Why they
are not using regmap-irq? Am I missing something? But what comes to
changing the regmap-irq type-setting this is definitely a good news =)
And... Thanks for all the feedback and support Mark!

Br,
	Matti Vaittinen

-- 
Matti Vaittinen
ROHM Semiconductors

~~~ "I don't think so," said Rene Descartes.  Just then, he vanished ~~~
