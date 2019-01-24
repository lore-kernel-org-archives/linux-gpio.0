From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 3/9] irq/irq_sim: provide irq_sim_get_type()
Date: Thu, 24 Jan 2019 09:09:14 +0100
Message-ID: <20190124080914.knftob7s4hpgz27n@pengutronix.de>
References: <20190123141538.29408-1-brgl@bgdev.pl>
 <20190123141538.29408-4-brgl@bgdev.pl>
 <20190123191824.btuaq4s5rvc236n3@pengutronix.de>
 <CAMRc=Me58SFJOMxie5aTkOAHRqS7bjdOSAaZSY8wjPK7tntTfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMRc=Me58SFJOMxie5aTkOAHRqS7bjdOSAaZSY8wjPK7tntTfQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 24, 2019 at 08:46:56AM +0100, Bartosz Golaszewski wrote:
> śr., 23 sty 2019 o 20:18 Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> napisał(a):
> >
> > Hello Bartosz,
> >
> > On Wed, Jan 23, 2019 at 03:15:32PM +0100, Bartosz Golaszewski wrote:
> > > Provide a helper that allows users to retrieve the configured flow type
> > > of dummy interrupts. That allows certain users to decide whether an irq
> > > needs to be fired depending on its edge/level/... configuration.
> >
> > You don't talk about the .set_type callback here; is this intended?
> >
> > I wonder how you think this should be used. Assume the mockup-driver is
> > directed to pull up a certain line, does it do something like that:
> >
> >         def mockup_setval(self, val):
> >                 irqtype = irq_sim_get_type(...)
> >                 if irqtype == LEVEL_HIGH:
> >                         if val:
> >                                 fire_irq()
> >
> >                 else if irqtype == EDGE_RISING:
> >                         if val and not prev_val:
> >                                 fire_irq()
> >
> >                 else if irqtype == LEVEL_LOW:
> >                         if not val:
> >                                 fire_irq()
> >
> >                 else if irqtype == EDGE_FALLING:
> >                         if not val and prev_val:
> >                                 fire_irq()
> >
> > I wonder if that logic should be done in the same place as where the irq
> > type is stored. Otherwise that .type member is only a data store
> > provided by the irq simulator. So I suggest to either move the variable
> > that mirrors the current level of the line into the irq simulator, or
> > keep the irqtype variable in the mockup driver. Both approaches would
> > make it unnecessary to provide an accessor function for the type member.
> >
> 
> Yeah, might be better to go back to my previous idea of adding
> irq_sim_fire_edge(), but maybe it should be irq_sim_fire_type()
> instead, so that irq_sim_fire() fires unconditionally and
> irq_sim_fire_type() would fire only if the passed flag is the same as
> the one previously configured by the set_type() callback.

How (if at all) do you intend to support level sensitive irqs with this
interface? It probably works (but I didn't thought it through
completely), but firing a LEVEL_HIGH sensitive irq on

	irq_sim_fire_type(EDGE_RISING)

might look at least surprising and needs proper comments and thoughts.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
