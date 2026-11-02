Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602895;
	b=PMilshOyPpsWdk8mNyayXrCsEhAiIqK1SD4wxHoWShpnW8W8Oqqhc3ppuaD5RYhjs970
	 AzfcKOPTRWfoYPPzyREqPs4wftHEYKsCAn67m+PPkUWi7uSDn9JsEXXw58inP6jnjDF1C
	 NGmUOzRYN58iEDdxVXVlA7QkBsjrn0UVb+zxMCwLn6tg4NxzAHjAtoD9Q+QMebrv9I7j7
	 IoAGc53TzwiUkq5ZmNVNDErWqMjJF1PZ3Geks8XjG061jeWVnvqU5/HJsmFlaUTbyno0B
	 eGI6JnW9wOBnoMOQvy31YCr3V77N6e6uVrh922Q4BiosrpRHipTDI+mGmbviBNWZi+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602895;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TJGEwD7jtGT63TbiJfLrr9nTlLTqan3nl9lRwUMu14U=;
	b=BN2R7pQOoSZJ93A6aWC2qkQrhbB5MuAsWqp0KfNeVmRDxan8o5zMGAVkBj2Y6rDA+yLi
	 h8i1TKg8EYR9WWJ+CYtrT8BkaxEcE8CspHhN7LPuvyPiOG3Em4kS7dDiA6Yg1pvoD5dBI
	 ZSHSP7VIAF2V/qMMWx46A50scVWOoJCVqGKlwkhru70D58cVDJd57Mq/psjR5dyvQPrJW
	 MZYXHaFnQ3aCCOBiYznHqJdNVzOnx1xMko3M7vaxy9M82YM3WRWj6LC7wnBWO6ikcjTqE
	 e6Ie+lCMcwp+mdCnBJIJKVmTy9gl5N8+si9jTQNIgx5J5//cFbCmxgRI7XFhv2MwRnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VgGNusFI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F67A606A324;
	Mon,  2 Nov 2026 07:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VgGNusFI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74511F000C1;
	Mon,  2 Nov 2026 07:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793602895;
	bh=TJGEwD7jtGT63TbiJfLrr9nTlLTqan3nl9lRwUMu14U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VgGNusFIqU5OJfaX7Sgme2nXQMQpcygau96KKJ6JI8iSO8wET+rf1g9IT4sjvw2p4
	 y0Ze1r4/N+odiYp6nRhncnJgfvPPUC4FqUL0Nt/rLc9ffcW9pdFEFb9vKebECsKVDm
	 LwpnAgduTVv8L73BlkxaRK3RFLW8sHxzoQTlEqRBF8anzVMG67BZQnRHy5ZKeGws0O
	 MsVz2vXiyiL2a8iN8AmAnJUwedPNyMqoyWdYgt7szO65fQk/yW/opb6fi9vOfLD/5J
	 0N1JuyTEk8AcpVxS4VNGuGkug7LXjnYTUbh/+Wa6IoAyObAv4qSn7SX0IF1gWT6kXL
	 dfWRUHOphM+HQ==
Message-ID: <sashiko-outbox-192993@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 02/13] gpiolib: regmap: add
 GPIO_REGMAP_QUIRK_SET_AFTER_DIR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>, linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-cv75-gpio-v13-2-4f93114ea204@ambarella.com>
References: <20261102-cv75-gpio-v13-0-4f93114ea204@ambarella.com>
 <20261102-cv75-gpio-v13-2-4f93114ea204@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 07:01:34 +0000
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
- [Medium] gpio: regmap: unchecked gpio_regmap_set() in gpio_regmap_directi=
on_output()
--

commit eae7ad18ef30360e98f853dbc86b39ea56d2da3f
Author: Long Zhao <longzhao@ambarella.com>

gpiolib: regmap: add GPIO_REGMAP_QUIRK_SET_AFTER_DIR

This commit adds a quirk flag to struct gpio_regmap_config and struct
gpio_regmap so that gpio_regmap_direction_output() writes the output value
after switching the line direction to output for controllers that ignore
output writes while a line is configured as an input.

> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 51b4d69b87403..0a44deae3d01e 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c

[ ... ]

> @@ -271,9 +272,17 @@ static int gpio_regmap_direction_output(struct gpio_=
chip *chip,
>  			return ret;
>  	}
> =20
> -	gpio_regmap_set(chip, offset, value);
> +	if (!(gpio->quirks & GPIO_REGMAP_QUIRK_SET_AFTER_DIR))
> +		gpio_regmap_set(chip, offset, value);
> =20
> -	return gpio_regmap_set_direction(chip, offset, true);
> +	ret =3D gpio_regmap_set_direction(chip, offset, true);
> +	if (ret)
> +		return ret;
> +
> +	if (gpio->quirks & GPIO_REGMAP_QUIRK_SET_AFTER_DIR)
> +		gpio_regmap_set(chip, offset, value);
> +
> +	return 0;
>  }

[Severity: Medium]
As reported by Sashiko on v11 [1], should gpio_regmap_direction_output()
check and propagate the return value of gpio_regmap_set()?

In drivers/gpio/gpio-regmap.c, gpio_regmap_set() returns a negative error
code if gpio->reg_mask_xlate() fails or if regmap_write_bits() or
regmap_update_bits() fails:

drivers/gpio/gpio-regmap.c:gpio_regmap_set() {
	ret =3D gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
	if (ret)
		return ret;
	...
	if (gpio->reg_dat_base =3D=3D gpio->reg_set_base)
		ret =3D regmap_write_bits(gpio->regmap, reg, mask, mask_val);
	else
		ret =3D regmap_update_bits(gpio->regmap, reg, mask, mask_val);

	return ret;
}

When the quirk is not set, a failure in gpio_regmap_set() is ignored and
gpio_regmap_direction_output() still proceeds to call
gpio_regmap_set_direction(), enabling the output with a stale value. When
the quirk is set, a failure in gpio_regmap_set() after changing the
direction is also discarded and 0 is returned to the caller.

[1] https://lore.kernel.org/r/20261020-cv75-gpio-v11-2-e058bae19571@ambarel=
la.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-cv75-gpio-=
v13-0-4f93114ea204@ambarella.com?part=3D2
