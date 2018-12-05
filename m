From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] irq/irq_sim: provide irq_sim_fire_edge()
Date: Wed, 5 Dec 2018 13:19:54 +0100
Message-ID: <CACRpkdahWTts9Vz_vdC8dfd_HxCb3NmiFcwK=x-tVvFRcRm3tg@mail.gmail.com>
References: <CAMRc=MfKf_f+x3Wt5gScA5yb78kbpphL87bi2arxcKKGjg1S7Q@mail.gmail.com>
 <20181121191509.ia2vcklvx4q2rh56@pengutronix.de> <CAMRc=Mef_O9ANUekZaz7vP7M2PpQFjZxJBoG8EPbXt6enRPL7g@mail.gmail.com>
 <20181125211854.idnqxz4pco3r7ydr@pengutronix.de> <CAMRc=Mfu=e3BsjMN=_H9CbUvumdmT1pvNjsyivTo1WN+LC1+2A@mail.gmail.com>
 <20181202215613.jcfrxwl4taiqgsql@pengutronix.de> <CAMRc=Me=FP537vMVx-jkuff2GqO66T+i3XUBza2Xb4oWzGNcLw@mail.gmail.com>
 <CAMRc=MeD-O5-7sBfrFn2rt27VHXwcOQ5cX2ybLHXU8kFyA_dLQ@mail.gmail.com>
 <20181203104923.gcb2bcsaoczjcjhk@pengutronix.de> <CAMRc=Me3srKHXLvdAVLAaVOyW79D378EGVh=dTXbCxo7FiyAsA@mail.gmail.com>
 <20181203110654.53o3prw3qu3u2uyf@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203110654.53o3prw3qu3u2uyf@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 3, 2018 at 12:06 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Mon, Dec 03, 2018 at 11:57:26AM +0100, Bartosz Golaszewski wrote:

> > It used to live in the gpio-mockup driver and I generalized it
> > precisely because there was another driver - iio evgen - which was
> > doing basically the same thing. While I don't know if there'll be more
> > users (I'd guess it would be useful for testing purposes of other
> > subsystems) having the same functionality implemented once is better
> > than twice.
>
> The iio testing driver only needs the trigger and relies on an irq that
> then calls the registerd handler. The iio driver doesn't need to tune
> the edge sensitivity though and if your mockup driver just only calls
> the fire routine if the configured sensitivity justifies that,
> everything should work as expected.

Simulating edges in the generic IRQ simulator codes seems
generally useful to me, even if there is just one user now.

Certainly for any kind of IRQ testing, it could be interesting to
throw several low-to-high and high-to-low transitions
on a driver and see how it reacts.

But it is up to the irqchip maintainers to state whether they
agree.

Yours,
Linus Walleij
