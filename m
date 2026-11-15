Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794740232;
	b=utFYvO5mLFsTZKWvOzG/NmtKKGfv14u388iOqrD3PT88oEcSFNGWIHLyO/3kC7n3hzKP
	 Ct1obqr177HmwHzoDOOpUKtp05fKfvASU4akhPDnK1wTo/d2pcwUZdr2CYlFmoUOmCPHb
	 qKB3eUPM8nRIOqQr4ZMlPhFwR4Z6iIFTvkpkKulced7yPN9G+TG0y/NIHwjCcCMnpoGkB
	 IvBKL82cD5w4YoQJx72TGhkWfhr7XmLhDBwQe8ixrBdCIoaWb827QuzY8ylvKavl36Twb
	 FhLtcndA5axkCUXlvLGG0d/oqk7MNiAxiZQYXkN4fpmP6VM1ezJs047q91kJgcYouAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740232;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CDqjDJWGyt4y6O1fq3kiTeH8lDZo2VEHM05aDM9jBnQ=;
	b=xfX0Df7KYXn6u21kpWoXuDsWfUFEiAG3mpdih/tsRPBS5279U7IF7zeYdnhkyOeZvN4b
	 Ct79MtqtNwcvmw07Z7LbNB7nTWKfl8u9DhWAOait7xg4WOYNLY0KB5qDlyB27fACSmHBw
	 ZTjSy8TzfvPh0TfeN0s7peTgG+SF5TiBlxOlcKVQJTRkXJf31h48maFHH6bU9Oc4Ek+1q
	 MjpXc8bYLu93yelc83OSTgn3SvJ60v1k2xTpM9SrIQQqkZLJPxGIGw2oAbCJ+VDtO768v
	 PR64q/7/UOpD5sfSFXtylCXw2fjulugwGUcJHetn9fd/MkSe807dePyUC9SnZwCe1xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=awyNpPi3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2301606A31E;
	Sun, 15 Nov 2026 10:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=awyNpPi3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185121F000C4;
	Sun, 15 Nov 2026 10:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794740232;
	bh=CDqjDJWGyt4y6O1fq3kiTeH8lDZo2VEHM05aDM9jBnQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=awyNpPi3gp0+khBqG0mh6+XUN3FOF9g/NWYy74zWF6gPrISL0/LTl0YcV6taz5q12
	 /JkrgWhYp7YFrsJC+zw8qmCOADgsk/KEnTB/DfdN72BtjDlJ17kUcxhZlsTJoxJMmS
	 gJ531CYTl34xTY5U4jVQk8HejdnspH49lZPxVPuJLxndv+v4e/7k6mSQ/LbRrMyghX
	 QD6MX09Bfk5mzLFtNwNxdkCMx5uGnpPVbFU5Vze3x9VumrDq71vnPRitEDjPHSUokw
	 4fzkmgOmB667COxKA75xtiHr5DoeHTq/q5zS8JvQsKxFLLB0DSirgUzsf6a908osi6
	 se/DfUdq9Baag==
Message-ID: <sashiko-outbox-215429@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/13] pinctrl: berlin: add Synaptics SL2610 pin
 controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115102401.3520-9-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-9-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:57:11 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] pinctrl: berlin: wrong pad config offset 0x87c for GPIO54 on
  SL2610
--

commit b2ae5372019c8928361d53ac7a361789c010c9c3
Author: Jisheng Zhang <jszhang@kernel.org>

pinctrl: berlin: add Synaptics SL2610 pin controller support

This commit adds the pin controller driver for Synaptics SL2610 SoCs,
defining the SoC and MCU pin groups, mux functions, and pad configuration
register offsets.

> diff --git a/drivers/pinctrl/berlin/pinctrl-sl2610.c b/drivers/pinctrl/be=
rlin/pinctrl-sl2610.c
> new file mode 100644
> index 0000000000000..0a3dc146c2c01
> --- /dev/null
> +++ b/drivers/pinctrl/berlin/pinctrl-sl2610.c
> @@ -0,0 +1,759 @@

[ ... ]

> +static const struct berlin_desc_group sl2610_soc_pinctrl_groups[] =3D {

[ ... ]

> +	BERLIN_PINCTRLCONF_GROUP("GPIO53", 0x800c, 0x3, 0x00,
> +			0x8878, 10,
> +			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO53 */
> +			BERLIN_PINCTRL_FUNCTION(0x1, "rgmii2"), /* RD1 */
> +			BERLIN_PINCTRL_FUNCTION(0x6, "spi4"), /* SS3n */
> +			BERLIN_PINCTRL_FUNCTION(0x7, "spi3")), /* SCLK */
> +	BERLIN_PINCTRLCONF_GROUP("GPIO54", 0x800c, 0x3, 0x03,
> +			0x87c, 10,
> +			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO54 */
> +			BERLIN_PINCTRL_FUNCTION(0x1, "rgmii2"), /* RD2 */
> +			BERLIN_PINCTRL_FUNCTION(0x7, "spi3")), /* SDI */
> +	BERLIN_PINCTRLCONF_GROUP("GPIO55", 0x800c, 0x3, 0x06,
> +			0x8880, 10,
> +			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO55 */
> +			BERLIN_PINCTRL_FUNCTION(0x1, "rgmii2"), /* RD3 */
> +			BERLIN_PINCTRL_FUNCTION(0x5, "spi5"), /* SDI */
> +			BERLIN_PINCTRL_FUNCTION(0x7, "spi4")), /* SS1n */

[Severity: Medium]
Should the pad configuration offset for GPIO54 be 0x887c instead of 0x87c?
All other entries in sl2610_soc_pinctrl_groups place conf_offset at 4-byte
intervals in the 0x8800..0x88ec range, so configuring pad parameters for
GPIO54 will read and modify offset 0x87c in the parent syscon regmap while
leaving GPIO54's pad unconfigured.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115102401.3520=
-1-jszhang@kernel.org?part=3D8
