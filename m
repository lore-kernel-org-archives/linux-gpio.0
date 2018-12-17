From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2] irq/irq_sim: provide irq_sim_fire_edge()
Date: Mon, 17 Dec 2018 12:19:45 +0100
Message-ID: <20181217111945.sirtdt2a3h34rect@pengutronix.de>
References: <CAMRc=Mfu=e3BsjMN=_H9CbUvumdmT1pvNjsyivTo1WN+LC1+2A@mail.gmail.com>
 <20181202215613.jcfrxwl4taiqgsql@pengutronix.de>
 <CAMRc=Me=FP537vMVx-jkuff2GqO66T+i3XUBza2Xb4oWzGNcLw@mail.gmail.com>
 <CAMRc=MeD-O5-7sBfrFn2rt27VHXwcOQ5cX2ybLHXU8kFyA_dLQ@mail.gmail.com>
 <20181203104923.gcb2bcsaoczjcjhk@pengutronix.de>
 <CAMRc=Me3srKHXLvdAVLAaVOyW79D378EGVh=dTXbCxo7FiyAsA@mail.gmail.com>
 <20181203110654.53o3prw3qu3u2uyf@pengutronix.de>
 <CACRpkdahWTts9Vz_vdC8dfd_HxCb3NmiFcwK=x-tVvFRcRm3tg@mail.gmail.com>
 <20181205132000.f7n2stv2pxldzcxu@pengutronix.de>
 <CACRpkdaTNFFevE-hauMn17cXbsoddkw_Bp3WyBHbzG1+dohxew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaTNFFevE-hauMn17cXbsoddkw_Bp3WyBHbzG1+dohxew@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Dec 14, 2018 at 03:07:37PM +0100, Linus Walleij wrote:
> On Wed, Dec 5, 2018 at 2:20 PM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Wed, Dec 05, 2018 at 01:19:54PM +0100, Linus Walleij wrote:
> 
> > > > The iio testing driver only needs the trigger and relies on an irq that
> > > > then calls the registerd handler. The iio driver doesn't need to tune
> > > > the edge sensitivity though and if your mockup driver just only calls
> > > > the fire routine if the configured sensitivity justifies that,
> > > > everything should work as expected.
> > >
> > > Simulating edges in the generic IRQ simulator codes seems
> > > generally useful to me, even if there is just one user now.
> >
> > I cannot imagine another potential user. Which kind of driver could use
> > that that is not a gpio simulator?
> 
> I suppose anything that can generate an IRQ and wants to generate
> some test IRQs where edge matters, drivers/irqchips/?

Should the irqchip be the consumer or the provider of the irq? I would
have said the provider as it is an irqchip. What would be the gain of
such an irq chip as all users could use a (flexible enough) gpio
simulator instead?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
