From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 2/2] gpio: vf610: Use PTR_ERR_OR_ZERO() in vf610_gpio_probe()
Date: Mon, 29 Apr 2019 10:05:12 +0200
Message-ID: <CAMpxmJUrVU6qGH9ZOaxABOuOopnHjyv+iqT908p1f-NuSk0r5w@mail.gmail.com>
References: <20190429054948.9185-1-andrew.smirnov@gmail.com> <20190429054948.9185-2-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190429054948.9185-2-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Chris Healy <cphealy@gmail.com>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

pon., 29 kwi 2019 o 07:50 Andrey Smirnov <andrew.smirnov@gmail.com> napisa=
=C5=82(a):
>
> Simplify error checking code by replacing multiple ERR macros with a
> call to PTR_ERR_OR_ZERO. No functional change intended.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/gpio/gpio-vf610.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index 30aef41e3b7e..7ba668db171b 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -265,7 +265,8 @@ static int vf610_gpio_probe(struct platform_device *p=
dev)
>                 return port->irq;
>
>         port->clk_port =3D devm_clk_get(dev, "port");
> -       if (!IS_ERR(port->clk_port)) {
> +       ret =3D PTR_ERR_OR_ZERO(port->clk_port);
> +       if (!ret) {
>                 ret =3D clk_prepare_enable(port->clk_port);
>                 if (ret)
>                         return ret;
> @@ -273,16 +274,17 @@ static int vf610_gpio_probe(struct platform_device =
*pdev)
>                                                port->clk_port);
>                 if (ret)
>                         return ret;
> -       } else if (port->clk_port =3D=3D ERR_PTR(-EPROBE_DEFER)) {
> +       } else if (ret =3D=3D -EPROBE_DEFER) {
>                 /*
>                  * Percolate deferrals, for anything else,
>                  * just live without the clocking.
>                  */
> -               return PTR_ERR(port->clk_port);
> +               return ret;
>         }
>
>         port->clk_gpio =3D devm_clk_get(dev, "gpio");
> -       if (!IS_ERR(port->clk_gpio)) {
> +       ret =3D PTR_ERR_OR_ZERO(port->clk_gpio);
> +       if (!ret) {
>                 ret =3D clk_prepare_enable(port->clk_gpio);
>                 if (ret)
>                         return ret;
> @@ -290,8 +292,8 @@ static int vf610_gpio_probe(struct platform_device *p=
dev)
>                                                port->clk_gpio);
>                 if (ret)
>                         return ret;
> -       } else if (port->clk_gpio =3D=3D ERR_PTR(-EPROBE_DEFER)) {
> -               return PTR_ERR(port->clk_gpio);
> +       } else if (ret =3D=3D -EPROBE_DEFER) {
> +               return ret;
>         }
>
>         gc =3D &port->gc;
> --
> 2.20.1
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
