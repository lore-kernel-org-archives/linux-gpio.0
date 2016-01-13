From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: mpc8xxx: Do not use gpiochip_get_data() in mpc8xxx_gpio_save_regs()
Date: Wed, 13 Jan 2016 10:22:46 +0100
Message-ID: <CACRpkdb0H5VGku2Lm_FsyGMVSZ5KjyMGS9ywmQ-BYgnv531JEw@mail.gmail.com>
References: <1452183924-19390-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452183924-19390-1-git-send-email-linux@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Alexander Stein <alexander.stein@systec-electronic.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 7, 2016 at 5:25 PM, Guenter Roeck <linux@roeck-us.net> wrot=
e:

> Commit 709d71a17c33 ("gpio: mpc8xxx: use gpiochip data pointer") repl=
aces
> the use of container_of() with gpiochip_get_data(). However, the data
> pointer is not yet set by the time the save_regs function is called.
>
> Fixes: 709d71a17c33 ("gpio: mpc8xxx: use gpiochip data pointer")
> Cc: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> Cc: Alexander Stein <alexander.stein@systec-electronic.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Patch applied.

Yours,
Linus Walleij
