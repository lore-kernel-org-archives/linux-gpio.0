From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 1/2] gpio: sprd: Fix the incorrect data register
Date: Wed, 16 Jan 2019 09:27:28 +0100
Message-ID: <CAMpxmJWamqR23xsWQZgkPO7sOEWrvKER4niG2brndCZGpsZChw@mail.gmail.com>
References: <24594f8799f6aabdeaad3935fe36d832fb465148.1547615070.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <24594f8799f6aabdeaad3935fe36d832fb465148.1547615070.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Orson Zhai <orsonzhai@gmail.com>, Lyra Zhang <zhang.lyra@gmail.com>, neo.hou@unisoc.com, Mark Brown <broonie@kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

=C5=9Br., 16 sty 2019 o 06:06 Baolin Wang <baolin.wang@linaro.org> napisa=
=C5=82(a):
>
> From: Neo Hou <neo.hou@unisoc.com>
>
> Since differnt type EICs have its own data register to read, thus fix the
> incorrect data register.
>
> Fixes: 25518e024e3a ("gpio: Add Spreadtrum EIC driver support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Neo Hou <neo.hou@unisoc.com>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
> Changes from v1:
>  - Add fix tag and CC stable.
> ---
>  drivers/gpio/gpio-eic-sprd.c |   13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c
> index e0d6a0a..257df59 100644
> --- a/drivers/gpio/gpio-eic-sprd.c
> +++ b/drivers/gpio/gpio-eic-sprd.c
> @@ -180,7 +180,18 @@ static void sprd_eic_free(struct gpio_chip *chip, un=
signed int offset)
>
>  static int sprd_eic_get(struct gpio_chip *chip, unsigned int offset)
>  {
> -       return sprd_eic_read(chip, offset, SPRD_EIC_DBNC_DATA);
> +       struct sprd_eic *sprd_eic =3D gpiochip_get_data(chip);
> +
> +       switch (sprd_eic->type) {
> +       case SPRD_EIC_DEBOUNCE:
> +               return sprd_eic_read(chip, offset, SPRD_EIC_DBNC_DATA);
> +       case SPRD_EIC_ASYNC:
> +               return sprd_eic_read(chip, offset, SPRD_EIC_ASYNC_DATA);
> +       case SPRD_EIC_SYNC:
> +               return sprd_eic_read(chip, offset, SPRD_EIC_SYNC_DATA);
> +       default:
> +               return -ENOTSUPP;
> +       }
>  }
>
>  static int sprd_eic_direction_input(struct gpio_chip *chip, unsigned int=
 offset)
> --
> 1.7.9.5
>

Both applied for fixes, thanks!

Bartosz
