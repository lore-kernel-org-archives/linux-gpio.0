From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/3] gpio: mockup: fix indicated direction
Date: Fri, 9 Nov 2018 18:23:01 +0100
Message-ID: <CAMRc=MfY7c21NOBNnVgXKimywXHFifwek5B76Y_3DgmM_hBbgw@mail.gmail.com>
References: <20181108165255.9940-1-brgl@bgdev.pl> <20181108165255.9940-2-brgl@bgdev.pl>
 <20181108203546.54rncnydgamud5z3@pengutronix.de> <CAMRc=Mev6RMvVox2Sx6s80+obLg4QWAL=_hwcf34m2iMXwEbOg@mail.gmail.com>
 <20181109115424.pe4w26nmt6xplzto@pengutronix.de> <CAMRc=Mdf1GHR0_7uQ4PFFCwL9p3NyKBDMSBkipR826BhTYpz=g@mail.gmail.com>
 <20181109131036.v6d645ojv6jr7v3y@pengutronix.de> <CAMRc=Mf18udrM=2=SZHMg3M2akcccPXb7Fr81vXODpNgjf+uJw@mail.gmail.com>
 <20181109143950.gy7swu6vgaqgg7dw@pengutronix.de> <CAMRc=McF482n+57e6Vz9H1dEQ5QS+4p88SYg6ZjNuUMYZx6t3Q@mail.gmail.com>
 <20181109170323.6b2nj5vvtwu3d5ee@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181109170323.6b2nj5vvtwu3d5ee@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

pt., 9 lis 2018 o 18:03 Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
>
> Hello Bartosz,
>
> On Fri, Nov 09, 2018 at 04:24:10PM +0100, Bartosz Golaszewski wrote:
> > pt., 9 lis 2018 o 15:39 Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
> > > On Fri, Nov 09, 2018 at 02:53:16PM +0100, Bartosz Golaszewski wrote:
> > > > pt., 9 lis 2018 o 14:10 Uwe Kleine-K=C3=B6nig
> > > > <u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
> > > > > Which test failed exactly?
> > > >
> > > > All gpioinfo tests that check the output of this command and expect=
 to
> > > > see input as line direction.
> > >
> > > This wasn't the answer I expected. The background of my question was:
> > > This failing test seems to expect that a given GPIO is an input. If t=
hat
> > > expectation already exists after the gpio is only requested, then the
> > > test is broken and a fix is necessary there.
> >
> > The test is only expected to work with gpio-mockup which is a dummy
> > testing module. I believe its behavior should be as deterministic as
> > possible to the point where newly created chips always have the same
> > direction.
>
> Given that the initial direction of a GPIO isn't fixed in my eyes the
> test should be able to cope with both possibilities. I'd say it's a bug
> in the test if it doesn't.
>

As I said before: it is and should be fixed in this specific case.
This isn't real hardware.

Bart
