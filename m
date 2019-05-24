From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: fix gpio-adp5588 build errors
Date: Fri, 24 May 2019 09:03:14 +0200
Message-ID: <CAMpxmJUVoaAq0-0ELpzmZjke7yjZN+n75WO9i=cWK-WbXw8gZw@mail.gmail.com>
References: <8054bec0-ea24-8590-738b-bae58c0be3b4@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8054bec0-ea24-8590-738b-bae58c0be3b4@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kbuild test robot <lkp@intel.com>, Michael Hennerich <michael.hennerich@analog.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

pt., 24 maj 2019 o 00:00 Randy Dunlap <rdunlap@infradead.org> napisa=C5=82(=
a):
>
> From: Randy Dunlap <rdunlap@infradead.org>
>
> The gpio-adp5588 driver uses interfaces that are provided by
> GPIOLIB_IRQCHIP, so select that symbol in its Kconfig entry.
>
> Fixes these build errors:
>
> ../drivers/gpio/gpio-adp5588.c: In function =E2=80=98adp5588_irq_handler=
=E2=80=99:
> ../drivers/gpio/gpio-adp5588.c:266:26: error: =E2=80=98struct gpio_chip=
=E2=80=99 has no member named =E2=80=98irq=E2=80=99
>             dev->gpio_chip.irq.domain, gpio));
>                           ^
> ../drivers/gpio/gpio-adp5588.c: In function =E2=80=98adp5588_irq_setup=E2=
=80=99:
> ../drivers/gpio/gpio-adp5588.c:298:2: error: implicit declaration of func=
tion =E2=80=98gpiochip_irqchip_add_nested=E2=80=99 [-Werror=3Dimplicit-func=
tion-declaration]
>   ret =3D gpiochip_irqchip_add_nested(&dev->gpio_chip,
>   ^
> ../drivers/gpio/gpio-adp5588.c:307:2: error: implicit declaration of func=
tion =E2=80=98gpiochip_set_nested_irqchip=E2=80=99 [-Werror=3Dimplicit-func=
tion-declaration]
>   gpiochip_set_nested_irqchip(&dev->gpio_chip,
>   ^
>
> Fixes: 459773ae8dbb ("gpio: adp5588-gpio: support interrupt controller")
>
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Michael Hennerich <michael.hennerich@analog.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: linux-gpio@vger.kernel.org
> ---
>  drivers/gpio/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>
> --- lnx-52-rc1.orig/drivers/gpio/Kconfig
> +++ lnx-52-rc1/drivers/gpio/Kconfig
> @@ -822,6 +822,7 @@ config GPIO_ADP5588
>  config GPIO_ADP5588_IRQ
>         bool "Interrupt controller support for ADP5588"
>         depends on GPIO_ADP5588=3Dy
> +       select GPIOLIB_IRQCHIP
>         help
>           Say yes here to enable the adp5588 to be used as an interrupt
>           controller. It requires the driver to be built in the kernel.
>
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
