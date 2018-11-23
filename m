From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/2] irq/irq_sim: provide irq_sim_fire_edge()
Date: Fri, 23 Nov 2018 16:59:46 +0100
Message-ID: <CAMRc=Mef_O9ANUekZaz7vP7M2PpQFjZxJBoG8EPbXt6enRPL7g@mail.gmail.com>
References: <20181120134032.31645-1-brgl@bgdev.pl> <20181120134032.31645-2-brgl@bgdev.pl>
 <20181120171742.gkwb4s4qbcqvnefj@pengutronix.de> <CAMRc=MfKf_f+x3Wt5gScA5yb78kbpphL87bi2arxcKKGjg1S7Q@mail.gmail.com>
 <20181121191509.ia2vcklvx4q2rh56@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181121191509.ia2vcklvx4q2rh56@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

=C5=9Br., 21 lis 2018 o 20:15 Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
>
> Hello Bartosz,
>
> On Wed, Nov 21, 2018 at 05:34:32PM +0100, Bartosz Golaszewski wrote:
> > wt., 20 lis 2018 o 18:17 Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
> > >
> > > On Tue, Nov 20, 2018 at 02:40:31PM +0100, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > The irq_sim irqchip doesn't allow to configure the sensitivity so e=
very
> > > > call to irq_sim_fire() fires a dummy interrupt. This used to not ma=
tter
> > > > for gpio-mockup (one of the irq_sim users) until commit fa38869b016=
1
> > > > ("gpiolib: Don't support irq sharing for userspace") which made it
> > > > impossible for gpio-mockup to ignore certain events (e.g. only rece=
ive
> > > > notifications about rising edge events).
> > > >
> > > > Introduce a specialized variant of irq_sim_fire() which takes anoth=
er
> > > > argument called edge. allowing to specify the trigger type for the
> > > > dummy interrupt.
> > >
> > > I wonder if it's worth the effort to fix irq_sim. If you take a look =
in
> > > my gpio-simulator patch, it is trivial to get it right without extern=
al
> > > help with an amount of code that is usual for a driver that handles
> > > irqs.
> >
> > You're basically recommending handcrafting another local piece of code
> > for simulating interrupts - something that multiple users may be
> > interested in. You did that in your proposed gpio-simulator and I
> > still can't understand why you couldn't reuse the existing solution.
> > Even if it's broken for your use-case, it's surely easier to fix it
> > than to rewrite and duplicate it? There are very few cases where code
> > consolidation is not a good thing and I don't think this is one of
> > them.
>
> I don't say that factoring out common stuff is bad. But if in the end
> you call
>
>         irq_sim_something(some, parameters, offset);
>
> with the simulator and if you don't use the irq simulator you do
>
>         irq =3D irq_find_mapping(irqdomain, offset);
>         generic_handle_irq(irq);
>
> I prefer the latter because it's only a single additional line and in
> return it's more obvious what it does because it's the same that many
> other drivers (for real hardware) also do.
>

I'm not sure I'm following you. You still need to add ~150 LOC for the
gpio_simulator_irqtrigger() worker and gpio_simulator_irq_*() routines
locally as you did in your gpio-simulator patch. A generic simulator +
using the irq_work saves you that.

Bart
