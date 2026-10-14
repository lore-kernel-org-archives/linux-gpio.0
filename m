Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A2B4AC161
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 08:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967527; cv=none; b=Tg558W1nG46V3ILm/YMdOZGGC9nzqSYMwey0US94rwcUj3iw7oVyDD+70O3Ny2PgIgdMxh2gue1W4U3jugXg6VH4xx/wCOHIuu4aSvqvxI1kTYlGhSojHj2A5GoqoXjRcOezY3+6ZZC8/zJvGHEDC+IHDYga+2Q792bsmZ+UPP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967527; c=relaxed/simple;
	bh=M3XrbzS52MAPzm9pEt+8BHV3SioCM+61I/a7UKE0+Ao=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3S+A7OSBssjpGs3LS9YXFpcJnzWvCm06Xz3QfXoFu+WJjXXp9qUEohtHGlZ7RnZ+Jq9+NPw9cVjaaeQKGG23qUcG1AJCrK6DquWyOheMO/aSlPfppJNHoTgqilMkRbC0K3D7igc0FEXGhd2QFqGXVeuuXFVbZ+fRVVUwvsGXlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b6nljVoq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b6nljVoq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDD81F00893
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 08:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791967525;
	bh=IHthPZKXlvkg1esCWSbqRA+eNslXiqM7gXODTvSRuUg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=b6nljVoqhRwiGJrYjOqj1c9Km1WpND08TFtOIB98cojqeBiw2NVHLpP1tyx7Afizb
	 bupFFTYxDhwdzxHqLy86wXUeQNzya47BUie3VQuHpd0P1BFCyuNRIWPEo6A6rSpI+n
	 u661dKMWMt5iCZFC0ucz4REK3gIKdiSOXS5ePcNGvdunQL2CbIHKJX9vFLN47hnfTE
	 i0yOUZmnkQ94wLNZ+3cHMthV0i8JyU+zwp/ZPPMy+dUidRwZMWfFou1HttY/HyaaNH
	 mnlgFTJZt9rqeCY8Q4ldCUj9Q+Prncseap8RqLdkzAmh1+futSjy94+hVDZhPOrqLz
	 ALHBrwoIVcHjQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso162952e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 01:45:25 -0700 (PDT)
X-Gm-Message-State: AFq9FYIybsw+fiREbfnw9nu5YLxPdFtY/NAZnPj0oYuV5xO1k0MDCS5o
	trv11D+4S/KNYb3g7ZhNQd7iejnqWk7IVYVM1k3+s8ytNXs/5JE/O/V/OhFekD89GSVtIQVvG5n
	/kRDmapYM+7+BHDGztcngC9ct8ZEqjsOfNGLI9IMltw==
X-Received: by 2002:a05:6512:15a6:b0:5b8:c04b:27ef with SMTP id
 2adb3069b0e04-5bcde35db28mr5213296e87.5.1791967524158; Wed, 14 Oct 2026
 01:45:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 01:45:22 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 01:45:22 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <sashiko-outbox-169786@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
 <20261013-gpio-kunit-plat-lookup-v3-1-3907f913e964@oss.qualcomm.com> <sashiko-outbox-169786@kernel.org>
Date: Wed, 14 Oct 2026 01:45:22 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md8n+=SNJHQ4dDO5y0XK8eD8Nyi9ypHN3Hc5AFrs4b0Tw@mail.gmail.com>
X-Gm-Features: AclHuK9nV1b6gYwmGxwS8RlsUlswNsr2mBomDNJvocRAAhNNeKfLIlHx9aPUgGE
Message-ID: <CAMRc=Md8n+=SNJHQ4dDO5y0XK8eD8Nyi9ypHN3Hc5AFrs4b0Tw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] gpio: kunit: fix the label of the dummy GPIO chip
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Oct 2026 15:14:30 +0200, sashiko-bot@kernel.org said:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] gpio: resource leak of gdev on KUnit test assertion failure
> --
>
> commit b7e40967a53cb1589f5bac90dea8c80d8d27bce0
> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
> gpio: kunit: fix the label of the dummy GPIO chip
>
> The label of the test GPIO provider is currently set to the consumer
> name. Use the provider name instead.
>
>> diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
>> --- a/drivers/gpio/gpiolib-kunit.c
>> +++ b/drivers/gpio/gpiolib-kunit.c
>
> [ ... ]
>
>> @@ -780,7 +779,7 @@ static void gpio_hog_assert(struct kunit *test, unsi=
gned int offset,
>>
>>  	/* The hog must have configured the line with the expected direction. =
*/
>>  	struct gpio_device *gdev __free(gpio_device_put) =3D
>> -		gpio_device_find_by_label(GPIO_CONSUMER_NAME);
>> +			gpio_device_find_by_label(GPIO_TEST_PROVIDER);
>>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gdev);
>>
>>  	desc =3D gpio_device_get_desc(gdev, offset);
>>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, desc);
>>
>>  	ret =3D gpiod_get_direction(desc);
>>  	KUNIT_ASSERT_EQ(test, ret, expected_direction);
>
> [Severity: Medium]
> Does this code leak the gdev reference when KUnit assertions fail?
>
> If KUNIT_ASSERT_NOT_ERR_OR_NULL(test, desc) or the subsequent KUNIT_ASSER=
T_EQ()
> fails in gpio_hog_assert(), KUnit aborts the test thread immediately usin=
g
> kthread_exit().
>
> Because kthread_exit() bypasses normal C scope exit, compiler-generated
> cleanup handlers like __free(gpio_device_put) are skipped, causing a refe=
rence
> count leak of the gpio_device.
>
> This leaked reference could prevent the dummy device from being properly =
freed,
> which might wedge subsequent test runs or module unloads.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-gpio-kun=
it-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com?part=3D1
>
>

Fixed in a follow-up commit:

    https://lore.kernel.org/20261014-gpio-kunit-autofree-leak-fix-v1-1-5bfa=
7be0eb1f@oss.qualcomm.com

Bart
