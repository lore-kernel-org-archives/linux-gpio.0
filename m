From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/2] irq/irq_sim: provide irq_sim_fire_edge()
Date: Mon, 17 Dec 2018 11:32:45 +0100
Message-ID: <CAMRc=MdaEPVTx6u0XsLJ8RFH2Kw+8DE1pJMe3H+e3KY2ycETaw@mail.gmail.com>
References: <CAMRc=MfKf_f+x3Wt5gScA5yb78kbpphL87bi2arxcKKGjg1S7Q@mail.gmail.com>
 <20181121191509.ia2vcklvx4q2rh56@pengutronix.de> <CAMRc=Mef_O9ANUekZaz7vP7M2PpQFjZxJBoG8EPbXt6enRPL7g@mail.gmail.com>
 <20181125211854.idnqxz4pco3r7ydr@pengutronix.de> <CAMRc=Mfu=e3BsjMN=_H9CbUvumdmT1pvNjsyivTo1WN+LC1+2A@mail.gmail.com>
 <20181202215613.jcfrxwl4taiqgsql@pengutronix.de> <CAMRc=Me=FP537vMVx-jkuff2GqO66T+i3XUBza2Xb4oWzGNcLw@mail.gmail.com>
 <CAMRc=MeD-O5-7sBfrFn2rt27VHXwcOQ5cX2ybLHXU8kFyA_dLQ@mail.gmail.com>
 <20181203104923.gcb2bcsaoczjcjhk@pengutronix.de> <CAMRc=Me3srKHXLvdAVLAaVOyW79D378EGVh=dTXbCxo7FiyAsA@mail.gmail.com>
 <20181203110654.53o3prw3qu3u2uyf@pengutronix.de> <CACRpkdahWTts9Vz_vdC8dfd_HxCb3NmiFcwK=x-tVvFRcRm3tg@mail.gmail.com>
 <CAMpxmJWAZevmCkDDgLVTY5REGPB3HA5JAtNDtxT0NMt964GQCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMpxmJWAZevmCkDDgLVTY5REGPB3HA5JAtNDtxT0NMt964GQCQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

=C5=9Br., 5 gru 2018 o 13:38 Bartosz Golaszewski
<bgolaszewski@baylibre.com> napisa=C5=82(a):
>
> =C5=9Br., 5 gru 2018 o 13:20 Linus Walleij <linus.walleij@linaro.org> nap=
isa=C5=82(a):
> >
> > On Mon, Dec 3, 2018 at 12:06 PM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > > On Mon, Dec 03, 2018 at 11:57:26AM +0100, Bartosz Golaszewski wrote:
> >
> > > > It used to live in the gpio-mockup driver and I generalized it
> > > > precisely because there was another driver - iio evgen - which was
> > > > doing basically the same thing. While I don't know if there'll be m=
ore
> > > > users (I'd guess it would be useful for testing purposes of other
> > > > subsystems) having the same functionality implemented once is bette=
r
> > > > than twice.
> > >
> > > The iio testing driver only needs the trigger and relies on an irq th=
at
> > > then calls the registerd handler. The iio driver doesn't need to tune
> > > the edge sensitivity though and if your mockup driver just only calls
> > > the fire routine if the configured sensitivity justifies that,
> > > everything should work as expected.
> >
> > Simulating edges in the generic IRQ simulator codes seems
> > generally useful to me, even if there is just one user now.
> >
> > Certainly for any kind of IRQ testing, it could be interesting to
> > throw several low-to-high and high-to-low transitions
> > on a driver and see how it reacts.
> >
> > But it is up to the irqchip maintainers to state whether they
> > agree.
> >
>
> All that would be great, but at this point I just want to fix broken
> tests in user-space. After that we can think about how to
> improve/approach simulating interrupts all we want.
>
> Marc: is my explanation for using an int instead of bool for
> irq_sim_fire_edge() fine? Can Linus pick this up for fixes?
>

Ping. We have only this week left to fix the regression - can we get
your Ack Marc?

NOTE: this patch must go into v4.20, and will probably conflict with
the bitmap patch you picked up for 4.21. I can take it into my PR for
Linus Walleij and then fix the conflict in next.

Bart
