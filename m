Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530895;
	b=HI5EwJnht2xuZJ5VrYinPprNSnuB+aQUP3MqtwRK8W+r3dvmLQT2Y/AmLurY3VNTC1uD
	 s5odQNeqSc+X6zk3Ry6AxMn+4/c8Hq43Us0ZcC0mhwr9WMzV57yEqRvYAxL1dshjkyOY5
	 PImhvSZLl/1K6Lo5NI9CXZerJEed7iQfZC27EjZpd4xGcmAqK/qfNKkJx5f85r905IU3Q
	 c3/glYdX4KeGctJuk9kSfRpMEmdmRAL23+PXm0QYn6CaPGF2qwcEaHTOrvoYjTktnVEEJ
	 cucr2KPBn+eudBgxsW4mZQ8RoUC0ZVttCb+kKMV38W/a5gUAS7xs8EImeBZRHZeGBxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530895;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Zz5Gz85CyHtqmRJfi2ZTA0BY0NiZd7LAlLATXOr8x6k=;
	b=c8sV7KbgMj0x9ai3SOe2V+s8zjQg8EQRx87mVUq/sVAKza9PtTVABLx9lmVdWirioSgO
	 j7s5WctNZcvnIoBWh/PNMdg7IR9wyycEKptdef9Fk+UYZMs+/IqeBOG+8hgZBXaqfaHov
	 Cne3on2d+h11ZBtQ4V0yf7b6GGSn1uy00Vj2+88d0O+8r1sscVC71BTw8WXGoTvwW34oz
	 tyr9C6U0eSzliDj9wZq9IZeQSMAwiugWrSgLX+PI/OoQaHlXIv2wmMvToVid/Jr8djGYJ
	 kaM+2hYxdfXe/1q4xX3enSzknvB82JOik6g7pkmPlMCpFoLx25+2R+0KlEIrYaVDPFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YcAdnVv9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71617606A689;
	Tue, 24 Nov 2026 14:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YcAdnVv9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C5551F000D1;
	Tue, 24 Nov 2026 14:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795530894;
	bh=Zz5Gz85CyHtqmRJfi2ZTA0BY0NiZd7LAlLATXOr8x6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YcAdnVv97gT7hEw+Au1Gk6QTmUle3BJiNVTZC2xaL7L8PsO0hdIBN64xzgwfEXsZg
	 2uhWSj6uBjOQlqlXD0Y+WHpDMJiquG2uf4KY5Hy3S60vVoQ2tQhxBNaU+87XehVw/D
	 RGzUVwgtNBrqa26IgMR696GeGykFgtyEnEyfnbmrTA4jf7MiLGARu33Q4Q7ObV94N+
	 39evDWPSPF6D+txLt3wj4pRskG7wszRIornQsanYxTeQEjEZrm1VNZb86s1u4Otglq
	 WuaMWPv3dnek0FJjsWPGEnhGu+icu+1Qq/yLTQU1wupENTlmWASQ9r95KGz7nl4CAA
	 HehilQeQOrOuA==
Message-ID: <sashiko-outbox-231357@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: Add Halliday pinctrl driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-halliday-tlmm-v3-2-6b516e5f269c@gmail.com>
References: <20261124-halliday-tlmm-v3-0-6b516e5f269c@gmail.com>
 <20261124-halliday-tlmm-v3-2-6b516e5f269c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 14:34:53 +0000
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
- [Medium] pinctrl: qcom: halliday: egpio function missing
  MSM_GPIO_PIN_FUNCTION()
--

commit 15b578bd9798073a1a0bb1b2dd492309ef5f9871
Author: Stanislav Aleksandrov <lightofmysoul@gmail.com>

pinctrl: qcom: Add Halliday pinctrl driver

This commit adds the pinctrl driver for the TLMM block on the Qualcomm
Halliday SoC, covering 224 GPIOs, PDC wakeup interrupts, UFS reset, and
SDC2 pins.

Link: https://lore.kernel.org/r/wkceygbndcdv2ldsemla27mn5dnzdeijowvxpjozee7=
3wyze6r@mlmymb7cehm4

> diff --git a/drivers/pinctrl/qcom/pinctrl-halliday.c b/drivers/pinctrl/qc=
om/pinctrl-halliday.c
> new file mode 100644
> index 0000000000000..a8f501457b35b
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-halliday.c

[ ... ]

> +static const struct pinfunction halliday_functions[] =3D {
> +	MSM_GPIO_PIN_FUNCTION(gpio),

[ ... ]

> +	MSM_PIN_FUNCTION(edp1_hot),
> +	MSM_PIN_FUNCTION(egpio),

[Severity: Medium]
Should the egpio entry in halliday_functions[] use
MSM_GPIO_PIN_FUNCTION(egpio) instead of MSM_PIN_FUNCTION(egpio)?

msm_pinmux_ops sets .strict =3D true and .function_is_gpio =3D
pinmux_generic_function_is_gpio.  Without PINFUNCTION_FLAG_GPIO on egpio,
pin_request() rejects GPIO requests with -EINVAL for any pin in
egpio_groups (gpio185 through gpio223) that is muxed to the egpio
function, as addressed in 480dc1952404 ("pinctrl: qcom: mark the `gpio`
and `egpio` pins function as non-strict functions").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-halliday-t=
lmm-v3-0-6b516e5f269c@gmail.com?part=3D2
