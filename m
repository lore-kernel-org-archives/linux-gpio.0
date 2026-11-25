Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617281;
	b=T0M2YzaRV+OHO5jL6Xpc6pt0NC9UsUkNWJ35xUygFwubGGHBi3/PUnTDKWyYu1mvlu7S
	 yxqwBKLrdfclGje1ie8Gce/YaMQZnToh8UNUSjyNZ/PkqRAaEvDZfA/A15oYuPMcCpSAo
	 D8hFQcJen+MvR4l5/piEjCHKqveEoLjzkovKaloVXOCTw9baNv77kBiteqyOKurThwquH
	 2hOyF8Aa2zdlYpcJUheloUbNOxiDzpQTm980AymgmLXxkdh5CIittw5bNE9g5Vx3YI1+E
	 T6NdY4+yPw6kFxzq8oZdwJ6T7B9rhzoLslgquPm1Xej1VTP3aTAmcPo9iKD6N1O/1ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617281;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=cqCiELa6nbsCUzTTz8YpyoZQ75NYLAQuxQban16hB/w=;
	b=Rlneb8VYfhtyBU64n1XumUuFU5fs1kBwZCAU8j0FUlDMOBWCTehBTqjr+9r+2XmlVI2L
	 DxDXkhQ3UG+Hs18s6lcNZcTJLcP8Q7G0HK/y/YfkVPtxlGbPmA+JyVQqk+v6EeYiW2y0E
	 n/GBqmcoF7Gp2KkvNlpwTUR2pO/o6TVKK7nljUjA8JWlrkGssu4CAZua6VDJR6lQpmOwI
	 o6nT0/NiCL9ElOgpi0IdiNf07fZGhwIQP45qqOEANo2DcjRI0I6b9TDVHJzL+oiDL3uN+
	 aYcdodJDQVs0dX/WzpQKQ+u1cEuIEJc6w0HYJtuyMKr14XIXsyEGGuPUNhu16mAiqWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E214606A335;
	Wed, 25 Nov 2026 14:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E214606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <a61b9a24e0eaf8240933ad2433e6f1c00855b683.camel@crapouillou.net>
Subject: Re: [PATCH v5 6/7] pinctrl: ingenic: Handle X2600 Port E Schmitt
 trigger
From: Paul Cercueil <paul@crapouillou.net>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, Linus Walleij	
 <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz
 Golaszewski	 <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	letux-kernel@openphoenux.org
Date: Wed, 25 Nov 2026 15:34:36 +0100
In-Reply-To: <ec49e1a7da313c8dfe012c17a04d03dc4167ee2a.1795589383.git.hns@goldelico.com>
References: <cover.1795589383.git.hns@goldelico.com>
	 <ec49e1a7da313c8dfe012c17a04d03dc4167ee2a.1795589383.git.hns@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Le mercredi 25 novembre 2026 =C3=A0 07:49 +0100, H. Nikolaus Schaller a =C3=
=A9crit=C2=A0:
> Port E has two Schmitt trigger configuration bits per pin.
> Select the lower-hysteresis mode when enabling and read both bits
> to report firmware-initialized settings.
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

With one question below.

> ---
>=20
> Notes:
> =C2=A0=C2=A0=C2=A0 Changes V5:
> =C2=A0=C2=A0=C2=A0 - Keep the ingenic_get_pin_config() call and the Port =
E
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 condition on single lines, as suggested by=
 Paul Cercueil.
>=20
> =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 7 +++++++
> =C2=A01 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-
> ingenic.c
> index 88531d472cd2e..d253674accacd 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -69,6 +69,7 @@
> =C2=A0#define X2000_GPIO_PEPD				0x90
> =C2=A0#define X2000_GPIO_SR				0xd0
> =C2=A0#define X2000_GPIO_SMT				0xe0
> +#define X2600_GPIO_SMT1				0x100
> =C2=A0
> =C2=A0#define X2600_GPIO_SHADOW_OFFSET		0x800
> =C2=A0#define X2600_GPIO_PAGLD			(X2600_GPIO_SHADOW_OFFSET +
> 0xf0)
> @@ -4693,6 +4694,8 @@ static int ingenic_pinconf_get(struct pinctrl_dev
> *pctldev,
> =C2=A0			return -EINVAL;
> =C2=A0
> =C2=A0		arg =3D !!ingenic_get_pin_config(jzpc, pin, reg);
> +		if (is_soc(jzpc, ID_X2600) && offt =3D=3D 4)
> +			arg |=3D !!ingenic_get_pin_config(jzpc, pin,
> X2600_GPIO_SMT1);
> =C2=A0		break;
> =C2=A0
> =C2=A0	case PIN_CONFIG_SLEW_RATE:
> @@ -4767,6 +4770,10 @@ static void ingenic_set_bias(struct ingenic_pinctr=
l
> *jzpc,
> =C2=A0static void ingenic_set_schmitt_trigger(struct ingenic_pinctrl *jzp=
c,
> =C2=A0		unsigned int pin, bool enable)
> =C2=A0{
> +	/* Port E uses two bits; select the lower-hysteresis Schmitt mode. */
> +	if (is_soc(jzpc, ID_X2600) && pin / PINS_PER_GPIO_CHIP =3D=3D 4)
> +		ingenic_config_pin(jzpc, pin, X2600_GPIO_SMT1, false);

So on port E it will configure both X2600_GPIO_SMT1 and X2000_GPIO_SMT?

Cheers,
-Paul

> +
> =C2=A0	if (is_soc_or_above(jzpc, ID_X2000))
> =C2=A0		ingenic_config_pin(jzpc, pin, X2000_GPIO_SMT, enable);
> =C2=A0	else
