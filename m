From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] irq/irq_sim: provide irq_sim_fire_edge()
Date: Fri, 14 Dec 2018 15:07:37 +0100
Message-ID: <CACRpkdaTNFFevE-hauMn17cXbsoddkw_Bp3WyBHbzG1+dohxew@mail.gmail.com>
References: <CAMRc=Mef_O9ANUekZaz7vP7M2PpQFjZxJBoG8EPbXt6enRPL7g@mail.gmail.com>
 <20181125211854.idnqxz4pco3r7ydr@pengutronix.de> <CAMRc=Mfu=e3BsjMN=_H9CbUvumdmT1pvNjsyivTo1WN+LC1+2A@mail.gmail.com>
 <20181202215613.jcfrxwl4taiqgsql@pengutronix.de> <CAMRc=Me=FP537vMVx-jkuff2GqO66T+i3XUBza2Xb4oWzGNcLw@mail.gmail.com>
 <CAMRc=MeD-O5-7sBfrFn2rt27VHXwcOQ5cX2ybLHXU8kFyA_dLQ@mail.gmail.com>
 <20181203104923.gcb2bcsaoczjcjhk@pengutronix.de> <CAMRc=Me3srKHXLvdAVLAaVOyW79D378EGVh=dTXbCxo7FiyAsA@mail.gmail.com>
 <20181203110654.53o3prw3qu3u2uyf@pengutronix.de> <CACRpkdahWTts9Vz_vdC8dfd_HxCb3NmiFcwK=x-tVvFRcRm3tg@mail.gmail.com>
 <20181205132000.f7n2stv2pxldzcxu@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205132000.f7n2stv2pxldzcxu@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Dec 5, 2018 at 2:20 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Wed, Dec 05, 2018 at 01:19:54PM +0100, Linus Walleij wrote:

> > > The iio testing driver only needs the trigger and relies on an irq th=
at
> > > then calls the registerd handler. The iio driver doesn't need to tune
> > > the edge sensitivity though and if your mockup driver just only calls
> > > the fire routine if the configured sensitivity justifies that,
> > > everything should work as expected.
> >
> > Simulating edges in the generic IRQ simulator codes seems
> > generally useful to me, even if there is just one user now.
>
> I cannot imagine another potential user. Which kind of driver could use
> that that is not a gpio simulator?

I suppose anything that can generate an IRQ and wants to generate
some test IRQs where edge matters, drivers/irqchips/?

Regmap IRQ drivers/base/regmap/regmap-irq.c does support
edges, and regmap already expose all registers it handles in
debugfs, so it'd be really neat of you can also use debugfs
to insert IRQs from a device using regmap.

Yours,
Linus Walleij
