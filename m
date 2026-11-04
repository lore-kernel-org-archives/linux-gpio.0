Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793764248;
	b=xJpI1xbjbN50yqwClr/27XY111WlWserLjVNinW5AGDUtIVdOHof5F7br3UYAg7t2jXJ
	 mHRPJL74P4Y8mUtybh2U4Shuf6I27muPDwyPucsqKFYa6YBgsxUomjSaLsqSj21/OYW84
	 slUdZd2ha6am4q7kAOH8R9mzyAi4Itwg38C8hjtVqAiwGpzNAg3DL8EBGN/UR4ZzEQ1ZQ
	 AqNhM5T4o8E683WmsSzBfPRYwYVlW2IfLfIP0I+Stm3bA5cxbpapm1/KtqOBbACkscdaa
	 IeS+9cgebD+HUIEtA3/APnJ9hXADFw3s6zEr4GNQb1u630oeme28c7Waz/cn4gm0YkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793764248;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SyD/U05+Pj6jp2Uy4fwVyBmMKfjiiif6e3RcyrDPYaY=;
	b=c0olo1QglkIu9vPNPvAc2PjGt0qf02NGJ12//BUWC3of3Uh7WeL8RqTXuvmMl5DGl2tC
	 8HXf2uArzjjqzZOefS5Wq6UUP4sljQl14htmj3x24ZNbE/M+Iq6K3FfPQZHs9nQk+fsmM
	 nshkgruLqEHXM18gzdJvOGRaDlgUMNDzKGtBpzTvY/sp0xw8lVhkdWiiFO4UkubklGiyd
	 qOiVlUvKMKvwApHfycNsAkxq2t3/hAvlN9+mh6m2H+NwOxPTL2o5vIpROfBiTdsRI+/7e
	 OOmbklI4dnsQhuXwIlvBy0IopLTdigN5o+qRup+ZL4x4i+4LJ0paacxRaPNx6+5kB+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QfJb4vql;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891B2606A31B
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 03:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QfJb4vql
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008371F000C1;
	Wed,  4 Nov 2026 03:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793764248;
	bh=SyD/U05+Pj6jp2Uy4fwVyBmMKfjiiif6e3RcyrDPYaY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QfJb4vql0rpt+Z6vhaszi/X3fFW//5IQWQAWtOjHnpWj+/BKqRUPsSQt3qW7+kAQy
	 1xQ2GT69vNgySdqdHD7p2fc2Ehzium3uHphPeBwCx8kz274H2pZKg/agkROlif+YsZ
	 Hzv2sCPSl9oOIEas4CAYXUD4cbcf87CX+RRQZ2XcYyp8EBYDKssNAcRj/I0SYozwKn
	 /EMONhnKJRrI0WnsGo/VrGlNXeOil0RQv9cAEXclgc6dE3MXD0zvbOrAe71u1Pp28t
	 wE+o3SbQZrzOXZ4Rz3CPKanY6ds5wR3G1ZK23/x5ZonLoLrGyjvsD4PjUzOT14igwN
	 9Nhmu/F/03tmQ==
Message-ID: <sashiko-outbox-196638@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] gpiolib: use bitmap_zalloc() for fastpath
 bitmaps
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261103-b4-gpiolib-free-v2-7-ea46767c9cf8@gmail.com>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
 <20261103-b4-gpiolib-free-v2-7-ea46767c9cf8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 03:50:46 +0000
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
- [Low] gpiolib: define and initialize __free() variable in gpio_descs_allo=
c()
--

commit 014858138dec2ff00e5cb0fd3fa050587447ef44
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>

gpiolib: use bitmap_zalloc() for fastpath bitmaps

This commit converts invert_mask in struct gpio_array to a pointer and
allocates the get_mask, set_mask, and invert_mask fastpath bitmaps
individually via bitmap_zalloc() instead of a single combined kzalloc()
with manual pointer arithmetic.

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index cf311c1a707c9..bba4e5bb125f9 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -5208,13 +5208,28 @@ static void gpiochip_free_hogs(struct gpio_chip *=
gc)

[ ... ]

> +static struct gpio_descs *gpio_descs_alloc(unsigned int count,
> +					   struct gpio_desc *first_desc)
>  {
>  	struct gpio_device *gdev =3D gpiod_to_gpio_device(first_desc);
> +	struct gpio_descs *descs __free(gpiod_put_array) =3D NULL;
>  	struct gpio_array *array_info;
> -	struct gpio_descs *descs;
>  	size_t descs_size, alloc_size;
> -	unsigned int bitmap_size;
> +	unsigned int nbits;
> =20
>  	/*
>  	 * If pin hardware number of array member 0 is also 0, select
> @@ -5224,25 +5239,36 @@ static struct gpio_descs *gpio_descs_alloc(unsign=
ed int count, struct gpio_desc
>  		return kzalloc_flex(*descs, desc, count);
> =20
>  	descs_size =3D struct_size(descs, desc, count);
> -	bitmap_size =3D BITS_TO_LONGS(max(gdev->ngpio, count));
> -	alloc_size =3D descs_size + struct_size(array_info, invert_mask, 3 * bi=
tmap_size);
> +	alloc_size =3D descs_size + sizeof(*array_info);
> =20
>  	descs =3D kzalloc(alloc_size, GFP_KERNEL);

[Severity: Low]
This isn't a bug, but cleanup.h conventions prefer defining and initializing
__free() variables in a single statement rather than declaring them as NULL
at the top of the function and assigning them later.

In gpio_descs_alloc(), could descs be defined and initialized directly at t=
he
kzalloc() call site after computing descs_size (using struct_size_t(struct
gpio_descs, desc, count)) and alloc_size?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-b4-gpiolib=
-free-v2-0-ea46767c9cf8@gmail.com?part=3D7
