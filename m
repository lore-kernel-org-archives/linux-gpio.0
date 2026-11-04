Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777653;
	b=0obEIxCxjCLl1QqNErOsNiOzrwSLlI8FarwoBk2f31FpB87J/G7B0dnhBeaQMFGZW5hU
	 y2VHDsFzKOueaOHxOpwh9Meo9pfdgnO8XOheaNgx9V3NaIW1evRu8CrAT6IXEz0GBd0iw
	 R2SwSgTIHZAZ17NOU8MhY/Q4eDHcv87eOEsU1fvsw4Ij6h9iDGG+Mm+VF/1+9tMsEtonI
	 5sB1zOrKuqTFPHj4s7Z/CJEMdIQPdR0Elgwvk8WkQGKKBqbQCQwLhlxdUAdjk2Lbnh+m0
	 0VsbbW5j+cMUDxg029bIV6DqvM64Z5wawGV6U8hjoqtkzTbUjiE0VDNihj8grmZZa/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777653;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EAiui550w+maAp3KAF7t+lyaEkj2zfbNdF/rfTJllnw=;
	b=xh7DhNjBftWGbCf69O7T3WU+nfOQdis7c+vzVnIbQzdRrTmQMQPBYe+CGtuH8RvNHQNg
	 ZWVvvoTgW0ozlzpXWlR6wjcsh+vN5p82/8C+FZPOECcWYPJ/Mi0r1PoiDPn2TeL6v+VjS
	 3qPFHD19yN4IYrNeiUifSgB/6hiqXmFTQMWCsvYSnTt4bPKXnVUPZusGW4thLD8T4+jbA
	 RWs6FOK5182KmM4I++kAVULi3NBuopmSJgj9f0nV5LavZThVnU5Py07BhQq8C/EDD48Fa
	 Yv8Bt6xpb7FNoYmOPiw5l06D/UZ4P7ZhXJddf+0k5kmGQAMo6Ci0EC4NgaZutBtCbEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JS/GWK4t";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B378606A328;
	Wed,  4 Nov 2026 07:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JS/GWK4t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD16E1F000C1;
	Wed,  4 Nov 2026 07:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793777653;
	bh=EAiui550w+maAp3KAF7t+lyaEkj2zfbNdF/rfTJllnw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JS/GWK4tf6oYoM4DyVkCISVcPABMhSKZDhd1b3se2SynP7wIoxSMviI7Oka7Krkpe
	 WGyuM5Ypwf7PrGP+SAAHaUluIWGfU9V2573g/Cw/mOWej75glE6778uDj2LlQxhScp
	 sm+okmEaSzgLGUNZHi29H1wyhQ7pT6o7Ad9t5lhHNqYBU4+nRiS80Z7qRPoRnZRjCD
	 Wql4WONp1uj8z2/HGddOyVa7GIS5hQ6N3l8GzWYN67+4bSIe4chwo0DuVYaYOdba7p
	 ZkTMRKa2UNVfLvNzyUkDYpiD2xhtrliImUpSm+nJ6wXOixbbs8FK/z0UYWFebm64SN
	 VJXEkshkMONfw==
Message-ID: <sashiko-outbox-196802@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev>
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
 <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 07:34:12 +0000
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
- [Low] pinctrl: sf19a2890: Kconfig depends on undefined MACH_SIFLOWER_MIPS
--

commit ac52cbc972a93961baa0d00dc4d81d67b2ec8a72
Author: Joseph Telaak <joseph@telaak.dev>

pinctrl: Add Siflower SF19A2890 pin controller driver

This commit adds a pin controller driver for the Siflower SF19A2890 SoC,
supporting pinmuxing, GPIO mux switching, and pad configuration such as
bias, input enable, Schmitt trigger, and drive strength.

> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index dc7138302c55c..1321eb679fcdd 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -562,6 +562,20 @@ config PINCTRL_SCMI
>  	  It uses SCMI Message Protocol to interact with the
>  	  firmware providing all the pinctrl controls.
> =20
> +config PINCTRL_SF19A2890
> +	tristate "Siflower SF19A2890 pin controller"
> +	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST
> +	depends on OF
> +	default MACH_SIFLOWER_MIPS

[Severity: Low]
Is MACH_SIFLOWER_MIPS defined in the tree? Because MACH_SIFLOWER_MIPS does
not exist in any Kconfig file, PINCTRL_SF19A2890 in drivers/pinctrl/Kconfig
cannot be enabled on MIPS configurations unless COMPILE_TEST is set, and
default MACH_SIFLOWER_MIPS always evaluates to n.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-sf19a2890-=
pinctrl-v1-0-4bb83afdbacf@telaak.dev?part=3D2
