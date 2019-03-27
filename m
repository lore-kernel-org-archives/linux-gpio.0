From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1] gpio: gpio-mlxbf: Add dependency on 64BIT to Kconfig entry
Date: Wed, 27 Mar 2019 16:59:03 +0100
Message-ID: <CAMpxmJXB5cGi7z3b0p4Nmgtb=iPRXut+RTrGf=JnT6Bc3ziXeQ@mail.gmail.com>
References: <bfe609b73c36810457e5ae75b74e1d0fb7f6c5ac.1553696064.git.sramani@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bfe609b73c36810457e5ae75b74e1d0fb7f6c5ac.1553696064.git.sramani@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shravan Kumar Ramani <sramani@mellanox.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

=C5=9Br., 27 mar 2019 o 15:15 Shravan Kumar Ramani <sramani@mellanox.com> n=
apisa=C5=82(a):
>
> Fixes a compile test failure
>
> Signed-off-by: Shravan Kumar Ramani <sramani@mellanox.com>
> ---
>  drivers/gpio/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 0d9ddff..530ee34 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1318,7 +1318,7 @@ config GPIO_MERRIFIELD
>
>  config GPIO_MLXBF
>         tristate "Mellanox BlueField SoC GPIO"
> -       depends on (MELLANOX_PLATFORM && ARM64 && ACPI) || COMPILE_TEST
> +       depends on (MELLANOX_PLATFORM && ARM64 && ACPI) || (64BIT && COMP=
ILE_TEST)
>         select GPIO_GENERIC
>         help
>           Say Y here if you want GPIO support on Mellanox BlueField SoC.
> --
> 2.1.2
>

Applied, thanks!

Bart
