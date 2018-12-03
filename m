From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/2] irq/irq_sim: provide irq_sim_fire_edge()
Date: Mon, 3 Dec 2018 11:57:26 +0100
Message-ID: <CAMRc=Me3srKHXLvdAVLAaVOyW79D378EGVh=dTXbCxo7FiyAsA@mail.gmail.com>
References: <20181120134032.31645-2-brgl@bgdev.pl> <20181120171742.gkwb4s4qbcqvnefj@pengutronix.de>
 <CAMRc=MfKf_f+x3Wt5gScA5yb78kbpphL87bi2arxcKKGjg1S7Q@mail.gmail.com>
 <20181121191509.ia2vcklvx4q2rh56@pengutronix.de> <CAMRc=Mef_O9ANUekZaz7vP7M2PpQFjZxJBoG8EPbXt6enRPL7g@mail.gmail.com>
 <20181125211854.idnqxz4pco3r7ydr@pengutronix.de> <CAMRc=Mfu=e3BsjMN=_H9CbUvumdmT1pvNjsyivTo1WN+LC1+2A@mail.gmail.com>
 <20181202215613.jcfrxwl4taiqgsql@pengutronix.de> <CAMRc=Me=FP537vMVx-jkuff2GqO66T+i3XUBza2Xb4oWzGNcLw@mail.gmail.com>
 <CAMRc=MeD-O5-7sBfrFn2rt27VHXwcOQ5cX2ybLHXU8kFyA_dLQ@mail.gmail.com> <20181203104923.gcb2bcsaoczjcjhk@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203104923.gcb2bcsaoczjcjhk@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

pon., 3 gru 2018 o 11:49 Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
>
> On Mon, Dec 03, 2018 at 11:23:38AM +0100, Bartosz Golaszewski wrote:
> > niedz., 2 gru 2018 o 23:20 Bartosz Golaszewski <brgl@bgdev.pl> napisa=
=C5=82(a):
> > >
> > > niedz., 2 gru 2018 o 22:56 Uwe Kleine-K=C3=B6nig
> > > <u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
> > > >
> > > > Hello,
> > > >
> > > > On Thu, Nov 29, 2018 at 07:14:45PM +0100, Bartosz Golaszewski wrote=
:
> > > > > We're getting too much into details of how to handle simulated
> > > > > interrupts and we can continue discussing it, but meanwhile I'd l=
ike
> > > > > to address a different thing:
> > > > >
> > > > > Thomas, Linus: after commit fa38869b0161 ("gpiolib: Don't support=
 irq
> > > > > sharing for userspace") some libgpiod tests are failing because w=
e can
> > > > > no longer depend on reading the value of a dummy GPIO after detec=
ting
> > > > > an interrupt to know the edge of the interrupt. While these inter=
rupts
> > > > > are triggered from debugfs and debugfs is not required to maintai=
n
> > > > > compatibility, I thing having a working test suite for the GPIO
> > > > > subsystem and uAPI is worth applying these two patches and also t=
he
> > > > > previous one[1].
> > > > >
> > > > > Can we have them applied for 4.20 or are there any objections?
> > > >
> > > > Just for the record: I objected the patch, Bartosz agrees to discus=
s
> > > > further and but because this is too much detail the patch should no=
w be
> > > > applied anyhow to fix the test suite of an external project. This s=
eems
> > > > wrong to me.
> > > >
> > >
> > > Just to look at it from a different perspective: we have a project
> > > whose tests rely on a behavior that was changed by Uwe's patch. While
> > > the patch is fine, we need to find a correct way of testing the GPIO
> > > user API. This may take a long time. In order to not break the tests
> > > of an external project in 4.20 I propose to patch the interrupt
> > > simulator (a component only used for testing) for now and to revisit
> > > it later without time pressure.
> > >
> > > Best regards,
> > > Bartosz
> >
> > In fact after re-reading this conversation I'm still not sure what
> > your objection is exactly. You're proposing a solution that may well
> > be nicely engineered but it's specific to your gpio-simulator.
> > Meanwhile I'm trying to provide a more generalized API for more
> > testing modules to use.
>
> I think you're generalizing something that won't find any user apart
> from your mockup driver. So I'd say the generalisation is wrong and the
> added code could better live in the mockup driver directly.
>

It used to live in the gpio-mockup driver and I generalized it
precisely because there was another driver - iio evgen - which was
doing basically the same thing. While I don't know if there'll be more
users (I'd guess it would be useful for testing purposes of other
subsystems) having the same functionality implemented once is better
than twice.

Bart
