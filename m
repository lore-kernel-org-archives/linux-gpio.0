Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAE64C650B;
	Fri,  9 Oct 2026 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545244; cv=none; b=WNN7ttfW9AimLpmxsCaQgs0dK+OUnXb3rpZRAmqfbIHbIhMhDxDBsT1RQXH+bsPRjbiKsFM7JPfS5ShrhJx1s9Geh7mE5yhjLIqY9/aKfbCUmZWZSPaz26qfiXSz5dHUn1/i/WjENDHoymAIhJNierTqqXHdVLOfEsuwXzCBEI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545244; c=relaxed/simple;
	bh=l0vYMRi4bMydeWty5yPKwaYLMOBhsEAlhAmPQZbX43Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=UnFepvOXp4PD6jFxm6tYmTf8Zoe+XVkSgu/Xl+LvIh4nn6ZOhbIAP64qF9Q1y7HcfNWDc+pf16SLoOLXqmSYEGwYbcFMWn3wHTLJIWqRhY+h9iZwd7u6f91vfER6Jt68x2DnECxrYeY/FeHFdJzJaGyLpY6YIw2F2Fzil8Yn9wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cr9/6Y3k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cr9/6Y3k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C530E1F000FF;
	Fri,  9 Oct 2026 11:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791545236;
	bh=OVtPrF3V5ziQrs/6S9GBcEMyEm0qlKiaDAVZsKdUW9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cr9/6Y3kLk+FqMB6Ek42ByYsZ9uHu4x+IrDKWLLg36UMU6v1k2y861AI53XsnF7yY
	 L3ZSePie/qYW+Qp6lhbyDiFE8MYAe2WIGkysYQ3oM2vxPPLuNr+g434kCwqDbrJAP2
	 BFCJsxjMXJWzZAMyszpcTnvtmL1Bo2rtMfwrpalZsd6pmvXCU9nyn69cPeOTe+01vN
	 +o+7wZilZbTfPcb7MhGkc/eTiEy4Skh00h/HHYmBsXJ1bllQFQoD0nUQ7qdjtEz9Wp
	 Xan/FKTHMgqGmOnSF9USENdfnGAbAnLfO6pZUiWsRoB1LM8LMV46Nxg/Sp2aQAH90J
	 CvVFaRz1zgTYA==
Message-ID: <sashiko-outbox-165371@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] gpiolib: regmap: add
 GPIO_REGMAP_QUIRK_SET_AFTER_DIR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20261009-cv75-gpio-v1-2-5836bd438423@ambarella.com>
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
 <20261009-cv75-gpio-v1-2-5836bd438423@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 11:27:15 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] gpio: regmap: missing return value check for gpio_regmap_set in =
direction_output
--

commit 4dfbff55c3fbea74424f90710c5b76efb22f738e
Author: Long Zhao <longzhao@ambarella.com>

gpiolib: regmap: add GPIO_REGMAP_QUIRK_SET_AFTER_DIR

Some controllers ignore output writes while a line is still an input.
Add a behaviour flag so the output value is written after the direction
change. This is a legacy quirk. New hardware must not use it.

> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 51b4d69b87403..0a44deae3d01e 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c

[ ... ]

> @@ -271,9 +272,17 @@ static int gpio_regmap_direction_output(struct gpio_=
chip *chip,
>  			return ret;
>  	}
> =20
> -	gpio_regmap_set(chip, offset, value);
> +	if (!(gpio->quirks & GPIO_REGMAP_QUIRK_SET_AFTER_DIR))
> +		gpio_regmap_set(chip, offset, value);
> =20
> -	return gpio_regmap_set_direction(chip, offset, true);
> +	ret =3D gpio_regmap_set_direction(chip, offset, true);
> +	if (ret)
> +		return ret;
> +
> +	if (gpio->quirks & GPIO_REGMAP_QUIRK_SET_AFTER_DIR)
> +		gpio_regmap_set(chip, offset, value);
> +
> +	return 0;
>  }

[Severity: Medium]
Does this code silently ignore hardware or bus errors?

If gpio_regmap_set() fails due to an underlying I2C/SPI bus timeout or NACK,
it returns a negative error code. However, the return value is dropped in t=
he
newly added GPIO_REGMAP_QUIRK_SET_AFTER_DIR path, just as it is in the
pre-existing path.

Could this falsely signal to the gpiolib framework that the output pin was
successfully configured, leaving the hardware in an undefined state and
masking the error from consumers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-cv75-gpio-=
v1-0-5836bd438423@ambarella.com?part=3D2
