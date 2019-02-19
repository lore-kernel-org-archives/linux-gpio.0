From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v5 1/7] irq/irq_sim: add irq_set_type() callback
Date: Tue, 19 Feb 2019 14:20:03 +0100
Message-ID: <CAMRc=McPh3ox-eLGdS=VdmJOsxHeYwRTTjHfay9oEAr4QfjV1g@mail.gmail.com>
References: <20190218164138.24921-1-brgl@bgdev.pl> <20190218164138.24921-2-brgl@bgdev.pl>
 <20190219122524.2e2b01db@why.wild-wind.fr.eu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219122524.2e2b01db@why.wild-wind.fr.eu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

wt., 19 lut 2019 o 13:25 Marc Zyngier <marc.zyngier@arm.com> napisa=C5=82(a=
):
>
> On Mon, 18 Feb 2019 17:41:32 +0100
> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Implement the irq_set_type() callback and call irqd_set_trigger_type()
> > internally so that users interested in the configured trigger type can
> > later retrieve it using irqd_get_trigger_type().
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  kernel/irq/irq_sim.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
> > index 98a20e1594ce..83ecc65d8be2 100644
> > --- a/kernel/irq/irq_sim.c
> > +++ b/kernel/irq/irq_sim.c
> > @@ -25,10 +25,18 @@ static void irq_sim_irqunmask(struct irq_data *data=
)
> >       irq_ctx->enabled =3D true;
> >  }
> >
> > +static int irq_sim_set_type(struct irq_data *data, unsigned int type)
> > +{
> > +     irqd_set_trigger_type(data, type);
> > +
> > +     return 0;
>
> You keep ignoring the requirement for sanitization of the trigger type.
> Frankly, I'm getting tired of fighting over 3 lines of incorrect code.
>

It used to be there in previous versions, but I removed it on purpose
in v5. I understand why we needed that earlier, but if we now moved
*all* the logic behind the trigger type to the users of this API and
we're now simply storing any config we get, then why would we impose
any limits on it here? We don't do this now and this patch doesn't
change the current behavior. I really don't understand how not
rejecting certain trigger types makes this patch incorrect.

> I guess that despite all the noise, you don't really want this code in
> after all.
>

I do want and need this, but I really can't figure out from your
reviews how you imagine the correct solution. You said previously that
the irq_set_type callback should push the configuration to wherever
it's needed. I believe the above patch does this. Should we then limit
the supported trigger types? That would mean that irq_sim would need
to know what users support. It seems inverted to me, but if you think
it's right, then my question is: will accepting only IRQ_TYPE_NONE,
IRQ_TYPE_EDGE_RISING and IRQ_TYPE_EDGE_FALLING in the above function
be enough for you to accept it? Is the rest fine?

Thanks,
Bartosz
