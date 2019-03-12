From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] drivers: gpio: octeon: use devm_platform_ioremap_resource()
Date: Tue, 12 Mar 2019 14:45:01 +0100
Message-ID: <CAMpxmJWCpfm0E15k0vAcxOKFTGdaFkmqK-VXD+orVE65H1Uk2g@mail.gmail.com>
References: <1552330521-4276-23-git-send-email-info@metux.net> <1552333701-22712-1-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552333701-22712-1-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

pon., 11 mar 2019 o 20:48 Enrico Weigelt, metux IT consult
<info@metux.net> napisa=C5=82(a):
>
> Use the new helper that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together.
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
>  drivers/gpio/gpio-octeon.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-octeon.c b/drivers/gpio/gpio-octeon.c
> index 1b19c88..afb0e8a 100644
> --- a/drivers/gpio/gpio-octeon.c
> +++ b/drivers/gpio/gpio-octeon.c
> @@ -82,7 +82,6 @@ static int octeon_gpio_probe(struct platform_device *pd=
ev)
>  {
>         struct octeon_gpio *gpio;
>         struct gpio_chip *chip;
> -       struct resource *res_mem;
>         void __iomem *reg_base;
>         int err =3D 0;
>
> @@ -91,8 +90,7 @@ static int octeon_gpio_probe(struct platform_device *pd=
ev)
>                 return -ENOMEM;
>         chip =3D &gpio->chip;
>
> -       res_mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       reg_base =3D devm_ioremap_resource(&pdev->dev, res_mem);
> +       reg_base =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(reg_base))
>                 return PTR_ERR(reg_base);
>
> --
> 1.9.1
>

Can you make this a part of the bigger series and resend together with
subject line fixes?

Also: maybe consider adding a coccinelle script for that. When I added
that function I noticed there are 1200+ instances in the kernel that
need fixing. I think we'll be better off automating it.

Bart
