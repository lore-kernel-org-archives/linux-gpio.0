Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304840;
	b=gxVx3cZpQKufVAz85qGdQQHfjMHIWmhVEcxgwfT7HdD4Yt3277fVit7lEDmcdZWxPiLL
	 al/SMSeDDb3fY2B6kgBKQjZCGXWSx5aQYrB99YGOWKzwOLRx9hciu7CWM6dLRysQYILGC
	 5aw3VN/dOkIKY5AzFj676Xduaa207vIUlr2HjMjG9fqIEG8ZRAcsmLk/w4lsRBQyb7PQ2
	 +OxBZp2ZI7x6qNVjQgQZP+z3Ma7y4vxW9ntkYCzS1bgSfSCA+212HLJ39PmV0EXE/T6be
	 NrU7yLiycGunb/0eKdQemdfqUgdYDDD6ZsJ+lGduQuMz20omm4Guc9ePTnlnRUC1MHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304840;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BQEC6GLqhqq+5gtoPURzWbkHyEh6URzsuNMwg+FEDBY=;
	b=AOcMK8V2oBajbc+ylFkcJsDmx5W+8elAEmP02Oa11FQb7R1bk598kfqMHj84mSy5AJZR
	 hUn3UgNknRZ/EplXd1W1D5O0YiVsrAm26WMMXu2H3NgosEQejaPMhoTAc4sAdOeWfHHGq
	 BKrbICRUQll3VDva85I+rbi60sbvaVVutqAAzDbl9GJxPnxZ7I1buVDge+DYAsnPai5ac
	 YP3PUPaEmGjAggfCwBLbddlLwxvLEc2d3MaB/VUsOOvcJy6ocnoYxYB2ehyAHoSO5+frQ
	 0cmMHgNE96kk4a5ibbu4b6Ff6n4QtJpEQePD4KVxnCkooq/FuxeLw/D1LYlVlH9jitA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VkKnt/Kn";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39C360A5BE3;
	Tue, 10 Nov 2026 10:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VkKnt/Kn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110341F008A3;
	Tue, 10 Nov 2026 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794304839;
	bh=BQEC6GLqhqq+5gtoPURzWbkHyEh6URzsuNMwg+FEDBY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VkKnt/KnTPX+ef1DMRYyiYmh33F06k4dy2l4dBwPRTiCm6WjU6jDAb0TLdZpIsvDD
	 npNOpkAlJsbhJ8r/mGGiK/HfL8lzXebieHHecqH4xQ4D+GZDcq0sAddcwLcPypB01h
	 LuhUDG0u3MBkB7/juuMPHJs+kSmNauq8KcflakOWpKnt382t8XRSz9zooEjfiyZ0bo
	 rwadkICL1f/B6wyTO71rVzH9KiRbrrg9V+yMyJdvWAGoLRXEc4IbOAqwu0DMEhLmwP
	 MIbzWYE3LpiRziEki/eH2OeSJqHnjGhJnWYs0DAM9NZSDAD7mG+CCJcfxMF3ZQ0eqW
	 3Bnhh153jf6JA==
Message-ID: <sashiko-outbox-206823@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/12] pinctrl: airoha: an7581: select force GPIO mode
 on GPIO requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhengping Zhang" <zhengping.zhang@airoha.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110094339.749110-6-zhengping.zhang@airoha.com>
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
 <20261110094339.749110-6-zhengping.zhang@airoha.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 10:00:38 +0000
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
- [Medium] pinctrl: airoha: an7581: mux conflict between hsuart and
  hsuart_cts_rts
--

commit b98ded648dd882fe63d659f1c2bdcde0ac118345
Author: Zhengping Zhang <zhengping.zhang@airoha.com>

pinctrl: airoha: an7581: select force GPIO mode on GPIO requests

This commit extends the AN7581 pinctrl driver to support GPIO mux groups for
GPIO0-49 using per-pad force GPIO overrides, clears force GPIO bits when
selecting peripheral functions, and enables shared mux conflict checks.

> diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/ai=
roha/pinctrl-an7581.c
> index 3cbdfc31e97e5..b266cc8bc65f4 100644
> --- a/drivers/pinctrl/airoha/pinctrl-an7581.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7581.c

[ ... ]

> @@ -721,7 +792,14 @@ static const struct airoha_pinctrl_func_group uart_f=
unc_group[] =3D {
>  			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK,
>  			GPIO_HSUART_MODE_MASK
>  		},
> -		.regmap_size =3D 1,
> +		.regmap[1] =3D {
> +			AIROHA_FUNC_MUX,
> +			REG_FORCE_GPIO_EN,
> +			BIT(15) |
> +			BIT(16),
> +			0
> +		},
> +		.regmap_size =3D 2,
>  	},
>  	{
>  		.name =3D "hsuart_cts_rts",
> @@ -731,7 +809,14 @@ static const struct airoha_pinctrl_func_group uart_f=
unc_group[] =3D {
>  			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK,
>  			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK
>  		},
> -		.regmap_size =3D 1,
> +		.regmap[1] =3D {
> +			AIROHA_FUNC_MUX,
> +			REG_FORCE_GPIO_EN,
> +			BIT(13) |
> +			BIT(14),
> +			0
> +		},
> +		.regmap_size =3D 2,
>  	}, {

[ ... ]

> @@ -1432,6 +1834,7 @@ static const struct airoha_pinctrl_conf pinctrl_pci=
e_rst_od_conf[] =3D {
>  };
> =20
>  static const struct airoha_pinctrl_match_data pinctrl_match_data =3D {
> +	.check_mux_conflicts =3D true,
>  	.chip_scu_compatible =3D "airoha,en7581-chip-scu",
>  	.pinctrl_name =3D KBUILD_MODNAME,
>  	.pinctrl_owner =3D THIS_MODULE,

[Severity: Medium]
Does enabling check_mux_conflicts prevent hsuart and hsuart_cts_rts from
being selected together?

hsuart_pins covers only the TX/RX pins (gpio15, gpio16) and clears
BIT(15) | BIT(16) in REG_FORCE_GPIO_EN, while hsuart_cts_rts_pins covers
only the CTS/RTS pins (gpio13, gpio14) and clears BIT(13) | BIT(14).
Configuring 4-wire HSUART with flow control therefore requires selecting
both groups, just like uart2 and uart2_cts_rts.

However, unlike uart2 (whose mask in REG_GPIO_PON_MODE is only
GPIO_UART2_MODE_MASK), hsuart includes GPIO_HSUART_CTS_RTS_MODE_MASK in
its mask with val =3D GPIO_HSUART_MODE_MASK, requiring the CTS/RTS bit to be
0, while hsuart_cts_rts requires that bit to be 1.  With
check_mux_conflicts enabled, airoha_pinmux_set_mux() ->
airoha_pinmux_check_conflicts() rejects selecting both groups with -EBUSY,
and selecting hsuart_cts_rts alone leaves the TX/RX pins unclaimed and
their force-GPIO bits uncleared.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110094339.7491=
10-1-zhengping.zhang@airoha.com?part=3D5
