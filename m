Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713395;
	b=Ss6BqAb0fsYprtbLMe4CVAEviaGwRRKe22qE5d8uN1XmzVQ358XnO/SdCYatmyKmDXkt
	 DBUzdS7Kb9zPPEYjJHYRN13D6LjcFmzI+9/fp0oeUa8xAoA5vyy32e45/po0EO7uwbxVT
	 jQ9AxMSc/HUNJocEpY/Dhnk2vx77EdhUWnoJsy9u99CLZP2D+gEg1NnEYaCtwLuiNo3ye
	 vP42dpC4yjEIrrpdRpzt2+BBQizyTfzFh1qTQ9QXzJNjzesu6tQkRYmFDwE6LmPmNjZAt
	 6br/Yj5sxFYTi24CwXK1twawI07lHnQ/WeScyZCV23IpYm7AWzo8f743/f66GexWGfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713395;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gNV3Y+kbiOmN+1UrURRxaz77l8ApBFrnbY3w221rqUY=;
	b=Q7USFALzJ+ov2OCQmV7r/xt8Bp6N7euNGRvRasUdobEz5CvqckAyQKnxaZxbr8FJzNrx
	 TR970Fx8+LumvpdHf7iEEEDJgq9H2VmoMahpOqB+0w5Ao/UlWrqY6G+buXbRYfiENUPj7
	 PnefSeWfCroGElYQ3r6d+aqGOseCCYoSLv4Mz7P2JHjpNzexKIlbDmAYTkS4/BB0qOKwO
	 exipMx2CMYwJuraOtep0USG2TkzYeL7RkUwJ0Mb7VsfsWlLbMqcO3Ee/5NxBrwAR4QfRt
	 58HHdFAY/1txpwwmmwNJpFW05iMeDbC/4VHerxsA/61PXa24tNnI+22Zsa6BkO6Rrsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nQvtDbXb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE9B606D80F;
	Tue,  3 Nov 2026 13:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nQvtDbXb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3A41F00A17;
	Tue,  3 Nov 2026 13:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793713394;
	bh=gNV3Y+kbiOmN+1UrURRxaz77l8ApBFrnbY3w221rqUY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nQvtDbXbC7cCPTSA0kLC1bQ4rRhAe+4Jaq8JFAYPPTqVtBpgG7ZY0jsUPOg0zsQ4P
	 e6oti7mA0ENA289fIKx9Vk/bU2HAvfZp358G1+KxGLZMA+eOw9QHnN8JowTXsWcff/
	 vTr6tKK7Rt+BezrPG1WAgJmIM85VnFUbaIXVzRPSow5YgZeRxb+ZZ8I2rBsK9WSqpk
	 VAwGznMBC0aFQKLNNLcXnN5k0dDUvgXfDRk33jPvHgYbdR1mgYv2nvIN7f48Q85FJJ
	 gsVc+FHN/FCCnu2wrd8qsFFLHWkeGN2aDQLaQ8TeyM07Jf5hB5nWOaVyfuHyiRiMJE
	 GFU3s1L9UPhew==
Message-ID: <sashiko-outbox-195389@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] ARM: sunxi: select HAVE_SHARED_GPIOS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org
In-Reply-To: <20261103-panel-mipi-non-exclusive-gpios-v1-2-aa862c1d71e3@oss.qualcomm.com>
References: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
 <20261103-panel-mipi-non-exclusive-gpios-v1-2-aa862c1d71e3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 13:43:13 +0000
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
- [Medium] ARM: sunxi: HAVE_SHARED_GPIOS ignores 3-cell sunxi SoC GPIO bind=
ings
--

commit 08b8c5df755142dacaed1d91af688663b9db7e82
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

ARM: sunxi: select HAVE_SHARED_GPIOS

This commit selects HAVE_SHARED_GPIOS for ARCH_SUNXI to enable automated
management of shared GPIOs via the GPIO shared proxy module on sunxi
platforms.

> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index e015f2497111a..b62e8518e2704 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -5,6 +5,7 @@ menuconfig ARCH_SUNXI
>  	select ARCH_HAS_RESET_CONTROLLER
>  	select CLKSRC_MMIO
>  	select GPIOLIB
> +	select HAVE_SHARED_GPIOS

[Severity: Medium]
Does selecting HAVE_SHARED_GPIOS here actually work for Allwinner sunxi SoC
GPIO controllers?

Allwinner sunxi pinctrl/GPIO controllers (&pio and &r_pio) use 3-cell GPIO
specifiers (#gpio-cells =3D <3>: bank, pin, flags), as translated in
drivers/pinctrl/sunxi/pinctrl-sunxi.c:sunxi_pinctrl_gpio_of_xlate():

static int sunxi_pinctrl_gpio_of_xlate(struct gpio_chip *gc,
				const struct of_phandle_args *gpiospec,
				u32 *flags)
{
	int pin, base;

	base =3D PINS_PER_BANK * gpiospec->args[0];
	pin =3D base + gpiospec->args[1];

For example, in arch/arm/boot/dts/allwinner/sunxi-libretech-all-h3-cc.dtsi,
reg_vcc1v2 and reg_vdd_cpux share a GPIO using a 3-cell specifier:

	gpio =3D <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */

However, during boot, gpio_shared_of_scan() -> gpio_shared_of_traverse() in
drivers/gpio/gpiolib-shared.c skips any GPIO specifier that does not have
exactly 2 cells:

	if (args.args_count !=3D 2)
		continue;

Additionally, struct gpio_shared_entry only records a single cell in
entry->offset, and gpiochip_setup_shared() in drivers/gpio/gpiolib-shared.c
hardcodes a 2-cell specifier with only args[0] populated when invoking
gc->of_xlate():

	gpiospec.np =3D to_of_node(entry->fwnode);
	gpiospec.args_count =3D 2;
	gpiospec.args[0] =3D entry->offset;

	ret =3D gc->of_xlate(gc, &gpiospec, NULL);

Wouldn't this cause gpiolib-shared to ignore all shared sunxi SoC GPIOs in
device tree, so any consumer relying on HAVE_SHARED_GPIOS rather than
GPIOD_FLAGS_BIT_NONEXCLUSIVE fails with -EBUSY?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-panel-mipi=
-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com?part=3D2
