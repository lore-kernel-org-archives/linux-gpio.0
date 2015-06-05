From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 01/27] drm/bridge: ptn3460: #include
 <linux/gpio/consumer.h>, depend on GPIOLIB
Date: Fri, 5 Jun 2015 13:20:52 +0200
Message-ID: <20150605112050.GA17776@ulmo.nvidia.com>
References: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-gpio@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2015 at 06:32:17PM +0200, Geert Uytterhoeven wrote:
> If GPIOLIB=3Dn and asm-generic/gpio.h is not used:
>=20
>     drivers/gpu/drm/bridge/ptn3460.c: In function =E2=80=98ptn3460_pre_en=
able=E2=80=99:
>     drivers/gpu/drm/bridge/ptn3460.c:135: error: implicit declaration of =
function =E2=80=98gpiod_set_value=E2=80=99
>     drivers/gpu/drm/bridge/ptn3460.c: In function =E2=80=98ptn3460_probe=
=E2=80=99:
>     drivers/gpu/drm/bridge/ptn3460.c:333: error: implicit declaration of =
function =E2=80=98devm_gpiod_get=E2=80=99
>     drivers/gpu/drm/bridge/ptn3460.c:333: warning: assignment makes point=
er from integer without a cast
>     drivers/gpu/drm/bridge/ptn3460.c:340: error: implicit declaration of =
function =E2=80=98gpiod_direction_output=E2=80=99
>     drivers/gpu/drm/bridge/ptn3460.c:346: warning: assignment makes point=
er from integer without a cast
>=20
> Add the missing #include <linux/gpio/consumer.h> to fix this.
>=20
> As the resulting driver won't work with GPIOLIB=3Dn anyway, make
> DRM_PTN3460 depend on GPIOLIB || COMPILE_TEST.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/Kconfig   | 4 ++--
>  drivers/gpu/drm/bridge/ptn3460.c | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied, thanks. Note that I dropped the part about adding the GPIOLIB
dependency because that had been attempted previously to fix this, but
it causes recursive dependencies on PowerPC (ppc64_defconfig). I don't
know of a way to untangle those (I tried and failed miserably), so I
think adding the include is really as good as it'll get.

Thierry

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVcYYPAAoJEN0jrNd/PrOhgsMP+QGPbT8V8r3U+G33xG8hGMED
JxbnlEN2lvApaZwnglPWdTyiMEQwLrVGowJo1eGhkWMu34CynMW03ITDY4oKyN3X
rdiIGmLsZwlqvJFeC6lADezhkWkpL40VMdIg6ojseIt7xyc9hJVxnLsDqOnxL2LF
bVMhnpIRzkJ7x5FyBPgRATZEWuy1f/yu/yq4yM7aiVewzL+SII9uOHX9L7iJ5EKO
5iAT9RfVSDrfwNyR96hNa2IuWrc/F21ST/BnwudytzUBTk1Zuh1LMOJcrfhpVhjL
jISwm2lLQt+V3+zsB7VweTDp+kF9denBFWHdUDzK/zGNo4Rt/p4whD2qHpW11Dg3
mX71LweAT9a+t88sqeO5boeCpTjUg3HDZoD5hNrxCCe/vxx5U2OyxfeIvagpxEIE
faD2yyKHckToegv2uae+GvGtz2Ghuy2AH1/wUekeEdIExe2q/bdtBIivPpnThAgU
k38DDsKm0lNw8fRoYJWuTibLVUcSyBgM5y9gAGLgguYUFQVIn4bWeLKYRUMfW0PX
q5JIkPiPM9aIfHsf0hgdRNemgqkPDGkZnshhhiwgTnao8nc/0gO3RW6FB4z7Shhn
Hm/nQYp/KkLMmzKQRKO7DgXVbuxEoBG1M8KUJPL3K+XCnpYoYCuVbpEyRw/Cfb54
XSdTsDv/gKOFZgj8hggO
=gUx0
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
