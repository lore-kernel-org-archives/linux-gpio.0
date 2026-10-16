Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A2D3168EB;
	Fri, 16 Oct 2026 14:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162395; cv=none; b=egyMPVRKIgxB3/2FpoVrCYwrmkOcIn52BG9h63wH0PMnTPzvXnEkKVezAAGFQp32w8spnQ4HJQpJ39nOrhPtDmh+BVsKk4wJTsrPKJXxf+jwaDSTRoRghVwJHEXWFGNqyDdwjlHqLRb/1wKhpU58NbDBc+iu0zntkD1qWtxWIq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162395; c=relaxed/simple;
	bh=cWPVIhQg28XdqmUe5vg1m1XWf58sh8dJscl69YI4lzQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=aoDqKrPxztsEs6miM6HJlUUUpe4DV/IBkFQrPYvNZX3AM8u+W0YWDYuEB56w+/rttkFlIqa/5RGRfr4KNTrERZvQzFwkm1IYdTA/TiZlacIxWv9zflFCeCTdxMma5ZxQ+PIXSmtsojR4uRbPMMhMst5qZyAuzrEMJQ2UrFB4ayY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5f/3vcO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5f/3vcO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9A71F000C4;
	Fri, 16 Oct 2026 14:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792162393;
	bh=nEDBcb2dYXaTlFUJBluxnJjKiR2AjJE598lhZCFoYqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B5f/3vcOtcIFFLMx43cFVC+wlx/y87vhmUeQpEeMRoQt8RsOO4DygpJKQY2HDKqJG
	 kYO6aNdVOrp+nOziA8OKqG3/Rx5aDS14KVRJVYXbMu53GaPstcoLpIXaVjEabOVBV3
	 rRhMilcs/AbanOnVZp5rF/6xZK9cmLKHY/2NKpSdI0oCbpWB8mW6XhOzssvb/Kav7I
	 DMcFsPdsXpgBwY8/6DSVsflw8IxvbTP5WLEPru448a1szjMWaIQrx0gHPtbhzIdHnx
	 L7ng4Fp9FvocVqj43hqDbm634mwTSLJkLtUhc1rvOktE717MAbfk+TtdYFiBsGzLk8
	 gFqtzKpkmKZNA==
Message-ID: <sashiko-outbox-174499@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/10] ARM: dts: omap: dm816x: Correct speed for sysclk5
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ettore Chimenti" <ettore.chimenti@linaro.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-8-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-8-b4ce30217028@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 14:53:12 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: ti: divider mask resolves to 0 preventing hardware update
--

commit 010a738d1ba1df99c68c1c1fed6854e92365aa42
Author: Andrew Goodbody <andrew.goodbody@linaro.org>

ARM: dts: omap: dm816x: Correct speed for sysclk5

The commit forces sysclk5 to run at 813MHz by changing its divider
configuration from a maximum divider of 1 to a divider of 2.

> diff --git a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi b/arch/arm/boot=
/dts/ti/omap/dm816x-clocks.dtsi
> index 76ebc6c3c3e5e..cb990773b0985 100644
> --- a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
> @@ -144,7 +144,7 @@ sysclk5_ck: sysclk5_ck@310 {
>  		#clock-cells =3D <0>;
>  		compatible =3D "ti,divider-clock";
>  		clocks =3D <&sysclk4_ck>;
> -		ti,max-div =3D <1>;
> +		ti,dividers =3D <2>;

[Severity: High]
Does this actually change the clock rate in the hardware register?

By providing a single-element array ti,dividers =3D <2>;, the divider value=
 2
maps to the array index 0.

In drivers/clk/ti/divider.c:ti_clk_get_div_table():

	table[valid_div].div =3D val;
	table[valid_div].val =3D i;

Since there is only one element, the maximum valid index (and maximum regis=
ter
value) is capped at 0.

When the mask is calculated in drivers/clk/ti/divider.c:_setup_mask():

	divider->mask =3D (1 << fls(mask)) - 1;

A maximum register value of 0 results in the mask evaluating to 0.

Consequently, any attempt to update the rate in ti_clk_divider_set_rate()
becomes a no-op:

	val &=3D ~(divider->mask << divider->shift);
	val |=3D value << divider->shift;

With a mask of 0, the physical hardware register is not modified, leaving t=
he
clock running at 1.6GHz while the software incorrectly believes it has been
set to 813MHz.

>  		reg =3D <0x0310>;
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-patch-ekto=
r5-dm8168-dts-v1-0-b4ce30217028@linaro.org?part=3D8
