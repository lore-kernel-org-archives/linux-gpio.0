Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793746558;
	b=VcIm0SxdqMMZmx5xyt44QmIeLlm2f8/7gDkqVkZVn8PPrLoIw3VCnl69Z1bQt1lp/V3N
	 ucEzhi78p81D4aUQGvf6+ad5y4LFr4BQRfbbpEX1tujAON0zulTqb940eip5V9KMFHvUU
	 qMm0/yxQWo2vZh56+o0evbE2qj+ur0Wmsn0GY7HrBkgyxtSXIBDluENWUOSYWSgwGcevv
	 Us84JrorLZ131FGz+9Fo8U0vflzXlbMtqBRlJOP8QuEZ8NwIzK3FV00nc1vSx3LEeIhZU
	 V0x9UQYjaKkX7wRveregxPKwJvSjrXAw+YFPFATYqrL6nJ4tu3cFsqqqeW3le1vXpIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793746558;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ijb9pZ8oITGankx6oLCY9lMEfiQFfauTX/y5d1QEL/M=;
	b=vW6L0flgZYI8PLdO3Dqpt8j+i03FTb9Tr0FLbFbAOhpIVFGF6eBMT3UVCqudj+kkTTB4
	 wqaZlF8F66NYrXYyLQ0QWthTG3UxqfdTBJTwbeqH2zHh0t57eP6WStfLTAuGe0/mDv/qJ
	 hGvqHpLhKx9zGqtGeZx5+bbzfgSd9ayeApveB7LLeZ4WlAzU/Pf/p8P75B3CSjNLmRGLm
	 vwQMaRKjAc9p8rdqTj+Vh83LrUl7eRHdbwybhrnJBgljvKQb24jSdEkKd5NUkfyO94m0r
	 B8bDx0x1KG8E3xiMGQycPeiPsYMvchN1GQ9ck3xASOR2e9r7KiNNMtpcY+E/OFlulZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DOtrnOjp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA43606A324
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 22:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DOtrnOjp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39CAF1F00A15;
	Tue,  3 Nov 2026 22:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793746558;
	bh=ijb9pZ8oITGankx6oLCY9lMEfiQFfauTX/y5d1QEL/M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DOtrnOjpPT40VyawQSNa0a/pH6Kq6aVULzXRMok/ewEPVGtoHsszWFceF4uNlEYYn
	 WVV1rHOgbDzOhH+RMcCRxpdGxFXRtjzORA5FQ2e1gg1wf4uXcmN1fI5QRaEjsfbPQx
	 O02WDafaouQHELPWvYr5E10rKVNOqsVkE/0a5yICBcZZCs9vZlc38LgL0W1SA1Euyx
	 GmmQaN8vsHhHdsfVuoAGdq7OnVaxQvYFN+68U33Kc6eeAiXbLXswKtVu9k7PvTbcUs
	 PYcFZUMOWfVsPWDbqJu1TjK7nrmTdp73sOsp6Zst+iwPlgsG8cexRz3+qnzuN1scJp
	 vfJey+tM8A4sA==
Message-ID: <sashiko-outbox-196163@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpiolib: reset lookup flags for each hogged line
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261103224339.1180-1-kimjinseob88@gmail.com>
References: <20261103224339.1180-1-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 22:55:57 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] gpiolib: kunit: avoid duplicate hog test suite in gpiolib-kunit.c
- [Low] gpiolib: drop build/test log and tool commentary from commit message
--

commit 089aff495b510f5bab7031abfc65e971b196d1ef
Author: Jinseob Kim <kimjinseob88@gmail.com>

gpiolib: reset lookup flags for each hogged line

This commit resets the lookup flags variable inside the per-line loop in
gpiochip_add_hog() so that active-low flags do not carry over to subsequent
active-high lines in non-OF multi-line GPIO hogs, and adds a KUnit test case
for mixed-polarity software-node hogs.

>     gpiolib: reset lookup flags for each hogged line
>    =20
>     gpiochip_add_hog() initializes lflags once before iterating over the =
GPIO
>     specifiers. In the non-OF path, an active-low line sets GPIO_ACTIVE_L=
OW,
>     but a later active-high line does not clear it. A single firmware hog
>     with mixed polarities therefore configures later active-high lines as
>     active-low, including inverting their initial output value.
>    =20
>     Initialize the lookup flags for each line before translating its flag=
s.
>     The OF helper already overwrites the flags for each specifier; the
>     non-OF path must also start with a fresh value.
>    =20
>     Add a KUnit case using one software-node hog with four alternating li=
ne
>     polarities. Check both the descriptor polarity and raw output level f=
or
>     a logical high using the existing software GPIO provider. On UML, the
>     eight existing cases pass before the fix while the new case fails;
>     all nine cases pass after the fix with the same configuration.
>    =20
>     Clang W=3D1 and private Sparse C=3D2 builds of both changed files com=
plete
>     without diagnostics. No physical GPIO hardware was tested.
>    =20
>     Codex assisted with the source analysis, fix, regression test and com=
mit
>     message.
>    =20
>     Fixes: 802c51a83e9a ("gpiolib: fix hogs with multiple lines")
>     Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>

[Severity: Low]
This isn't a bug, but the commit message body includes before/after UML test
case counts, Clang W=3D1 and Sparse C=3D2 build check notes, a hardware tes=
ting
disclaimer, and a paragraph describing Codex assistance.

Since this meta-information is already provided below the tear line in the
patch notes, could these details be dropped from the permanent changelog so
the commit message stays focused on the bug, the fix, and the added test?

> diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
> index f005854e7ff7c..01205acf62651 100644
> --- a/drivers/gpio/gpiolib-kunit.c
> +++ b/drivers/gpio/gpiolib-kunit.c
> @@ -862,11 +862,99 @@ static struct kunit_suite gpio_swnode_hog_test_suit=
e =3D {
>  	.init =3D gpio_swnode_register_drivers,
>  };
> =20
> +/* A single non-OF hog may describe lines with different polarities. */
> +static const struct software_node gpio_mixed_hog_provider_swnode =3D {
> +	.name =3D "gpio-mixed-hog-provider",
> +};

[ ... ]

> +static int gpio_mixed_hog_suite_init(struct kunit_suite *suite)
> +{
> +	return software_node_register_node_group(gpio_mixed_hog_swnodes);
> +}
> +
> +static void gpio_mixed_hog_suite_exit(struct kunit_suite *suite)
> +{
> +	software_node_unregister_node_group(gpio_mixed_hog_swnodes);
> +}
> +
> +static struct kunit_case gpio_mixed_hog_tests[] =3D {
> +	KUNIT_CASE(gpio_hog_mixed_polarities),
> +	{ }
> +};
> +
> +static struct kunit_suite gpio_mixed_hog_test_suite =3D {
> +	.name =3D "gpio-mixed-hog-polarity",
> +	.test_cases =3D gpio_mixed_hog_tests,
> +	.suite_init =3D gpio_mixed_hog_suite_init,
> +	.suite_exit =3D gpio_mixed_hog_suite_exit,
> +	.init =3D gpio_swnode_register_drivers,
> +};

[Severity: Low]
This isn't a bug, but drivers/gpio/gpiolib-kunit.c already defines
gpio_swnode_hog_test_suite to group software-node GPIO hog test cases:

static int gpio_hog_suite_init(struct kunit_suite *suite)
{
	return software_node_register_node_group(gpio_hog_swnodes);
}

static void gpio_hog_suite_exit(struct kunit_suite *suite)
{
	software_node_unregister_node_group(gpio_hog_swnodes);
}

static struct kunit_case gpio_swnode_hog_tests[] =3D {
	KUNIT_CASE(gpio_hog_output_high),
	KUNIT_CASE(gpio_hog_output_low),
	KUNIT_CASE(gpio_hog_input),
	{ }
};

static struct kunit_suite gpio_swnode_hog_test_suite =3D {
	.name =3D "gpio-swnode-hog",
	.test_cases =3D gpio_swnode_hog_tests,
	.suite_init =3D gpio_hog_suite_init,
	.suite_exit =3D gpio_hog_suite_exit,
	.init =3D gpio_swnode_register_drivers,
};

Could gpio_mixed_hog_provider_swnode and gpio_mixed_hog_swnode be added to
gpio_hog_swnodes (or registered inside gpio_hog_mixed_polarities()), with
KUNIT_CASE(gpio_hog_mixed_polarities) added directly to
gpio_swnode_hog_tests[], instead of duplicating the suite definition and the
gpio_mixed_hog_suite_init() and gpio_mixed_hog_suite_exit() wrappers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103224339.1180=
-1-kimjinseob88@gmail.com?part=3D1
