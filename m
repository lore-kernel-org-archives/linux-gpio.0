From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] pinctrl: bcm2835: Fix some merge fallout
Date: Thu, 9 Nov 2017 11:05:56 +0100
Message-ID: <20171109100556.GA20678@ulmo>
References: <20171109083710.3567-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:18260 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752920AbdKIKGC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Nov 2017 05:06:02 -0500
In-Reply-To: <20171109083710.3567-1-linus.walleij@linaro.org>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2017 at 09:37:10AM +0100, Linus Walleij wrote:
> Fixing a small merge problem in BCM2835 related to the
> new irqchip code.
>=20
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I was just going to send out a fixup for this as well. Looks like this
may be the result of the conflict that I had mentioned.

Anyway, not that you really need it, but:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloEKIEACgkQ3SOs138+
s6EXWQ//W9AlJuceeWAywSBCBy1UA5tvQTYhlMjlGF1XeVeYvMBoWjaebqohl/GC
Cl+fhI3qBlEXvIHGssoghAZRTO7zHEcJks+NfEwtlFIXyz2BufXCRTJA5jzcNYOW
+dwjlLmU90G7a1Cvh0k9O4lHGsHzeoZV25SdcG6Lgn0cym4tyo9cTTm/l0Kz88Pm
ZvGjrKHDCHrSYkJ7eim2+caNcTjCJdhsOd/1XXtMwBb9ZipWHjS9dBuHW3zl+BrC
CDpLKlx7dxUe3bxvF3dQ7gmPk/XVjfIufzWg7e94NlGBBVPZTqAiOKWImvJNLSb4
1gdG681eM8eIjteYzkF8n86TUtKJyPjCFwsYa/GGhNl2LvQaQRzBOTMkWqwaTK3v
q3Ji6vsL+tlhol1AVei4bCzD5K8LPblF9Z88IwOBSdYK21TTapLvPp/uKymQ7y3e
snAJu+Lq4QVbV1pOXrAotbDyfiANU495ee1FD+0GslnfxOZhK5wJWkytB+Hv3KZ+
azQNXrSuNFafCs3KIRi5DzzeD7mc+xcV9erawKiP/ORdTEMUqniIv3etnR5XFJf1
Hmda+xSL2GV5Ga36y2JBRlOJ0FVOvJMfinji0ORlO9Yyt6faw6nSTfcivnPNfR86
v+Xb4Fwh4p+BBAA9M7jE5+GD+3Vij1K9/wvAq4xD4ZGqT+GJxWE=
=Wp+V
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
