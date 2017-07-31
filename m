From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] pinctrl: bcm2835: Remove unneeded irq_group field
Date: Mon, 31 Jul 2017 12:57:31 +0200
Message-ID: <20170731105731.GH26667@ulmo>
References: <20170720165912.14360-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PW0Eas8rCkcu1VkF"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:36739 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750979AbdGaK5e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2017 06:57:34 -0400
Received: by mail-wm0-f51.google.com with SMTP id t201so175743501wmt.1
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2017 03:57:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170720165912.14360-1-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org


--PW0Eas8rCkcu1VkF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2017 at 06:59:12PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The irq_group field stores a 1:1 mapping. Use the loop variable to
> derive the values instead of storing them in an extra array.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Ping...

Thierry

--PW0Eas8rCkcu1VkF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAll/DRsACgkQ3SOs138+
s6F2lg/8D1PyEymhFLjyMNMfqec8PkYnhXghMD4dbKFNDkxNDDw8GJ27EiDYNv2f
9HxLq22X1PcGG0LajyEI3u4fwKf1unrMQY5yRBNkHTN1Ch4KE014GbRWlm6soMwZ
zBk8JSAAJiWk4kUzR7NIdAaTyrH2iInJZAlY5COQPe1PqL+yG+PpFoBIxdPwX4z1
ctSjBhYV7g+i17+UllEOqduCTnpXbS9k1p8Vgs0iE4bOhqlaVNp9IWx3RgParbFF
1pxrT800iOV7WTC/WbWrsAgeo1Sz+8bmVM88tYTgZYMxZV22vNrbZ57BUw3vW2Xq
2q7ijrPl9NPZJzGQadwhrorEW2FSMo+AVsm7hYsw1tUT9i29lrFrFDEXtWuEHrcP
HINo0pQe0PQHFofi3G54sTE0Qq1uIKSLBGk4s8WnM59ZpNR0YHUGVee2vW/EKB7A
LuuTnShBTD1f4BTaoScIxJt4zhVh7jnpxw1CmYpumyjm/gAjfexlkmN06uHewlo7
hqoRrnbvt6NT31Vh/NxwhmniUc/0BHg5awyNFmQU+dH3LmVVTFy4Ic4uTx6jJ9v9
P3twCEAwH7eJuhlPhUSt7KZ+zGVifrQ9/QKgCDTv4UUXII9O0jALs3cVeTpqaCYQ
feEYu5DTDYe7/CPeRpuFwwewrO96328qp8n4MRVV0F0mS54CiBU=
=meZV
-----END PGP SIGNATURE-----

--PW0Eas8rCkcu1VkF--
