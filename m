Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793376563;
	b=3f0QA3JCx+SsoykmZSsE69wtgdmI7p1ibHDSGIPiHyEZF9j79l4yUWeGfgn3oH8ukFmT
	 DI2bF7qczqn6kOy/Ra9qbbU1y7JE+RlgD/NeT3L64PFBCpl6cODaL8CnU54fJLx/HqWy0
	 yeLehQfm5QtQY337WwnQ364nMRVAxobzxZ75qSW/VWKATzXLZHX/NArOffY82G2ksyB/w
	 fcWhW3c2f9HlRtT15fURF4AVI/aI128lAJtUKBMG2t5YuppC4uAlWbxTTge97WZnz+V5M
	 n6O1dIiTmHtZA1+uYrGkN5bzayyUocPGjYt/lLxCogmSJeAZKGtWDxR2fp7J67NoDJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793376563;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=prMwTzgOvyl80Zep6yruyyZ0mPzh3WOgwRTGbeLE9vU=;
	b=WqRdtyVROUSS5X0ttVIElbWb0+otJuK0uDPNIM1B4vD+ji/77p6xsFgJSYmnY5NjJlRj
	 tAbrJ4jQlOyMUTBq+3eXqlDTkMOPUQkTEILkJfqOv0CuZXtXHG6uSknTZ8dQLqP7/JqPj
	 Mhg+H6uwBvpAA1IVg/XejQVa08TYU23os8tfZ/FBhhUuf430M2TyVb6xUYAAheHb2icpO
	 Q5pxOCC9Na0K26bn4dWTN+wCUMJPgawHuM6B6f63uyMgBgQI06jhjJHfOF40oNVgw0jCj
	 xMFS5NCZtlLQpJosDzi1H3YgevuxqZfC/HMrAfuwrd/C+wres1cg3a/3pDdLxpGqp4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dqPV8Ueo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F930606A31A
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 16:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dqPV8Ueo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965601F000C1;
	Fri, 30 Oct 2026 16:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793376562;
	bh=prMwTzgOvyl80Zep6yruyyZ0mPzh3WOgwRTGbeLE9vU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dqPV8Ueo+OQeBXqeSBrhLFJlcu7Dbn7IWgl6cUPmQlXHT5DpyqUfVSu8tpbuBYtB+
	 YgP6xNBcPrldLrS4KQfULJ9bDFx2x4KdRNNiJ6HSNPISeTDsv5abdhhY6pfMhC0xQp
	 t37qe8werfWEL4/+oIs7vIrn9u3AyUNPaMhZRLHTkKXRjpCAxojY8NeWKzsPLfwIUz
	 he88IKUb2J7lBssT09+3LGfB9fjMe33U3I05BE876o7G7SQ4hiE1jKmE0bWr+VSckn
	 xqC2e6Zg0xCGrLOdzuh3m021WnZQuRfCbVBfoSkGMES9fWOesFbTPid9pT4Vw97hAY
	 XTwIownkR4qSQ==
Message-ID: <sashiko-outbox-191219@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/11] pinctrl: scmi: report an off setting as not set
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Q2zDqW1lbnQgTGUgR29mZmlj?= <clegoffic@baylibre.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 16:09:22 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pinctrl: scmi: -EINVAL in pinctrl_scmi_pinconf_get() breaks GPIO g=
et_direction
--

commit 925e342f7e0510b1b9dda63effb86ab92324b2e4
Author: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>

pinctrl: scmi: report an off setting as not set

This commit changes the SCMI pinctrl driver to return -EINVAL when
querying boolean or pull pinconf parameters whose platform value is 0, so
that inactive settings are not reported as set.

> diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scm=
i.c
> index f74ef0952ba9b..355ad26cb2156 100644
> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -153,13 +153,41 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_c=
onfig_param param,
>  	return 0;
>  }
> =20
> -static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
> -					    u32 value)
> +static bool pinctrl_scmi_pinconf_inactive_flag(enum pin_config_param par=
am,
> +					       u32 value)
>  {
> +	if (value)
> +		return false;
> +
> +	switch (param) {
> +	case PIN_CONFIG_BIAS_BUS_HOLD:
> +	case PIN_CONFIG_BIAS_DISABLE:
> +	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +	case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
> +	case PIN_CONFIG_DRIVE_PUSH_PULL:
> +	case PIN_CONFIG_INPUT_ENABLE:
> +	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> +	case PIN_CONFIG_OUTPUT_ENABLE:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
> +					    u32 *value)
> +{
> +	if (pinctrl_scmi_pinconf_inactive_flag(param, *value))
> +		return -EINVAL;
> +
>  	if (param =3D=3D PIN_CONFIG_DRIVE_STRENGTH)
> -		return value / MILLI;
> +		*value /=3D MILLI;
> =20
> -	return value;
> +	return 0;
>  }
> =20
>  static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
> @@ -232,7 +260,10 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_d=
ev *pctldev,
>  	if (ret)
>  		return ret;
> =20
> -	config_value =3D pinctrl_scmi_map_pinconf_arg_get(config_type, config_v=
alue);
> +	ret =3D pinctrl_scmi_map_pinconf_arg_get(config_type, &config_value);
> +	if (ret)
> +		return ret;

[Severity: High]
Does returning -EINVAL for PIN_CONFIG_OUTPUT_ENABLE when config_value is 0
break pin_control_gpio_get_direction() in drivers/gpio/gpio-by-pinctrl.c
for scmi-pinctrl-gpio?

In drivers/gpio/gpio-by-pinctrl.c, pin_control_gpio_get_direction()
queries the pin direction through pinctrl_gpio_get_config() ->
pin_config_get_for_pin() -> pinctrl_scmi_pinconf_get():

drivers/gpio/gpio-by-pinctrl.c:pin_control_gpio_get_direction() {
	config =3D PIN_CONFIG_OUTPUT_ENABLE;
	ret =3D pinctrl_gpio_get_config(gc, offset, &config);
	if (ret)
		return ret;
	if (config)
		return GPIO_LINE_DIRECTION_OUT;

	return GPIO_LINE_DIRECTION_IN;
}

When a pin has output mode disabled (SCMI_PIN_OUTPUT_MODE is 0, meaning
the pin is an input), pinctrl_scmi_pinconf_inactive_flag() now returns
true for PIN_CONFIG_OUTPUT_ENABLE, so pinctrl_scmi_pinconf_get() returns
-EINVAL.

Because pin_control_gpio_get_direction() returns ret immediately when it
is non-zero, querying the direction of any input line via
gpiod_get_direction() or gpiochip_lock_as_irq() will fail with -EINVAL,
and GPIO_LINE_DIRECTION_IN becomes unreachable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-clegoffic-=
pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com?part=3D4
