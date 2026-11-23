Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434517;
	b=vBwa6L9M82Ye4Jm8IsO8a8EzNRo2kUqxLXXPpy5bQWCUgjW/rShKFCjFXKwRefqgdQLO
	 N3o+HKpXJ+ZCOXBepsiNLEpNYlL3MG76wbj9VrfGneJfYgVB+JfYv0YGEJlMPKbK4Cn/z
	 9+DZlua9rORjykciY9Ykc5ChblNBLSmW4l1VfhInwB9BwGbN8ax5M8TTGCVdGrGz9z2rY
	 vweGMGdFKoHrrubUNkvPyShPG2bfG/fhBYeyMogDKGXl1uGKn6slT31VVujBYeSupMtCD
	 VnLWLheMJxcRPj0tYrJ7ZsYeYgjY1qASbmI7ZRQ59hh/5ZNvhPUnEFQ5XbsiSv+W9Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434517;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hBySprZkMB/O8sw27MoPojzvoZKhEFd6IQzL7ijl184=;
	b=cSKVc8g5OtHfrlNNtKq5dWhHT1gh+CkEIlqQwg3QVPgMyRxYKNfDzQG2e99p/Rvut2PX
	 1G+1lsIY2KKgzAJf048e3EXFUK31EbeskFMs/VVM6kJRI6HHz3SDKeg5OE5YitsgrrJvh
	 kbi4SemAzewgdjhqqhxonZV4xH/EGY4WBfQXILs7V20ApLXYqGazPrP3nku8LhjJ2r2dx
	 17pPT7sCTXcxAlVMA8EUgkSBCXpTYYRV/+QszBnvBqwYY4DN5R2GIqfp34XYU9+OmN8fF
	 9sbLh0b4NZg/u/HrTEV1Fv4d12/7b7fJN+oLNCCLKSLbEVv1Zta9GD9/6OWyahCpi+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IwMuuf7h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC74E606A31A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 11:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IwMuuf7h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843861F000C4;
	Mon, 23 Nov 2026 11:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795434517;
	bh=hBySprZkMB/O8sw27MoPojzvoZKhEFd6IQzL7ijl184=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=IwMuuf7hn4i4h1Q5vw452756TkMChjpkL2OzfpNCjPPa9IeZicTKpb3z89tqETooH
	 TKh9VpPiyjqSZgXSwLnE46cBTw/8p0q9fxB8xbWA3IHdAN71xNR5kuDbfVx5OxxM0e
	 IKKZ94c9FpRJjfwastFrGkXDO4YuhV0wswIB+E8NuWO0ytVvsXbtWTK1i8cIibwYu+
	 G8lTO1QY/SDlhFYJRk9aQfHfvmovJhFfWAMmRvIt3b7TlHh/keZFevCBHn1U8+IzoT
	 6vpbhkVzOgCNDLsTv1RyckDFwqBrxwHQFaZs7UVuc3O4y/UA5MNyJrnSBPi9x6XYi1
	 icnAvK6Nby8pQ==
Message-ID: <sashiko-outbox-229170@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] gpio: pca953x: Fix TCA6418 bulk transfers and input
 caching
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maria Garcia" <mariagarcia7293@gmail.com>, linux-gpio@vger.kernel.org
In-Reply-To: <20261123113234.197852-2-mariagarcia7293@gmail.com>
References: <20261123113234.197852-1-mariagarcia7293@gmail.com>
 <20261123113234.197852-2-mariagarcia7293@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 11:48:37 +0000
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
- [Medium] gpio: pca953x: missing select BITREVERSE in Kconfig for
  bitrev8() calls
--

commit bfc14bf3ac2754cdca4700090ff5ce99abc64218
Author: Maria Garcia <mariagarcia7293@gmail.com>

gpio: pca953x: Fix TCA6418 bulk transfers and input caching

This commit disables PCA-style register auto-increment for TCA6418, reverses
Bank 0 bits during bulk reads and writes, marks TCA6418 input registers
volatile, and adds TCA6418 IRQ registers to tca6418_check_register().

> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index afec5ec236968..8d9f5563e222a 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c

[ ... ]

> @@ -577,6 +598,9 @@ static int pca953x_write_regs(struct pca953x_chip *ch=
ip, int reg, unsigned long
>  	for (i =3D 0; i < NBANK(chip); i++)
>  		value[i] =3D bitmap_get_value8(val, i * BANK_SZ);
> =20
> +	if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D TCA6418_TYPE)
> +		value[0] =3D bitrev8(value[0]);
> +
>  	ret =3D regmap_bulk_write(chip->regmap, regaddr, value, NBANK(chip));
>  	if (ret < 0) {
>  		dev_err(&chip->client->dev, "failed writing register: %d\n", ret);
> @@ -598,6 +622,9 @@ static int pca953x_read_regs(struct pca953x_chip *chi=
p, int reg, unsigned long *
>  		return ret;
>  	}
> =20
> +	if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D TCA6418_TYPE)
> +		value[0] =3D bitrev8(value[0]);

[Severity: Medium]
Does config GPIO_PCA953X in drivers/gpio/Kconfig need to select BITREVERSE
for these bitrev8() calls?

On architectures without CONFIG_HAVE_ARCH_BITREVERSE, runtime bitrev8() cal=
ls
reference byte_rev_table from lib/bitrev.c, which is only built when
CONFIG_BITREVERSE is enabled.  Without selecting BITREVERSE, building with
CONFIG_GPIO_PCA953X enabled and CONFIG_BITREVERSE disabled (or =3Dm with
CONFIG_GPIO_PCA953X=3Dy) fails at link time with an undefined reference to
byte_rev_table.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123113234.1978=
52-1-mariagarcia7293@gmail.com?part=3D1
