From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 02/27] drm/bridge: ps8622: #include
 <linux/gpio/consumer.h>, depend on GPIOLIB
Date: Fri, 5 Jun 2015 13:21:43 +0200
Message-ID: <20150605112141.GB17776@ulmo.nvidia.com>
References: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-2-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f173.google.com ([209.85.220.173]:35877 "EHLO
	mail-qk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754206AbbFELWG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jun 2015 07:22:06 -0400
Content-Disposition: inline
In-Reply-To: <1430843563-18615-2-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org


--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2015 at 06:32:18PM +0200, Geert Uytterhoeven wrote:
> If GPIOLIB=3Dn and asm-generic/gpio.h is not used:
>=20
>     drivers/gpu/drm/bridge/ps8622.c: In function =E2=80=98ps8622_pre_enab=
le=E2=80=99:
>     drivers/gpu/drm/bridge/ps8622.c:368: error: implicit declaration of f=
unction =E2=80=98gpiod_set_value=E2=80=99
>     drivers/gpu/drm/bridge/ps8622.c: In function =E2=80=98ps8622_probe=E2=
=80=99:
>     drivers/gpu/drm/bridge/ps8622.c:584: error: implicit declaration of f=
unction =E2=80=98devm_gpiod_get=E2=80=99
>     drivers/gpu/drm/bridge/ps8622.c:584: warning: assignment makes pointe=
r from integer without a cast
>     drivers/gpu/drm/bridge/ps8622.c:590: error: implicit declaration of f=
unction =E2=80=98gpiod_direction_output=E2=80=99
>     drivers/gpu/drm/bridge/ps8622.c:596: warning: assignment makes pointe=
r from integer without a cast
>=20
> Add the missing #include <linux/gpio/consumer.h> to fix this.
>=20
> As the resulting driver won't work with GPIOLIB=3Dn anyway, make
> DRM_PS8622 depend on GPIOLIB || COMPILE_TEST.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/Kconfig  | 4 ++--
>  drivers/gpu/drm/bridge/ps8622.c | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied, thanks. With the same modifications as patch 1/27. I wonder if
there's any reason to keep the linux/gpio.h include, since consumer.h
seems to expose all the API that the drivers need.

Thierry

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVcYZFAAoJEN0jrNd/PrOhia8QAIIlk7lu/segHClrRVzRzDz7
klzQK+qqbe8KRZG2qXHg/IEH0Mv7lHr2V4XkzT+dIPvo+6mnJfGHiUfkduxXoDOv
JOaNOq0dJmj6FFPURdf/NKOL5NqDjPl7QmJ9v7x5tR9ZP2sWcpNd5AOUFcmGnKO2
dIOviMLNGSYjAFS218BmqiKKgwkfTRgZg+YkjyZ7S1TT1/QSBgju4JA8B/SqbHTn
J+CAfjurScLYK0fLgxcds+tSKKeVrZ/mU6LTqyqTaME3hNWtomT86letVLjf4WzB
USnlIca0fhIyQ6xcmhr5DvEvJNZ1v13Faebddk8UrI0RpN63YdAlPPaWcTtonnaG
KbcA5UYIF0SnyqSmBMgJ2HOFnqs0it2crdRTifuJiCGgCg0kAYwrIGZTqBXfW3xA
TE86291kJe0CauY8MUct1ypT3nbEXUAMV8ccGVLXbngHN0xuSI1gGkXbJ/Qaif2H
TklC4Nwy/G9CQYeUr2IOeUe2FhksdAQH4wUW+L+iaphlKlwclgksHXAnGlE3E5OQ
yUCKpPx6XWq7MksvsMMXa3S5Htha0SJWQ1t19Nf/dPhlGfcnpiZtCcfYPVZpZUs3
vTqqEfh973sFOEaXD7Acw7ariZ7Aw9qytxo6Vx29igjtY0hCgTHDGWvR5tbs877e
4aPcqWmAzLBL+GGaGIYv
=cKkw
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--
