From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Fine-grained Runtime PM support
Date: Thu, 08 Dec 2016 23:40:42 +0200
Message-ID: <1984659.qgJsdhyW2B@avalon>
References: <20161208173228.16835-1-niklas.soderlund+renesas@ragnatech.se> <20161208173228.16835-3-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20161208173228.16835-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thursday 08 Dec 2016 18:32:28 Niklas S=F6derlund wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Currently gpio modules are runtime-resumed at probe time. This means =
the
> gpio module will be active all the time (except during system suspend=
,
> if not configured as a wake-up source).
>=20
> While an R-Car Gen2 gpio module retains pins configured for output at=

> the requested level while put in standby mode, gpio register cannot b=
e
> accessed while suspended.  Unfortunately pm_runtime_get_sync() cannot=
 be
> called from all contexts where gpio register access is needed. Hence
> move the Runtime PM handling from probe/remove time to gpio request/f=
ree
> time, which is probably the best we can do.
>=20
> On r8a7791/koelsch, gpio modules 0, 1, 3, and 4 are now suspended dur=
ing
> normal use (gpio2 is used for LEDs and regulators, gpio5 for keys, gp=
io6
> for SD-Card CD & WP, gpio7 for keys and regulators).
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> [Niklas: s/gpio_to_priv(chip)/gpiochip_get_data(chip)/]

Just curious, what's the rationale for this ?

> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech=
.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpio/gpio-rcar.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> index 3b77c10..31ad288 100644
> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -242,11 +242,24 @@ static void
> gpio_rcar_config_general_input_output_mode(struct gpio_chip *chip,
>=20
>  static int gpio_rcar_request(struct gpio_chip *chip, unsigned offset=
)
>  {
> -=09return pinctrl_request_gpio(chip->base + offset);
> +=09struct gpio_rcar_priv *p =3D gpiochip_get_data(chip);
> +=09int error;
> +
> +=09error =3D pm_runtime_get_sync(&p->pdev->dev);
> +=09if (error < 0)
> +=09=09return error;
> +
> +=09error =3D pinctrl_request_gpio(chip->base + offset);
> +=09if (error)
> +=09=09pm_runtime_put(&p->pdev->dev);
> +
> +=09return error;
>  }
>=20
>  static void gpio_rcar_free(struct gpio_chip *chip, unsigned offset)
>  {
> +=09struct gpio_rcar_priv *p =3D gpiochip_get_data(chip);
> +
>  =09pinctrl_free_gpio(chip->base + offset);
>=20
>  =09/*
> @@ -254,6 +267,8 @@ static void gpio_rcar_free(struct gpio_chip *chip=
,
> unsigned offset) * drive the GPIO pin as an output.
>  =09 */
>  =09gpio_rcar_config_general_input_output_mode(chip, offset, false);
> +
> +=09pm_runtime_put(&p->pdev->dev);
>  }
>=20
>  static int gpio_rcar_direction_input(struct gpio_chip *chip, unsigne=
d
> offset) @@ -426,7 +441,6 @@ static int gpio_rcar_probe(struct
> platform_device *pdev) }
>=20
>  =09pm_runtime_enable(dev);
> -=09pm_runtime_get_sync(dev);
>=20
>  =09io =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  =09irq =3D platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> @@ -495,7 +509,6 @@ static int gpio_rcar_probe(struct platform_device=
 *pdev)
> err1:
>  =09gpiochip_remove(gpio_chip);
>  err0:
> -=09pm_runtime_put(dev);
>  =09pm_runtime_disable(dev);
>  =09return ret;
>  }
> @@ -506,7 +519,6 @@ static int gpio_rcar_remove(struct platform_devic=
e
> *pdev)
>=20
>  =09gpiochip_remove(&p->gpio_chip);
>=20
> -=09pm_runtime_put(&pdev->dev);
>  =09pm_runtime_disable(&pdev->dev);
>  =09return 0;
>  }

--=20
Regards,

Laurent Pinchart
