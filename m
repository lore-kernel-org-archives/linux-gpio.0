From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] mfd: intel_soc_pmic_core: Terminate panel control GPIO
 lookup table correctly
Date: Mon, 25 Apr 2016 12:06:08 +0200
Message-ID: <20160425100608.GB20630@ulmo.ba.sec>
References: <1461353935-8078-1-git-send-email-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461353935-8078-1-git-send-email-ville.syrjala@linux.intel.com>
Sender: stable-owner@vger.kernel.org
To: ville.syrjala@linux.intel.com
Cc: linux-gpio@vger.kernel.org, intel-gfx@lists.freedesktop.org, Shobhit Kumar <shobhit.kumar@intel.com>, Samuel Ortiz <sameo@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Lee Jones <lee.jones@linaro.org>, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2016 at 10:38:55PM +0300, ville.syrjala@linux.intel.com wro=
te:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> GPIO lookup tables are supposed to be zero terminated. Let's do that
> and avoid accidentally walking off the end.
>=20
> Cc: Shobhit Kumar <shobhit.kumar@intel.com>
> Cc: Samuel Ortiz <sameo@linux.intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: stable@vger.kernel.org
> Fixes: 61dd2ca2d44e ("mfd: intel_soc_pmic_core: Add lookup table for Pane=
l Control as GPIO signal")
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/mfd/intel_soc_pmic_core.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXHewQAAoJEN0jrNd/PrOhHyEP/3cZAuA0lMggTavX3tRFyFo9
ueDTV6QksNonpT7AAoujab6tU5G/pCfF0izE/9oqKc0ivsMK/siJKmef+MZ8S6zk
YPZ9lnwkTypZ4EC1EqkSKW+x+SbsXPW4T7w5FekkoOBid7RUqo1AX4i5V2yFLM8Q
TJlNLzvPlAnVNtGsBLqrjKh99qj0X6OSlk3OY+Cxw2MojPls5CHFfxoJnTqLMiuk
vxBqWKTIkm5jtL7VlLqaP9A7JsQhK+HhEMpia0LeY20tCyZyYAXtdLbF+1yUJp6K
+QHDVS+h5UWMHmOLgVQ0m/p5k+d4VUQHC7Mdsp+7Q03d+X2gxYOAe/U0pw9OOgwL
xuODfLfB/ZiC3md3QwZhBShCAVnYGIxfSa8mA3+kc5PeDK/TRi+XdfTKAq994mXp
7uSc/4CRyMxyrtdELmsrmvBGyb48n0R47VhNmyi/lq7WSi+G74OOJLKmojFLKq2W
BEx4MK9Lfekh/yfgfk/HTveRPCSuWbaGkkvHSgIA5rIHctQyhDSuRRk2EjvzL9OV
v/Pvwa1fb/xOGjr3X4SkAcUe2pphq+spCQ9Pq03VcdcJhP/jbS4FDn7iN6I/NX9N
AyR67Ruw4uUOF/Qq4RwkZeQMvoF2BdCzbNKcjBKAuIJEf9bG09P2JbcbQE/ueg2r
PaaLv5CxIRYiMQ9RThEm
=NTj7
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--
