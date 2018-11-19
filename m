From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 2/3] gpio: mockup: add locking
Date: Mon, 19 Nov 2018 10:09:02 +0100
Message-ID: <CAMRc=Me9Ypsz_NH7j1K1TxR8u=9qF9opKPri10Jkn3G=_tdssg@mail.gmail.com>
References: <20181108165255.9940-1-brgl@bgdev.pl> <20181108165255.9940-3-brgl@bgdev.pl>
 <CACRpkdb71d2yCmxWDBaHY+60A9UDG1u0ACuXUq9pcH13_yA6-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb71d2yCmxWDBaHY+60A9UDG1u0ACuXUq9pcH13_yA6-g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

pt., 16 lis 2018 o 22:43 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> On Thu, Nov 8, 2018 at 5:53 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > While no user reported any race condition problems with gpio-mockup,
> > let's be on the safe side and use a mutex when performing any changes
> > on the dummy chip structures.
> >
> > Suggested-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>
> I tried to apply this but it failed, does it require patch 1?
>

Yes, because of the change in get_direction().

> I can pull in the next -rc after I merged the fix in that case
> and we can apply on top.
>

This is fine, it's aimed for 4.21 anyway.

> __gpio_*
> I tend to dislike __underscore_notation because I feel it
> is semantically ambguous. I prefer a proper name, even
> to the point that I prefer inner_function_foo over __foo,
> but it's your driver and I might be a bit grumpy. :)
>

I think this is a common and intuitive pattern in the kernel codebase.
Many subsystems and drivers use '__' to mark functions that execute
internal logic and expect certain locks to be held etc.

If you don't mind, I'd like to leave it like this.

Bart
