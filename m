Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D54B4D6C55;
	Thu, 15 Oct 2026 11:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062081; cv=none; b=mR8JzN4t2bh6zUrOlpebX6ImVlGRNdvdIdJ1zlfSu+wJASZPVJyxwZLfVCTdRj3rMlIEB7WKofTEC4BvRUvWXJdIpsTilf/ngR8mKDX0VMPYBdqcZgdw5cU6reoD9504RLsJCIMavNv/0OU6ZSpWTvJYZSpg3Vapii8Teie1nDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062081; c=relaxed/simple;
	bh=0VB0tGY8ojZLvTnGA8iio/NOt+RWrDtUk0DAQ2pvhd0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=F2K0ZaH9dvDJb4rGRCBdE8EiIsXiwIWEszdKcLGWBtTzCelCrpm3ZHIOYo934m2513cEJWIKwY3FJjxBwHRqsRMjHFIZGTkEni0qG33gq/LO1TGMgAguLlQqFX10qchys9OxWTvgJKc6PwsD/ZRhy0MEA+H3b9TtY6OaMWNmTTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZZms+fx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZZms+fx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595911F000C4;
	Thu, 15 Oct 2026 11:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792062078;
	bh=yrnG9frQdNwEtwybNjUWmKnJwv1Meshlf1Fuvu7jIuo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PZZms+fxanZjPoWf/7W6Rklbw6f7HU36cGFW9Smg5DVj6iUFPAbN7KjNqTx3eRHlh
	 db0M+lsBqClKmaHFuiAUi8EnOpt9xPSZQS4UASdk41LoFZLNeAU2ztlc9ijJGtDxuY
	 IFfBlLUDIO/oWUCo5Ll31sFMTNBrnWs7/lVrpfvSpePIf/SYbYwBDB8sT8h24N8P3r
	 u984X96vnp0IJfSFvKsDzDLxalEJUGSCf0/AMJ805x/CB9EZe0Fftz+H5EwjmPP3iW
	 hxf1tkA9e7j34xEbL9nrqodsbn1lgqEExv6vs8by+L0Iu/bIEAjLnU38xy8n1wSY9s
	 DBnONCDx9Zxlw==
Message-ID: <sashiko-outbox-172706@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/8] gpiolib: regmap: add
 GPIO_REGMAP_QUIRK_SET_AFTER_DIR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>, linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-cv75-gpio-v10-2-3fe3eb315a55@ambarella.com>
References: <20261015-cv75-gpio-v10-0-3fe3eb315a55@ambarella.com>
 <20261015-cv75-gpio-v10-2-3fe3eb315a55@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 11:01:17 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] gpio: regmap: direction_output bypasses set_with_clear callback
- [Medium] gpio: regmap: silent masking of regmap I/O errors in direction_o=
utput
--

commit 3bcfc79235e7b203090c7124352804ddb1bcdde7
Author: Long Zhao <longzhao@ambarella.com>

gpiolib: regmap: add GPIO_REGMAP_QUIRK_SET_AFTER_DIR

This commit introduces a new quirk flag, GPIO_REGMAP_QUIRK_SET_AFTER_DIR,
which allows the output value to be written after the direction change.
This supports legacy controllers that ignore output writes while a line
is still configured as an input.

> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
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

[Severity: High]
Does this bypass the chip->set callback for hardware that uses separate set
and clear registers?

When setting the initial value during a direction change to output,
hardcoding a call to gpio_regmap_set() instead of using the properly assign=
ed
callback (such as gpio_regmap_set_with_clear) means that if value =3D=3D 0,=
 it
writes 0 to the reg_set_base register.

On set/clear hardware, this is typically a no-op instead of properly writing
the mask to reg_clr_base. This could leave the pin incorrectly driven high.

[Severity: Medium]
Is it safe to ignore the return value of gpio_regmap_set() here?

If the underlying bus (like I2C or SPI) encounters a failure or timeout
during the register write, the negative error code is silently dropped.

The gpiolib core would be falsely informed that the direction and value were
successfully configured, leading to state inconsistencies where software
believes a line is driven high or low but the hardware register write faile=
d.

> +
> +	return 0;
>  }
> =20
>  void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-cv75-gpio-=
v10-0-3fe3eb315a55@ambarella.com?part=3D2
