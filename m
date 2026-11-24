Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549997;
	b=B8PSU/G2BOm2ffdQypDIcGcw6+hezzK+0YNgJI9h2Upvz+psa6Kh86Fav/V5iFGNxbTw
	 ah15CxNIm1uJbV57C8x05ka71jemECaDjlicE2EY6555QWsBbe3lD1p0+8ZGlzvkRePEB
	 U4Hw6QaRtVX1RWx3CIR+Hnzt5HQyiaRpfthhFaFbm0JPtcm2z8p0XuO3Jk7nsaf2CCRYz
	 apQVe4R0KrgumBEwfRW4L2tLeMc/rv680YaeZLgz8nG1jzaQfXWMZa1HMG7hTO398DZXu
	 93p61U+a46FN8WGQsuGRlPe5DVZrgwsjpMim1UgHw1AG/m6M9lmRoMkCoK8T9O0ehsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549997;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JhNA9vcA4rjyGrnZFcrxcZhj96TM96Lx7f9sptF3ReY=;
	b=LmVPuYeHRW15VG5Abeapfe11XojwWVxszOvsOgjku5MxGajyAToEqNlctatb08/InLe2
	 lOklEOZF0pjNVp3SbNPJtLqlDiFjMw/ugOWuzkWRrvLuqdIIdyTQOQscfTbrrHHbcxQQv
	 5NJgaM4cmG9xb7jfjFZbOkvG1Ay9tuqNeCQmbDRw9A4Zz10Y/QUw5Yb3n9hrAd9PaC6NT
	 zdL5/EDR2hdvj6/2EPe7NvdpM0vup0+VMB96R08xDMtEL4F050lwtVfHrpfcVcPWtp0my
	 iJaWThrm46jmPb8P00BLvVQNfCBqZUDdcahMsusXX71FLIQ3sxh4rGigTA960kDQvHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eRY0MjsB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC08C606A326;
	Tue, 24 Nov 2026 19:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eRY0MjsB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6CA61F000F0;
	Tue, 24 Nov 2026 19:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795549997;
	bh=JhNA9vcA4rjyGrnZFcrxcZhj96TM96Lx7f9sptF3ReY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eRY0MjsBrArzHKyXsm1BuNSgFg+ZMkgkLxftb7A4ZpLHl02nhC4wqnk0Nk0hUzJWs
	 swZ0IAZr6pHKHA+Wz7lfk7OSTQZCERr8yXwHOIWhjdYZVRw++Ke/30ulKV9z7L1aGy
	 qG9CRsJaS5B3qvPLZfTxPKDePXfFXYnlvXsuTZKi4dnBB/T2wNmHBiGzKAonf2rTdb
	 61IQIezeaCFjYcogo4gUWncanvuF6OXsDyh3rt5lQSJQ8GmPX1CSTwLUHk8zy/YWPF
	 mVcON6oRbpaRs/AuWe31XF/kHr4yRBrphtNO4wRMQ+5/a1p/u++1PcEwYwI1J6QAqQ
	 tmsal42zsTz8w==
Message-ID: <sashiko-outbox-231919@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: shikra: Add GP M/N clock
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-10-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
 <20261124-b4-pdm_clk_gp_mnd_v2-v3-10-98db26a87500@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 19:53:16 +0000
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
- [High] arm64: dts: qcom: shikra: undefined gp_mn pinmux function on
  gpio87
--

commit 21f238a4776648cda5ae0104384fa487d48ca02b
Author: Taniya Das <taniya.das@oss.qualcomm.com>

arm64: dts: qcom: shikra: Add GP M/N clock controller

This commit adds the GP M/N clock controller node and its gpio87 pin
configuration to the Shikra SoC devicetree.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index 0a95ad5a5582c..a5079b82f22f5 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -992,6 +992,13 @@ sdc2_card_det_n: sd-card-det-n-state {
>  				drive-strength =3D <2>;
>  				bias-pull-up;
>  			};
> +
> +			gp_mn_active: gp-mn-active-state {
> +				pins =3D "gpio87";
> +				function =3D "gp_mn";
> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};
>  		};

[Severity: High]
Is "gp_mn" a valid function for gpio87 on Shikra?

Neither Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
nor drivers/pinctrl/qcom/pinctrl-shikra.c defines a "gp_mn" function, and
pin 87 only defines "pwm":

drivers/pinctrl/qcom/pinctrl-shikra.c:shikra_groups[] {
    ...
	[87] =3D PINGROUP(87, _, pwm, _, _, _, _, _, _, _, _, _),
    ...
}

When a board enables gp_mn, pinctrl_bind_pins() fails to resolve "gp_mn"
with -EINVAL and prevents clock-controller@4713000 from probing, and
dtbs_check fails schema validation on gp-mn-active-state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-b4-pdm_clk=
_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com?part=3D10
