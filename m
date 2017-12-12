From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] gpio: Add helpers to determin direction of gpiods
Date: Tue, 12 Dec 2017 23:42:07 +0100
Message-ID: <20171212224207.xi4yiuyhp5radivr@ninjato>
References: <20171210002340.18460-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ulgqb3x656bkgo26"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171210002340.18460-1-linus.walleij@linaro.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


--ulgqb3x656bkgo26
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Linus,

thanks for doing this.

On Sun, Dec 10, 2017 at 01:23:40AM +0100, Linus Walleij wrote:
> The gpiod_get_direction() returns 1 for input and 0 for output
> but it's pretty hard to remember which one is which and generally
> unintuitive and messy to provide #defines so let's simply add
> two static inlines to do the job.
>=20
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Suggested-by: Wolfram Sang <wsa@the-dreams.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/gpio/consumer.txt | 14 +++++++++++---
>  include/linux/gpio/consumer.h   | 25 +++++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 3 deletions(-)

You need to fix the kerneldoc for 'gpiod_get_direction", too. It still
mentions GPIOF_DIR_*.

> +static inline bool gpiod_is_input(struct gpio_desc *desc)
> +{
> +	int ret =3D gpiod_get_direction(desc);
> +	if (ret < 0) {
> +		pr_err("GPIO: failed to get direction\n");

Is that really helpful for the user if we don't say which GPIO failed?

> +		/* It is usually safest to assume we are input */
> +		return true;
> +	}
> +	return !!ret;
> +}

Regards,

   Wolfram


--ulgqb3x656bkgo26
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlowWz4ACgkQFA3kzBSg
KbacFQ/8DCJTSvMKuNQrHiAigMM7Odi3+1aKyxYmQg8LyebwItspyQ545zH7T8Hq
myVriRNQlZF7pyZcVvrJFz+O7N6lz2jEUb7/Mj1Hze5xkrcNLNOkSZ/jsN5vUhNL
k/tLu+Xa8G7pI7t6ArUHAR1PwwDlKfZhFH4XY5w/Q40rlrtmoxQ2y6RQlBgb7JtD
0yQY90xpdbUAL5IqA7cwk43TQcPlXfqUoxA4o7b/PSiwcCmdtsSEB0WGY3apTjCq
UB9dQkqVSiw/V643m5PPT/lZz5ECifMhoAg42KLQBbTdMcsqKrBG6O0aP1XSFMMR
bK6w+va+5Ec6ViYDHAF+xfcmeMzR31XUYfTRegXzdWduMnTZF/5mRiB+dIj/KYuP
WouKTgRdqksrX9TwIj9Kf7Gn2F0RatsYtHQqAyJyyX2tk9PbaLkF1h+SLBbZ3vKA
A+P3Z0TCL0AgEvHcUgbNGKpT0F5Sm7WqvAg9Llo0O+jydJzcFmnNTDSsWChGvZWy
jbduWOXb+tRBbec/uTDepvmacRs/wb73c84eTJ6gbe7PTI9lpzukiFCqzUYIdm7N
hP3ubZQLIB8wQw5h+CScBPwQ3brliySf3aCspw0cPMqV6Kp3vSf37L0tPod0p+cs
EHjaMwplfd3hK0gazZhI4H1jODtbkR1ps0R7Lp8+G/n9yNIc0zA=
=J/VM
-----END PGP SIGNATURE-----

--ulgqb3x656bkgo26--
