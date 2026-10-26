Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029150;
	b=dnUtFABi9Gcn4W1TIRl8hkJSMimd+CliBl3p8vWDZrzdU/l9IebkcHen6jhLWd3vXI2H
	 c+baLZJSKISlPwTQ401UnTbaNM38efQLAd1aokXIUDEWA6uVPRj2nEF1cQP9QQWq8GyGG
	 s6riP9/f20e3ZTzGdNSDU7rbShA6LPaDAw/i9JA+yB+TyL+RPUlzVFFCpnqW5H/tY1CUr
	 dX/7JN0AgsZQtt0oCmS8635Mj15O5I3+311l7JVBe058MiKN5GPsIxE5Zilmgy/cY62Pm
	 I1ibxYq1+XwTnADMFfwJXqhp1nUzt8UHc9JEZRScUVB/MPTkavRDzBZ7gmTo9oo0xxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029150;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1pPQVcZTHWueWe6UVkUmz1Urg+zAZiJ3wpca+tOiLAo=;
	b=GoP65ZuJdhBY3awenDjdlsu8elekOnA0LxPGe42n8KaZk+eHdn1OgOdGXCPacK7zjxTJ
	 pMDma8Q09nPTF+ZNbJyB8PB38aa97/yIcONgtCDwke+VUw4c6TjA8sQiAem+49i1WAMvY
	 bllnl5ICbKy0R/EfWvvbLxPNiY6g6wOsilMNN5WltP6qtvxVcUE8GPb3dZvHofQw3rde0
	 fyg4/2WaC8poaPmFd5EHXNKytP4kjYV3pMdN0K+yRvL9MisH7D4+/DRDb4cwR6Rv0Y8Yv
	 xtAADJAzpFb68gE/dgw1vCmZfir6YxVjJtf+0A8Tjepg80i6qCsaUxkSnjFrs75zt1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bfYrpB1M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73160606A31A;
	Mon, 26 Oct 2026 15:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bfYrpB1M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335211F01825;
	Mon, 26 Oct 2026 15:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793029150;
	bh=1pPQVcZTHWueWe6UVkUmz1Urg+zAZiJ3wpca+tOiLAo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bfYrpB1M+DRks3Y8TuAQ/TZBeFQwMmDkQr3MCOwjtAoBHHtj9de3xddgttDvwpv99
	 3bItCsfDgpL8IBEbEYLTBI71OfbXDmqIVKniwZwEZYtyJD9Vhlzy6xJDptSQsVbWJc
	 E8Q1hL3N5z2lEUwGfBu9RH+1I4wEP32KgWQImw41phRpyuKKysPPqNOQO3G1L6v7cL
	 yN9Jti9mYwT/a17d/TSzmpJWWU3AMmmljZmrCTASSAlxYdAc5ixp3+kAYx+qnV4N6i
	 IXxqdL8g/qLbE3H8XGwEbxfLoSzVoGccLjRJZGhmNH+9ruZQiKyt0QA64iKsMighDM
	 w+mNb+9tbGY4Q==
Message-ID: <sashiko-outbox-185451@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] pinctrl: sunxi: request the per-bank supply
 optionally
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yang Siyuan" <hsyysy@163.com>
Cc: linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20261026152027.1417178-1-hsyysy@163.com>
References: <20261026144751.1392715-1-hsyysy@163.com>
 <20261026152027.1417178-1-hsyysy@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 15:39:09 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pinctrl: sunxi: unbalanced bank regulator refcount in sunxi_pmx_re=
quest()
--

commit 387a0217944495d51d6191636af797bf5c7e5da5
Author: Yang Siyuan <hsyysy@163.com>

pinctrl: sunxi: request the per-bank supply optionally

This commit switches sunxi_pmx_request() from regulator_get() to
regulator_get_optional() so that banks without a per-bank supply in the
device tree do not trigger a dummy regulator warning. When
regulator_get_optional() returns -ENODEV, sunxi_pmx_request() returns 0
with s_reg->regulator left as NULL, and sunxi_pmx_free() skips cleanup when
s_reg->regulator is NULL.

> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 31cd142ce0f79..f6c48a287a0e4 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -925,11 +925,19 @@ static int sunxi_pmx_request(struct pinctrl_dev *pc=
tldev, unsigned offset)
>  	}
> =20
>  	snprintf(supply, sizeof(supply), "vcc-p%c", 'a' + bank);
> -	reg =3D regulator_get(pctl->dev, supply);
> -	if (IS_ERR(reg))
> +	reg =3D regulator_get_optional(pctl->dev, supply);
> +	if (IS_ERR(reg)) {
> +		/*
> +		 * The per-bank supply is optional: boards that do not
> +		 * describe it simply have no regulator to manage.
> +		 */
> +		if (PTR_ERR(reg) =3D=3D -ENODEV)
> +			return 0;
> +
>  		return dev_err_probe(pctl->dev, PTR_ERR(reg),
>  				     "Couldn't get bank P%c regulator\n",
>  				     'A' + bank);
> +	}
> =20
>  	ret =3D regulator_enable(reg);
>  	if (ret) {
> @@ -959,6 +967,10 @@ static int sunxi_pmx_free(struct pinctrl_dev *pctlde=
v, unsigned offset)
>  					    PINS_PER_BANK;
>  	struct sunxi_pinctrl_regulator *s_reg =3D &pctl->regulators[bank_offset=
];
> =20
> +	/* The per-bank supply is optional, so this bank may not have one. */
> +	if (!s_reg->regulator)
> +		return 0;

[Severity: High]
Can leaving s_reg->regulator as NULL on -ENODEV cause s_reg->refcount to
become unbalanced and disable the bank regulator while other pins in the
same bank are still active?

In sunxi_pmx_request(), returning 0 on -ENODEV without recording that the
bank has no supply or incrementing s_reg->refcount means every subsequent
pin request in the same bank will call regulator_get_optional() again.

Inside regulator_get_optional() -> _regulator_get() ->
regulator_dev_lookup(), when the pinctrl device tree node does not have a
vcc-pX-supply property, regulator_dt_lookup() returns NULL and
regulator_dev_lookup() falls back to a global name lookup:

drivers/regulator/core.c:regulator_dev_lookup() {
	/* first do a dt based lookup */
	r =3D regulator_dt_lookup(dev, supply);
	if (r)
		return r;
...
	r =3D regulator_lookup_by_name(supply);
	if (r)
		return r;

	return ERR_PTR(-ENODEV);
}

On several Allwinner boards (for example,
arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi and
sun50i-a64-pine64.dts), vcc-pl-supply is omitted from r_pio to avoid a
circular dependency with the PMIC bus on PL0/PL1, while the PMIC regulator
node defines regulator-name =3D "vcc-pl":

	&r_pio {
		/*
		 * FIXME: We can't add that supply for now since it would
		 * create a circular dependency between pinctrl, the regulator
		 * and the RSB Bus.
		 *
		 * vcc-pl-supply =3D <&reg_aldo2>;
		 */
	};
	...
	&reg_aldo2 {
		regulator-always-on;
		regulator-min-microvolt =3D <1800000>;
		regulator-max-microvolt =3D <1800000>;
		regulator-name =3D "vcc-pl";
	};

When the PMIC bus driver probes before the PMIC and requests PL0/PL1,
regulator_get_optional(pctl->dev, "vcc-pl") returns -ENODEV, leaving
s_reg->regulator as NULL and s_reg->refcount at 0 for those active pins.

Once the PMIC registers the regulator named "vcc-pl", a later request for
another pin in bank PL sees s_reg->regulator =3D=3D NULL, calls
regulator_get_optional(pctl->dev, "vcc-pl") again, matches the regulator via
regulator_lookup_by_name("vcc-pl"), and initializes s_reg->refcount to 1:

drivers/pinctrl/sunxi/pinctrl-sunxi.c:sunxi_pmx_request() {
	...
	s_reg->regulator =3D reg;
	refcount_set(&s_reg->refcount, 1);
}

If that later pin (or one of the earlier pins requested before the PMIC
probed) is subsequently freed in sunxi_pmx_free(), s_reg->regulator is now
non-NULL, so refcount_dec_and_test(&s_reg->refcount) drops the refcount to 0
and calls regulator_disable() and regulator_put() while other pins in the
bank remain requested.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026152027.1417=
178-1-hsyysy@163.com?part=3D1
