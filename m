From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 1/2] gpio: vf610: Use devm_platform_ioremap_resource()
Date: Mon, 29 Apr 2019 09:53:18 +0200
Message-ID: <CAMpxmJVe2C1RSHq0xVDSdNEK0S06e2Q=tp5k5QJXdCTG2DzJbQ@mail.gmail.com>
References: <20190429054948.9185-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190429054948.9185-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Chris Healy <cphealy@gmail.com>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

pon., 29 kwi 2019 o 07:50 Andrey Smirnov <andrew.smirnov@gmail.com> napisa=
=C5=82(a):
>
> Replace calls to platform_get_resource() and devm_ioremap_resource()
> with newly added devm_platform_ioremap_resource() for brevity. No
> functional change intended.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/gpio/gpio-vf610.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index 6f6558715b88..30aef41e3b7e 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -242,7 +242,6 @@ static int vf610_gpio_probe(struct platform_device *p=
dev)
>         struct device *dev =3D &pdev->dev;
>         struct device_node *np =3D dev->of_node;
>         struct vf610_gpio_port *port;
> -       struct resource *iores;
>         struct gpio_chip *gc;
>         struct irq_chip *ic;
>         int i;
> @@ -253,13 +252,11 @@ static int vf610_gpio_probe(struct platform_device =
*pdev)
>                 return -ENOMEM;
>
>         port->sdata =3D of_device_get_match_data(dev);
> -       iores =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       port->base =3D devm_ioremap_resource(dev, iores);
> +       port->base =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(port->base))
>                 return PTR_ERR(port->base);
>
> -       iores =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -       port->gpio_base =3D devm_ioremap_resource(dev, iores);
> +       port->gpio_base =3D devm_platform_ioremap_resource(pdev, 1);
>         if (IS_ERR(port->gpio_base))
>                 return PTR_ERR(port->gpio_base);
>
> --
> 2.20.1
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
