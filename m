Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123672;
	b=M5wJH8tUCL8P8ZG8xdIFFJfBI5GfSevAOgkIgPWcCWoNfGsQTYLxY2G76mDmsWM2zehq
	 Ng5F4ta0Q1G6eb50Q51TnGmDAuP2GHD1+IhLjYuOt/TF5t8CmijAT/CX0dG6WO60EARQr
	 pPer3lIJpB0+MLqp4+GB3yrBEFVLGh5+l52byuET+ieXCwQkUfesn2CJqzrwFK3DxMzi+
	 H9XPkdKsDqRa8S79qB9332kguezNKRlG8kLoavLM3ggV1OZqAyTN0lJ3ipPujXseUExUO
	 ceQ7g8U9yJkUez7X+4i1ZXnHnHGEVDy00pAm2Il8nEQQnmyu3GorxJYABbhl9XwYu8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123672;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QS69iCDAiNfCAx1eHI6w7P3vlVZy3/nU+lHUBnIm8S8=;
	b=i2T5k4F1ACp+Pus19ma00JquAw+lrAogUulFCGwhRIZC8FIMAip0uDTI9ebHZNkeuI8T
	 eEJpfVvASrUAYLe/t04xPqo0tPL/WhCsG1Hw4Q5jFEYinDialkG1jgWaX84euKG2/k6gW
	 KFV4bjP5qau2zgtRCnd/FAGhbm9vSTFr+SDNWh7COMeO1oo1f/XrqEncsSVo9E9D5oKKY
	 lGIaY4OMRZThb49y7jaG/MMuygah45PQrPz0IOk4eAu99SPv40y8+0YpEkpCi4+BQxyog
	 s6QDU0SqzsTyO9YllM4vUT+1L+E057hr0DZTrdZD7JCLsmQBQzgi1/4QJFUE5JiospA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="CV/ZNa15";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F768606A325
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 21:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CV/ZNa15
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E851F000C4;
	Thu, 19 Nov 2026 21:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795123672;
	bh=QS69iCDAiNfCAx1eHI6w7P3vlVZy3/nU+lHUBnIm8S8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CV/ZNa15WQsteafE6xehp2nXMh9z1Ei94/BNOapbItq1818a/gMuKBOXsxYzDHX79
	 n+TEW5H+j8ZM9V8iDWWJpFZR1SCE34PKwCOCuNBNb1qW6CTfrqIxCKnqZgbHexM7uB
	 +HrT+gX9NCEjUOCwJ/5XPNJlGp/wwxHLMdJ+pIbGtNUv3Ko28KOleKGSy+qDtAl0cO
	 dc/B9JjoV//6I1gNKfoZAKk1J7KcpmdyzbYVWWJ7GNuwgDhmm251R3m6fGfe53MEqe
	 +aI92N76VdEEj0Xd/yG9wh0fbiAHCLm2v6pojO7BDuzUnuK9WWEjMIpaLyix5w09/j
	 EgVw8mhsM2jaw==
Message-ID: <sashiko-outbox-224092@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: rockchip: Fix RK3506 pinctrl support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261119211739.566874-1-jonas@kwiboo.se>
References: <20261119211739.566874-1-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 21:27:51 +0000
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
- [Medium] pinctrl: rockchip: rk3506_pin_banks[0] retains unused
  IOMUX_SOURCE_PMU flag
--

commit defa520e906abc538d7f2bc74fe878780b97ae35
Author: Jonas Karlman <jonas@kwiboo.se>

pinctrl: rockchip: Fix RK3506 pinctrl support

This commit updates RK3506 pinctrl to use per-bank rockchip,grf phandles
(bank->regmap_ioc) with a fallback to the top-level rockchip,grf
(info->regmap_base), removing the undocumented rockchip,ioc1 property.

> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl=
-rockchip.c
> index b78be7dd5342f..563c3ffcfe4ab 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
[ ... ]
> @@ -2568,9 +2560,13 @@ static int rk3506_calc_drv_reg_and_bit(struct rock=
chip_pin_bank *bank,
>  	struct rockchip_pinctrl *info =3D bank->drvdata;
>  	int ret =3D 0;
> =20
> +	if (bank->regmap_ioc)
> +		*regmap =3D bank->regmap_ioc;
> +	else
> +		*regmap =3D info->regmap_base;
> +
>  	switch (bank->bank_num) {
>  	case 0:
> -		*regmap =3D info->regmap_pmu;
>  		if (pin_num > 24) {
>  			ret =3D -EINVAL;
>  		} else if (pin_num < 24) {

[Severity: Medium]
Should IOMUX_SOURCE_PMU also be dropped from rk3506_pin_banks[0]?

drivers/pinctrl/pinctrl-rockchip.c:rk3506_pin_banks[] {
	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS_PULL_FLAGS(0, 32, "gpio0",
				    IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
				    IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
				    IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
				    IOMUX_WIDTH_2BIT | IOMUX_SOURCE_PMU,
    ...
}

Drive, pull and schmitt calculations for bank 0 now use bank->regmap_ioc
with a fallback to info->regmap_base, and rockchip,pmu is no longer
expected on the pinctrl node.  However, IOMUX_SOURCE_PMU still makes
rockchip_get_mux() and rockchip_set_mux() default to info->regmap_pmu
before checking bank->regmap_ioc.  If gpio0 lacks its own rockchip,grf
phandle (so bank->regmap_ioc is NULL) and rockchip,pmu is absent,
rockchip_get_mux() and rockchip_set_mux() pass a NULL regmap to
regmap_read() and regmap_update_bits(), causing a NULL pointer
dereference.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119211739.5668=
74-1-jonas@kwiboo.se?part=3D1
