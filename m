Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447586;
	b=h7yIzaj3jGFdHQAdZTokPBZWOPNVuN7qQd1+R/2ruebbCB6ZJfKVXIea04AuVxFLLwda
	 1LXYNVwQnVTFdJ+vZ3MggWELoIcv0OyVBROcuaaBJjyQHTMN8sQIRvlDL7nSHYCbR2RZw
	 Z9C59K42n0XG/neS1zLNI1vNGjYWzStgf/0feiTEszHwq7iE6L2e+acrWrGJai2EiwYXg
	 6bGs6K6aEStQzVaJKOKzl800YyKyANHTxPyQIIyhp71YWc1en4lA5gZnhtauxTFOzOl2D
	 vhE4PqE9KGuYQ/HMpOyLFKAu+0Od1ARXtQjGSQRPGp7iCPqkKwn+bWiGtOl3gkB8K7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447586;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HCU19bsdGbAlSUy9UzgkopwU/g02dcIIK5MAL+F2JAI=;
	b=m677tBZyTqVUclTUBlgl+BFI7Fv5SrXSaOyw+kpNnVSL8x992FX9b7focwn8RTxXJi4Q
	 xpCuoQkVbVcKihjCQm6W5fpgyECynNFRzJERAWUwBglfn6YjJxrHCbewn0vPjoXoGQHxu
	 1fXfjKdUCcyO9dHQ/aifGPoSBOEScNzdrYujIh7eEEhY+u2v5knfszQnVktY2he17UkH1
	 soPIZoWjBRArhDbtfJilKJnQcioPkQBme5ZyvIGdF5uaFf84oHrj2t6dLFjf+WK5ztql3
	 xBx7hWb+vIuHSB055CyxB7G5GsVB9RDOtAmMakhQRjYr7qRxPwi8by+6bA5TwPE5PwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VdztQVtn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A750606A31E
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VdztQVtn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC611F000E6;
	Mon, 23 Nov 2026 15:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795447586;
	bh=HCU19bsdGbAlSUy9UzgkopwU/g02dcIIK5MAL+F2JAI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VdztQVtnLzHts18CAeM+IhfmiQx4nffQrdWM3vtk+aPULl2q6Qm8R3U7lkO1oiona
	 Dg/H84WYAi1PFoRPi3x6QbVv0IC0Cm+yaQDcZ2KzX4oMd/8m6o/WEonZoNXrZMPOrw
	 E6pnTc4YFlbB/Ox8fmHwSRnxGHNve39V4PHEezbRqx/YTeTnsmDrwkiA9PW1GNv6mP
	 XXWZYVIRdWwd4go4JA3XLOJFJZvOj+OZvTPsgDk/wNjPQQsTtyUlAJlCpaHKfYWw5Z
	 FIk7Xvdih5Qr+oz3Dm/2PT3LiEpp+kGUfX9wfx10CSPJBA9RqhKbHl9fNNQCyGeKdx
	 lNajf5cWM7R7w==
Message-ID: <sashiko-outbox-229555@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] pinctrl: upboard: fix I2C pinmux-select set CPLD
 GPIO OUT not function mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Wang" <is0124@gmail.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-4-f2322a91686d@gmail.com>
References: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
 <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-4-f2322a91686d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:26:25 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] pinctrl: upboard: missing Signed-off-by trailer in commit
  message
- [High] pinctrl: upboard: NULL modes deref in upboard_pinctrl_set_mux()
  on mode 0
--

commit 9be514c1a4ebbf98ef179a29ba2bf1adb01fa558
Author: Gary Wang <is0124@gmail.com>

> pinctrl: upboard: fix I2C pinmux-select set CPLD GPIO OUT not function mo=
de
>
> The CPLD I2C pin mode setting following uart & spi used modes array
> on device AANT0F04.
>
> CC: stable@vger.kernel.org
> Fixes: dca2f73cf19f ("pinctrl: Add pin controller driver for AAEON UP boa=
rds")

[Severity: High]
The commit message is missing a Signed-off-by: trailer from the patch
author, as required by Documentation/process/submitting-patches.rst.

> diff --git a/drivers/pinctrl/pinctrl-upboard.c b/drivers/pinctrl/pinctrl-=
upboard.c
> index b9af6dd93c343..66c1c3e3bfe08 100644
> --- a/drivers/pinctrl/pinctrl-upboard.c
> +++ b/drivers/pinctrl/pinctrl-upboard.c
> @@ -225,11 +225,21 @@ static const unsigned int upboard_up_i2c0_pins[] =
=3D {
>  	UPBOARD_UP_BIT_TO_PIN(I2C0_SDA),
>  };
> =20
> +static const enum upboard_pin_mode upboard_up_i2c0_modes[] =3D {
> +	UPBOARD_PIN_MODE_FUNCTION,
> +	UPBOARD_PIN_MODE_FUNCTION,
> +};
> +
>  static const unsigned int upboard_up_i2c1_pins[] =3D {
>  	UPBOARD_UP_BIT_TO_PIN(I2C1_SCL),
>  	UPBOARD_UP_BIT_TO_PIN(I2C1_SDA),
>  };
> =20
> +static const enum upboard_pin_mode upboard_up_i2c1_modes[] =3D {
> +	UPBOARD_PIN_MODE_FUNCTION,
> +	UPBOARD_PIN_MODE_FUNCTION,
> +};
> +
>  static const unsigned int upboard_up_spi2_pins[] =3D {
>  	UPBOARD_UP_BIT_TO_PIN(SPI_MOSI),
>  	UPBOARD_UP_BIT_TO_PIN(SPI_MISO),
> @@ -289,8 +299,8 @@ static const unsigned int upboard_up_adc0_pins[] =3D {
> =20
>  static const struct upboard_pingroup upboard_up_pin_groups[] =3D {
>  	UPBOARD_PINGROUP("uart1_grp", upboard_up_uart1_pins, &upboard_up_uart1_=
modes[0]),
> -	UPBOARD_PINGROUP("i2c0_grp", upboard_up_i2c0_pins, UPBOARD_PIN_MODE_GPI=
O_OUT),
> -	UPBOARD_PINGROUP("i2c1_grp", upboard_up_i2c1_pins, UPBOARD_PIN_MODE_GPI=
O_OUT),
> +	UPBOARD_PINGROUP("i2c0_grp", upboard_up_i2c0_pins, &upboard_up_i2c0_mod=
es[0]),
> +	UPBOARD_PINGROUP("i2c1_grp", upboard_up_i2c1_pins, &upboard_up_i2c1_mod=
es[0]),
>  	UPBOARD_PINGROUP("spi2_grp", upboard_up_spi2_pins, &upboard_up_spi2_mod=
es[0]),
>  	UPBOARD_PINGROUP("i2s0_grp", upboard_up_i2s0_pins, &upboard_up_i2s0_mod=
es[0]),
>  	UPBOARD_PINGROUP("pwm0_grp", upboard_up_pwm0_pins, UPBOARD_PIN_MODE_GPI=
O_OUT),

[Severity: High]
Are upboard_up_i2c0_modes[] and upboard_up_i2c1_modes[] working around a
NULL pointer dereference in upboard_pinctrl_set_mux() when a pin group uses
a scalar UPBOARD_PIN_MODE_FUNCTION?

UPBOARD_PIN_MODE_FUNCTION is 0, and UPBOARD_PINGROUP() sets .mode =3D m and
.modes =3D NULL when passed a scalar enum upboard_pin_mode.  Because
upboard_pinctrl_set_mux() tests .mode instead of .modes:

drivers/pinctrl/pinctrl-upboard.c:upboard_pinctrl_set_mux() {
	...
	for (i =3D 0; i < grp->grp.npins; i++) {
		mode =3D upgroups[group_selector].mode ?: upgroups[group_selector].modes[=
i];
	...
}

any group configured with scalar UPBOARD_PIN_MODE_FUNCTION has .mode =3D=3D=
 0
and .modes =3D=3D NULL, causing upboard_pinctrl_set_mux() to dereference NU=
LL
at .modes[i].  The UP2 table already defines i2c0_grp and i2c1_grp with
scalar UPBOARD_PIN_MODE_FUNCTION in upboard_up2_pin_groups[], so muxing I2C
on UP2 still triggers this NULL pointer dereference.

Instead of adding uniform mode arrays (which also lack the static_assert()
size checks used for the other mode arrays), should
upboard_pinctrl_set_mux() check upgroups[group_selector].modes ?
upgroups[group_selector].modes[i] : upgroups[group_selector].mode so
i2c0_grp and i2c1_grp can pass UPBOARD_PIN_MODE_FUNCTION directly?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-upboard-pi=
nctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com?part=3D4
