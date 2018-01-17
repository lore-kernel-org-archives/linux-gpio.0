From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 3/3] pinctrl: sx150x: add a static gpio/pinctrl pin
 range mapping
Date: Wed, 17 Jan 2018 09:05:54 -0600
Message-ID: <1516201554.5522.15.camel@aj.id.au>
References: <CACRpkdZ8JYoY4nJe8n8zDaY2Lcu3BRPRpzxkv=v4FC7T2zYdiA@mail.gmail.com>
         <20180117133423.4482-1-peda@axentia.se>
         <20180117133423.4482-4-peda@axentia.se>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-+aJiPoe5CvKTaoBF4kby"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57337 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750908AbeAQPGA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Jan 2018 10:06:00 -0500
In-Reply-To: <20180117133423.4482-4-peda@axentia.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-gpio@vger.kernel.org


--=-+aJiPoe5CvKTaoBF4kby
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-01-17 at 14:34 +0100, Peter Rosin wrote:
> Without such a range, gpiolib fails with -EPROBE_DEFER, pending the
> addition of the range. So, without a range, gpiolib will keep
> deferring indefinitely.
>=20
> Fixes: e10f72bf4b3e ("gpio: gpiolib: Generalise state persistence beyond =
sleep")

This is a bit of a nit-pick, but I'd argue the hazard always existed in
the pinctrl-sx150x's probe however hadn't been triggered until now. My
instinct is Fixes should instead point to 9e80f9064e73 ("pinctrl: Add
SX150X GPIO Extender Pinctrl Driver"). Having said that I still think
it's worth pointing out in the commit message that e10f72bf4b3e ("gpio:
gpiolib: Generalise state persistence beyond sleep") is the motivation
for your patch (i.e. mention both commits).

Regardless, thanks to you both for getting to the bottom of this.

Andrew

> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  drivers/pinctrl/pinctrl-sx150x.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-s=
x150x.c
> index 049dd15e04ef..cbf58a10113d 100644
> --- a/drivers/pinctrl/pinctrl-sx150x.c
> +++ b/drivers/pinctrl/pinctrl-sx150x.c
> @@ -1193,6 +1193,11 @@ static int sx150x_probe(struct i2c_client *client,
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D gpiochip_add_pin_range(&pctl->gpio, dev_name(dev),
> +				     0, 0, pctl->data->npins);
> +	if (ret)
> +		return ret;
> +
>  	/* Add Interrupt support if an irq is specified */
>  	if (client->irq > 0) {
>  		pctl->irq_chip.name =3D devm_kstrdup(dev, client->name,
--=-+aJiPoe5CvKTaoBF4kby
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJaX2ZSAAoJEJ0dnzgO5LT5ABEP/2urndFcscZsfFyVX817oPyw
zVK86fVQ68bzZuDo9/ducHnN5ZxzL4L024HgbZyW1x6xkw082EWti8+/SUD4uVIE
N6c6HqtT2Wqz4Otwcqh62yslPsZ2YMtblkGQstjDb7UN2xea0FRT4VhWfa7Nvklx
h1icEqzBAGvPu28Ps/lkWbwcgcSQ8tczljorVylFJdLLjH2pLezrcjoNWWUshCkj
whA3milbz5OBsZLDCQfxob0yZfIgUzGDGa+eC7G+lcGrpy3vzlI9X2oL092nxX2P
58fJjkvkuzKXDuXUrIaMerbAf6tFMKGrmowFMCseJoQSj32S9rcRlp5XJzNXT4Fu
VLC8fyX04nB2pFVcSQ0mT2+s4Y5SCPv+Hl7cSYXXQo/KduURFL/3kXguWL4NypF8
RfcE2KHBrxzcvMf3Atp2xV4APZrgDUl7BwBF3/Rrlm1EyKmY9hoeqVjXWQ83EdMZ
jX1QXjip71AWvF2n5eynahLg/Kpgyx30AS8ydtxljO5N8eC0D4N8ptdBjCwxagBd
59NFqlmYjNhALpMbiJQMKc6QLoygvC3laHQ+4yU/BQ46Cr38Jy48sMOZQkehu5a1
jBa19Jn7trNjI04xLaZISgduFmDupfrcdK61LELJlCLZnaucOZyxQGZn114Gk2zl
Az78QKMWuRUk3dJKJIiC
=NQue
-----END PGP SIGNATURE-----

--=-+aJiPoe5CvKTaoBF4kby--

