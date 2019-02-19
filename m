From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v6 1/7] irq/irq_sim: add irq_set_type() callback
Date: Tue, 19 Feb 2019 17:36:23 +0100
Message-ID: <CAMRc=Md4UAYD-emar9yGnJCEnFDXkP2CR7HgjGedPoTPtYH5OQ@mail.gmail.com>
References: <20190219160650.9614-1-brgl@bgdev.pl> <20190219160650.9614-2-brgl@bgdev.pl>
 <20190219161449.26e99a2b@why.wild-wind.fr.eu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219161449.26e99a2b@why.wild-wind.fr.eu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

wt., 19 lut 2019 o 17:14 Marc Zyngier <marc.zyngier@arm.com> napisa=C5=82(a=
):
>
> On Tue, 19 Feb 2019 17:06:44 +0100
> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Implement the irq_set_type() callback and call irqd_set_trigger_type()
> > internally so that users interested in the configured trigger type can
> > later retrieve it using irqd_get_trigger_type(). We only support edge
> > trigger types.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  kernel/irq/irq_sim.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
> > index 98a20e1594ce..b992f88c5613 100644
> > --- a/kernel/irq/irq_sim.c
> > +++ b/kernel/irq/irq_sim.c
> > @@ -25,10 +25,22 @@ static void irq_sim_irqunmask(struct irq_data *data=
)
> >       irq_ctx->enabled =3D true;
> >  }
> >
> > +static int irq_sim_set_type(struct irq_data *data, unsigned int type)
> > +{
> > +     /* We only support rising and falling edge trigger types. */
> > +     if (type & ~IRQ_TYPE_EDGE_BOTH)
> > +             return -EINVAL;
> > +
> > +     irqd_set_trigger_type(data, type);
> > +
> > +     return 0;
> > +}
> > +
> >  static struct irq_chip irq_sim_irqchip =3D {
> >       .name           =3D "irq_sim",
> >       .irq_mask       =3D irq_sim_irqmask,
> >       .irq_unmask     =3D irq_sim_irqunmask,
> > +     .irq_set_type   =3D irq_sim_set_type,
> >  };
> >
> >  static void irq_sim_handle_irq(struct irq_work *work)
>
> Acked-by: Marc Zyngier <marc.zyngier@arm.com>
>

Thanks you! If you don't mind, I'll send this together with other
patches directly to Linus Walleij.

Bartosz
