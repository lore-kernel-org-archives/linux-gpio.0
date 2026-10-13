Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BAE503BD4
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897272; cv=none; b=pH1ODEKK7YU+aDpgv4f8OD4DARmXxwlL2o1dj27rbncSeZ5jVuvkToT/IjKMynpFhHcZQ4Rwq55c6J+0NKzMjYnGVi/jRWRZsGTq6du7vLUFm2lKxQqLDfIWqQNmMxKR9tgFDu2lhY4DA3NMLdZVeR3vF3BItAZV1m8gDNavYSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897272; c=relaxed/simple;
	bh=0ohOqvgCKD0QH86zJhtHkQbEVmgIzjPJ4YzsGaOvLTA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=GF9oLG7pc5sGChHifpJ3+hLQcJaYZB/OF3rCrzdkgcO8eKd77bRafissvXiv1E7ajzLXlGAPn+IJYuOYo7DPv9hLgpJzP/7dtfaXtK+suwakacUerpT8jQxQbX2uKzH+qsvGx4+pVyFkbdWo2KiU9YvxylorNMgSxybo3PccysY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WRvDGeWG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WRvDGeWG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF951F00893;
	Tue, 13 Oct 2026 13:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897270;
	bh=B7u6Xf6N8+sxrS3N09WAO4STSxLe5TleH8OmY3IMUUs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WRvDGeWGgPyiaAEJVLGIAYdCD9i9AG72lAMMb0fPwzsp6ooKPFe1JCC7dgz64V3Ow
	 d4fD9tUDt8OfiNeSZbEgCAn1eYX3bVHI3ll1PseRioZlIsPlVuX7qgjYQ+0vwnq1An
	 tLiylWbm8ehYKuxLa04bCh9RrenGsfkXFd12YmpxSqHrkNtO1/SaNav18Hqs1hgj7N
	 8FrBKvLGXLyy/J66g/E68osys7SYc2KoA13N0i5ejpHwgd3ob/N0aCqVKWFjv1G5qx
	 VJCfhmB0BqJWb/n2yG8qgUetrv3AxCdiiRkEmO/cDlVrzWVs3SpOsXBWBM8jJhFgBr
	 bfM/EB6jnnjow==
Message-ID: <sashiko-outbox-169786@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] gpio: kunit: fix the label of the dummy GPIO
 chip
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261013-gpio-kunit-plat-lookup-v3-1-3907f913e964@oss.qualcomm.com>
References: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
 <20261013-gpio-kunit-plat-lookup-v3-1-3907f913e964@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 13:14:30 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] gpio: resource leak of gdev on KUnit test assertion failure
--

commit b7e40967a53cb1589f5bac90dea8c80d8d27bce0
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: kunit: fix the label of the dummy GPIO chip

The label of the test GPIO provider is currently set to the consumer
name. Use the provider name instead.

> diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
> --- a/drivers/gpio/gpiolib-kunit.c
> +++ b/drivers/gpio/gpiolib-kunit.c

[ ... ]

> @@ -780,7 +779,7 @@ static void gpio_hog_assert(struct kunit *test, unsig=
ned int offset,
> =20
>  	/* The hog must have configured the line with the expected direction. */
>  	struct gpio_device *gdev __free(gpio_device_put) =3D
> -		gpio_device_find_by_label(GPIO_CONSUMER_NAME);
> +			gpio_device_find_by_label(GPIO_TEST_PROVIDER);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gdev);
> =20
>  	desc =3D gpio_device_get_desc(gdev, offset);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, desc);
> =20
>  	ret =3D gpiod_get_direction(desc);
>  	KUNIT_ASSERT_EQ(test, ret, expected_direction);

[Severity: Medium]
Does this code leak the gdev reference when KUnit assertions fail?

If KUNIT_ASSERT_NOT_ERR_OR_NULL(test, desc) or the subsequent KUNIT_ASSERT_=
EQ()
fails in gpio_hog_assert(), KUnit aborts the test thread immediately using
kthread_exit().

Because kthread_exit() bypasses normal C scope exit, compiler-generated
cleanup handlers like __free(gpio_device_put) are skipped, causing a refere=
nce
count leak of the gpio_device.

This leaked reference could prevent the dummy device from being properly fr=
eed,
which might wedge subsequent test runs or module unloads.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-gpio-kunit=
-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com?part=3D1
