Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540764;
	b=x4CZlXJ6qz5Gn6Hi1TUpQ1WiZ5FHoLUx68L00pG+8jmRo5yXNyCWVpJISL/p14SP8A5i
	 9enBYxsNbXDsa7hYjXMPgRnmUwNvjUXnvUbGaT/bG4h9dpfcdU9my1BJnmdltNqZ/lJTx
	 RZ7X8VDLAKwuwaEin/B31Bmy9BSJ79mOWplSoqzPdNDnH8V5pazE4cJJfU9jl0KUWUTEy
	 Rz3kasd2uARf1tZJcd2OAYd68RVeB3bzq8al5uUVfwZqcJIO/i8l9mkIC8JNzMRWp+cHp
	 kDQQnly3u8cftvMT6F3gJI/mBwewGkaAtzaAiHyDaU61/403myFt6QTn8WCUkit5Odw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540764;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Xb3y9Fbu8aL6NgVbicy4ZfYLKCQ2UYfUq2YkUbMAFWk=;
	b=Kjxec6kn3ISdTh5/X6C4AV7WGAzTzKQMheAhs+WSCApoWyWJvnexGtu/MGADCFHOo/yd
	 Dlw5dAKUIhumW6JrjQT2idZkCVnWpG1ihkzWoBvGTzDbCSoNndS1jhyqEdQUHFcKmEpMw
	 XpFpZP8acsV37hHO/ONQGm2G5pTAqm/4H9kHacStsJQpJqZbVNwiYPLfISnRN8Hia01bS
	 fbtemYf5R3EDWgBPFUQeXJTlIt6TWUvMr6NMQ5/yB17L+sJaz6kKmwCcGAhahQvvcJWhf
	 A87CSSR2SHHs5RlFCHOyKeng8MmEo4wSHKYUSWasg1PY56k8h/HzLId2LT/96crAupA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="cy/tyuWM";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A5D606A321
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 17:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cy/tyuWM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2381F000C4;
	Tue, 24 Nov 2026 17:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540763;
	bh=Xb3y9Fbu8aL6NgVbicy4ZfYLKCQ2UYfUq2YkUbMAFWk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cy/tyuWM5rICbzmiDFRnCaouaqwJivuWGfmPeCeIvF+ghs5HTsKBoryHf8XU9xOba
	 wuM788m59DGS6cSohv28BtrwHvLXNVcW6pp39MN7GO3mb2reEAiE5AbTNyRjMd5dKc
	 erWPMMWdTxSV0UOQqcZqonDzQD6Myz2AV1XiLCI2uoTpl1/fVk6rWHtxMTYKF4MsDr
	 XMkqDgsM0DNLZX5VdTCYAFTw9xmxL1zpX3SAh1IMFdsRvlvSOPaqzllI4/8YSwKExG
	 57YNrRgKPh/u8C//3sqfYhGNm3KNI6PqI3LkvhVaoUvTtU0H+gMjx11AtwU1FEj5WD
	 9vO/shqihCLVQ==
Message-ID: <sashiko-outbox-231683@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] pinctrl: upboard: add device id INTC1055 &
 INTC1057 & INTC105E based UP boards support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Wang" <is0124@gmail.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-5-c8079f8f569f@gmail.com>
References: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
 <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-5-c8079f8f569f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:19:21 +0000
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
- [High] pinctrl: upboard: wrong functions for ish_i2c groups in
  pinctrl_map_upnadln
--

commit cfa439814253611b6af521059869e83629a2939d
Author: Gary Wang <is0124@gmail.com>

pinctrl: upboard: add device id INTC1055 & INTC1057 & INTC105E based UP boa=
rds support

This commit adds pin mapping data and DMI entries for the UP Squared i12,
UP Squared Pro 7000, UP 7000, UP Xtreme i14, and UP Xtreme ARL boards.

> diff --git a/drivers/pinctrl/pinctrl-upboard.c b/drivers/pinctrl/pinctrl-=
upboard.c
> index 0903163493310..6b53d6fd5996d 100644
> --- a/drivers/pinctrl/pinctrl-upboard.c
> +++ b/drivers/pinctrl/pinctrl-upboard.c
> @@ -912,7 +912,7 @@ static const struct upboard_pinctrl_map upboard_pinct=
rl_map_apl01 =3D {
>  	.nmaps =3D ARRAY_SIZE(pinctrl_map_apl01),
>  };
> =20
> -static const struct pinctrl_map pinctrl_map_adl[] =3D {
> +static const struct pinctrl_map pinctrl_map_upxadlp[] =3D {
>  	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c0_grp",=
 "i2c0"),
>  	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c1_grp",=
 "i2c1"),
>  	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "pwm0_grp",=
 "pwm0"),
> @@ -920,9 +920,61 @@ static const struct pinctrl_map pinctrl_map_adl[] =
=3D {
>  	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "ssp2_grp",=
 "ssp2"),
>  };

[ ... ]

> +static const struct pinctrl_map pinctrl_map_upnadln[] =3D {
> +	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "ish_i2c0_g=
rp", "i2c0"),
> +	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "ish_i2c1_g=
rp", "i2c1"),

[Severity: High]
Should the functions for ish_i2c0_grp and ish_i2c1_grp in
pinctrl_map_upnadln[] be "ish_i2c0" and "ish_i2c1" instead of "i2c0" and
"i2c1"?

On INTC1057, adln_functions[] in drivers/pinctrl/intel/pinctrl-alderlake.c
only includes i2c0_grp in function "i2c0" and i2c1_grp in function "i2c1",
while ish_i2c0_grp and ish_i2c1_grp belong to functions "ish_i2c0" and
"ish_i2c1".  As a result, pinmux_map_to_setting() rejects these mappings
with -EINVAL, causing devm_pinctrl_get_select_default() and
upboard_pinctrl_probe() to fail on UP Squared Pro 7000 (UPN-ADLN01).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-upboard-pi=
nctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com?part=3D5
