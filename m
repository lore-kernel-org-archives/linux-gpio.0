From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/2] irq/irq_sim: provide irq_sim_fire_edge()
Date: Thu, 29 Nov 2018 19:14:45 +0100
Message-ID: <CAMRc=Mfu=e3BsjMN=_H9CbUvumdmT1pvNjsyivTo1WN+LC1+2A@mail.gmail.com>
References: <20181120134032.31645-1-brgl@bgdev.pl> <20181120134032.31645-2-brgl@bgdev.pl>
 <20181120171742.gkwb4s4qbcqvnefj@pengutronix.de> <CAMRc=MfKf_f+x3Wt5gScA5yb78kbpphL87bi2arxcKKGjg1S7Q@mail.gmail.com>
 <20181121191509.ia2vcklvx4q2rh56@pengutronix.de> <CAMRc=Mef_O9ANUekZaz7vP7M2PpQFjZxJBoG8EPbXt6enRPL7g@mail.gmail.com>
 <20181125211854.idnqxz4pco3r7ydr@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181125211854.idnqxz4pco3r7ydr@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

niedz., 25 lis 2018 o 22:18 Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
>
> On Fri, Nov 23, 2018 at 04:59:46PM +0100, Bartosz Golaszewski wrote:
> > =C5=9Br., 21 lis 2018 o 20:15 Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
> > >
> > > Hello Bartosz,
> > >
> > > On Wed, Nov 21, 2018 at 05:34:32PM +0100, Bartosz Golaszewski wrote:
> > > > wt., 20 lis 2018 o 18:17 Uwe Kleine-K=C3=B6nig
> > > > <u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
> > > > >
> > > > > On Tue, Nov 20, 2018 at 02:40:31PM +0100, Bartosz Golaszewski wro=
te:
> > > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > >
> > > > > > The irq_sim irqchip doesn't allow to configure the sensitivity =
so every
> > > > > > call to irq_sim_fire() fires a dummy interrupt. This used to no=
t matter
> > > > > > for gpio-mockup (one of the irq_sim users) until commit fa38869=
b0161
> > > > > > ("gpiolib: Don't support irq sharing for userspace") which made=
 it
> > > > > > impossible for gpio-mockup to ignore certain events (e.g. only =
receive
> > > > > > notifications about rising edge events).
> > > > > >
> > > > > > Introduce a specialized variant of irq_sim_fire() which takes a=
nother
> > > > > > argument called edge. allowing to specify the trigger type for =
the
> > > > > > dummy interrupt.
> > > > >
> > > > > I wonder if it's worth the effort to fix irq_sim. If you take a l=
ook in
> > > > > my gpio-simulator patch, it is trivial to get it right without ex=
ternal
> > > > > help with an amount of code that is usual for a driver that handl=
es
> > > > > irqs.
> > > >
> > > > You're basically recommending handcrafting another local piece of c=
ode
> > > > for simulating interrupts - something that multiple users may be
> > > > interested in. You did that in your proposed gpio-simulator and I
> > > > still can't understand why you couldn't reuse the existing solution=
.
> > > > Even if it's broken for your use-case, it's surely easier to fix it
> > > > than to rewrite and duplicate it? There are very few cases where co=
de
> > > > consolidation is not a good thing and I don't think this is one of
> > > > them.
> > >
> > > I don't say that factoring out common stuff is bad. But if in the end
> > > you call
> > >
> > >         irq_sim_something(some, parameters, offset);
> > >
> > > with the simulator and if you don't use the irq simulator you do
> > >
> > >         irq =3D irq_find_mapping(irqdomain, offset);
> > >         generic_handle_irq(irq);
> > >
> > > I prefer the latter because it's only a single additional line and in
> > > return it's more obvious what it does because it's the same that many
> > > other drivers (for real hardware) also do.
> >
> > I'm not sure I'm following you. You still need to add ~150 LOC for the
> > gpio_simulator_irqtrigger() worker and gpio_simulator_irq_*() routines
> > locally as you did in your gpio-simulator patch. A generic simulator +
> > using the irq_work saves you that.
>
> If you teach the irq-sim driver everything that the gpio-simulator does
> in the functions you pointed out then this is for sure functionality
> that other users of the irq-sim code won't make use of. This is about
> tracking the level of the gpio/irq line and the interrupt enable and raw
> status bits that usually happen in hardware. The dummy iio driver won't
> need that for sure as it only cares about triggering an irq and doesn't
> even specify an irq type.
>

We're getting too much into details of how to handle simulated
interrupts and we can continue discussing it, but meanwhile I'd like
to address a different thing:

Thomas, Linus: after commit fa38869b0161 ("gpiolib: Don't support irq
sharing for userspace") some libgpiod tests are failing because we can
no longer depend on reading the value of a dummy GPIO after detecting
an interrupt to know the edge of the interrupt. While these interrupts
are triggered from debugfs and debugfs is not required to maintain
compatibility, I thing having a working test suite for the GPIO
subsystem and uAPI is worth applying these two patches and also the
previous one[1].

Can we have them applied for 4.20 or are there any objections?

Best regards,
Bartosz Golaszewski

[1] https://lkml.org/lkml/2018/11/9/1418
