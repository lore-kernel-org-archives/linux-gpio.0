Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286830;
	b=djJgQnGZemBStxRZpZhLYqLGl38xLg9vRkPybXl37Gmy9VrnuUVVYUM8ArGwFYVgyapW
	 /zuV6z3lgI5EyT6O5LwzEKbmje3+bR+W9iQFKsCnfe9SaNYfPPGcCp99OH3EQ02rbBvjH
	 HPjybiUTIjC1xZd5V0VgHW4FmSEaq4gb6eDK0HXvykKm5g3usVKdYZzYcl1SyV5EktlfO
	 aqifrDOETf9hQMPTa3w1HtangPDxxAlBtYY7l7E3XMweenK1X+J+6fterVr6NHM5JXWWc
	 xkBKAFMDk5cCLhHMkJLkvc8SAwH4XFT2XEwVPaiUDGlTgQySYSzYC2Lg8nj4Eg1sLQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286830;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=85nbxXAKshbVS0p8L4+FiG85lDJ37PRG2H40A8CXzvE=;
	b=l2m3eV+Um5964wpBblPLDi5343sCOYxL+2ikDfxZ1S6snweoqUSJ5jeH1/tH+6exYWHM
	 MChASpsObh6W5uvIHn6RadWkWnuhWQIFX7tETUNJC+CtLf8cXMIXp5n4GK6gSVKNDwP7i
	 z6q+MYxthCT2hfQHsKowyXJZfJ5rCIFgOBs4mGIsp2/TZdkoIHbrEaSC7fVfEQy83Iimf
	 N4YM+gx97Fw2pb/rLP0+vQhmGtnqlX7G/N7SbIADbzBI2EAuxaLu9IWaoj+5Bf90FpWIi
	 GceaiQABDvhivT4P3MsSvGcMU9fiHFTbLD07JDJQ7pIHmhaG+xf/ruzLmM72IFEF5qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LnB+/70S";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2551E606A31C;
	Tue, 10 Nov 2026 05:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LnB+/70S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668E71F0089F;
	Tue, 10 Nov 2026 05:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794286829;
	bh=85nbxXAKshbVS0p8L4+FiG85lDJ37PRG2H40A8CXzvE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LnB+/70SUJSZN6N9X5HSQpIZdTrJe1tgCgRJYa25JTXCpJZ7v6Ww5ymbqXduM5Odk
	 5XM9ATYJWqB795pfbQaHOLNGbtALAYo3I9db/dqv6E5K0GG/QrJRkXcw3pCNdHHoLV
	 s2QITYVftooSMRka/+SmxoZgMpCgbkN4GHsDroEUa2ZFPSILi5M5J4izhRquswN5zb
	 5kPbvQ8uPQFOSUGUiXQMXwYMvaxwT6BxDu/KIX0hOEdHs2R18wpFsIALRi/PmhNOvs
	 J6AwUkqOkYdKJinOgs9VWgj6tOClqttqlngjPjnK8JGQJG5vnDxbNIBzGjt5pzjK5g
	 gYK82RTdWuOWg==
Message-ID: <sashiko-outbox-206251@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 02/14] gpio: regmap: add
 GPIO_REGMAP_QUIRK_SET_AFTER_DIR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>, linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-cv75-gpio-v14-2-e586aad0467a@ambarella.com>
References: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com>
 <20261110-cv75-gpio-v14-2-e586aad0467a@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 05:00:29 +0000
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
- [Medium] gpio: regmap: unchecked gpio_regmap_set() in
  gpio_regmap_direction_output()
--

commit 5e5487072ae4c1723cfe95105497cc99bb91bff0
Author: Long Zhao <longzhao@ambarella.com>

gpio: regmap: add GPIO_REGMAP_QUIRK_SET_AFTER_DIR

This commit adds the GPIO_REGMAP_QUIRK_SET_AFTER_DIR flag to write the
output value after configuring the line direction for controllers that
ignore output writes while a line is configured as an input.

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
Should gpio_regmap_direction_output() check and propagate errors from
gpio_regmap_set()?

gpio_regmap_set() returns a negative errno when reg_mask_xlate() or the
regmap write fails.  Ignoring that return value in both branches either
enables the output driver with a stale value or reports success to the
caller after failing to write the requested output value.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-cv75-gpio-=
v14-0-e586aad0467a@ambarella.com?part=3D2
