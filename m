Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392AC4A4983
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 16:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822236; cv=none; b=cAdOqae1gLjrM07bIcg95N7e2khOU/PQgdCUYe4WYR7gdf5As5tnjwe2E4Z9Y6K0fx0rA1hDAmW+2tiPXwObQECug5k4cTQSud6Mym/MUGxbyKHz36hJ73AQ73UjSkD6n/KRttVPn+fGmbfvKvy6fY/YBO1qBAA7MUG+dL/Jv38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822236; c=relaxed/simple;
	bh=+K1XIz46GJ404dJ+A2h7se6kaFw8wz7isoVls2hjwTs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bem76tnN13aEJE9xiswXu46hxCYdcf6Lo6trkWeec+myzc17d5fBIAJsBAqOiRSEhjjADR2p3Rd8GvzHHboFziWRDLAFi7ACb6pUBiiSFHKe1WJ5OvJ+XuQry90qlFwMoA+UQH1Za06q0m1WEcmiqRcuotObExLk1Ur5Yu7/fJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0iI8pLB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0iI8pLB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98491F0089E
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 16:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791822234;
	bh=8mUsVhEO8X0riRfn9RAaQkAs5HEGM5yagnRl+IHqAg8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=i0iI8pLBMsgae6c6nDWDdYWHHJ0zXoTC3ScTVdgn1MlGOeB3NQL4GKdx7WYrHLH8R
	 zJhvrs3W68nmLkVATdvQvhiuRGmIb/SeNjTGBdx24nXoM0TDJAhSCiFqqcHMssBpi9
	 qu9h9yCusHEXfbA8PkLLMKNmWKKOm5VpW4euBJ3n3XxLvNn39Ot1KTrhhgNjLoXuoo
	 sxUhRSyslWnqp1BTANKGVv48UpjlFZHXRhuLyxA5KnjqDSEwbVP0h9rALPCiVcB8TJ
	 04zIKWEX0gTWA1xJtPZK81KvrT8sz2Chl1INUAtmUxYnr1mr6NLMFliB+Y/9mZr0OY
	 4QkREZdj7n9rw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bcd17f3a93so1723720e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 09:23:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzYc7VcZRl49DinUZzeuoM5Jd9bo7f15oq/bBcX/c9YRBIgcf7LHzRfuMdMqlpQjo5uiSB5kCXgaWcs@vger.kernel.org
X-Gm-Message-State: AFq9FYKCdMO77qULvfg12ob+RxKmrGL9LZYJDsCAfM7IU+TtAoMrqbj/
	JqrnhQyBT1cVlaxaUFqT9C28peGhwjoGAKlO/X6veQnt+Ju3JvFlqxHHg2dY8qrVNeOaEc9jrtO
	h9gwa1OZirD6djZX8/H/DzvraGH7GMwOP0/FPmoLKXQ==
X-Received: by 2002:a05:6512:3a95:b0:5b6:183b:d21c with SMTP id
 2adb3069b0e04-5bcde8d5c24mr3156378e87.67.1791822233454; Mon, 12 Oct 2026
 09:23:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Oct 2026 09:23:52 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Oct 2026 09:23:52 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <sashiko-outbox-168284@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-gpio-kunit-plat-lookup-v2-0-553b0d6446b9@oss.qualcomm.com>
 <20261012-gpio-kunit-plat-lookup-v2-4-553b0d6446b9@oss.qualcomm.com> <sashiko-outbox-168284@kernel.org>
Date: Mon, 12 Oct 2026 09:23:52 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md=TJ1A=uaFCqzFRM-Ph+G95a0vzL2bn-TOBks8r_LT+A@mail.gmail.com>
X-Gm-Features: AclHuK_Gr0IM3Bam-xX7rdAQVjbsQEE7izB36uR9CV2cGSfK-0Gl1et_FcffzbM
Message-ID: <CAMRc=Md=TJ1A=uaFCqzFRM-Ph+G95a0vzL2bn-TOBks8r_LT+A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] gpio: kunit: add a test case for platform lookup tables
To: sashiko-reviews@lists.linux.dev
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, sashiko-bot@kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Oct 2026 16:48:15 +0200, sashiko-bot@kernel.org said:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] gpio: kunit: test failure due to missing wait_for_device_probe()
> --
>
> commit 743d1cf187f180e4ac825a86d7858ccb06076671
> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
> gpio: kunit: add a test case for platform lookup tables
>
> Add a kunit test-case for retrieving GPIOs using platform lookup tables.
>
>> diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
>> index b662be88a0871..5d04b134d5774 100644
>> --- a/drivers/gpio/gpiolib-kunit.c
>> +++ b/drivers/gpio/gpiolib-kunit.c
> [ ... ]
>> @@ -828,11 +829,110 @@ static struct kunit_suite gpio_swnode_hog_test_suite = {
> [ ... ]
>> +static void gpio_lookup_table_global(struct kunit *test)
>> +{
>> +	struct platform_device_info pdevinfo;
>> +	struct platform_device *pdev;
>> +	struct gpio_desc *desc;
>> +	int ret;
>> +
>> +	ret = kunit_gpiod_add_lookup_table(test, &gpio_test_lookup_table_global);
>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>> +
>> +	pdevinfo = (struct platform_device_info){
>> +		.name = GPIO_TEST_PROVIDER,
>> +		.id = PLATFORM_DEVID_NONE,
>> +	};
>> +
>> +	pdev = kunit_platform_device_register_full(test, &pdevinfo);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
>> +
>> +	desc = gpiod_get_index(NULL, "foo", 0, GPIOD_OUT_HIGH);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, desc);
>
> [Severity: Medium]
> Will this test sporadically fail if the kernel is booted with system-wide
> asynchronous probing enabled (e.g., driver_async_probe=*)?
>
> The test queries the GPIO immediately after registering the provider device.
> If the provider's probe function runs concurrently, gpiod_get_index() could
> execute before the GPIO chip is registered and return -EPROBE_DEFER, failing
> the assertion.
>
> Is a call to wait_for_device_probe() or gpio_test_device_check_bound() needed
> here before calling gpiod_get_index() to ensure the probe completes?
>

Yes, it is.

Bart
