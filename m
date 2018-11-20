From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: mockup: add locking
Date: Tue, 20 Nov 2018 09:46:50 +0100
Message-ID: <CACRpkdasK1UoNz34skdb+NbEE7SQuMhkij+xGW=Y6Pc5LF3AxQ@mail.gmail.com>
References: <20181108165255.9940-1-brgl@bgdev.pl> <20181108165255.9940-3-brgl@bgdev.pl>
 <CACRpkdb71d2yCmxWDBaHY+60A9UDG1u0ACuXUq9pcH13_yA6-g@mail.gmail.com> <CAMRc=Me9Ypsz_NH7j1K1TxR8u=9qF9opKPri10Jkn3G=_tdssg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMRc=Me9Ypsz_NH7j1K1TxR8u=9qF9opKPri10Jkn3G=_tdssg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Nov 19, 2018 at 10:09 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> pt., 16 lis 2018 o 22:43 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):

> > __gpio_*
> > I tend to dislike __underscore_notation because I feel it
> > is semantically ambguous. I prefer a proper name, even
> > to the point that I prefer inner_function_foo over __foo,
> > but it's your driver and I might be a bit grumpy. :)
>
> I think this is a common and intuitive pattern in the kernel codebase.
> Many subsystems and drivers use '__' to mark functions that execute
> internal logic and expect certain locks to be held etc.

You say it yourself: interpretation depends on context.

I might be especially stupid for being unable to discern
meaning from context in these cases and so what is
intuitive for some is just not intuitive for me.

Example:
set_bit() vs __set_bit()

Apparently some kernel developers think it is completely
obvious that the latter is the unlocked non-atomic version
of set_bit(). However I was confused for years with no
idea as to what the difference was.

Had it simply been named set_bit_nonatomic(), at the
cost of a few characters, confusion on my part would be
avoided and at least to me the world would be a better
place.

> If you don't mind, I'd like to leave it like this.

No big deal, keep it as is :)

Yours,
Linus Walleij
