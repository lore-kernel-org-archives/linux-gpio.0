From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 1/2] gpio: sprd: Fix the incorrect data register
Date: Tue, 15 Jan 2019 11:47:22 +0100
Message-ID: <CAMpxmJVyMd=rebK2h=uC_Cu_KXivRpCDCxzrneig0eZnK=wXpQ@mail.gmail.com>
References: <732ea4f8ff1bf3ad28bda543ae8e1727c78f8b3b.1547538574.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <732ea4f8ff1bf3ad28bda543ae8e1727c78f8b3b.1547538574.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, orsonzhai@gmail.com, zhang.lyra@gmail.com, neo.hou@unisoc.com, Mark Brown <broonie@kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

wt., 15 sty 2019 o 08:53 Baolin Wang <baolin.wang@linaro.org> napisa=C5=82(=
a):
>
> From: Neo Hou <neo.hou@unisoc.com>
>
> Since differnt type EICs have its own data register to read, thus fix the
> incorrect data register.
>
> Signed-off-by: Neo Hou <neo.hou@unisoc.com>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
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

I guess both this and the second patch should go into stable and have
a Fixes: tag?

Bart
