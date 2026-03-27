Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345D426290;
	Fri, 27 Mar 2026 00:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570178; cv=none; b=NkpH9v8BPl9Q2XyHm5b9kAaJPua3A1mllE0neaEoS9426XufXvnRUO8JdrXrdO8vU33S5sZCurLmzKgQwgVEPjgjWtKE1QczLKuwEROQ8EoeHMyJRfDIThdO5eHU5IDtnOwzVFZOKV8YyaVtWhanNxW7aUmaTGkSzurY8zSE8cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570178; c=relaxed/simple;
	bh=NtVvB17prGq/rDzcOx50gb9pEOvnlt8/PkVt1l9JhhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDx5Mt15DTF5aIA5ZS8u9ZZ9ffBoVcHR9YpXFNwmWQbZmbHtCHWE/DVykf1ITDiokdiZMNNEkLI4iProDq9MY/iRqTRVDjz94SMqEZ80cmvoeb/1og/0jluvlyG2HyNrSDz2rqnXxCvGxavezhGXL9HsaYocCYWFctYFRLNjRQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KeraVxzA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KeraVxzA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F9FC116C6;
	Fri, 27 Mar 2026 00:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774570178;
	bh=NtVvB17prGq/rDzcOx50gb9pEOvnlt8/PkVt1l9JhhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KeraVxzARUz+LslbYVVEWwNtQ8kjtC/ec4C5IcS1qFz6zNZVNuJ8FGsP/3DAccWAH
	 K8sC+4TETsPBWwjvjwWKAhi3N/VS9lMlhbmYViw9ITmWqkA4BrJz2MqOhWOs0xyiYm
	 BqNtMJ+t5kN52OxIKUj+4bX8lrZAdpJORWzgKMOsXnWLqwmy3FBTPG3TgH6zvdbd0D
	 jq9gx2jHQpAelGKveSrbpRtceuy5XdmjkiRGXPR0dX1nqM9u9hABoOdueZE3Ftn6Gc
	 35qXuepsprdiFFr1CA2NZOJFZ6Gdp8HbWF2Vdh9QU+p3vl7Q3maJFfOqGDRaT+GSjt
	 jG++FCABYBaHw==
Date: Fri, 27 Mar 2026 00:09:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v4 3/7] pinctrl: extract pinctrl_generic_to_map() from
 pinctrl_generic_pins_function_dt_node_to_map()
Message-ID: <20260327-overdrawn-stretch-2311ec39aa58@spud>
References: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
 <20260325-pinctrl-mux-v4-3-043c2c82e623@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o+mudXqwbMVi6APo"
Content-Disposition: inline
In-Reply-To: <20260325-pinctrl-mux-v4-3-043c2c82e623@nxp.com>


--o+mudXqwbMVi6APo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 07:04:12PM -0400, Frank Li wrote:
> Refactor pinctrl_generic_pins_function_dt_subnode_to_map() by separating =
DT
> parsing logic from map creation. Introduce a new helper
> pinctrl_generic_to_map() to handle mapping to kernel data structures, whi=
le
> keeping DT property parsing in the subnode function.
>=20
> Improve code structure and enables easier reuse for platforms using
> different DT properties (e.g. pinmux) without modifying the
> dt_node_to_map-style callback API. Avoid unnecessary coupling to
> pinctrl_generic_pins_function_dt_node_to_map(), which provides
> functionality not needed when the phandle target is unambiguous.
>=20
> Maximize code reuse and provide a cleaner extension point for future
> pinctrl drivers.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v4
> - new patch
> ---
>  drivers/pinctrl/pinconf.h         | 18 ++++++++
>  drivers/pinctrl/pinctrl-generic.c | 91 ++++++++++++++++++++++++---------=
------
>  2 files changed, 74 insertions(+), 35 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
> index 2880adef476e68950ffdd540ea42cdee6a16ec27..ffdabddb9660324ed8886a2e8=
dcacff7e1c6c529 100644
> --- a/drivers/pinctrl/pinconf.h
> +++ b/drivers/pinctrl/pinconf.h
> @@ -166,6 +166,13 @@ int pinctrl_generic_pins_function_dt_node_to_map(str=
uct pinctrl_dev *pctldev,
>  						 struct device_node *np,
>  						 struct pinctrl_map **maps,
>  						 unsigned int *num_maps);
> +
> +int
> +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *=
parent,
> +		       struct device_node *np, struct pinctrl_map **maps,
> +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> +		       const char **group_name, unsigned int ngroups,
> +		       const char **functions, unsigned int *pins);
>  #else
>  static inline int
>  pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
> @@ -175,4 +182,15 @@ pinctrl_generic_pins_function_dt_node_to_map(struct =
pinctrl_dev *pctldev,
>  {
>  	return -ENOTSUPP;
>  }
> +
> +static inline int
> +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *=
parent,
> +		       struct device_node *np, struct pinctrl_map **maps,
> +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> +		       const char **group_name, unsigned int ngroups,
> +		       const char **functions, unsigned int *pins,
> +		       void *function_data)
> +{
> +	return -ENOTSUPP;
> +}
>  #endif
> diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-=
generic.c
> index efb39c6a670331775855efdc8566102b5c6202ef..20a216ae63e91b69985ea4cfc=
d0b57103c6ca950 100644
> --- a/drivers/pinctrl/pinctrl-generic.c
> +++ b/drivers/pinctrl/pinctrl-generic.c
> @@ -17,29 +17,18 @@
>  #include "pinctrl-utils.h"
>  #include "pinmux.h"
> =20
> -static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctr=
l_dev *pctldev,
> -							   struct device_node *parent,
> -							   struct device_node *np,
> -							   struct pinctrl_map **maps,
> -							   unsigned int *num_maps,
> -							   unsigned int *num_reserved_maps,
> -							   const char **group_names,
> -							   unsigned int ngroups)
> +int
> +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *=
parent,
> +		       struct device_node *np, struct pinctrl_map **maps,
> +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> +		       const char **group_names, unsigned int ngroups,
> +		       const char **functions, unsigned int *pins)

npins needs to be an argument to this function also, otherwise
pinctrl_generic_add_group() uses it uninitialised...

>  {
>  	struct device *dev =3D pctldev->dev;
> -	const char **functions;
> +	int npins, ret, reserve =3D 1;

=2E..because you're declaring it here when it's something set by the dt
parsing code in pinctrl_generic_pins_function_dt_subnode_to_map()...

> +	unsigned int num_configs;
>  	const char *group_name;
>  	unsigned long *configs;
> -	unsigned int num_configs, pin, *pins;
> -	int npins, ret, reserve =3D 1;
> -
> -	npins =3D of_property_count_u32_elems(np, "pins");
> -
> -	if (npins < 1) {
> -		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
> -			parent, np, npins);
> -		return npins;
> -	}
> =20
>  	group_name =3D devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", parent, n=
p);
>  	if (!group_name)
> @@ -51,22 +40,6 @@ static int pinctrl_generic_pins_function_dt_subnode_to=
_map(struct pinctrl_dev *p
>  	if (!pins)
>  		return -ENOMEM;
> =20
> -	functions =3D devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL);
> -	if (!functions)
> -		return -ENOMEM;
> -
> -	for (int i =3D 0; i < npins; i++) {
> -		ret =3D of_property_read_u32_index(np, "pins", i, &pin);
> -		if (ret)
> -			return ret;
> -
> -		pins[i] =3D pin;
> -
> -		ret =3D of_property_read_string(np, "function", &functions[i]);
> -		if (ret)
> -			return ret;
> -	}
> -
>  	ret =3D pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, num=
_maps, reserve);
>  	if (ret)
>  		return ret;
> @@ -103,6 +76,54 @@ static int pinctrl_generic_pins_function_dt_subnode_t=
o_map(struct pinctrl_dev *p
>  	return 0;
>  };
> =20
> +static int
> +pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *pctl=
dev,
> +						struct device_node *parent,
> +						struct device_node *np,
> +						struct pinctrl_map **maps,
> +						unsigned int *num_maps,
> +						unsigned int *num_reserved_maps,
> +						const char **group_names,
> +						unsigned int ngroups)
> +{
> +	struct device *dev =3D pctldev->dev;
> +	unsigned int pin, *pins;
> +	const char **functions;
> +	int npins, ret;
> +
> +	npins =3D of_property_count_u32_elems(np, "pins");

=2E..down here.

> +
> +	if (npins < 1) {
> +		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
> +			parent, np, npins);
> +		return npins;
> +	}
> +
> +	pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> +	if (!pins)
> +		return -ENOMEM;
> +
> +	functions =3D devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL);
> +	if (!functions)
> +		return -ENOMEM;
> +
> +	for (int i =3D 0; i < npins; i++) {
> +		ret =3D of_property_read_u32_index(np, "pins", i, &pin);
> +		if (ret)
> +			return ret;
> +
> +		pins[i] =3D pin;
> +
> +		ret =3D of_property_read_string(np, "function", &functions[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return pinctrl_generic_to_map(pctldev, parent, np, maps, num_maps,
> +				      num_reserved_maps, group_names, ngroups,
> +				      functions, pins);
> +}
> +
>  /*
>   * For platforms that do not define groups or functions in the driver, b=
ut
>   * instead use the devicetree to describe them. This function will, unli=
ke
>=20
> --=20
> 2.43.0
>=20

--o+mudXqwbMVi6APo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacXKvAAKCRB4tDGHoIJi
0thbAQDbxNyZa3GlTnX7r+sEYyk1llSXOcQQeaeFVeqx24IPsAD/XOAxZiDAnZEX
HkHTxIYqbuTa1cJPPkfDdnwGzmk12AI=
=vM4Z
-----END PGP SIGNATURE-----

--o+mudXqwbMVi6APo--
