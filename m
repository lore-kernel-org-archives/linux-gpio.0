From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 1/9] irq/irq_sim: don't share the irq_chip structure
 between simulators
Date: Tue, 12 Feb 2019 09:29:01 +0100
Message-ID: <CAMpxmJUVHNU8mvOiKOvk6rkqjVOtxy_j+LVm0rjjV7ys0+DHPw@mail.gmail.com>
References: <20190129084411.30495-1-brgl@bgdev.pl> <20190129084411.30495-2-brgl@bgdev.pl>
 <20190211222839.7a7ad87f@why.wild-wind.fr.eu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211222839.7a7ad87f@why.wild-wind.fr.eu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

pon., 11 lut 2019 o 23:28 Marc Zyngier <marc.zyngier@arm.com> napisa=C5=82(=
a):
>
> On Tue, 29 Jan 2019 09:44:03 +0100
> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > We want to support multiple instances of irq_sim. Make struct irq_chip
> > part of the irq_sim structure.
>
> Why? There is nothing dynamic in an irqchip structure. It is all code
> that is set in stone for the lifetime of the irqchip.
>
> I've sure you have a use for such indirection, so why don't you explain
> what you have in mind?
>

No you're right, this can be dropped.

Bart

> Thanks,
>
>         M.
>
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  include/linux/irq_sim.h |  2 ++
> >  kernel/irq/irq_sim.c    | 12 +++++-------
> >  2 files changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/include/linux/irq_sim.h b/include/linux/irq_sim.h
> > index 4500d453a63e..eda132c22b57 100644
> > --- a/include/linux/irq_sim.h
> > +++ b/include/linux/irq_sim.h
> > @@ -6,6 +6,7 @@
> >  #ifndef _LINUX_IRQ_SIM_H
> >  #define _LINUX_IRQ_SIM_H
> >
> > +#include <linux/irq.h>
> >  #include <linux/irq_work.h>
> >  #include <linux/device.h>
> >
> > @@ -25,6 +26,7 @@ struct irq_sim_irq_ctx {
> >  };
> >
> >  struct irq_sim {
> > +     struct irq_chip         chip;
> >       struct irq_sim_work_ctx work_ctx;
> >       int                     irq_base;
> >       unsigned int            irq_count;
> > diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
> > index 98a20e1594ce..b732e4e2e45b 100644
> > --- a/kernel/irq/irq_sim.c
> > +++ b/kernel/irq/irq_sim.c
> > @@ -25,12 +25,6 @@ static void irq_sim_irqunmask(struct irq_data *data)
> >       irq_ctx->enabled =3D true;
> >  }
> >
> > -static struct irq_chip irq_sim_irqchip =3D {
> > -     .name           =3D "irq_sim",
> > -     .irq_mask       =3D irq_sim_irqmask,
> > -     .irq_unmask     =3D irq_sim_irqunmask,
> > -};
> > -
> >  static void irq_sim_handle_irq(struct irq_work *work)
> >  {
> >       struct irq_sim_work_ctx *work_ctx;
> > @@ -74,6 +68,10 @@ int irq_sim_init(struct irq_sim *sim, unsigned int n=
um_irqs)
> >               return sim->irq_base;
> >       }
> >
> > +     sim->chip.name =3D "irq_sim";
> > +     sim->chip.irq_mask =3D irq_sim_irqmask;
> > +     sim->chip.irq_unmask =3D irq_sim_irqunmask;
> > +
> >       sim->work_ctx.pending =3D bitmap_zalloc(num_irqs, GFP_KERNEL);
> >       if (!sim->work_ctx.pending) {
> >               kfree(sim->irqs);
> > @@ -84,7 +82,7 @@ int irq_sim_init(struct irq_sim *sim, unsigned int nu=
m_irqs)
> >       for (i =3D 0; i < num_irqs; i++) {
> >               sim->irqs[i].irqnum =3D sim->irq_base + i;
> >               sim->irqs[i].enabled =3D false;
> > -             irq_set_chip(sim->irq_base + i, &irq_sim_irqchip);
> > +             irq_set_chip(sim->irq_base + i, &sim->chip);
> >               irq_set_chip_data(sim->irq_base + i, &sim->irqs[i]);
> >               irq_set_handler(sim->irq_base + i, &handle_simple_irq);
> >               irq_modify_status(sim->irq_base + i,
>
>
>
> --
> Without deviation from the norm, progress is not possible.
