From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 3/9] irq/irq_sim: provide irq_sim_fire_type()
Date: Tue, 29 Jan 2019 12:01:37 +0100
Message-ID: <CAMRc=Me6bGaGiiwvGNXbcr+fxarYsrgH-3MhQpSKjOjKQ6BtTw@mail.gmail.com>
References: <20190129084411.30495-1-brgl@bgdev.pl> <20190129084411.30495-4-brgl@bgdev.pl>
 <20190129090706.33wcxb6d2c64yx7c@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129090706.33wcxb6d2c64yx7c@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

wt., 29 sty 2019 o 10:07 Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
>
> Hello Bartosz,
>
> On Tue, Jan 29, 2019 at 09:44:05AM +0100, Bartosz Golaszewski wrote:
> > -void irq_sim_fire(struct irq_sim *sim, unsigned int offset)
> > +void irq_sim_fire_type(struct irq_sim *sim,
> > +                    unsigned int offset, unsigned int type)
> >  {
> >       struct irq_sim_irq_ctx *ctx =3D irq_sim_get_ctx(sim, offset);
> >
> > -     if (ctx->enabled) {
> > +     /* Only care about relevant flags. */
> > +     type &=3D IRQ_TYPE_SENSE_MASK;
> > +
> > +     if (ctx->enabled && (ctx->type & type)) {
> >               set_bit(offset, sim->work_ctx.pending);
> >               irq_work_queue(&sim->work_ctx.work);
> >       }
> >  }
> > -EXPORT_SYMBOL_GPL(irq_sim_fire);
> > +EXPORT_SYMBOL_GPL(irq_sim_fire_type);
>
> This looks better than the previous variant. I wonder if it would be
> still more sensible to have type only in the mockup driver. But I don't
> have the complete picture here and it might be easier this way.
>

I'm afraid I don't follow. Wasn't that the way it was done in v1?

Bart
