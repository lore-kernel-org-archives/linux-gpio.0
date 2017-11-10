From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpio: tegra186: Remove tegra186_gpio_lock_class
Date: Fri, 10 Nov 2017 12:12:25 +0100
Message-ID: <20171110111225.GA26512@ulmo>
References: <20171110061055.12431-1-axel.lin@ingics.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:48019 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750835AbdKJLM2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Nov 2017 06:12:28 -0500
Received: by mail-wr0-f194.google.com with SMTP id k61so8280450wrc.4
        for <linux-gpio@vger.kernel.org>; Fri, 10 Nov 2017 03:12:28 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171110061055.12431-1-axel.lin@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2017 at 02:10:55PM +0800, Axel Lin wrote:
> This is no longer required after commit 959bc7b22bd2
> ("gpio: Automatically add lockdep keys")
>=20
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/gpio/gpio-tegra186.c | 3 ---
>  1 file changed, 3 deletions(-)

I have the same patch in my local tree as a follow-up cleanup for the
series, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloFiZYACgkQ3SOs138+
s6EgJw//ZUxu+vLb0u9rlXymoCcWu2yn5pJ7Cs1sD6v1mB33fzLJkiV7EorojchZ
qOiBV/nib0mxHjHsrGKChks2BJ/mY/RjjiddYpMSxEFnwLpuzsD2zcWlfjdjzY5n
+MOnmJk0KEm/hdUNEENmGzT7EOcwlhbkOlJr2cH00Eg4Q/t64ca/04o02ThTNKgM
JR50S9oSzY/UqbzTpbEDepSjcHkLB4QAZcGjhgiKrNlF87pzqZC+1B9XOFhTBJ7d
s8CD20RK/kRL5EHXytNIZhKehN5IpEk1dmHl4PmKFnx8Uh9kYTdbzGRYz4uhi0pw
IMG6zzcxpKclyuBTru2c/j0gf8jFs6JuXDRXxK2rh+5H14aJGO8LUIWEVQpntLj+
sC6P6p5q5pEStUJ80qQdhvV2x6t8nK/4p5+K95cXrxqo1KlJw/vQu+a8xonM3Qs1
3KqVj89pgp1ROGWVwJb1vM1SbFDvQeoXAFsHJRWllt54cpyx9csb6jM2AkSxn0uy
dLrM9gu9cu8FdyjcyAtswvUbbEnMHNu3ccMKS5GhiT3XiCn0uPDgeQxuT+qFwVV+
zodD75e8++0+1DFTcQE3/soiaBFMnoVkvKTSGLCr5IKrGo+pcxkgii9+02bDIdgb
OW4GZpsIfCZWBrWQrm0j42MAa3/Ryok0rHvJzuhkoPhDrzqeZ4M=
=9CuV
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
