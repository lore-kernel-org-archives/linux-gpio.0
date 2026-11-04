Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793764115;
	b=wsRJ2HI08KWWh1ccOZ8YXf2WOXAZiCmUrFcRGfiHWKFd44Vo//ZNrKHz2nV+mFnXOCbD
	 L2hk7BKi4/RyohLxEA/ly9X2YtOZaIxArzdd3gZl687rt9ySNjwGqOAp5eM9g24z8ZPmc
	 qsR/bkNzOzPH5dqvVIeoMHAMYvVUs8BT95CAWtD+jUD9bjIj2NhUHvqsE3RSW2PszZtUE
	 pNyGG55SpC8SeiKMciFI5mEoUwdgYYakkL4GDDx37LTqxR1gA7WzWl2kWD0tmIg8kuT2d
	 XnYuXyM7kbFsJN1GaqNZkSQ+ykDiQzkTlxQQRxTvR5oNVpbSy52nLO7LsA7fVxtOhww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793764115;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NRGYwIRbTvZ9Ow8ZSXVHUpNNZoYpAg5SQuhBkFKGjag=;
	b=x/FUmPtfGyJV8YULCww3KLmNVJMPDm6zYij5Qa7s3eqqcPXvgZYC0KeO0sjI+MkMa2mb
	 isSQvklZeyjZ7Bt12ByKNHsyPTPSuPSavLqcTbA9S3Ifk3b4oXn5JOwQKBS3ibzy1//32
	 JfTlLsfis+zzH07chk3ttXmyaInV4x83CUA60Dfgf5mPWTUmkKLoxy+htNOSNMZqfytjt
	 DN4UGNzMz+ksAahUHhNYBZ1GUq39G+oiROHsz0rfkB/rFvXNRhknVzuxRVMAIRQzDqBfd
	 8HHv87lexp0VLQuyRJPJev3G34qh4+8RWteSPB5Cxh5o8HlVlH/zQDyBKXLpsxnIDog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JSetEWP4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903A2606A31B
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 03:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JSetEWP4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF6C1F000C1;
	Wed,  4 Nov 2026 03:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793764115;
	bh=NRGYwIRbTvZ9Ow8ZSXVHUpNNZoYpAg5SQuhBkFKGjag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JSetEWP4PwnJrDVUfnpECTwh0X+cPdyF81di9tyPDVClYAAaxl+ZPxaTbQvmZ/4DS
	 6XWrL1fOZMuWVMSUT34gcs3lje9oGUpqWv/QHlKFJd+3bis3roi5jvyTIzXbS5hOte
	 G2lGndymp0k9sVDYLGnY6hP/FdcDfbFiIGYJ0+NcU4d/cxPr0XpBKjT/wiuc/EGW41
	 ay/UrVZGryUZD7rwASf9/3+nYniqOuefboorcTi1h83eH1nhTT7Ussbwd+99LY3wMs
	 gY4Hp2FzH3LzwQYLL6JuTL0klYoEXML/dGcmj7IcBUpeZU1kZQK8BfgE8SYSnIymS1
	 YMDFSteLBbeOw==
Message-ID: <sashiko-outbox-196636@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] gpiolib: avoid krealloc() in gpiod_get_array()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261103-b4-gpiolib-free-v2-6-ea46767c9cf8@gmail.com>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
 <20261103-b4-gpiolib-free-v2-6-ea46767c9cf8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 03:48:34 +0000
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
- [Low] gpiolib: delayed initialization of __free() variable in gpiod_get_a=
rray()
--

commit ab11568406b8d4aa5255ce95e09509f3e6c86285
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>

gpiolib: avoid krealloc() in gpiod_get_array()

This commit defers allocating the gpio_descs structure in gpiod_get_array()
until the first GPIO descriptor is retrieved so that it can be allocated in
a single pass without needing krealloc(). It also factors descriptor
allocation and fast-path checks into helper functions.

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e71f8865559f6..cf311c1a707c9 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c

[ ... ]

> @@ -5226,105 +5311,35 @@ struct gpio_descs *__must_check gpiod_get_array(=
struct device *dev,
>  						const char *con_id,
>  						enum gpiod_flags flags)
>  {
> -	struct gpio_desc *desc;
> -	struct gpio_device *gdev;
> -	struct gpio_array *array_info =3D NULL;
> -	int i, count, bitmap_size;
> -	unsigned long dflags;
> +	struct gpio_descs *descs __free(gpiod_put_array) =3D NULL;
> +	int i, count;
> =20
>  	count =3D gpiod_count(dev, con_id);
>  	if (count < 0)
>  		return ERR_PTR(count);
> =20
> -	struct gpio_descs *descs __free(gpiod_put_array) =3D
> -		kzalloc_flex(*descs, desc, count);
> -	if (!descs)
> -		return ERR_PTR(-ENOMEM);
> -
>  	for (i =3D 0; i < count; i++) {
> -		desc =3D gpiod_get_index(dev, con_id, i, flags);
> +		struct gpio_desc *desc __free(gpiod_put) =3D
> +			gpiod_get_index(dev, con_id, i, flags);
>  		if (IS_ERR(desc))
>  			return ERR_CAST(desc);
> =20
> -		descs->desc[descs->ndescs++] =3D desc;
> -
> -		gdev =3D gpiod_to_gpio_device(desc);
> -		/*
> -		 * If pin hardware number of array member 0 is also 0, select
> -		 * its chip as a candidate for fast bitmap processing path.
> -		 */
> -		if (i =3D=3D 0 && gpiod_hwgpio(desc) =3D=3D 0) {
> -			struct gpio_descs *array;
> -			size_t descs_size =3D struct_size(descs, desc, count);
> -
> -			bitmap_size =3D BITS_TO_LONGS(gdev->ngpio > count ?
> -						    gdev->ngpio : count);
> -
> -			array =3D krealloc(descs, descs_size +
> -					 struct_size(array_info, invert_mask, 3 * bitmap_size),
> -					 GFP_KERNEL | __GFP_ZERO);
> -			if (!array)
> +		if (i =3D=3D 0) {
> +			descs =3D gpio_descs_alloc(count, desc);
> +			if (!descs)
>  				return ERR_PTR(-ENOMEM);
> -
> -			descs =3D array;
> -
> -			array_info =3D (void *)descs + descs_size;
> -			array_info->get_mask =3D array_info->invert_mask +
> -						  bitmap_size;
> -			array_info->set_mask =3D array_info->get_mask +
> -						  bitmap_size;
> -
> -			array_info->desc =3D descs->desc;
> -			array_info->size =3D count;
> -			array_info->gdev =3D gdev;
> -			bitmap_set(array_info->get_mask, 0, count);
> -			bitmap_set(array_info->set_mask, 0, count);
> -			descs->info =3D array_info;
>  		}

[Severity: Low]
This isn't a bug, but in gpiod_get_array(), descs is declared at the top of
the function with __free(gpiod_put_array) =3D NULL and then assigned later
inside the loop when i =3D=3D 0.

The cleanup.h conventions ask that __free() variables be defined and
initialized in a single statement at the point of resource acquisition
rather than initialized to NULL at the top of the function and assigned
later. Could the first descriptor be fetched before the loop, or the
allocation structured so that descs is defined and initialized in one
statement?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-b4-gpiolib=
-free-v2-0-ea46767c9cf8@gmail.com?part=3D6
