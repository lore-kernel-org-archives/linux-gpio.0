From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] drivers: provide devm_platform_ioremap_resource()
Date: Wed, 20 Feb 2019 10:57:03 +0100
Message-ID: <CACRpkdY43ojBZ1NUyvc0X8+3tc3=jhv4S2oJX2v-88TgrKxQqg@mail.gmail.com>
References: <20190215152507.31066-1-brgl@bgdev.pl> <20190215152507.31066-2-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190215152507.31066-2-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Keerthy <j-keerthy@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Feb 15, 2019 at 4:25 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> There are currently 1200+ instances of using platform_get_resource()
> and devm_ioremap_resource() together in the kernel tree.
>
> This patch wraps these two calls in a single helper. Thanks to that
> we don't have to declare a local variable for struct resource * and can
> omit the redundant argument for resource type. We also have one
> function call less.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This makes a lot of sense. I think Andy can confirm the value, he
knows a lot about good helpers.

I'd need Greg's ACK on this before merging through GPIO.

Can we make a script or coccinelle thing to fix them all when this
is applied?

Yours,
Linus Walleij
