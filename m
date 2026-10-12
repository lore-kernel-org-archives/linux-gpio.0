Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2E71AA797
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 02:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791770476; cv=none; b=iOBP/uZrx68Y1BFt4/VBe5R154fltpPZJ+p3WJdQ7g6gTKHL5Sq8PfveBFixfgkaarsWlR9bUgkLU3lYP2g8kvBEwP12joIIb6P7T/mEJyt5Tk2ZMl/AlqduNR358tJAH7TuNM5XpnkQXZPIjujqioJAPIVLeDJoHPG6siG6s5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791770476; c=relaxed/simple;
	bh=MeQFg+4xslxnm6p353c5Zw840CHD6MLxPhPiYW0dRII=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ZiiMqQpelYzASl4epRSeFF2pYMFNaN1r/s9xAK5xZC3Lh/F6eGaaOf8H7Whdw+DketRFEbCjvkIP1Kr//XHakjFwvY3cbJrDocIUkYJvLer3/FO8Qe8ygWKZjZ+6cCAorrNUk3vHlryBh6P0Luy1N56vysPOJ9AD6UyLPu26ZO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDpoX+oI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDpoX+oI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB571F0089B;
	Mon, 12 Oct 2026 02:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791770475;
	bh=5QQW12FNC8sZFWJiowm4ya897x1Hmu52ftQvmhHvCeY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lDpoX+oIDUS2bZGvLh5BQ6G0ZmeN/Dsw8K6Q2x9VCZFy435Dhbq+e+nYRhtMhdEDG
	 kJj7/tkLsStsHvMA1A0fq4/FlbFfhPLQu85H38PNplwLN2lni5MrKiM2fr8FaQhKJ1
	 JBkrLft7liEoPNxw0ltnCrgcYYw02SeIJsi95KPP7H7L1PveVZz44jADnCdmcHwNPk
	 NxZRmAT3erawHLHatEgE1eLuerXgIusvtTEbdI8utJ0vXyw8H7/CKbmXaePmfgdrEh
	 gUeXeY+NWlbwfC6NNezkFLBeYD1HLNLaLHEm03/XUMs/SNU8yVVcDy0KCi7opTbgrG
	 uWIjadDOmUV+g==
Message-ID: <sashiko-outbox-167547@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] pinctrl: mcp23s08: Propagate reset GPIO errors
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261012015433.6155-1-phucduc.bui@gmail.com>
References: <20261012015433.6155-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 02:01:14 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pinctrl: mcp23s08: multi-device probe failure due to duplicate res=
et GPIO request
--

commit 95196894afec909a218e9bd99fc8884c93869fc7
Author: bui duc phuc <phucduc.bui@gmail.com>

pinctrl: mcp23s08: Propagate reset GPIO errors

This commit adds a check for the return value of devm_gpiod_get_optional() =
in
mcp23s08_probe_one() to propagate errors instead of ignoring them.

> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl=
-mcp23s08.c
> index cc668f84bf8bc..259ac02134c64 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -613,6 +613,9 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct d=
evice *dev,
>  	mcp->chip.owner =3D THIS_MODULE;
> =20
>  	mcp->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW=
);
> +	if (IS_ERR(mcp->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(mcp->reset_gpio),
> +				     "failed to get reset GPIO\n");

[Severity: High]
Does this cause a regression for multi-chip SPI configurations by aborting =
the
probe due to -EBUSY?

In the SPI driver, multiple physical chips can share a single SPI chip sele=
ct.
This is handled in drivers/pinctrl/pinctrl-mcp23s08_spi.c:mcp23s08_probe() =
by
iterating over spi_present_mask and calling mcp23s08_probe_one() for each:

drivers/pinctrl/pinctrl-mcp23s08_spi.c:mcp23s08_probe() {
	...
	for_each_set_bit(addr, &spi_present_mask, MCP_MAX_DEV_PER_CS) {
		...
		ret =3D mcp23s08_probe_one(data->mcp[addr], dev, MCP23S08_SPI_BASE | (add=
r << 1),
					 info->type, -1);
		if (ret < 0)
			return ret;
	}
	...
}

Because all logical chips share the same SPI device, the same struct device
*dev pointer is passed to every mcp23s08_probe_one() call.

During the first iteration, the reset GPIO is successfully requested
exclusively.

During the second iteration, devm_gpiod_get_optional() is called again on t=
he
same dev pointer for the same "reset" connection ID. The GPIO core will
attempt to request the same descriptor again, which will return -EBUSY beca=
use
it is already requested and does not use GPIOD_FLAGS_BIT_NONEXCLUSIVE.

Prior to this patch, the -EBUSY error was ignored, allowing the second and
subsequent chips to probe successfully (which was safe since the reset line
was already asserted and deasserted by the first chip).

> =20
>  	/* verify MCP_IOCON.SEQOP =3D 0, so sequential reads work,
>  	 * and MCP_IOCON.HAEN =3D 1, so we work with all chips.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012015433.6155=
-1-phucduc.bui@gmail.com?part=3D1
