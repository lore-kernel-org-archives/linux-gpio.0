Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424876;
	b=NE33uBjejH1xe2dNGWGEulEYle5TH+GE9R1OfSjjvfZJ/l3IohaN4faZbERPZRJXfrUi
	 +5o+Cn9bvNZI+Z5cbyrX/l0xFSpGcxiiXFP+o6HXBrqlrllGx1ntVlxDfyQ/VghLDDvxZ
	 eE7xv6+6J3kooatCHnsHrz7epTgFLAhPfzR2V93skrqPf5/7v4RP60FQETRCWnG07fClW
	 ITG/pAqVspdHVhYBt9YCNcc6Oq0P+MElcScSuOlJzfgtN4J+/+n/Vcb8jWTAFkw5dOzhq
	 iVcqJRhurNR4TIbToIeS5wROKVHuKIFQgnxWv4Vio9NfOpMePj66fV0W/rG6jV45W9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424876;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZuGNlOne1v1TQIk8yIQdoRU/h7WQ4XqR0AiCiov0ZVU=;
	b=AcCrdlwnaR/exKyDGsIhKBupFvMpTh3495tnmbwZVCrBEoj5D9NMScQGn/PZeq0DwAvo
	 7rsiKHrC5qDA/J4wW6+y/ELYVmSxGpgk31U1qrFUog/Ge0WCqb6YgW2iPB+Yg1rjTv72d
	 cjSVJ+SSbmyzdxGKYPgt/04Ky6zRBt0nBdPUIfD2cVjFIKrxvQH/e9Qu+M9iJ9EWfXVrB
	 /myK+SK3xHIprI6m01aeaRfQ4c2soXvtys/idqMa//nKWXrw10gBB2KsydLIDBHbZsiq4
	 rFipWmy6koVcMWtiREk3yHNvBHmnOV6wL9eypii2Ft2HelPbGZUXP8pvUSw4iSNpAhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wbmlk18y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C290606AFB2;
	Mon, 19 Oct 2026 15:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wbmlk18y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6B81F000C8;
	Mon, 19 Oct 2026 15:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792424875;
	bh=ZuGNlOne1v1TQIk8yIQdoRU/h7WQ4XqR0AiCiov0ZVU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wbmlk18y6WRK3+5mpaQhm9+k4CVgo8fN57kBo5ubUY7abND30V8YnXC/DGHfvjx+i
	 auf8yiYJ3FFmM+dxWZHRdvVOr9YlmY1zvyBeqv5x+WOPfYxxd4GF3uQGu9jQMUrcLK
	 L7QTnngbEahitUfm1SBfvEs3zLBcD2CpcyabswsoKma49hdwm8t+F4FgOrjyU/biAP
	 MQ7vsOnScWvm/mysQ9bIxWjQfrrSW9z7ZwerZAdGvSr9eOB8qAukjtHGFMVea+qYmZ
	 62pjxs+ewx7EwERadGhB0rHP5ORTXereraBlVP22mFC1tiLlRMOH3+MLDHduxSpKQa
	 0mWFxhHf7SCNw==
Message-ID: <sashiko-outbox-177786@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] pinctrl: samsung: Add Exynos5515 pinctrl
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aiden Isik" <aidenisik@member.fsf.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019-for-next-lucky7-pinctrl-v1-3-0f77e94c70bc@member.fsf.org>
References: <20261019-for-next-lucky7-pinctrl-v1-0-0f77e94c70bc@member.fsf.org>
 <20261019-for-next-lucky7-pinctrl-v1-3-0f77e94c70bc@member.fsf.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 15:47:54 +0000
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
- [High] pinctrl: samsung: mismatched EINT config for Exynos5515 FSYS contr=
oller
- [High] pinctrl: samsung: invalid exynos_eint_gpio_init() on Exynos5515 AL=
IVE
--

commit 9b9aa666ae93755ccd47b8a80ec9f4fcc81c1eca
Author: Aiden Isik <aidenisik@member.fsf.org>

pinctrl: samsung: Add Exynos5515 pinctrl configuration

This commit adds the pinctrl configuration, pin bank definitions, and
compatible string match data for the Samsung Exynos5515 SoC.

> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pin=
ctrl/samsung/pinctrl-exynos-arm64.c
> index 1aa977d2a1f80..def84f7f029ea 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -488,6 +488,129 @@ const struct samsung_pinctrl_of_match_data exynos54=
33_of_data __initconst =3D {
>  	.num_ctrl	=3D ARRAY_SIZE(exynos5433_pin_ctrl),
>  };
> =20
> +/* pin banks of exynos5515 pin-controller 0 (ALIVE) */
> +static const struct samsung_pin_bank_data exynos5515_pin_banks0[] __init=
const =3D {
> +	GS101_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00, 0x00),
> +	GS101_PIN_BANK_EINTW(7, 0x020, "gpa1", 0x04, 0x08),
> +	EXYNOS850_PIN_BANK_EINTN(6, 0x040, "gpq0"),
> +	EXYNOS850_PIN_BANK_EINTN(6, 0x060, "etc0"),
> +};
> +

[ ... ]

> +/* pin banks of exynos5515 pin-controller 3 (FSYS) */
> +static const struct samsung_pin_bank_data exynos5515_pin_banks3[] __init=
const =3D {
> +	EXYNOS5515_PIN_BANK_EINTN(4, 0x000, "gpf0"),
> +	EXYNOS5515_PIN_BANK_EINTN(8, 0x020, "gpf1"),
> +	EXYNOS5515_PIN_BANK_EINTN(6, 0x040, "gpf2"),
> +};
> +

[ ... ]

> +static const struct samsung_pin_ctrl exynos5515_pin_ctrl[] __initconst =
=3D {
> +	{
> +		/* pin-controller instance 0 ALIVE data */
> +		.pin_banks	=3D exynos5515_pin_banks0,
> +		.nr_banks	=3D ARRAY_SIZE(exynos5515_pin_banks0),
> +		.eint_gpio_init	=3D exynos_eint_gpio_init,
> +		.eint_wkup_init	=3D exynos_eint_wkup_init,
> +		.suspend	=3D gs101_pinctrl_suspend,
> +		.resume		=3D gs101_pinctrl_resume,
> +	}, {

[Severity: High]
Should eint_gpio_init be set on the ALIVE controller entry in
exynos5515_pin_ctrl?

exynos5515_pin_banks0 only defines EINT_TYPE_WKUP banks (gpa0 and gpa1 via
GS101_PIN_BANK_EINTW) and EINT_TYPE_NONE banks (gpq0 and etc0 via
EXYNOS850_PIN_BANK_EINTN), with no EINT_TYPE_GPIO banks.

When samsung_pinctrl_probe() calls exynos_eint_gpio_init() for the ALIVE
controller:

drivers/pinctrl/samsung/pinctrl-exynos.c:exynos_eint_gpio_init() {
	if (!d->irq) {
		dev_err(dev, "irq number not available\n");
		return -EINVAL;
	}
}

Because ALIVE wakeup interrupts are described per-bank and handled by
exynos_eint_wkup_init() without a controller-level GPIO interrupt property,
won't d->irq be zero and cause probe of the ALIVE pin controller to fail
with -EINVAL?

[ ... ]

> +	}, {
> +		/* pin-controller instance 3 FSYS data */
> +		.pin_banks	=3D exynos5515_pin_banks3,
> +		.nr_banks	=3D ARRAY_SIZE(exynos5515_pin_banks3),
> +		.eint_gpio_init	=3D exynos_eint_gpio_init,
> +		.suspend	=3D gs101_pinctrl_suspend,
> +		.resume		=3D gs101_pinctrl_resume,
> +	}, {

[Severity: High]
Is the EINT configuration for the FSYS controller in exynos5515_pin_ctrl
and exynos5515_pin_banks3 mismatched?

All three banks in exynos5515_pin_banks3 (gpf0, gpf1, and gpf2) are defined
with EXYNOS5515_PIN_BANK_EINTN, which sets eint_type to EINT_TYPE_NONE,
whereas the FSYS entry in exynos5515_pin_ctrl sets eint_gpio_init, suspend,
and resume:

drivers/pinctrl/samsung/pinctrl-exynos.c:exynos_eint_gpio_init() {
	if (!d->irq) {
		dev_err(dev, "irq number not available\n");
		return -EINVAL;
	}

	ret =3D devm_request_irq(dev, d->irq, exynos_eint_gpio_irq,
					0, dev_name(dev), d);
	...
	bank =3D d->pin_banks;
	for (i =3D 0; i < d->nr_banks; ++i, ++bank) {
		if (bank->eint_type !=3D EINT_TYPE_GPIO)
			continue;

If the FSYS controller has no GPIO interrupt in Device Tree,
exynos_eint_gpio_init() will fail probe with -EINVAL when checking d->irq.
Conversely, if FSYS does provide an interrupt, exynos_eint_gpio_init() will
register exynos_eint_gpio_irq() and then skip all three banks because their
eint_type is EINT_TYPE_NONE, leaving bank->irq_domain NULL if an interrupt
fires (and gs101_pinctrl_suspend() / gs101_pinctrl_resume() will also skip
every bank).

Should gpf0, gpf1, and gpf2 be defined as EINTG banks, or should
eint_gpio_init, suspend, and resume be omitted from the FSYS entry in
exynos5515_pin_ctrl?

[ ... ]

> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-for-next-l=
ucky7-pinctrl-v1-0-0f77e94c70bc@member.fsf.org?part=3D3
