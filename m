From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2] irq/irq_sim: provide irq_sim_fire_edge()
Date: Wed, 21 Nov 2018 20:15:09 +0100
Message-ID: <20181121191509.ia2vcklvx4q2rh56@pengutronix.de>
References: <20181120134032.31645-1-brgl@bgdev.pl>
 <20181120134032.31645-2-brgl@bgdev.pl>
 <20181120171742.gkwb4s4qbcqvnefj@pengutronix.de>
 <CAMRc=MfKf_f+x3Wt5gScA5yb78kbpphL87bi2arxcKKGjg1S7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMRc=MfKf_f+x3Wt5gScA5yb78kbpphL87bi2arxcKKGjg1S7Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

Hello Bartosz,

On Wed, Nov 21, 2018 at 05:34:32PM +0100, Bartosz Golaszewski wrote:
> wt., 20 lis 2018 o 18:17 Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> napisał(a):
> >
> > On Tue, Nov 20, 2018 at 02:40:31PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > The irq_sim irqchip doesn't allow to configure the sensitivity so every
> > > call to irq_sim_fire() fires a dummy interrupt. This used to not matter
> > > for gpio-mockup (one of the irq_sim users) until commit fa38869b0161
> > > ("gpiolib: Don't support irq sharing for userspace") which made it
> > > impossible for gpio-mockup to ignore certain events (e.g. only receive
> > > notifications about rising edge events).
> > >
> > > Introduce a specialized variant of irq_sim_fire() which takes another
> > > argument called edge. allowing to specify the trigger type for the
> > > dummy interrupt.
> >
> > I wonder if it's worth the effort to fix irq_sim. If you take a look in
> > my gpio-simulator patch, it is trivial to get it right without external
> > help with an amount of code that is usual for a driver that handles
> > irqs.
> 
> You're basically recommending handcrafting another local piece of code
> for simulating interrupts - something that multiple users may be
> interested in. You did that in your proposed gpio-simulator and I
> still can't understand why you couldn't reuse the existing solution.
> Even if it's broken for your use-case, it's surely easier to fix it
> than to rewrite and duplicate it? There are very few cases where code
> consolidation is not a good thing and I don't think this is one of
> them.

I don't say that factoring out common stuff is bad. But if in the end
you call

	irq_sim_something(some, parameters, offset);

with the simulator and if you don't use the irq simulator you do

	irq = irq_find_mapping(irqdomain, offset);
	generic_handle_irq(irq);

I prefer the latter because it's only a single additional line and in
return it's more obvious what it does because it's the same that many
other drivers (for real hardware) also do.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
