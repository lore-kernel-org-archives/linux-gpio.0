Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91F0568527
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 17:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171400; cv=none; b=fl8C6E0Qylde0+zsVI7jz1sKtqBHqrLfFc0i4wpHryYkupPpBNEl4GWhqqO9+ANdKECDT+wb/Nrs+CNNNLVjG3v3enGOavJWcc3YYAJ23nLMVJ4beYG2JzJzjzb+soTwDlCDIPA/idJWrwL1GkfwXVbsOc6bIiYC8xsrWzLy7JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171400; c=relaxed/simple;
	bh=498NI1DOWcZycEt0oquk2toLbvGwIabCpQjGESWOwBQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=I58NVStoWncw3CIibuVU8Unkv58IxpJKUi1VUBUi1XgJxSIa6UlWKt5ofGYM5J66O7qO6NDcElxjAa4AmzVNEAH/yuMRNQSAZCvLMUvRDSGk0J+TiMOMpYlYbRk0/g+FER9ZJKThU1rBKS6XpzZbYIwzIXW3JmHlKEcJSPpJq9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYroJbsn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYroJbsn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9498F1F000C4;
	Fri, 16 Oct 2026 17:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792171399;
	bh=jPzYKFXpYzVc3kM9YYxqTsK2MUWJJsJqxR5Eg4Nen5U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UYroJbsnzJONj22S8zR+eRnBRGTVPz0MXdRJ3zPmkLaLcfmByVWQ7tmYH4Aa11yly
	 c45eBAsedjt+LmkncR7PgGcPjBQh5ewPMGpWvnbrYiFv+I0x98ByX6HLgn41rmVbQj
	 9/XZOcbYmr79Dvgb7QKph7udJafq2NyYBMVvRxY6G1TaTTUm3Bsj+DqaVl2BBM04X0
	 m3iiI4nFlFforYPrZEmtyYG0/EdXKCsatmgvSTCdkFw1mPPmnYAEyhI6cn8o32Wcis
	 01j3PQQdXmF/zK51Sm9Ye2X0f/v+Ma4emh4kU0KuY1f3YjE4JM3GpckrFoL4NHKG+L
	 UVxoxavf0mEfg==
Message-ID: <sashiko-outbox-174720@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpio: cgbc: Add init_valid_mask() operation
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261016-cgbc-gpio-valid-mask-v1-1-938202276e26@bootlin.com>
References: <20261016-cgbc-gpio-valid-mask-v1-1-938202276e26@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 17:23:19 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] gpio: cgbc: init_valid_mask clobbers firmware reserved ranges
- [Medium] gpio: cgbc: uninitialized stack variable due to missing short re=
sponse check
--

commit b1d359743f45922b03a802e12705b29714b272cd
Author: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

gpio: cgbc: Add init_valid_mask() operation

This commit adds the init_valid_mask() operation to the cgbc gpio driver
to mark as valid only the GPIOs which are usable, excluding those
reconfigured by the BIOS as alternate functions.

> diff --git a/drivers/gpio/gpio-cgbc.c b/drivers/gpio/gpio-cgbc.c
> index 84b5ed3c6e22b..1b603d8eccdaa 100644
> --- a/drivers/gpio/gpio-cgbc.c
> +++ b/drivers/gpio/gpio-cgbc.c

[ ... ]

> @@ -146,6 +147,30 @@ static int cgbc_gpio_get_direction(struct gpio_chip =
*chip, unsigned int offset)
>  		return GPIO_LINE_DIRECTION_IN;
>  }
> =20
> +static int cgbc_gpio_init_valid_mask(struct gpio_chip *chip,
> +				     unsigned long *valid_mask,
> +				     unsigned int ngpios)
> +{
> +	struct cgbc_gpio_data *gpio =3D gpiochip_get_data(chip);
> +	struct cgbc_device_data *cgbc =3D gpio->cgbc;
> +	int ret;
> +	u8 val;
> +
> +	ret =3D cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_ENA_RD, 0, 0, &val);

[Severity: Medium]
If the hardware returns a short response, could val remain uninitialized he=
re?

Looking at cgbc_command() in drivers/mfd/cgbc-core.c, if the hardware retur=
ns
an empty payload (istatus =3D=3D 0) but a valid checksum, it returns 0 (suc=
cess)
without writing to the output buffer:

	case CGBC_STATUS_DATA_READY:
		if (istatus > data_size)
			istatus =3D data_size;
		for (i =3D 0; i < istatus; i++) {
			_data[i] =3D ioread8(cgbc->io_cmd + CGBC_CMD_DATA + ((i + 1) % 4));
			...

If istatus is 0, this loop is skipped, val is untouched, and the uninitiali=
zed
stack variable is used to populate the valid mask.

> +	if (ret)
> +		return ret;
> +
> +	*valid_mask =3D val;

[Severity: Medium]
Does this direct assignment clobber firmware-reserved ranges?

The gpiolib core clears reserved bits via gpiochip_apply_reserved_ranges()
before calling the driver's init_valid_mask() callback. By using a direct
assignment instead of a bitwise operation (e.g., *valid_mask &=3D val), any
hardware lines explicitly reserved by the board firmware will be incorrectly
marked as valid again.

> +
> +	ret =3D cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_ENA_RD, 1, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	*valid_mask |=3D (val << 8);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-cgbc-gpio-=
valid-mask-v1-1-938202276e26@bootlin.com?part=3D1
