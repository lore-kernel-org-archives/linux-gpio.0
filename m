From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/3] gpio: mockup: fix indicated direction
Date: Fri, 9 Nov 2018 12:13:44 +0100
Message-ID: <CAMRc=Mev6RMvVox2Sx6s80+obLg4QWAL=_hwcf34m2iMXwEbOg@mail.gmail.com>
References: <20181108165255.9940-1-brgl@bgdev.pl> <20181108165255.9940-2-brgl@bgdev.pl>
 <20181108203546.54rncnydgamud5z3@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108203546.54rncnydgamud5z3@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

czw., 8 lis 2018 o 21:35 Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
>
> Hello Bartosz,
>
> On Thu, Nov 08, 2018 at 05:52:53PM +0100, Bartosz Golaszewski wrote:
> > Commit 3edfb7bd76bd ("gpiolib: Show correct direction from the
> > beginning") fixed an existing issue but broke libgpiod tests by
> > changing the default direction of dummy lines to output.
>
> The indicated commit only changed what was shown in debugfs, but didn't
> touch the actual direction of a GPIO, doesn't it? If someone called
> gpiod_get_direction before it would have returned "output", too, unless
> I miss something.
>

This commit (3edfb7bd76bd) sets the correct direction of the line by
actually calling get_direction() instead of assuming input if
direction_input is not NULL. It just so happened that previously the
default direction of gpio-mockup lines was output but it would be
displayed as input due to this inconsistency.

My commit fixes it by simply setting the value of GPIO_MOCKUP_DIR_IN
to 0 so that when we kzalloc the line structure, we'll get the right
direction automatically.

Bart
