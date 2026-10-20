Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486659;
	b=ghDxbaDVpYQFkpxEoa2zrleb4cFNHYOjT3rYN+XycYT5MzjR3eEQtT6wZhG7MxmS4Itd
	 q4Mvr/ESJGd2RSWhPdwQrqY0WgVKOStuigRegn9hAs6q6Rj/8TvF2yashDuo91VpNA6Rq
	 pTNpnZK5JMw0CzQ70sL+o88hkzciho769JAdLQfZJSWcU5lgQ07RwRMh0iKWgUOYsZpX4
	 gAlIcl3WMA+f8KMH/CuMSFmH4L+rqOGCW6dWdyDgQ0TcR/3tYllfTHUMLBbGGGo6hXlAg
	 2npUJT7R3471Ner2WI1vuqaIczjXMJYs1y0g2tH19Maj2eu2uAMoDcwQhhizg7Uezjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486659;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9ukQJga8/SRanG/eXTVEXGt/zdJuLJaYbUF8HMgiuaw=;
	b=fEzby6D+L27XqvJtTIjhS7fQI2r5DMbnyGSVGmCGobn1E4D3uZM6Dzpg0S2Hgr0Jjypd
	 /fe0Aiyy9754dd4L6fdmb8ipWu6IsoJM6nBZ0Q5Paz7270fyvUkwgUde/YLVkOJpHXyn+
	 CadVkjKpbMJv70gKjoCewGV45Zj0LayN3eCUcFIgiFX0p9kgSIaByi8gyIb2YyJb6uzGi
	 epMOThw0loUfwRGhR4EjuqBHZODF/qLMtmwk5tbTwHgQW/uOhiIvdPiVEniYfEbqhEcaZ
	 AYjXjCJumk/P/V/O/GXFKVfTF6sezVPKbrp8xpg7y4pofP0WTU40SObvH37bvCcDGhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AmY5vkDW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0E4606A31F;
	Tue, 20 Oct 2026 08:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AmY5vkDW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E991F000C5;
	Tue, 20 Oct 2026 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792486659;
	bh=9ukQJga8/SRanG/eXTVEXGt/zdJuLJaYbUF8HMgiuaw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AmY5vkDWHUC1rzc0ZfxGW5IGujLMiHJUnk1UnZLHFN0ZOeK7S0pmMvQ36JkvRV5ip
	 I7i7lDgZk7JXTykmljT2gCZchacxFeWqs6d43P1VQUdxEEi/1Bqjbr2b4KMAxfyBDz
	 3y8JlWWL7shhqU4Y2YZ9SeOFkW7967pt/6kyz7DQZMD+A4jk+Ld/7zdzkBHIFnJeh1
	 eSX3Lv1cpLlF2eZLjbwlLngGS3C6OV29Xgw3s/GHb+InadSlBE6eLjcJKSKoWEEhGh
	 Yw2qUuFPhbAogdIBO1UJ5DgQKXjTZ8q7pnjSOORqFuU3gL4cWIm2n+R4QrtsJP9T8e
	 yEv4BNCzVnNkw==
Message-ID: <sashiko-outbox-178660@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/9] gpiolib: regmap: add
 GPIO_REGMAP_QUIRK_SET_AFTER_DIR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>, linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020-cv75-gpio-v11-2-e058bae19571@ambarella.com>
References: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
 <20261020-cv75-gpio-v11-2-e058bae19571@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:57:38 +0000
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

commit 08236aadae56fa844fef879953d0665dc5a56ed0
Author: Long Zhao <longzhao@ambarella.com>

gpiolib: regmap: add GPIO_REGMAP_QUIRK_SET_AFTER_DIR

This commit adds the GPIO_REGMAP_QUIRK_SET_AFTER_DIR flag to gpio-regmap so
controllers that ignore output writes while a line is configured as an input
can write the output value after changing the line direction.

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
Should gpio_regmap_direction_output() check and propagate the return value =
of
gpio_regmap_set()?

In drivers/gpio/gpio-regmap.c, gpio_regmap_set() returns a negative error c=
ode
when gpio->reg_mask_xlate(), regmap_write_bits(), or regmap_update_bits()
fails:

drivers/gpio/gpio-regmap.c:gpio_regmap_set() {
	...
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

When GPIO_REGMAP_QUIRK_SET_AFTER_DIR is not set, ignoring a failure from
gpio_regmap_set() causes gpio_regmap_direction_output() to still call
gpio_regmap_set_direction(chip, offset, true), enabling the output buffer w=
ith
a stale output value.

When GPIO_REGMAP_QUIRK_SET_AFTER_DIR is set, a failure in gpio_regmap_set()
after gpio_regmap_set_direction() is discarded and 0 is returned to
gpiod_direction_output_raw_commit(), leaving the line configured as an outp=
ut
with an unwritten value while reporting success to the caller.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-cv75-gpio-=
v11-0-e058bae19571@ambarella.com?part=3D2
