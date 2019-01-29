From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 3/9] irq/irq_sim: provide irq_sim_fire_type()
Date: Tue, 29 Jan 2019 13:55:25 +0100
Message-ID: <20190129125525.ahgiwaftubs3tlog@pengutronix.de>
References: <20190129084411.30495-1-brgl@bgdev.pl>
 <20190129084411.30495-4-brgl@bgdev.pl>
 <20190129090706.33wcxb6d2c64yx7c@pengutronix.de>
 <CAMRc=Me6bGaGiiwvGNXbcr+fxarYsrgH-3MhQpSKjOjKQ6BtTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMRc=Me6bGaGiiwvGNXbcr+fxarYsrgH-3MhQpSKjOjKQ6BtTw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 29, 2019 at 12:01:37PM +0100, Bartosz Golaszewski wrote:
> wt., 29 sty 2019 o 10:07 Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> napisał(a):
> >
> > Hello Bartosz,
> >
> > On Tue, Jan 29, 2019 at 09:44:05AM +0100, Bartosz Golaszewski wrote:
> > > -void irq_sim_fire(struct irq_sim *sim, unsigned int offset)
> > > +void irq_sim_fire_type(struct irq_sim *sim,
> > > +                    unsigned int offset, unsigned int type)
> > >  {
> > >       struct irq_sim_irq_ctx *ctx = irq_sim_get_ctx(sim, offset);
> > >
> > > -     if (ctx->enabled) {
> > > +     /* Only care about relevant flags. */
> > > +     type &= IRQ_TYPE_SENSE_MASK;
> > > +
> > > +     if (ctx->enabled && (ctx->type & type)) {
> > >               set_bit(offset, sim->work_ctx.pending);
> > >               irq_work_queue(&sim->work_ctx.work);
> > >       }
> > >  }
> > > -EXPORT_SYMBOL_GPL(irq_sim_fire);
> > > +EXPORT_SYMBOL_GPL(irq_sim_fire_type);
> >
> > This looks better than the previous variant. I wonder if it would be
> > still more sensible to have type only in the mockup driver. But I don't
> > have the complete picture here and it might be easier this way.
> >
> 
> I'm afraid I don't follow. Wasn't that the way it was done in v1?

No, in v1 you already had "type" in the irq_sim driver and the logic if
the irq should trigger in mockup. My wondering is about having both in
the mockup driver.

Then you have the tracking of the line's level and the logic if it should
trigger an irq in a single place.

But as I said, I'm not sure if this is better than your proposed
solution in v2.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
