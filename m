Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082460;
	b=xugKHD9N2B39whATAXk8bvLcpDfhXyCBbHpH4uSr05tKCgEh7D/J1GX7FoOt7AbvMhIW
	 9ztzNJUbLtkoU2Uhjl4hrosr5dhfAMo9uhuebspJYiz4YwnmJgkYKmq8aed4j8YM5DBCQ
	 9i5vw8qII4V9B5dOmxPKsn/mZsnYIhy38ySfBy3mqYoEKmqtvY6PD0TD7sGqQczGUt7kP
	 c2xbE5IYD5g9Ev9Fir4CzB5vl+W9JSNwbVA4sPPnZpMXYQe91GqTIZURCyIB/GpG5PVZ6
	 sCm1Xtb/p1/h3J1k2wfmQI2TjCkVLmhqSEwBQ/kP7t8QgURDb76Iang+RYpyqenOZgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082460;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=ZzlQiwCkbDkJoxEZD6UE5Ynrh3k5WicPHQm3BACKPYM=;
	b=WxaUpJwOyq60nAwMul7MjwqXrv61tdRcOgRcZNcD6BVJqRt62WUAQOK7mFX8X0b1jGyB
	 Wn4S9BCH2n1gvWVI6tzu/aDvRwvILU2D9egLw9IXx44g5Yhtx4I1CeEtaC5RRzkdxXTTP
	 xScS/NmzV9cSzXQXCif+h6xO2JJ+eQVRJx4iECrsjUp4F+/R23XCep+GE2VK4dSzTujjk
	 Ql3HfzTPE66W0YUYtiIbfBuByUu5SwWnw///mCMdmWaAQNrZacZ18EDmgXPfVMB/0QqMD
	 vMX7+JfCaHKk/W6XDHZWO6f6RL/LnDHfU6ZZL13FSJc9o90g5c6VIcfU0+oSkxv0ENQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F3C606A336;
	Thu, 19 Nov 2026 10:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88F3C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <39af3ec5a953dcc1cbada1c53881f8361f63e80e.camel@crapouillou.net>
Subject: Re: [PATCH v4 6/7] pinctrl: ingenic: Handle X2600 Port E Schmitt
 trigger
From: Paul Cercueil <paul@crapouillou.net>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, Linus Walleij	
 <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz
 Golaszewski	 <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	letux-kernel@openphoenux.org
Date: Thu, 19 Nov 2026 11:00:53 +0100
In-Reply-To: <1932f6b68d67badeddcd1d1ec213d2918d877d71.1795022736.git.hns@goldelico.com>
References: <cover.1795022736.git.hns@goldelico.com>
	 <1932f6b68d67badeddcd1d1ec213d2918d877d71.1795022736.git.hns@goldelico.com>
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

Hi Nikolaus,

Le mercredi 18 novembre 2026 =C3=A0 18:25 +0100, H. Nikolaus Schaller a =C3=
=A9crit=C2=A0:
> Port E has two Schmitt trigger configuration bits per pin.
> Select the lower-hysteresis mode when enabling and read both bits
> to report firmware-initialized settings.
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
> =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 9 +++++++++
> =C2=A01 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-
> ingenic.c
> index 02ebfecf9563a..876e8e9e00c45 100644
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
> @@ -4697,6 +4698,9 @@ static int ingenic_pinconf_get(struct pinctrl_dev
> *pctldev,
> =C2=A0			return -EINVAL;
> =C2=A0
> =C2=A0		arg =3D !!ingenic_get_pin_config(jzpc, pin, reg);
> +		if (is_soc(jzpc, ID_X2600) && offt =3D=3D 4)
> +			arg |=3D !!ingenic_get_pin_config(jzpc, pin,
> +						X2600_GPIO_SMT1);

You mis-align it here, then fix it in patch [7/7] in a somewhat unrelated p=
atch.

Honestly, you can keep it on one line - the hard limit is 100 chars per lin=
e
now, and splitting here does not make the code more readable, on the contra=
ry.

> =C2=A0		break;
> =C2=A0
> =C2=A0	case PIN_CONFIG_SLEW_RATE:
> @@ -4771,6 +4775,11 @@ static void ingenic_set_bias(struct ingenic_pinctr=
l
> *jzpc,
> =C2=A0static void ingenic_set_schmitt_trigger(struct ingenic_pinctrl *jzp=
c,
> =C2=A0		unsigned int pin, bool enable)
> =C2=A0{
> +	/* Port E uses two bits; select the lower-hysteresis Schmitt mode. */
> +	if (is_soc(jzpc, ID_X2600) &&
> +	=C2=A0=C2=A0=C2=A0 pin / PINS_PER_GPIO_CHIP =3D=3D 4)

Same here, no need to split.

Cheers,
-Paul

> +		ingenic_config_pin(jzpc, pin, X2600_GPIO_SMT1, false);
> +
> =C2=A0	if (is_soc_or_above(jzpc, ID_X2000))
> =C2=A0		ingenic_config_pin(jzpc, pin, X2000_GPIO_SMT, enable);
> =C2=A0	else
