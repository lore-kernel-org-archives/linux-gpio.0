From: Mylene JOSSERAND <mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] pinctrl: axp209: dereference pointer after
 it's been set
Date: Wed, 13 Dec 2017 10:20:48 +0100
Message-ID: <20171213102048.1c7e3b7f@dell-desktop.home>
References: <20171213085503.31899-1-quentin.schulz@free-electrons.com>
Reply-To: mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZO5JNV6ICBB57BYPIQKGQEPKRUVNA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171213085503.31899-1-quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Hello Quentin,

Le Wed, 13 Dec 2017 09:55:03 +0100,
Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> a =C3=A9crit :

> The number of GPIOs is gotten from a field within the structure
> referenced in the of_device.data but it was actually read before it was
> retrieved, thus it was dereferencing a null pointer.
>=20
> Set the number of GPIOs after retrieving of_device.data.
>=20
> Fixes: e1190083b89b ("pinctrl: axp209: add support for AXP813 GPIOs")
>=20
> Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Reported-by: Myl=C3=A8ne Josserand <mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Tested-by: Myl=C3=A8ne Josserand <mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks,

Myl=C3=A8ne

> ---
>  drivers/pinctrl/pinctrl-axp209.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-axp209.c b/drivers/pinctrl/pinctrl-a=
xp209.c
> index 22d3bb0bf927..510a2821e910 100644
> --- a/drivers/pinctrl/pinctrl-axp209.c
> +++ b/drivers/pinctrl/pinctrl-axp209.c
> @@ -413,9 +413,11 @@ static int axp20x_pctl_probe(struct platform_device =
*pdev)
>  	pctl->chip.set			=3D axp20x_gpio_set;
>  	pctl->chip.direction_input	=3D axp20x_gpio_input;
>  	pctl->chip.direction_output	=3D axp20x_gpio_output;
> -	pctl->chip.ngpio		=3D pctl->desc->npins;
> =20
>  	pctl->desc =3D (struct axp20x_pctrl_desc *)of_device_get_match_data(dev=
);
> +
> +	pctl->chip.ngpio		=3D pctl->desc->npins;
> +
>  	pctl->regmap =3D axp20x->regmap;
>  	pctl->dev =3D &pdev->dev;
> =20

--=20
Myl=C3=A8ne Josserand, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
