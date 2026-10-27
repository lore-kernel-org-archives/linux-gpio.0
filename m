Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793075320;
	b=Zi9MySZvIeYL61OR30o7xcA6IHySSj0kjBga+BhuUEx/FXr/9dHHhOBkGr7iibUXqC++
	 siyo+SKc7iIhlTwUBm9amVeyUNm3EmvV/BnmuiFgKVscL2PVBXDcF30/80vKzFCiJso9p
	 vBj/57twsvtim0lPhYw8Y5NfFw8UBoMbb1ovlGBhos6Yk6w+y5bIxfzZgwsnUuHOatlx6
	 yS552Dm8aHmiE29XAJGcfDaC4fvNBXR3XqIZWnJEVVyC6PsTlu/cw+Fo+Uye5DBxp5TnF
	 mZanUEupj/J4KLO8yCT1VhaFjYCyw0Buqnr7WWROA2ApEodYNUgqSB3EF5sn+IbXSkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075320;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sMWvOVtBIa1tWsgDaO3oY3FEqsdd7thgwrS2v4FAZBc=;
	b=qaG6WbNpGLgPxuNXcWqZx8F6dbR/FdyPEippGce17XpM95XJ4r0Mxgy62WdsJFiMtQIB
	 SBJEariH/aPwR6SJLUu6Xk1glAHIP7iaUbvzULc/S7BBHhReWGZ3WLCWiN7IdSmgDYc1X
	 XQBoc0H/wmQZmtFXaNRDnp9hA6zoa9csQZxwTPeDH5mokyH+ZFo952uA5hsRUN8evVTAS
	 C7yruC2Tg9A17W4XLnvZWHq/OfrJUW1xj1jFRyKBd4/MjtnJbGFVJsnJx70LpVRcrG1or
	 nPIdCOOG5NAsVLBBzDOH4QPDl2lZQa/f2SJLTuxibk8NB9mw2HmKdIzfy4BNwEGqPDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BlhdA/7d";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7979D606A31E;
	Tue, 27 Oct 2026 04:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BlhdA/7d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B551F01825;
	Tue, 27 Oct 2026 04:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793075320;
	bh=sMWvOVtBIa1tWsgDaO3oY3FEqsdd7thgwrS2v4FAZBc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BlhdA/7dLhtBtFlBPilnPIKBpUqgOJWiUiWTtON/aZtmKfHkxLSVBOT+rMBR3VuFW
	 ubKwPJYB4MdCKcTs4MlQWyOEYa20A33n0Sn02bhpWpjttuwcbka3rvwvXJZt2FslYe
	 A380XGZBc2gR1Cl1uhw2tbeJdVndcsTjlxj2Y62NWOj39l1jKjyYkl3aKNbwL32msi
	 IcXRJkD5dNkx50ylpgFNFHx52ZGJOpnszGr4Dii9D2LmuU4dk2ZBSH23fv9XfKFd/t
	 EG7lTjBnnfCFJjuxXTKPadFXDTnUBUdC2ore+7QJ3ItGi8qqRqPwiSwMPxRktYSDVC
	 Z59mafjCVU8Zg==
Message-ID: <sashiko-outbox-186079@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 02/11] gpiolib: regmap: add
 GPIO_REGMAP_QUIRK_SET_AFTER_DIR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>, linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027-cv75-gpio-v12-2-c22555400e18@ambarella.com>
References: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
 <20261027-cv75-gpio-v12-2-c22555400e18@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 04:28:38 +0000
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
- [Medium] gpiolib: regmap: unchecked gpio_regmap_set() in gpio_regmap_dire=
ction_output()
--

commit 1a15997a522bf0a981af10f62271be5cd75e972d
Author: Long Zhao <longzhao@ambarella.com>

gpiolib: regmap: add GPIO_REGMAP_QUIRK_SET_AFTER_DIR

This commit adds a quirk flag to allow writing the output value of a GPIO
line after changing its direction to output for controllers that ignore
output writes while the line is still configured as an input.

> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 51b4d69b87403..0a44deae3d01e 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
[ ... ]
> @@ -271,9 +272,17 @@ static int gpio_regmap_direction_output(struct gpio_=
chip *chip,
>  			return ret;
>  	}
> =20
> -	gpio_regmap_set(chip, offset, value);
> +	if (!(gpio->quirks & GPIO_REGMAP_QUIRK_SET_AFTER_DIR))
> +		gpio_regmap_set(chip, offset, value);
> =20
> -	return gpio_regmap_set_direction(chip, offset, true);
> +	ret =3D gpio_regmap_set_direction(chip, offset, true);
> +	if (ret)
> +		return ret;
> +
> +	if (gpio->quirks & GPIO_REGMAP_QUIRK_SET_AFTER_DIR)
> +		gpio_regmap_set(chip, offset, value);
> +
> +	return 0;

[Severity: Medium]
Should gpio_regmap_direction_output() in drivers/gpio/gpio-regmap.c check
and propagate the return value of both gpio_regmap_set() calls?

In drivers/gpio/gpio-regmap.c, gpio_regmap_set() returns a negative error
code if reg_mask_xlate() or regmap_write_bits() / regmap_update_bits()
fails:

drivers/gpio/gpio-regmap.c:gpio_regmap_set() {
	ret =3D gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
	if (ret)
		return ret;
	...
	if (gpio->reg_dat_base =3D=3D gpio->reg_set_base)
		ret =3D regmap_write_bits(gpio->regmap, reg, mask, mask_val);
	else
		ret =3D regmap_update_bits(gpio->regmap, reg, mask, mask_val);

	return ret;
}

When the quirk is not set and the initial gpio_regmap_set() fails (for
example due to an I2C/SPI bus error or invalid register translation),
ignoring the return value allows execution to proceed to
gpio_regmap_set_direction(), enabling the output driver on the pin with a
stale output value.

When the quirk is set and the post-direction gpio_regmap_set() fails,
gpio_regmap_direction_output() discards the error and returns 0 to the
caller even though setting the output value failed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-cv75-gpio-=
v12-0-c22555400e18@ambarella.com?part=3D2
