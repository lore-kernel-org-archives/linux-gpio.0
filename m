Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082692;
	b=SawB+BXC3LcdJuD1UASvcoUJ3b8DHXXp7fIWwk6tMryhoMG1YY0kD0/+6U9IkxA5fkTD
	 EkOEaVi1lUvqX1Z4taNu94/pGEOZOU5f2leewjxQKT0krlOUV4uwqxjEWxaO/knoAsdDT
	 4Tv6JtpbFM5RRg1ctgYMmPBp5QNmsM1DFd8/PjP45GNJlmv8o+gnaNZwhHIhkjAajXzBT
	 MLmYzjdfvRaRcqriiXglplTA4AbDlDO5TtDhNtacvhw8gLFQ2qLVLRvmw+ywwr6jq5xs2
	 0GGgGgkhEjWOLd7rKW61gTVAJgcol+3DZmihEx9ZEogzekLoXsffB/p/8axuUez7WRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082692;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=JvrJqMMK/RepnSmA4x1HpGIMOemt/Q5sU0cQuWjwmLk=;
	b=nXf8vbyjXAdWnDZ/VZXEf8cG8qdG7NDpP7dHnv9qWhDa4DrGsEeEcolJiY1RarF2asj9
	 8vv3Uyh4g53R5KpgMInyqYX460NiKvl5bxQhI3TyXFr+ke/XVme0i7OoHXWdZs3ryOZvG
	 LwHOLRnCuWjQWgJ4wvTeE9Vo32FZSfPLzcxhPyU/gsRFPDpuTJypcLazpOo5uAu5PcAZ9
	 KGaOk4cuFhychHjM7icXtGjCWYD+IYZ46/YHHfgbXW7g/QrmRLDI6HCEZEwck6Vc0GTjQ
	 8wHUA4fswtvWu//ttfSJ11rwf+3GTZH7D+A5Jujhe4BFPv/Oy1Yz1jhV4wAkG9JlhYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98153606A324;
	Thu, 19 Nov 2026 10:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98153606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <0f52b0ec10c89081c692ba7401d9804b4ccc8513.camel@crapouillou.net>
Subject: Re: [PATCH v4 7/7] pinctrl: ingenic: Handle X2600 Port E pull
 configuration
From: Paul Cercueil <paul@crapouillou.net>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, Linus Walleij	
 <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz
 Golaszewski	 <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	letux-kernel@openphoenux.org
Date: Thu, 19 Nov 2026 11:04:46 +0100
In-Reply-To: <c5923b0330b605adc5dd5c05370bad017015edb0.1795022736.git.hns@goldelico.com>
References: <cover.1795022736.git.hns@goldelico.com>
	 <c5923b0330b605adc5dd5c05370bad017015edb0.1795022736.git.hns@goldelico.com>
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
> Port E uses PEPE as pull enable and PEPS as pull direction
> selection, unlike ports A-D with independent pull registers.
> Update both pinconf get and set while leaving other ports unchanged.
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Apart for the alignment fixup in ingenic_pinconf_get() that I mentioned in =
my
review of [6/7], the patch looks good.

So with this dropped from this patch you can add to your v5:
Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 33 ++++++++++++++++++++++++++++=
---
> =C2=A01 file changed, 30 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-
> ingenic.c
> index 876e8e9e00c45..5feae90c8cbb2 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -4632,7 +4632,16 @@ static int ingenic_pinconf_get(struct pinctrl_dev
> *pctldev,
> =C2=A0	unsigned int bias, reg;
> =C2=A0	bool pull, pullup, pulldown;
> =C2=A0
> -	if (is_soc_or_above(jzpc, ID_X2000)) {
> +	if (is_soc(jzpc, ID_X2600) && offt =3D=3D 4) {
> +		pull =3D ingenic_get_pin_config(jzpc, pin, X2000_GPIO_PEPU);
> +		pullup =3D pull &&
> +			 ingenic_get_pin_config(jzpc, pin, X2000_GPIO_PEPD)
> &&
> +			 (jzpc->info->pull_ups[offt] & BIT(idx));
> +		pulldown =3D pull &&
> +			=C2=A0=C2=A0 !ingenic_get_pin_config(jzpc, pin,
> X2000_GPIO_PEPD) &&
> +			=C2=A0=C2=A0 (jzpc->info->pull_downs[offt] & BIT(idx));
> +
> +	} else if (is_soc_or_above(jzpc, ID_X2000)) {
> =C2=A0		pullup =3D ingenic_get_pin_config(jzpc, pin, X2000_GPIO_PEPU)
> &&
> =C2=A0				!ingenic_get_pin_config(jzpc, pin,
> X2000_GPIO_PEPD) &&
> =C2=A0				(jzpc->info->pull_ups[offt] & BIT(idx));
> @@ -4700,7 +4709,7 @@ static int ingenic_pinconf_get(struct pinctrl_dev
> *pctldev,
> =C2=A0		arg =3D !!ingenic_get_pin_config(jzpc, pin, reg);
> =C2=A0		if (is_soc(jzpc, ID_X2600) && offt =3D=3D 4)
> =C2=A0			arg |=3D !!ingenic_get_pin_config(jzpc, pin,
> -						X2600_GPIO_SMT1);
> +							X2600_GPIO_SMT1);
> =C2=A0		break;
> =C2=A0
> =C2=A0	case PIN_CONFIG_SLEW_RATE:
> @@ -4725,7 +4734,25 @@ static int ingenic_pinconf_get(struct pinctrl_dev
> *pctldev,
> =C2=A0static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
> =C2=A0		unsigned int pin, unsigned int bias)
> =C2=A0{
> -	if (is_soc_or_above(jzpc, ID_X2000)) {
> +	if (is_soc(jzpc, ID_X2600) && pin / PINS_PER_GPIO_CHIP =3D=3D 4) {
> +		/* X2600 Port E: PEPS selects direction, PEPE enables pull */
> +		switch (bias) {
> +		case GPIO_PULL_UP:
> +			ingenic_config_pin(jzpc, pin, X2000_GPIO_PEPD, true);
> +			ingenic_config_pin(jzpc, pin, X2000_GPIO_PEPU, true);
> +			break;
> +
> +		case GPIO_PULL_DOWN:
> +			ingenic_config_pin(jzpc, pin, X2000_GPIO_PEPD,
> false);
> +			ingenic_config_pin(jzpc, pin, X2000_GPIO_PEPU, true);
> +			break;
> +
> +		case GPIO_PULL_DIS:
> +		default:
> +			ingenic_config_pin(jzpc, pin, X2000_GPIO_PEPU,
> false);
> +			break;
> +		}
> +	} else if (is_soc_or_above(jzpc, ID_X2000)) {
> =C2=A0		switch (bias) {
> =C2=A0		case GPIO_PULL_UP:
> =C2=A0			ingenic_config_pin(jzpc, pin, X2000_GPIO_PEPD,
> false);
