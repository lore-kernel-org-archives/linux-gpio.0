From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 3/9] irq/irq_sim: provide irq_sim_fire_type()
Date: Tue, 12 Feb 2019 11:15:30 +0100
Message-ID: <CAMRc=Md+pAPSyQeFOOEiOiBb6bLvQ=FTNQHVYA-=6iZMfsuHng@mail.gmail.com>
References: <20190129084411.30495-1-brgl@bgdev.pl> <20190129084411.30495-4-brgl@bgdev.pl>
 <656763ec-41b9-cdee-22bd-1f32d74473a0@arm.com> <CAMpxmJXdyiSLyx7O5G41GzfJQktOS1JeuRUoHejVB3ZOmCFMLQ@mail.gmail.com>
 <20190212100607.4etnqytsrtxtcqvc@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212100607.4etnqytsrtxtcqvc@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

wt., 12 lut 2019 o 11:06 Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
>
> On Tue, Feb 12, 2019 at 10:19:20AM +0100, Bartosz Golaszewski wrote:
> > wt., 12 lut 2019 o 10:10 Marc Zyngier <marc.zyngier@arm.com> napisa=C5=
=82(a):
> > >
> > > On 29/01/2019 08:44, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > Provide a more specialized variant of irq_sim_fire() that allows to
> > > > specify the type of the fired interrupt. The type is stored in the
> > > > dummy irq context struct via the set_type callback.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > ---
> > > >  include/linux/irq_sim.h |  9 ++++++++-
> > > >  kernel/irq/irq_sim.c    | 26 ++++++++++++++++++++++----
> > > >  2 files changed, 30 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/include/linux/irq_sim.h b/include/linux/irq_sim.h
> > > > index b96c2f752320..647a6c8ffb31 100644
> > > > --- a/include/linux/irq_sim.h
> > > > +++ b/include/linux/irq_sim.h
> > > > @@ -23,6 +23,7 @@ struct irq_sim_work_ctx {
> > > >
> > > >  struct irq_sim_irq_ctx {
> > > >       bool                    enabled;
> > > > +     unsigned int            type;
> > > >  };
> > > >
> > > >  struct irq_sim {
> > > > @@ -37,7 +38,13 @@ int irq_sim_init(struct irq_sim *sim, unsigned i=
nt num_irqs);
> > > >  int devm_irq_sim_init(struct device *dev, struct irq_sim *sim,
> > > >                     unsigned int num_irqs);
> > > >  void irq_sim_fini(struct irq_sim *sim);
> > > > -void irq_sim_fire(struct irq_sim *sim, unsigned int offset);
> > > > +void irq_sim_fire_type(struct irq_sim *sim,
> > > > +                    unsigned int offset, unsigned int type);
> > > >  int irq_sim_irqnum(struct irq_sim *sim, unsigned int offset);
> > > >
> > > > +static inline void irq_sim_fire(struct irq_sim *sim, unsigned int =
offset)
> > > > +{
> > > > +     irq_sim_fire_type(sim, offset, IRQ_TYPE_DEFAULT);
> > > > +}
> > > > +
> > > >  #endif /* _LINUX_IRQ_SIM_H */
> > > > diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
> > > > index 2bcdbab1bc5a..e3160b5e59b8 100644
> > > > --- a/kernel/irq/irq_sim.c
> > > > +++ b/kernel/irq/irq_sim.c
> > > > @@ -25,6 +25,15 @@ static void irq_sim_irqunmask(struct irq_data *d=
ata)
> > > >       irq_ctx->enabled =3D true;
> > > >  }
> > > >
> > > > +static int irq_sim_set_type(struct irq_data *data, unsigned int ty=
pe)
> > > > +{
> > > > +     struct irq_sim_irq_ctx *irq_ctx =3D irq_data_get_irq_chip_dat=
a(data);
> > > > +
> > > > +     irq_ctx->type =3D type;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > >  static void irq_sim_handle_irq(struct irq_work *work)
> > > >  {
> > > >       struct irq_sim_work_ctx *work_ctx;
> > > > @@ -107,6 +116,7 @@ int irq_sim_init(struct irq_sim *sim, unsigned =
int num_irqs)
> > > >       sim->chip.name =3D "irq_sim";
> > > >       sim->chip.irq_mask =3D irq_sim_irqmask;
> > > >       sim->chip.irq_unmask =3D irq_sim_irqunmask;
> > > > +     sim->chip.irq_set_type =3D irq_sim_set_type;
> > > >
> > > >       sim->work_ctx.pending =3D bitmap_zalloc(num_irqs, GFP_KERNEL)=
;
> > > >       if (!sim->work_ctx.pending) {
> > > > @@ -192,21 +202,29 @@ irq_sim_get_ctx(struct irq_sim *sim, unsigned=
 int offset)
> > > >  }
> > > >
> > > >  /**
> > > > - * irq_sim_fire - Enqueue an interrupt.
> > > > + * irq_sim_fire_type - Enqueue an interrupt.
> > > >   *
> > > >   * @sim:        The interrupt simulator object.
> > > >   * @offset:     Offset of the simulated interrupt which should be =
fired.
> > > > + * @type:    Type of the fired interrupt. Must be one of the follo=
wing:
> > > > + *           IRQ_TYPE_EDGE_RISING, IRQ_TYPE_EDGE_FALLING,
> > > > + *           IRQ_TYPE_EDGE_BOTH, IRQ_TYPE_LEVEL_HIGH,
> > > > + *           IRQ_TYPE_LEVEL_LOW, IRQ_TYPE_DEFAULT
> > > >   */
> > > > -void irq_sim_fire(struct irq_sim *sim, unsigned int offset)
> > > > +void irq_sim_fire_type(struct irq_sim *sim,
> > > > +                    unsigned int offset, unsigned int type)
> > > >  {
> > > >       struct irq_sim_irq_ctx *ctx =3D irq_sim_get_ctx(sim, offset);
> > > >
> > > > -     if (ctx->enabled) {
> > > > +     /* Only care about relevant flags. */
> > > > +     type &=3D IRQ_TYPE_SENSE_MASK;
> > > > +
> > > > +     if (ctx->enabled && (ctx->type & type)) {
> > >
> > > I wonder how realistic this is, given that you do not track the relea=
se
> > > of a level. In short, mo matter what the type is, you treat everythin=
g
> > > as edge.
> > >
> > > What is the point of this?
> > >
> >
> > When userspace wants to monitor GPIO line interrupts, the GPIO
> > framework requests a threaded interrupt with IRQF_TRIGGER_FALLING,
> > IRQF_TRIGGER_RISING or both.
>
> I think the background of the question was: Why is there no support for
> level sensitive irqs?
>
> The userspace API has this limitation (also for no good reason I think).
>

Fair point. We also need support for programmable pull-up/down
resistors as it's something many users request. It's just a matter of
someone getting down to doing it. :)

Bart
