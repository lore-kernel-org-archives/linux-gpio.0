From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] pinctrl-st: fix of_irq_to_resource() result check
Date: Mon, 31 Jul 2017 13:27:19 +0200
Message-ID: <20170731112719.GM26667@ulmo>
References: <20170729180744.873303067@cogentembedded.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/t6ASE28jIy1gGy9"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f171.google.com ([209.85.128.171]:33239 "EHLO
        mail-wr0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750920AbdGaL1W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2017 07:27:22 -0400
Received: by mail-wr0-f171.google.com with SMTP id v105so147670504wrb.0
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2017 04:27:22 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170729180744.873303067@cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Patrice Chotard <patrice.chotard@st.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--/t6ASE28jIy1gGy9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 29, 2017 at 09:07:07PM +0300, Sergei Shtylyov wrote:
> of_irq_to_resource() has recently been fixed to return negative error #'s
> along with 0 in case of failure, however the ST driver still only regards
> 0 as failure indication -- fix it up.
>=20
> Fixes: 7a4228bbff76 ("of: irq: use of_irq_get() in of_irq_to_resource()")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>=20
> ---
>  drivers/pinctrl/pinctrl-st.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> Index: linux-pinctrl/drivers/pinctrl/pinctrl-st.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-pinctrl.orig/drivers/pinctrl/pinctrl-st.c
> +++ linux-pinctrl/drivers/pinctrl/pinctrl-st.c
> @@ -1521,7 +1521,7 @@ static int st_gpiolib_register_bank(stru
>  	 *	[irqN]----> [gpio-bank (n)]
>  	 */
> =20
> -	if (of_irq_to_resource(np, 0, &irq_res)) {
> +	if (of_irq_to_resource(np, 0, &irq_res) > 0) {
>  		gpio_irq =3D irq_res.start;
>  		gpiochip_set_chained_irqchip(&bank->gpio_chip, &st_gpio_irqchip,
>  					     gpio_irq, st_gpio_irq_handler);

While at it, maybe turn this into of_irq_get() since you only need the
interrupt number in the first place?

Thierry

--/t6ASE28jIy1gGy9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAll/FBcACgkQ3SOs138+
s6H5pRAAg1jt6S0D7RBprBrHLLuOYI3pkvfb+cLG2ID9qd4MgjcHTuwUwJtF0C4q
jrSIbMbw1iW2OoNhf5wxPTMT8WdVqRQqLxx/LrBbyZjjUaK7n3qY6n4vYJXfj5sM
23jtr2hqYL8c/n5yEi3lEggroz6i2m7FxFlVu6C8pxb28l0HIav4li6Y0ym6iccY
/fiEGTltDIalA12cAfbK5HSYQj+dJrAy5coyylVpjiKXRsYXkytLqnw6el+0qm6Q
cEmJZgQA5WagDUvsc8aQuaW/LvFdY/7mJ42taPjkOIqTCSk5HAExPNgIOFwij9JM
7ThI5mmhwkLBvVhaxeXIIPT+XOwI74CkrGHEk/3PlA/yIMoyzADvqcnU7w6dTUAU
et46W/ZWCLQJ09Gc9PVjLJv7MBpNEhWbwSQkk6h39Y0M/C5d3MG/MSI+7OURfnAf
VNnaMcgVdusvV9SV6lEe8a54qzpN8YAIaU9emdwNrbp+gQB3KtxO85+rK03o7Fhl
2iHA+dTk20KbpgIhhNHbbe0MaMsQzuOIhnv8NGAatH0sW3NIsM4Yy0bL4j3U6Qsa
w6jMRafFsFRv9mOI/BXWK0phuWHF/N+cyOcPXdJx+BB1VxNEPAWC5f633C/3/W26
GicKss6g9QEHpaode+bNm8SziByp9Ms16jcg6Y4/H0/CsOO5P6s=
=hXsF
-----END PGP SIGNATURE-----

--/t6ASE28jIy1gGy9--
