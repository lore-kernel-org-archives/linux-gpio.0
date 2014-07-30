From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 3/4] gpio: pca953x: Add pca9506 as DT compatible
Date: Wed, 30 Jul 2014 14:52:16 +0200
Message-ID: <20140730125216.GI13842@pengutronix.de>
References: <1406618686-22385-1-git-send-email-mpa@pengutronix.de>
 <1406618686-22385-4-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k1BdFSKqAqVdu8k/"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:43129 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752791AbaG3Mw1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Jul 2014 08:52:27 -0400
Content-Disposition: inline
In-Reply-To: <1406618686-22385-4-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Toby Smith <toby@tismith.id.au>, Aaron Sierra <asierra@xes-inc.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de


--k1BdFSKqAqVdu8k/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2014 at 09:24:45AM +0200, Markus Pargmann wrote:
> This driver can also be used for the nxp,pca9506 device.
>=20
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
>  drivers/gpio/gpio-pca953x.c                             | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Do=
cumentation/devicetree/bindings/gpio/gpio-pca953x.txt
> index b9a42f294dd0..eb65157d47f6 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> @@ -3,6 +3,7 @@
>  Required properties:
>   - compatible: Has to contain one of the following:
>  	nxp,pca9505
> +	nxp,pca9506
>  	nxp,pca9534
>  	nxp,pca9535
>  	nxp,pca9536
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index fda3eae835d0..df5eb6e6be1e 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -729,6 +729,7 @@ static int pca953x_remove(struct i2c_client *client)
> =20
>  static const struct of_device_id pca953x_dt_ids[] =3D {
>  	{ .compatible =3D "nxp,pca9505", },
> +	{ .compatible =3D "nxp,pca9506", },

The item for the i2c_device_id table is missing in this patch. I will
send a v2.

Regards,

Markus

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--k1BdFSKqAqVdu8k/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJT2OqAAAoJEEpcgKtcEGQQS1YQAJRoY2NmnP0bVKB313hpm4ob
1fKeBttJ4nERgXsK87Y87leovqW47EWptZniV6g38mRkCF/FLFqzSoAwSZTLjP2a
LOs5uEhYiCypyCliit+OfkdNcLYmAZ4uLQbW+02gIhiNCg99QkVGWVAw34riu+U3
e/t5b9ZikxIV6v+Mpzd24HztGu3MZTlPj7ksu+pCcfVhF8rF3MxlpE2d9p6lpTQQ
+Q9WWWbhJzjBuL0hHB/4mKNJaJaQJ7dLjr0GPQeWicyivZEVdwgu65ub0ychU2AB
RxWdzXoKbGKnQ85DkIcQMWFwIg930Y8Lz/564LPkDJpHJt5yt45gQUZYkou/oCl2
b7fmEgG8O0YvL8eiGpayyXv17d31UVndoKtpq16aQOqpngfjnLK2/lEAY0kaNDFO
CwfEQTdh9nBee0sbBSmKJ+AjYWnThmUtetLg3F1GoK3ZQL+lwgz+o5dfs4/7lhyY
b5I3PSDoYZCByacFop7GysGir81QlcaMsIpirzp1/Vq6PaXASkTlHLrbMOT7aBhS
7fZhhYpotY06J1gtuc7p+W0SfapsERK7oaOUZvpZsQvEGnF/08o5dA/rzJHj5TTp
AXAQsiGPSVbErTZanGGTEz3cMEJ8670CjcNzt0KiHo7s4QW8YkXgQWAvtwn2CXqC
06OCN5NCZK3BsSDYCjxu
=HIdy
-----END PGP SIGNATURE-----

--k1BdFSKqAqVdu8k/--
