From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/2] gpio: mockup: drop unneeded dependencies from Kconfig
Date: Fri, 22 Mar 2019 16:55:32 +0100
Message-ID: <CAMRc=MfeJSN9Nza4rMmaA6eARUzUvq46YEmq4+GhVxjYSiuorQ@mail.gmail.com>
References: <20190314150750.9371-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190314150750.9371-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

czw., 14 mar 2019 o 16:08 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(=
a):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> The testing module doesn't need GPIO irqchip nor does it depend on
> sysfs. Remove unnecessary dependencies from Kconfig.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/Kconfig | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 3f50526a771f..e9473e968d9a 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -332,9 +332,7 @@ config GPIO_MM_LANTIQ
>
>  config GPIO_MOCKUP
>         tristate "GPIO Testing Driver"
> -       depends on GPIOLIB && SYSFS
> -       select GPIO_SYSFS
> -       select GPIOLIB_IRQCHIP
> +       depends on GPIOLIB
>         select IRQ_SIM
>         help
>           This enables GPIO Testing driver, which provides a way to test =
GPIO
> --
> 2.20.1
>

Both applied to for-next.

Bart
