Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E35A48F827
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816497; cv=none; b=tBUaBPg7QAQNcBu7zweDIxQSTeMvmzNx40KD36JLZOBIzzQ0ilElXZku9c1o/JX8KPL8s1fwQ2Urb9PoUB0lWKpHmkM8j2w0aZ32E2Cq35aJ0J/tpPs6SYcwtjJJcjKhKocqs2Mr5XA+ImyMmFvXhuXDkzVnXxP0GksfP3ZU7Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816497; c=relaxed/simple;
	bh=4AN2vNqF0IOa54i8jQPH9ntPkhRDaWk6NYQNWT+8kk4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=GN1jClm19WVup62VhbO4XaMPM/4WPeyaOq1hbVBmL5mm0sdsXmJnAJeFMSbbSNdsbxnWWjr/fEvKu/ZXnRpMr2JB/OxpnhekBhQzKHdf7naHUmoXIMldZhMTinswfK0Cd5ZH+tOcASAL3BQyTYmyEBohck2GCF6YYGf8mC8gJAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLN0ZvBL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLN0ZvBL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8AA21F0089C;
	Mon, 12 Oct 2026 14:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791816495;
	bh=cARSwqn/qJJm/7Y99qZWN7JITyCtLuQQYNtxRxS+R44=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZLN0ZvBLIt8aopSD7G5dd2Mg1gLH+T9b0Ibe9uk7ztr20YdhM6Z0fRl2IWrD5falY
	 VAU3MeQEirpSHq5wzhXNt3oyWgCbyVSJG72PHH4Cg2S5zV1cN42jdf1aLryFv7Fcrv
	 73j447UQuaLp9DgFll2eh9F59B6A8Umxo8+Vy8R39LI6bex3QoP4kH7aLnKJ4sYA+Q
	 LfDAT58FjLBeTl8+qZz2JLSR5GJO8ZoA+LuK86mQrkmH+zWpNUaV6IIhse3iU8GqzH
	 SUtBc1Lo/5MqTLoONERib3Ti0ZyK9sthbT2aGo1qTD+NDjTz6WhUTNdMxUQ5jTJisU
	 arkGktJnF6Lsg==
Message-ID: <sashiko-outbox-168284@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] gpio: kunit: add a test case for platform lookup
 tables
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261012-gpio-kunit-plat-lookup-v2-4-553b0d6446b9@oss.qualcomm.com>
References: <20261012-gpio-kunit-plat-lookup-v2-0-553b0d6446b9@oss.qualcomm.com>
 <20261012-gpio-kunit-plat-lookup-v2-4-553b0d6446b9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 14:48:15 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] gpio: kunit: test failure due to missing wait_for_device_probe()
--

commit 743d1cf187f180e4ac825a86d7858ccb06076671
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: kunit: add a test case for platform lookup tables

Add a kunit test-case for retrieving GPIOs using platform lookup tables.

> diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
> index b662be88a0871..5d04b134d5774 100644
> --- a/drivers/gpio/gpiolib-kunit.c
> +++ b/drivers/gpio/gpiolib-kunit.c
[ ... ]
> @@ -828,11 +829,110 @@ static struct kunit_suite gpio_swnode_hog_test_sui=
te =3D {
[ ... ]
> +static void gpio_lookup_table_global(struct kunit *test)
> +{
> +	struct platform_device_info pdevinfo;
> +	struct platform_device *pdev;
> +	struct gpio_desc *desc;
> +	int ret;
> +
> +	ret =3D kunit_gpiod_add_lookup_table(test, &gpio_test_lookup_table_glob=
al);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	pdevinfo =3D (struct platform_device_info){
> +		.name =3D GPIO_TEST_PROVIDER,
> +		.id =3D PLATFORM_DEVID_NONE,
> +	};
> +
> +	pdev =3D kunit_platform_device_register_full(test, &pdevinfo);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
> +
> +	desc =3D gpiod_get_index(NULL, "foo", 0, GPIOD_OUT_HIGH);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, desc);

[Severity: Medium]
Will this test sporadically fail if the kernel is booted with system-wide
asynchronous probing enabled (e.g., driver_async_probe=3D*)?

The test queries the GPIO immediately after registering the provider device.
If the provider's probe function runs concurrently, gpiod_get_index() could
execute before the GPIO chip is registered and return -EPROBE_DEFER, failing
the assertion.

Is a call to wait_for_device_probe() or gpio_test_device_check_bound() need=
ed
here before calling gpiod_get_index() to ensure the probe completes?

> +
> +	gpiod_put(desc);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-gpio-kunit=
-plat-lookup-v2-0-553b0d6446b9@oss.qualcomm.com?part=3D4
