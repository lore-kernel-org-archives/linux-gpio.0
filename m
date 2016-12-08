From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] gpio: rcar: set IRQ chip parent_device
Date: Thu, 08 Dec 2016 23:36:53 +0200
Message-ID: <15939548.2BLIxooZCY@avalon>
References: <20161208173228.16835-1-niklas.soderlund+renesas@ragnatech.se> <20161208173228.16835-2-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20161208173228.16835-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-gpio@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thursday 08 Dec 2016 18:32:27 Niklas S=F6derlund wrote:
> This enables Runtime PM handling for interrupts.
>=20
> By setting the parent_device in struct irq_chip genirq will call the
> pm_runtime_get/put APIs when an IRQ is requested/freed.
>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech=
.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpio/gpio-rcar.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> index 2be48f5..3b77c10 100644
> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -460,6 +460,7 @@ static int gpio_rcar_probe(struct platform_device=
 *pdev)
>=20
>  =09irq_chip =3D &p->irq_chip;
>  =09irq_chip->name =3D name;
> +=09irq_chip->parent_device =3D dev;
>  =09irq_chip->irq_mask =3D gpio_rcar_irq_disable;
>  =09irq_chip->irq_unmask =3D gpio_rcar_irq_enable;
>  =09irq_chip->irq_set_type =3D gpio_rcar_irq_set_type;

--=20
Regards,

Laurent Pinchart
