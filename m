Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5387925B0A5;
	Thu, 15 Oct 2026 14:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074650; cv=none; b=cbJPWylR/YQ5K5ASa2lRlkszFaoOblb91o+3BEd7VpzupahWhMVkhiggpFEyO2BmIWMWV0JsXabcqSQ5st1vhi6SbXE4sPN7Ka8mH5vHODAbyhOavBOXIer49g+dArt98Iy5wxKPD+N5kEZk5OJouuJUHEekI0yi+k2D/GFqNg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074650; c=relaxed/simple;
	bh=nqwXOXkoTIPdskFKsbI+2JinSmffZ9RuDp392D9CL5Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=eJam3/s/j+usQ4btYDNe5qjxALYfDQ+JE7li2t+nzi2ZPYOHBBtZeUr3Gg9H81W3FR2C2uDLO02vibw5shQNTmQJW73+buxgtI3WCHoRq9ODcBixPeYrXMXyu706OpRRhRm2lt8CGVODnxTPcVGwQ1qhLRjvWAZLlg8NSuw1/lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NiZAjr0C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NiZAjr0C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C29B1F000C5;
	Thu, 15 Oct 2026 14:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792074645;
	bh=l7i7lextzW+v2QgWOjzXjf+MTqmbolNbnid85+i8qEg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NiZAjr0CDx34uiqpFTqSCv9Gx4jfxw7iTu4CnJJqKFuPp0YnkJcK31+qclJ4VOuqM
	 7z5OFXEZ4gueMJ6z/iVBK6YTkdDhAc6oRIwOVyJRe1dFg4Fd1ttR4S2poFbqnXVnje
	 Gw3kx1QcMUazuoOCM8LHRf1fLGG6G2zNvSoLv0S7NF2q3oD4MlcT2lUWh8jXbJi8iI
	 f1eX3qprqLPeLn5VP5eLUv0/R4Fct99I37vY2dyLBBKzjcJCgQfMmz9OGodHi6tHzh
	 mUA/RrzA0Lb2vnLi7pBrOrXTdHUJ9vS39Bg8oSXl3i0G+twMyrQFPmwMREWc8xxRaC
	 sbInqjp7ZfdSg==
Message-ID: <sashiko-outbox-172961@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: Allow arming the wakeup_enable
 bit from pin config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-tlmm_wakeup_gpio_support-v1-2-c6d6f37a7e51@oss.qualcomm.com>
References: <20261015-tlmm_wakeup_gpio_support-v1-0-c6d6f37a7e51@oss.qualcomm.com>
 <20261015-tlmm_wakeup_gpio_support-v1-2-c6d6f37a7e51@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 14:30:44 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] pinctrl: qcom: missing hardware capability check in wakeup-enable g=
et()
--

commit b3082e25a0d303b051061eac8a2191e7673c4106
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

pinctrl: qcom: Allow arming the wakeup_enable bit from pin config

This commit adds a "wakeup-enable" pin configuration parameter to arm the
wakeup_enable bit without taking over the pin mux. It folds open-coded
accesses into a helper shared between GPIO IRQ requests and pin config. Pins
not described as wakeup-capable by the SoC are rejected.

> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pi=
nctrl-msm.c
> index 27f06bbc113c9..cb12f8b906007 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
[ ... ]
> @@ -354,6 +402,16 @@ static int msm_config_group_get(struct pinctrl_dev *=
pctldev,
> =20
>  	g =3D &pctrl->soc->groups[group];
> =20
> +	if (param =3D=3D MSM_PINCONF_WAKEUP_ENABLE) {
> +		if (!g->intr_wakeup_present_bit)
> +			return -EOPNOTSUPP;
> +
> +		arg =3D msm_readl_intr_cfg(pctrl, g) & BIT(g->intr_wakeup_enable_bit);
> +		*config =3D pinconf_to_config_packed(param, !!arg);

[Severity: Low]
Does this code miss a hardware capability check before returning the
configuration?

In the setter msm_pin_set_wakeup_enable(), the code correctly verifies that
the specific pin has the capability by checking the dynamic hardware presen=
ce
bit:

    intr_cfg =3D msm_readl_intr_cfg(pctrl, g);
    if (intr_cfg & BIT(g->intr_wakeup_present_bit)) {

However, this getter msm_config_group_get() only checks the static bit offs=
et
g->intr_wakeup_present_bit from the SoC struct and fails to read the regist=
er
to check the actual dynamic hardware capability.

Can querying wakeup-enable on a pin that is dynamically not wakeup-capable
succeed and return unverified, meaningless register state from the enable_b=
it
offset, exposing inconsistent capabilities to userspace?

> +
> +		return 0;
> +	}
> +
>  	ret =3D msm_config_reg(pctrl, g, param, &mask, &bit);
>  	if (ret < 0)
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-tlmm_wakeu=
p_gpio_support-v1-0-c6d6f37a7e51@oss.qualcomm.com?part=3D2
