From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: mxc: use devm_platform_ioremap_resource() to
 simplify code
Date: Mon, 1 Apr 2019 10:08:13 +0200
Message-ID: <CAMpxmJUgyP59dkZYessbjvNV=vSH+xEkHz+KD++d6Gq-wX5VwA@mail.gmail.com>
References: <1554095107-15003-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554095107-15003-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org

pon., 1 kwi 2019 o 07:09 Anson Huang <anson.huang@nxp.com> napisa=C5=82(a):
>
> Use the new helper devm_platform_ioremap_resource() which wraps the
> platform_get_resource() and devm_ioremap_resource() together, to
> simplify the code.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index e86e61d..b281358 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -411,7 +411,6 @@ static int mxc_gpio_probe(struct platform_device *pde=
v)
>  {
>         struct device_node *np =3D pdev->dev.of_node;
>         struct mxc_gpio_port *port;
> -       struct resource *iores;
>         int irq_base;
>         int err;
>
> @@ -423,8 +422,7 @@ static int mxc_gpio_probe(struct platform_device *pde=
v)
>
>         port->dev =3D &pdev->dev;
>
> -       iores =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       port->base =3D devm_ioremap_resource(&pdev->dev, iores);
> +       port->base =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(port->base))
>                 return PTR_ERR(port->base);
>
> --
> 2.7.4
>

Patch is trivial, so applied right away. Thanks!

Bart
