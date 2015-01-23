From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: sx150x: Fix compile issue when CONFIG_OF_GPIO is
 not defined
Date: Fri, 23 Jan 2015 09:45:26 +0900
Message-ID: <CAAVeFuJxSmdP09s_kLMx2_+qc=XLHX65jMbAWy66vmADsswRgg@mail.gmail.com>
References: <1421973429-9663-1-git-send-email-mopsfelder@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421973429-9663-1-git-send-email-mopsfelder@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Murilo Opsfelder Araujo <mopsfelder@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Wei.Chen@csr.com, Baohua.Song@csr.com
List-Id: linux-gpio@vger.kernel.org

On Fri, Jan 23, 2015 at 9:37 AM, Murilo Opsfelder Araujo
<mopsfelder@gmail.com> wrote:
> Without this patch, the compilation of gpio-sx150x.c fails because
> struct gpio_chip members 'of_node' and 'of_gpio_n_cells' do not exist
> when CONFIG_OF_GPIO is not defined:
>
> drivers/gpio/gpio-sx150x.c: In function =E2=80=98sx150x_init_chip=E2=80=
=99:
> drivers/gpio/gpio-sx150x.c:487:17: error: =E2=80=98struct gpio_chip=E2=
=80=99 has no member named =E2=80=98of_node=E2=80=99
>   chip->gpio_chip.of_node          =3D client->dev.of_node;
>                  ^
> drivers/gpio/gpio-sx150x.c:488:17: error: =E2=80=98struct gpio_chip=E2=
=80=99 has no member named =E2=80=98of_gpio_n_cells=E2=80=99
>   chip->gpio_chip.of_gpio_n_cells  =3D 2;
>                  ^
>
> This issue was introduced by the commit
> 04d2264c3bf07f5c3d18165ba78de0a93360c6c0 "gpio: sx150x: add dts suppo=
rt for sx150x driver".
>
> Signed-off-by: Murilo Opsfelder Araujo <mopsfelder@gmail.com>
> ---
>  drivers/gpio/gpio-sx150x.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
> index 88012e2..b1e2f1c 100644
> --- a/drivers/gpio/gpio-sx150x.c
> +++ b/drivers/gpio/gpio-sx150x.c
> @@ -484,8 +484,10 @@ static void sx150x_init_chip(struct sx150x_chip =
*chip,
>         chip->gpio_chip.base             =3D pdata->gpio_base;
>         chip->gpio_chip.can_sleep        =3D true;
>         chip->gpio_chip.ngpio            =3D chip->dev_cfg->ngpios;
> +#ifdef CONFIG_OF_GPIO
>         chip->gpio_chip.of_node          =3D client->dev.of_node;
>         chip->gpio_chip.of_gpio_n_cells  =3D 2;
> +#endif
>         if (pdata->oscio_is_gpo)
>                 ++chip->gpio_chip.ngpio;

Linus just sent a patch to fix this, see
http://patchwork.ozlabs.org/patch/431704/
