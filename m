From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: make of_get_named_gpiod_flags() private
Date: Tue, 13 May 2014 15:17:51 +0200
Message-ID: <CACRpkdYM5W2oVT0y25u+BhWHpVma5fRP8MgmEH46dAyu8L8-2g@mail.gmail.com>
References: <1399175125-6430-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1399175125-6430-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, May 4, 2014 at 5:45 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> of_get_named_gpiod_flags() is visible and directly usable by GPIO
> consumers, but it really should not as the gpiod interface relies
> on the simpler gpiod_get() to provide properly-configured GPIOs.
>
> of_get_named_gpiod_flags() is just used internally by gpiolib to
> implement gpiod_get(), and by the old of_get_named_gpio_flags()
> function, therefore it makes sense to make it gpiolib-private.
>
> As a side-effect, the unused (and unneeded) of_get_gpiod_flags()
> inline function is also removed, and of_get_named_gpio_flags() is moved
> from a static inline function to a regular one in gpiolib-of.c
>
> This results in all references to gpiod_* functions in of_gpio.h being
> gone, which is the way it should be since this file is part of the old
> integer GPIO interface.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

This patch broke a lot of drivers so I had to take it out again...

Yours,
Linus Walleij
