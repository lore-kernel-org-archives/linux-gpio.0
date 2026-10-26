Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032669;
	b=yh5vxKi72/Oyd6o7zHSV2cjqJI0SBdNcvDgiGbDtUcqVtvWvSYAU8wTK2hkZSezdQSnn
	 njEnygD2m6y3Nr04FWw6G/Du7A+9/BBrLKRuwufkG8fW45uDpDmLzPM+WAezR5bsqBhA7
	 25G/b62QVjpIxLmpgdUj7MFTdMuh+NNEzIdY7Gi9fhlyloNEqVjtWKeQoBEFPTnOo0koD
	 lOMa707/6+g5ByFsZEUHKnK0rzAOOLiIUGdvR+vNOEQM5jhVguYz6E1j80asxWtj2q/oY
	 lPRygz2A0ZlAQfe1xtDGQ0tJl/8s2lkSKyTVhvY+enjQ/E0r7j+jVTF992L/INT9Y6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032669;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=19mSluI290qTihlO3U7zmMMhmqL79tgYvlSRd75/cfg=;
	b=Xg42JNuzYz0Lp87u1XCDZCcTpV3oEI4Jq6tlkw50tnQJOvKsSt41HGzCdeLtk97SjCz/
	 1kB6NPLKAvQrbuCyLvQDMJk90YHTSVMO6kuCVM3VluLI63HtDa6ul9MuqxeVvYBtt/Edk
	 pPkMb8IkHlcdsGvQnSbXqE4nMzyZwpWyjz2GekrzwHbROi943h/fWvNgAvwlew4vh8mKc
	 i2XMbZPFmxMzp42zvVdToxvWcNaYHZIZbDJwj5KgQl3GjHCUvYKPsos+i9UB8IZ2eUqTk
	 saUZxfAtY+yqrkUojOdu39kEAPzYpyf0NLuel/NMdolQjO6MkR2e+wPVqpksN1AzoxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=na36WeTF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3E8606A31A;
	Mon, 26 Oct 2026 16:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=na36WeTF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB95F1F031E6;
	Mon, 26 Oct 2026 16:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793032669;
	bh=19mSluI290qTihlO3U7zmMMhmqL79tgYvlSRd75/cfg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=na36WeTFI3CK8UxC/AqT+s0D6hMwTnMKVvfeZF+I/dRKUniZ+BuF/jtWbATEVSfUH
	 9oHQmB5I+TXbQHczDeoSruOG16RozUddk3126JPTe095pAwxBnz9cmwYA4iPYb+KYf
	 x12Chm95tSsi9rIGzs0gHymeNIBm9QBtipK7GXkUdTnZs5OL7hTncW6IXrqDihO94R
	 56p/IZHdmmEJpE38YLwCyou3mBtGGjPMVxxz0sVKxmdrKBIN9FushYYf/IAvl8Xotu
	 9j8lkurJNdZUy7WD+uem4UeCyGsPuuUUwaaqK8oZE2QmVkc46EwD8RA0Ubuv4ohOGw
	 YebSuPqWe3Acg==
Message-ID: <sashiko-outbox-185544@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/22] gpio: Add missing OF module annotations
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <844cb6a50d79486b95e8cf1cb369bb031268cca1.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
 <844cb6a50d79486b95e8cf1cb369bb031268cca1.1793030820.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 16:37:48 +0000
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
- [Low] gpio: mpc5200: missing MODULE_DEVICE_TABLE() for mpc52xx_simple_gpi=
ochip_match
--

commit 7d75c8390d5c804a0671444aa9096ad1c750b879
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

gpio: Add missing OF module annotations

This commit adds missing MODULE_DEVICE_TABLE(of, ...) declarations to sever=
al
GPIO drivers that match devices via Open Firmware device ID tables.

> diff --git a/drivers/gpio/gpio-mpc5200.c b/drivers/gpio/gpio-mpc5200.c
> index 00f209157fd0f..2c828bc922ae3 100644
> --- a/drivers/gpio/gpio-mpc5200.c
> +++ b/drivers/gpio/gpio-mpc5200.c
> @@ -180,6 +180,7 @@ static const struct of_device_id mpc52xx_wkup_gpiochi=
p_match[] =3D {
>  	{ .compatible =3D "fsl,mpc5200-gpio-wkup", },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, mpc52xx_wkup_gpiochip_match);

[Severity: Low]
Should mpc52xx_simple_gpiochip_match in drivers/gpio/gpio-mpc5200.c also be
annotated with MODULE_DEVICE_TABLE(of, mpc52xx_simple_gpiochip_match)?

This file registers two platform drivers in mpc52xx_gpio_init() via
platform_register_drivers(): mpc52xx_wkup_gpiochip_driver and
mpc52xx_simple_gpiochip_driver:

static const struct of_device_id mpc52xx_simple_gpiochip_match[] =3D {
	{ .compatible =3D "fsl,mpc5200-gpio", },
	{}
};

static struct platform_driver mpc52xx_simple_gpiochip_driver =3D {
	.driver =3D {
		.name =3D "mpc5200-gpio",
		.of_match_table =3D mpc52xx_simple_gpiochip_match,
	},
	.probe =3D mpc52xx_simple_gpiochip_probe,
};

Without MODULE_DEVICE_TABLE(of, mpc52xx_simple_gpiochip_match), the module
metadata generated for drivers/gpio/gpio-mpc5200.c omits the OF modalias for
"fsl,mpc5200-gpio".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793030820.gi=
t.u.kleine-koenig@baylibre.com?part=3D9
