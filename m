From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 2/2] gpio: mockup: use irq_sim_fire_edge()
Date: Tue, 11 Dec 2018 16:38:54 +0100
Message-ID: <CAMRc=MepmF4phnh_cSE5sFDMYcYEtyh0KGeBot_tu1jnq1276A@mail.gmail.com>
References: <20181120134032.31645-1-brgl@bgdev.pl> <20181120134032.31645-3-brgl@bgdev.pl>
 <20181203110916.eseh2udxvhi4lf3v@pengutronix.de> <20181211141509.6x74jlzipj6o2exh@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211141509.6x74jlzipj6o2exh@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

wt., 11 gru 2018 o 15:15 Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
>
> Hello Bartosz,
>
> On Mon, Dec 03, 2018 at 12:09:16PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > On Tue, Nov 20, 2018 at 02:40:32PM +0100, Bartosz Golaszewski wrote:
> > > @@ -213,7 +213,8 @@ static ssize_t gpio_mockup_event_write(struct fil=
e *file,
> > >     chip =3D priv->chip;
> > >
> > >     gpiod_set_value_cansleep(desc, val);
> > > -   irq_sim_fire(&chip->irqsim, priv->offset);
> > > +   edge =3D val =3D=3D 0 ? IRQ_TYPE_EDGE_FALLING : IRQ_TYPE_EDGE_RIS=
ING;
> > > +   irq_sim_fire_edge(&chip->irqsim, priv->offset, edge);
> >
> > If I write 0 twice into the debugfs file, does it fire two irqs or only
> > one? I think it fires two but only one would be the right behaviour?!
>
> If you still think that patch 1 of this series is the way to go, I think
> this objection is still valid. Then you need to check the state of the
> line by at least calling (something like) .get_value to determine if the
> previous value was different.
>

Hi Uwe,

I've already started working on a series improving the entire concept.
I've taken some of your suggestions into account.

Since we're already at rc-6 I'd like to get those upstream despite
there being some disagreements to keep the userspace intact.

For now it will generate two falling edge interrupts when you write 0 twice=
.

Bart
