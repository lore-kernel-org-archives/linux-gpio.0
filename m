From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/2] irq/irq_sim: provide irq_sim_fire_edge()
Date: Wed, 21 Nov 2018 17:34:32 +0100
Message-ID: <CAMRc=MfKf_f+x3Wt5gScA5yb78kbpphL87bi2arxcKKGjg1S7Q@mail.gmail.com>
References: <20181120134032.31645-1-brgl@bgdev.pl> <20181120134032.31645-2-brgl@bgdev.pl>
 <20181120171742.gkwb4s4qbcqvnefj@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181120171742.gkwb4s4qbcqvnefj@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

wt., 20 lis 2018 o 18:17 Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
>
> On Tue, Nov 20, 2018 at 02:40:31PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > The irq_sim irqchip doesn't allow to configure the sensitivity so every
> > call to irq_sim_fire() fires a dummy interrupt. This used to not matter
> > for gpio-mockup (one of the irq_sim users) until commit fa38869b0161
> > ("gpiolib: Don't support irq sharing for userspace") which made it
> > impossible for gpio-mockup to ignore certain events (e.g. only receive
> > notifications about rising edge events).
> >
> > Introduce a specialized variant of irq_sim_fire() which takes another
> > argument called edge. allowing to specify the trigger type for the
> > dummy interrupt.
>
> I wonder if it's worth the effort to fix irq_sim. If you take a look in
> my gpio-simulator patch, it is trivial to get it right without external
> help with an amount of code that is usual for a driver that handles
> irqs.
>

You're basically recommending handcrafting another local piece of code
for simulating interrupts - something that multiple users may be
interested in. You did that in your proposed gpio-simulator and I
still can't understand why you couldn't reuse the existing solution.
Even if it's broken for your use-case, it's surely easier to fix it
than to rewrite and duplicate it? There are very few cases where code
consolidation is not a good thing and I don't think this is one of
them.

The interrupt simulator exists and is used by two testing drivers
currently. One of them needs some more flexibility and this is what
this patch is trying to add. I believe it is worth the effort.

Best regards,
Bartosz

> > @@ -161,12 +171,28 @@ EXPORT_SYMBOL_GPL(devm_irq_sim_init);
> >   */
> >  void irq_sim_fire(struct irq_sim *sim, unsigned int offset)
> >  {
> > -     if (sim->irqs[offset].enabled) {
> > +     /* Don't care about the edge. */
> > +     irq_sim_fire_edge(sim, offset, IRQ_TYPE_EDGE_BOTH);
>
> Conceptually irq_sim_fire_edge should be defined above irq_sim_fire.
>
> > +EXPORT_SYMBOL_GPL(irq_sim_fire);
> > +
> > +/**
> > + * irq_sim_fire_edge - Enqueue an interrupt, specify the edge.
> > + *
> > + * @sim:        The interrupt simulator object.
> > + * @offset:     Offset of the simulated interrupt which should be fire=
d.
> > + * edge:        Edge of the interrupt (IRQ_TYPE_EDGE_RISING/FALLING).
> > + */
> > +void irq_sim_fire_edge(struct irq_sim *sim, unsigned int offset, int e=
dge)
> > +{
> > +     struct irq_sim_irq_ctx *irq =3D &sim->irqs[offset];
> > +
> > +     if (irq->enabled && (irq->edge & edge)) {
> >               set_bit(offset, sim->work_ctx.pending);
> >               irq_work_queue(&sim->work_ctx.work);
> >       }
> >  }
> > -EXPORT_SYMBOL_GPL(irq_sim_fire);
> > +EXPORT_SYMBOL_GPL(irq_sim_fire_edge);
>
> Best regards
> Uwe
>
> --
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  =
|
