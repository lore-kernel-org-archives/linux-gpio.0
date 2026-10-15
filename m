Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E818832C942
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 04:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036898; cv=none; b=a5gyl2w0i+Em/aVtBhUnK48ML0Jiw6Q9oiPZfxvXvBdjo2zzb4NGpf0CmoIW6lmF4YwTtyPLesbIdjRSk9V0e9tOEX+jkcrcsFte729LcJF0vkqcf4nfBQbh6SZX2X7goPGvvWrCvSlRRS08sMgssRXohboLgdZ9WaGleX7GAuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036898; c=relaxed/simple;
	bh=kmAzxBdl5tRKdP24WzhVnkZN0ukb/LrCC8Ln1bGB8pQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Jk0zf9Xj9AlveoDIgOgHUILrkgowI1pxG7wpg+qAHw0fawHvuSgZWVQRXs8g++cSI6oDdCLfpCjRJvSnbvQ53wbFrO0Ltm4o1GCTVyo+aRFmI4JBIGDkijUFVRPCjW9TMRz5oy9r7TGSx2VG0MeFwShXkOknu1Lr/CHRaeyQm5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2fhkSon; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2fhkSon"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B211F000C4;
	Thu, 15 Oct 2026 04:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792036896;
	bh=YLSg7+T8rZycpumUVkSwypb/AFHQN0gWzE9kSPFE+A4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o2fhkSonJIdpmWZ+qsd0ohizGuZuPzdabpaKjWjnGMqwUwAotNEPD3+9r1oQ8oxeB
	 xvZIrlfTYhiMO5ZIj0xSzHGQaqFhblmEQDilDDCrj+uAv+dIuRy8hT1NHKu3EOfSid
	 WoIDb0j4Uht6rr6jWqMoeVAK3flpW+OJA1oXrJjghbJunFYCVfv4P9i2Dg3zuesNBW
	 Uow8Om/bag2/VKof40kjX6x1wRNZeKCGEiH91roL4/t4v6gz8Zq3fNDKF7hJo2GkQ8
	 Ee9FO7KfBP2osr67leFAal/R2TyEKnnGR8TAWmYKRSUmhzg42yAhmHM3nzKbxiTGPu
	 /9Igc0kwbqr1g==
Message-ID: <sashiko-outbox-172228@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] pinctrl: aspeed: Handle GPIOZ6 pass-through strap
 on GPIO requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasanth Kumar Padarthi" <prasanth.padarthi10@gmail.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
References: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 04:01:35 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] pinctrl: aspeed: clobbering shared SCU51C[9] strap bit breaks pass=
-through
- [High] pinctrl: aspeed: unconditionally rejecting GPIO requests based on =
SCU510[28]
- [Medium] pinctrl: aspeed: missing hardware mux rollback on error path
--

commit fc751bac2dfdee809f65ba4da118ede6fdbe6aaf
Author: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>

pinctrl: aspeed: Handle GPIOZ6 pass-through strap on GPIO requests

This commit introduces an AST2600-specific GPIO request callback to handle
the GPIOZ6 pass-through strap in SCU51C[9] for GPIOP0-P5. It clears this
shared strap bit to allow host power control on boards like the B650D4U,
while also explicitly rejecting requests when SCU510[28] is set.

> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl=
/aspeed/pinctrl-aspeed-g6.c
> index 85d6640ff4c4e..6e58feb48bf59 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c

[ ... ]

> @@ -2743,12 +2744,56 @@ static struct aspeed_pinctrl_data aspeed_g6_pinct=
rl_data =3D {
> +static int aspeed_g6_gpio_request_enable(struct pinctrl_dev *pctldev,
> +					 struct pinctrl_gpio_range *range,
> +					 unsigned int offset)
> +{
> +	struct aspeed_pinctrl_data *pdata =3D pinctrl_dev_get_drvdata(pctldev);
> +	struct regmap *scu =3D pdata->pinmux.maps[ASPEED_IP_SCU];
> +	unsigned int strap2, strap3;
> +	int ret;
> +
> +	if (offset < AB22 || offset > AB23)
> +		return aspeed_gpio_request_enable(pctldev, range, offset);
> +
> +	ret =3D regmap_read(scu, SCU510, &strap2);
> +	if (ret)
> +		return ret;
> +	if (strap2 & BIT(28))
> +		return -EOPNOTSUPP;

[Severity: High]
Does this unconditionally reject standard GPIO requests based on an unhandl=
ed
strap condition?=20

Systems where the SCU510[28] strap is set will no longer be able to request
GPIOP0-P5 as standard GPIOs. Any standard GPIO consumer on such hardware wi=
ll
fail, breaking backwards compatibility.

> +
> +	ret =3D aspeed_gpio_request_enable(pctldev, range, offset);
> +	if (ret)
> +		return ret;
> +
> +	/* In dedicated-strap mode, SCU51C[9] does not enable pass-through. */
> +	if (strap2 & BIT(30))
> +		return 0;
> +
> +	ret =3D regmap_update_bits(scu, SCU51C, BIT(9), 0);

[Severity: High]
Does this clear a shared hardware enable bit for all three pairs without
refcounting?=20

The SCU51C[9] bit globally controls the pass-through feature for three
distinct pin pairs (GPIOP0/P1, GPIOP2/P3, and GPIOP4/P5). Modifying it
unconditionally for a single pin request might destructively clobber
concurrent pass-through usage for the other unconnected pins.

> +	if (ret)
> +		return ret;

[Severity: Medium]
If regmap_update_bits() fails here, does this return an error without
unwinding the active pinmux modification made earlier by
aspeed_gpio_request_enable()?

This could leave the pin's hardware multiplexer configured for GPIO, while
the pinctrl subsystem considers the request failed and the pin unreserved,
creating a state mismatch between hardware and software.

> +	ret =3D regmap_read(scu, SCU51C, &strap3);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Similarly, if this regmap_read() fails, does this also leak the hardware mux
state?

> +	if (strap3 & BIT(9))
> +		return -EPERM;

[Severity: Medium]
Could this error path also miss unwinding the hardware mux state from
aspeed_gpio_request_enable()?

> +
> +	return 0;
> +}
> +
>  static const struct pinmux_ops aspeed_g6_pinmux_ops =3D {
>  	.get_functions_count =3D aspeed_pinmux_get_fn_count,
>  	.get_function_name =3D aspeed_pinmux_get_fn_name,
>  	.get_function_groups =3D aspeed_pinmux_get_fn_groups,
>  	.set_mux =3D aspeed_pinmux_set_mux,
> -	.gpio_request_enable =3D aspeed_gpio_request_enable,
> +	.gpio_request_enable =3D aspeed_g6_gpio_request_enable,

[Severity: High]
Since this structure lacks a .gpio_disable_free callback, is there any
mechanism to ensure the shared strap modification is reversed upon release?

Without it, the SCU51C[9] bit is never restored when the GPIO is freed,
which could cause a permanent system-wide functional loss for pass-through
features until a reboot.

>  	.strict =3D true,
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015035118.9495=
-1-prasanth.padarthi10@gmail.com?part=3D1
