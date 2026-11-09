Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794255673;
	b=Atw5YpIv3gSlwBxjXzt+vi7Bx9nHZI6lW74hIeFcSpu51vej+f+oA/dbQSaQ9SGUrybO
	 /OVHZ7rDFBcdV+opHq9tyIJrumjf5aShray/2LVRbhsDuKUChqvp9+K4OM+68iRC2XvZ6
	 vYuMkUSjhtysytqan6SajvB/e4fhqOujs+zbRCpNjfmyBKYrishoJLgI4Qnh28Mq00p/B
	 /oRXOjJgI0uRmhXLpzlbQBzP7V1wtFMfxqBL+t48HMegA0f26CJLG/ez/uXjmePsEvL9f
	 8bRUWorL5hcfnDVEkSDNq3zxklPDy4s5/xSKkgsmGITaZYFHwJEsUrbGPzJ+f2Deavg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255673;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CIxYh3ZHE7+VWvTjm68DE0e3fOLiVywR6KhwWVjJIbc=;
	b=zzIA3rXCCJ8ubUUwGRjjQqUk8UPocBWEHVeoN/C7OVT8mdb2+VXx54mvpTGyP62aKP8W
	 ur5yNWqMmiW2U4wpSZ1LIPNZ4WzJbWTkaSxGX+PQ9gLq9OLcPbrBznoEWIao3gL4FI8mh
	 ZMEjWc8F7RGfvyryYCgXJfJIqeyTCk5BKGyd5z6EzOU/qQZwbrxowFqbv0OZkMylBVJdv
	 FbyEj6b+zIREIx+2L3Kxo0fw65a24/8R9xVWC55ze6wi8eN1oCP4Dl1556PlNHj3n1wE/
	 zCStAyYK5z6Q1BhK/UvhrM43SEnmDu79lwTlG8/u4iKZt8utuxa4NqhkQRl48vgTzYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I9TShc7D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463C6606A321;
	Mon,  9 Nov 2026 20:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I9TShc7D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B83F1F0089F;
	Mon,  9 Nov 2026 20:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794255672;
	bh=CIxYh3ZHE7+VWvTjm68DE0e3fOLiVywR6KhwWVjJIbc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I9TShc7DlgrUm/nHDI0Kpq48u3oZbJumwZrT4UWrWXlfaCMSKA6dKTc8qOiL4A2PI
	 r1Zx82lNAbfBuHL8zMTRpIduY8IH+a9ANwhHwOjON+ubvRowDYKL3JFscQ3hJopXpR
	 nRNYgTrsfFAdhS7TdFYEq4bZYd5UyqbDaJLAELilUxEQ9rYs6QJIRwsQ02+8SAJHQW
	 +U5o9u69mEbmEaqrevblKPNgqBbMkjf7/igraEIUpHywbEg0kLIkC860zMMs5he4vU
	 QEESx7S8V6L1KVQOUTyutT90wbHyzirGSTkZWMhdvP+c0F15/WGpLBtTmatqbdxZ6k
	 Z2F4dfsBPmyaA==
Message-ID: <sashiko-outbox-205573@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] gpio: Add Siflower GPIO controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109-sf19a2890-gpio-v2-2-b885fbd84c4c@telaak.dev>
References: <20261109-sf19a2890-gpio-v2-0-b885fbd84c4c@telaak.dev>
 <20261109-sf19a2890-gpio-v2-2-b885fbd84c4c@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 20:21:11 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] gpio: siflower: Kconfig dependency on undefined symbol
  MACH_SIFLOWER_MIPS
--

commit 7d4cf03fe67bddda82068aa514774129a210dcc8
Author: Qingfang Deng <qingfang.deng@siflower.com.cn>

gpio: Add Siflower GPIO controller driver

This commit adds a driver for the GPIO controller on Siflower MIPS and
RISC-V SoCs.

> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 55e4280029d86..623c09832bebc 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -721,6 +721,18 @@ config GPIO_SIFIVE
>  	help
>  	  Say yes here to support the GPIO device on SiFive SoCs.
> =20
> +config GPIO_SIFLOWER
> +	tristate "Siflower GPIO support"
> +	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST

[Severity: Medium]
Is MACH_SIFLOWER_MIPS defined in Kconfig?  Because the symbol does not
exist in the tree, CONFIG_GPIO_SIFLOWER cannot be enabled unless
CONFIG_COMPILE_TEST is set.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-sf19a2890-=
gpio-v2-1-b885fbd84c4c@telaak.dev?part=3D2
