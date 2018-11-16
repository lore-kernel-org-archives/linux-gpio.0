From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: mockup: fix indicated direction
Date: Fri, 16 Nov 2018 22:38:47 +0100
Message-ID: <CACRpkdYNW7BsZO71WBAz9FCP=zOuP6oVf8pbj5rsAV7izkreUw@mail.gmail.com>
References: <20181108165255.9940-1-brgl@bgdev.pl> <20181108165255.9940-2-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108165255.9940-2-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Nov 8, 2018 at 5:53 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Commit 3edfb7bd76bd ("gpiolib: Show correct direction from the
> beginning") fixed an existing issue but broke libgpiod tests by
> changing the default direction of dummy lines to output.
>
> We don't break user-space so make gpio-mockup behave as before.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Patch applied for fixes.

I browsed the debate here. I think this should be applied for
fixes, then if the test should be changed, we can do that for
devel in that case.

Yours,
Linus Walleij
