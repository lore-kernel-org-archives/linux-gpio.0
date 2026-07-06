Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC964DC550
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 09:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329550; cv=none; b=rmAp5j6zwSwwz3cPo5EBcEEvtnokhZ8D45bMOug1tVT7xVCIFy/mLxzvNySZZ9UMJ38cAyhrwMl+pm5qfQJMzxEgZkyF5JvKBaaApkDhm0/2gWV7ejjI3poiNeyCTuPHUzOI5yoPqEMdHnmYAb27daCWYTI4Uhh8CAi8t6rbh0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329550; c=relaxed/simple;
	bh=1P9oxnt1RR+i6Jmost3GXU/54qRAntILBoaU+gZI+Vc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gGT2uqIYxyOGJZgcwQkXKtCYCZJF6udIPrO6XRtiFNjiHmd9kYfT/DN4+2XPr2bBl60zQ1CJ5igMhWRv49lDp3YKZMpaO6b5oQuXW++Jv2bATMlOANBmTWkRtL17j1ksstLUPGrsXk9MLS+3c8VmpRSm+JV8dHoO22Pit3UDQJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nxc4QCdX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nxc4QCdX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4942E1F00ACF
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 09:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783329545;
	bh=xqr7iCIFd2mIIDYlSLvi4QE4QRnGR4gQBpIY4BwdrK4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Nxc4QCdXwCcc6n2//tjIJUA7/35/FqCECAXQ6wRhcxP2iBnd1RMo2n2bBwQ0ZMVxk
	 +YESmTDojNsFcy48wgVttXwe7a9SKjTPrQugEUgYO0f5jTKoVAOSVS+FZSeBl36c35
	 tnphUdtQGX9jsqbsR4BJqw9B0SKIGnHCd+bCtuwiSFuXLVdSG7GwZjOOAFEmmJ0INR
	 QWG20lZbYYOlx8khl+Z4AvLrvmYciYpNCPwOXhnNzEZfnmXzk8+SojQLcqVp3WOOcI
	 ibPWmXPTHB6P0O8NHd7NBmTSfy4bppMgQiNmta76ELA1eP1dBQ94G4IsWQ8omDqGu4
	 wK6b4b02Qe+MA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39b1eb7bd9bso23353291fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 02:19:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpA3EYZYGNI2YsPPZCvocNfTpbS6g6SlUisV4oAdvr/ZuM4HKJGFxVfiK8PCaShjHvMzIbG4d/7hc1v@vger.kernel.org
X-Gm-Message-State: AOJu0YxelV/IGWXE/GgNhQEGD3MilRiVMevKNLF1k4hi1B+NVfbbVxAK
	rLfdneVuzMBC78E+KJ1uhADspogOajn8iPMDJMlp7/jhVCYQ5L8V92SfCrzv0BbUV3+mKSpGnyb
	Fj7fNkJqLRocdTNFGg2sSvbWoYpg5R6WfBLML+U1A+g==
X-Received: by 2002:a2e:bc0e:0:b0:397:e391:c0a9 with SMTP id
 38308e7fff4ca-39b53bb6f38mr16641141fa.10.1783329543999; Mon, 06 Jul 2026
 02:19:03 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 02:19:02 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 02:19:02 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260704151521.211335-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org> <20260704151521.211335-2-marek.vasut+renesas@mailbox.org>
Date: Mon, 6 Jul 2026 02:19:02 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeyKGv75rTLauZuGxSfgjCPXVE_r=A7uNduRr6kAd43aA@mail.gmail.com>
X-Gm-Features: AVVi8Cf8lfGTKX_OdhM-ELP82F_HX1LJB7zZdswu6qjGqp9698E2Ktz2Mev3i2E
Message-ID: <CAMRc=MeyKGv75rTLauZuGxSfgjCPXVE_r=A7uNduRr6kAd43aA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 4 Jul 2026 17:13:47 +0200, Marek Vasut
<marek.vasut+renesas@mailbox.org> said:
> R-Car X5H (R8A78000) is the first member of the R-Car Gen5 family.
> Add support for R-Car X5H, which has slightly different GPIO block
> register layout compared to previous generations. Introduce offset
> remap function which performs 1:1 remap for R-Car Gen1..4 and a bit
> more complex remap for R-Car Gen5.
>
> The GPIO block register offsets on R-Car Gen5 changed and the change
> can be divided into five groups, registers which remained at the
> same offset, INDT register shifted by +0x10, OUTDTSEL register
> shifted by -0x34, INEN register shifted by -0x38 and the rest of
> the registers used by the driver shifted by +0x70 .
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/gpio/gpio-rcar.c | 61 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> index 09bebde5c4260..a22112d9dce0f 100644
> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -36,6 +36,7 @@ struct gpio_rcar_info {
>  	bool has_both_edge_trigger;
>  	bool has_always_in;
>  	bool has_inen;
> +	bool has_layout_gen5;
>  };
>
>  struct gpio_rcar_priv {
> @@ -65,14 +66,59 @@ struct gpio_rcar_priv {
>
>  #define RCAR_MAX_GPIO_PER_BANK		32
>
> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
> +{
> +	/* R-Car Gen4 and older do not need any offset remap. */
> +	if (!p->info.has_layout_gen5)
> +		return 0;
> +
> +	/*
> +	 * R-Car Gen5 register layout is slightly different and the offsets
> +	 * that have to be added to or subtracted from each register offset
> +	 * can be divided into five groups, listed below.
> +	 */
> +	switch (*offs) {
> +	case IOINTSEL...OUTDT:
> +		return 0;
> +	case INDT:
> +		*offs += 0x10;
> +		return 0;
> +	case INTDT...EDGLEVEL:
> +		fallthrough;
> +	case BOTHEDGE:
> +		*offs += 0x70;
> +		return 0;
> +	case OUTDTSEL:
> +		*offs -= 0x34;
> +		return 0;
> +	case INEN:
> +		*offs -= 0x38;
> +		return 0;
> +	default:
> +		/*
> +		 * This here must never be reached, if this is reached, that
> +		 * means there is a catastrophic failure in the driver. Skip
> +		 * any IO read/write to prevent further damage.
> +		 */
> +		WARN_ON(1);
> +		return -EINVAL;
> +	}
> +}
> +
>  static inline u32 gpio_rcar_read(struct gpio_rcar_priv *p, int offs)
>  {
> +	if (gpio_rcar_remap_offset(p, &offs))
> +		return 0;
> +
>  	return ioread32(p->base + offs);
>  }
>
>  static inline void gpio_rcar_write(struct gpio_rcar_priv *p, int offs,
>  				   u32 value)
>  {
> +	if (gpio_rcar_remap_offset(p, &offs))
> +		return;
> +
>  	iowrite32(value, p->base + offs);
>  }
>
> @@ -399,6 +445,7 @@ static const struct gpio_rcar_info gpio_rcar_info_gen1 = {
>  	.has_both_edge_trigger = false,
>  	.has_always_in = false,
>  	.has_inen = false,
> +	.has_layout_gen5 = false,
>  };
>
>  static const struct gpio_rcar_info gpio_rcar_info_gen2 = {
> @@ -406,6 +453,7 @@ static const struct gpio_rcar_info gpio_rcar_info_gen2 = {
>  	.has_both_edge_trigger = true,
>  	.has_always_in = false,
>  	.has_inen = false,
> +	.has_layout_gen5 = false,
>  };
>
>  static const struct gpio_rcar_info gpio_rcar_info_gen3 = {
> @@ -413,6 +461,7 @@ static const struct gpio_rcar_info gpio_rcar_info_gen3 = {
>  	.has_both_edge_trigger = true,
>  	.has_always_in = true,
>  	.has_inen = false,
> +	.has_layout_gen5 = false,
>  };
>
>  static const struct gpio_rcar_info gpio_rcar_info_gen4 = {
> @@ -420,6 +469,15 @@ static const struct gpio_rcar_info gpio_rcar_info_gen4 = {
>  	.has_both_edge_trigger = true,
>  	.has_always_in = true,
>  	.has_inen = true,
> +	.has_layout_gen5 = false,

This looks good but do we really need to change these lines if it's zeroes
anyway?

Bart

> +};
> +
> +static const struct gpio_rcar_info gpio_rcar_info_gen5 = {
> +	.has_outdtsel = true,
> +	.has_both_edge_trigger = true,
> +	.has_always_in = true,
> +	.has_inen = true,
> +	.has_layout_gen5 = true,
>  };
>
>  static const struct of_device_id gpio_rcar_of_table[] = {
> @@ -438,6 +496,9 @@ static const struct of_device_id gpio_rcar_of_table[] = {
>  	}, {
>  		.compatible = "renesas,rcar-gen4-gpio",
>  		.data = &gpio_rcar_info_gen4,
> +	}, {
> +		.compatible = "renesas,rcar-gen5-gpio",
> +		.data = &gpio_rcar_info_gen5,
>  	}, {
>  		.compatible = "renesas,gpio-rcar",
>  		.data = &gpio_rcar_info_gen1,
> --
> 2.53.0
>
>
