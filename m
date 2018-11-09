From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/3] gpio: mockup: fix indicated direction
Date: Fri, 9 Nov 2018 16:24:10 +0100
Message-ID: <CAMRc=McF482n+57e6Vz9H1dEQ5QS+4p88SYg6ZjNuUMYZx6t3Q@mail.gmail.com>
References: <20181108165255.9940-1-brgl@bgdev.pl> <20181108165255.9940-2-brgl@bgdev.pl>
 <20181108203546.54rncnydgamud5z3@pengutronix.de> <CAMRc=Mev6RMvVox2Sx6s80+obLg4QWAL=_hwcf34m2iMXwEbOg@mail.gmail.com>
 <20181109115424.pe4w26nmt6xplzto@pengutronix.de> <CAMRc=Mdf1GHR0_7uQ4PFFCwL9p3NyKBDMSBkipR826BhTYpz=g@mail.gmail.com>
 <20181109131036.v6d645ojv6jr7v3y@pengutronix.de> <CAMRc=Mf18udrM=2=SZHMg3M2akcccPXb7Fr81vXODpNgjf+uJw@mail.gmail.com>
 <20181109143950.gy7swu6vgaqgg7dw@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181109143950.gy7swu6vgaqgg7dw@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

pt., 9 lis 2018 o 15:39 Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
>
> On Fri, Nov 09, 2018 at 02:53:16PM +0100, Bartosz Golaszewski wrote:
> > pt., 9 lis 2018 o 14:10 Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
> > >
> > > Hello,
> > >
> > > On Fri, Nov 09, 2018 at 01:24:36PM +0100, Bartosz Golaszewski wrote:
> > > > pt., 9 lis 2018 o 12:54 Uwe Kleine-K=C3=B6nig
> > > > <u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
> > > > > On Fri, Nov 09, 2018 at 12:13:44PM +0100, Bartosz Golaszewski wro=
te:
> > > > > > czw., 8 lis 2018 o 21:35 Uwe Kleine-K=C3=B6nig
> > > > > > <u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
> > > > > > > On Thu, Nov 08, 2018 at 05:52:53PM +0100, Bartosz Golaszewski=
 wrote:
> > > > > > > > Commit 3edfb7bd76bd ("gpiolib: Show correct direction from =
the
> > > > > > > > beginning") fixed an existing issue but broke libgpiod test=
s by
> > > > > > > > changing the default direction of dummy lines to output.
> > > > > > >
> > > > > > > The indicated commit only changed what was shown in debugfs, =
but didn't
> > > > > > > touch the actual direction of a GPIO, doesn't it? If someone =
called
> > > > > > > gpiod_get_direction before it would have returned "output", t=
oo, unless
> > > > > > > I miss something.
> > > > > > >
> > > > > >
> > > > > > This commit (3edfb7bd76bd) sets the correct direction of the li=
ne by
> > > > > > actually calling get_direction() instead of assuming input if
> > > > > > direction_input is not NULL. It just so happened that previousl=
y the
> > > > > > default direction of gpio-mockup lines was output but it would =
be
> > > > > > displayed as input due to this inconsistency.
> > > > >
> > > > > Does the test that fails since 3edfb7bd76bd use debugfs/gpio to f=
ind out
> > > > > the direction of a gpio? I'd say it's a bad idea to depend on thi=
s as
> > > > > (AFAICT) debugfs is only a debug aid and you shouldn't depend on =
stuff
> > > > > contained in it.
> > > >
> > > > No, this is what we get from the LINEINFO ioctl(). I only use debug=
fs
> > > > for triggering dummy interrupts.
> > >
> > > A right, gpio_ioctl uses these flags, too.
> > >
> > > > > I'd weaken the commit log a bit to not claim that the commit brok=
e
> > > > > libgpiod but that it only made the inconsistency visible. After a=
ll this
> > > > > commit didn't "change the default direction of dummy lines to out=
put",
> > > > > they were an output already before.
> > > >
> > > > Well it did break the tests you know. ;)
> > >
> > > Which test failed exactly?
> > >
> >
> > All gpioinfo tests that check the output of this command and expect to
> > see input as line direction.
>
> This wasn't the answer I expected. The background of my question was:
> This failing test seems to expect that a given GPIO is an input. If that
> expectation already exists after the gpio is only requested, then the
> test is broken and a fix is necessary there.
>

The test is only expected to work with gpio-mockup which is a dummy
testing module. I believe its behavior should be as deterministic as
possible to the point where newly created chips always have the same
direction.

Bart
