Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502343;
	b=IJEVuItpfXJlfsfFaokwIEW2bVrYXtfyDDl8rWd9kWZnOKy1jA8ZI0cGM9G9/jWKU/ad
	 FhAbrPt+oZbBjrVJlG1fhpqlRji1Br0WwU78XYE5b4IStWaU+KrdoUS6beMKTR+o9GUpL
	 g/keK/msmJXPqR56+J7IKcF79CYOh7gK8tDKtN2ONZQ1Dm+elPMU+ddTyl2Hn7e3hvoNI
	 1hHibW5CUWbELW/LECZBV1dj4DJd52/qG0oGKiWjBGx5TQJs0/AovxjmFSjIT7v1yiKYK
	 aARsq3GdulWh9sU1DokqZz/yk2RO7Fu58hAEPCCcjGeY6T06HxhpFHQTdBucCOjOSEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502343;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9YvoZ+bfkxOpcGjtwpVvYa1oYyhp16DHZmoHiZDrOPw=;
	b=XOdJcyYoGLk4Vz4cBrTG6fM9jiJit0pJjzgMcYdPdFgXrO6aCoSewNwZtypmttbyqfHV
	 6RV0GwceXS5SWMjU9Kc0eyfSXsaYJdOT+XBy4bkiX/r3/sLw6Lmb4UFmXURbDggcbqy1M
	 5s7+MCnbTeP2uUg9xDj6pnkbQxKo7NkI6/ThSsR/8RluAl4/vbp2ZwhyOHc7ugjOBl7Dq
	 lqoaa0gQMz91GJagtUNrEDFlLJWUo493KTnjvBWctFZ21ZStsEtzs356XP1gqBRB4k51V
	 gqY7nRLRtuSOch1R/oN7/abIQ7WWyPVGOb2yLhz0PEhbngZxHnm3fpi75NOKDpyRNSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UpJVvmkI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC80B60A260B
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UpJVvmkI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733D81F000CC;
	Tue, 20 Oct 2026 13:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792502342;
	bh=9YvoZ+bfkxOpcGjtwpVvYa1oYyhp16DHZmoHiZDrOPw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UpJVvmkIlNKAXrcJnz/sWOAF1JueFO+iR2+Sopxr+JEepukexJyIGHKcqTErqj7AB
	 2CJ/0DyHGLEp6FqTgs5APHGlHlTu3VUZU6BmEjQvsGTuZ0esTtv5HZGdJ11iEVaOZv
	 hTaUEy/Gjmc2jc9aBx7wcucuBJuKkZVvtg+zhTvBJyazZmEBGawkdPT009WJD48QC3
	 rn5keEcbkhysW1sXMlLi58gufQ5aun3nck1OSNOcW922leQVFzwC9ROXmYL0kwWVmG
	 5zgZr0bUVOOSgQRiHEUCizgqCh0o2tPHLGled2b6nfNVbcABRwavUOu+joCobPZTL6
	 m7eeunDX37wsw==
Message-ID: <sashiko-outbox-179011@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/6] gpiolib: free the label of lines released after
 their chip was removed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ambrozewicz" <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261020-gpiolib-chip-removal-v3-2-aambrozewicz@nvidia.com>
References: <20261020-gpiolib-chip-removal-v3-0-aambrozewicz@nvidia.com>
 <20261020-gpiolib-chip-removal-v3-2-aambrozewicz@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 13:19:01 +0000
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
- [High] gpiolib: premature label clear in gpiod_free_commit() before gc->f=
ree()
--

commit edc5ef8f1a27a83fd784e08207b698b98a88ea6d
Author: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

gpiolib: free the label of lines released after their chip was removed

This commit moves desc_set_label(desc, NULL) in gpiod_free_commit() ahead of
the guard.gc check so that consumer labels are still freed when a requested
line is released after gpiochip_remove() has cleared gdev->chip.

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e5326c472a544..e923512febf15 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2666,7 +2666,12 @@ void gpiod_free_commit(struct gpio_desc *desc)
> =20
>  	flags =3D READ_ONCE(desc->flags);
> =20
> -	if (guard.gc && test_bit(GPIOD_FLAG_REQUESTED, &flags)) {
> +	if (guard.gc && !test_bit(GPIOD_FLAG_REQUESTED, &flags))
> +		return;
> +
> +	desc_set_label(desc, NULL);
> +
> +	if (guard.gc) {
>  		if (guard.gc->free)
>  			guard.gc->free(guard.gc, gpiod_hwgpio(desc));

[Severity: High]
Can clearing desc->label before invoking guard.gc->free() and before cleari=
ng
GPIOD_FLAG_REQUESTED cause a concurrent for_each_hwgpio() or
for_each_requested_gpio() caller to pass ERR_PTR(-ENOMEM) to kfree()?

In drivers/gpio/gpiolib.c:gpiod_free_commit(), desc_set_label(desc, NULL) n=
ow
runs before guard.gc->free() and before GPIOD_FLAG_REQUESTED is cleared via
WRITE_ONCE(desc->flags, flags). Because guard.gc->free() can sleep or block=
 on
driver locks (such as &chip->lock in gpio_sim_free(), &pctldev->mutex in
pinctrl_gpio_free(), or bus transfers in I2C/SPI/USB GPIO drivers), this le=
aves
a window where GPIOD_FLAG_REQUESTED is still set while desc->label is NULL.

For example, in drivers/gpio/gpio-sim.c:gpio_sim_dbg_show():

	guard(mutex)(&chip->lock);

	for_each_hwgpio(gc, i, label)

If gpiod_free_commit() clears desc->label and then blocks on &chip->lock in
gpio_sim_free() while gpio_sim_dbg_show() (or another caller such as
intel_restore_hostown() or lp_gpio_resume()) iterates the lines,
drivers/gpio/gpiolib.c:gpiochip_dup_line_label() will see GPIOD_FLAG_REQUES=
TED
still set:

	if (!test_bit(GPIOD_FLAG_REQUESTED, &desc->flags))
		return NULL;

	guard(srcu)(&desc->gdev->desc_srcu);

	label =3D kstrdup(gpiod_get_label(desc), GFP_KERNEL);
	if (!label)
		return ERR_PTR(-ENOMEM);

Since gpiod_get_label(desc) is already NULL, kstrdup(NULL, GFP_KERNEL) retu=
rns
NULL and gpiochip_dup_line_label() returns ERR_PTR(-ENOMEM).

Then in include/linux/gpio/driver.h:for_each_hwgpio_in_range():

#define for_each_hwgpio_in_range(_chip, _i, _base, _size, _label)			\
	for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i);			\
	     _i < _size;								\
	     _i++, kfree(_label), _label =3D NULL)					\
		for_each_if(!IS_ERR(_label =3D gpiochip_dup_line_label(_chip, _base + _i)=
))

for_each_if(!IS_ERR(_label =3D ...)) skips the loop body and the loop incre=
ment
calls kfree(ERR_PTR(-ENOMEM)). In addition, gpiolib_dbg_show() can observe
GPIOD_FLAG_REQUESTED with a NULL label and print (null) while guard.gc->fre=
e()
sleeps.

Should desc_set_label(desc, NULL) instead remain after guard.gc->free() (or=
 run
after the if (guard.gc) block)?

> @@ -2685,7 +2690,6 @@ void gpiod_free_commit(struct gpio_desc *desc)
>  #ifdef CONFIG_OF_DYNAMIC
>  		WRITE_ONCE(desc->hog, NULL);
>  #endif
> -		desc_set_label(desc, NULL);
>  		WRITE_ONCE(desc->flags, flags);
>  #ifdef CONFIG_GPIO_CDEV
>  		WRITE_ONCE(desc->debounce_period_us, 0);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-gpiolib-ch=
ip-removal-v3-0-aambrozewicz@nvidia.com?part=3D2
