Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988680;
	b=hCEUzZIN8fY+5s306h1GkJUxUso1wiw5b4JxbgL325VEVRUjqY3YDOXoFb0DGUhF+u4u
	 sobqyZu5Q0YbuDdfyNkO4TEh9g9wmlmLkKhTJxYIXDxxjkBysCTB/2NP9OdQvV/K0gDKJ
	 382lvQIf3GNjCRs/brGhz3FobrSNqnrYacmxcc49izFH8IaK8ok5c3UYnE6KeJ2QUpPCj
	 sTiKgNoRKLbN2a9L/1nXqu2lX/resNDN18crE2ZgLxHk7qUogwmmjswbYZwcfVH7G+SnF
	 Z7uQm7xuZkC35rFDEnW2hPNbaA5fOQ9PTdrH7X8qZW4Lw8C+RHsmW3t0AbXqSbiqUqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988680;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SRZ8WXOFh8EfnZ2OmFlHFlq2ppwLrhy8HjXo01ywcQQ=;
	b=o5RpaGIuSnOH20VD6GTv/Ugq3Z12MbCoCn3ywygI/UzTCle171NhAi/SESFxoZGXYTpy
	 m6LY4Obnx+TIRm42wE5aL1y/2DQjhkuTNdVy9GXvs6kuUVeQFNQzllT3NSEfsAOoxzw8e
	 8v0rTs+lhBmnFxVwsnYhCZ0IoGRltp6WSDixLijcD2QhRJ+J3u6BSwC/vwQ7OxHEYTczv
	 qSNSS8muFPbEX73GstbpTTh4dEw2OJYI6Nc57Zhq8OkG46r+WO4wHhbhzKIZgl1AhN5hc
	 j1aSmBCFn8kOz9opM7b7JF0v3kX2ja3VBIxi5gH+XG+1CCygZbQ2I2HjnNdl6vMF9dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oU3OQ0s/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB76606A32A;
	Wed, 18 Nov 2026 07:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oU3OQ0s/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716FE1F000C4;
	Wed, 18 Nov 2026 07:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794988679;
	bh=SRZ8WXOFh8EfnZ2OmFlHFlq2ppwLrhy8HjXo01ywcQQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oU3OQ0s/lJzF0TltBa7C+2g4ZAgnxr6Gm/RJHoIHT1yKMLrOlBNGwBd6RcN1RqRix
	 rZksr/dpFhQRWYOtFmg3IPNES8d26a3z7S2yjFkLL058bHfFoIvz4m+XpGjNF93a0c
	 +aOwb0fwp8jg2ldqMY2haXAN8lRy9NY6+9xqgPeyS/ny70vAOaMJ4oyKlwhhtUkTe9
	 gMQlf+mFgp0qoQEgoZ+R35j5ybSaDbZgX8/3mRWE+FYSLUbAMz5yFIFWUjmx7Bsn8t
	 yUcLsRWK8tqLEYwyvX/yJa2KvFkogUx649TN5enk58gzKAsr7PWTUs6D5y6zDBSBkh
	 vD6RfweB+AeUw==
Message-ID: <sashiko-outbox-220388@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 02/14] gpio: regmap: add
 GPIO_REGMAP_QUIRK_SET_AFTER_DIR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>, linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-cv75-gpio-v15-2-e3c563673fe1@ambarella.com>
References: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
 <20261118-cv75-gpio-v15-2-e3c563673fe1@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 07:57:59 +0000
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

commit a28b7f775ac99e04969880f3336f27205468ad0c
Author: Long Zhao <longzhao@ambarella.com>

gpio: regmap: add GPIO_REGMAP_QUIRK_SET_AFTER_DIR

This commit adds the GPIO_REGMAP_QUIRK_SET_AFTER_DIR flag to allow
gpio-regmap controllers to write the output value after configuring the
line direction as output.

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
Should gpio_regmap_direction_output() check and return the error code from
gpio_regmap_set()?

gpio_regmap_set() returns a negative errno when gpio->reg_mask_xlate() or
the underlying regmap write fails.  Ignoring it lets the non-quirk path
switch the pin to output while driving a stale hardware value, and lets
the GPIO_REGMAP_QUIRK_SET_AFTER_DIR path return 0 after switching the
direction even though setting the output level failed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-cv75-gpio-=
v15-0-e3c563673fe1@ambarella.com?part=3D2
