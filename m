From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: mockup: add locking
Date: Fri, 16 Nov 2018 22:43:08 +0100
Message-ID: <CACRpkdb71d2yCmxWDBaHY+60A9UDG1u0ACuXUq9pcH13_yA6-g@mail.gmail.com>
References: <20181108165255.9940-1-brgl@bgdev.pl> <20181108165255.9940-3-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108165255.9940-3-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Nov 8, 2018 at 5:53 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> While no user reported any race condition problems with gpio-mockup,
> let's be on the safe side and use a mutex when performing any changes
> on the dummy chip structures.
>
> Suggested-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

I tried to apply this but it failed, does it require patch 1?

I can pull in the next -rc after I merged the fix in that case
and we can apply on top.

__gpio_*
I tend to dislike __underscore_notation because I feel it
is semantically ambguous. I prefer a proper name, even
to the point that I prefer inner_function_foo over __foo,
but it's your driver and I might be a bit grumpy. :)

Yours,
Linus Walleij
