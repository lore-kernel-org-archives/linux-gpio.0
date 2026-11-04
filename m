Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793783562;
	b=xmu2okI5/6/AvdckRX4cvx0aaT+BJEKBNaOY6O3tZDZRsfwHwIktlmrvELQLVnhAwnHt
	 F/FyEyjPk7PkZFKe57nRedvuRGSTOEg11ChBHdehxRJMhtbH+Ev8y3zb/yISP8q4zl9kr
	 jSlSuyucSJbYfXUCAAlfW7mM1rMQ1zrZyWN0Nmjl56Na1gelK8gC+tRXv3xKJc1qaW66/
	 VO/XzPZGkOZYnyuaSPzfUeLr9/Jp2WasorkEINFiAIcorsW0NbbB6W0gMxt4xf8WzzVpo
	 GCqg3UbNe5No+Yjo1wx1bkj9ZVPPpPZQzZKcT0fEST4bhOFxQPxwZhrn8+6BPQbGFRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783562;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=2R1gNZLN1hJ4LSn6OOKlccVNHzTPuKUuY49NdzVSUgY=;
	b=LN539rq59kYfHYD7b8oUwOv9TPTlxR/w3veIxNHwTulXLInaDHa3+f6j8lGxRmnUp+TH
	 SIOeuYJOpsgK60dZn9jVKfr0UXcSKr3p8V6Nt+CMiCp0skC0DT3Nnzj+3SW4h4k9CGaIg
	 a3LqBK7JBH6k0O9HIIxx29DLRGuMNTGXLhidgxzVbZ6MVEgJ7HnBfauSWKQGx8/UHSWoh
	 PharpH/Wc3YwPhLqj2Ia/TqYemv0hUC/kTBrYAGNrn90tR1xSuCmUWqXMXjtIS47nwHVj
	 FKq5Oecm0rjeFZtUxvBNLfKNwytUS8GBscBZXIJhPwNlQ8JwNjT2PCmwz+j04fMy8VQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=PygTu6EZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC3F606A31B;
	Wed,  4 Nov 2026 09:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAC3F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=PygTu6EZ
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 934FE2008BB;
	Wed, 04 Nov 2026 10:12:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793783557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2R1gNZLN1hJ4LSn6OOKlccVNHzTPuKUuY49NdzVSUgY=;
	b=PygTu6EZx3iFJx/QNNaYQBb9JJn/lBHo15FEALOZTOoXoTURpjF9mElqTSdr53bRuHwSd8
	NZUe/Oye8Y7oBr+p8+tTyLzE3aSKuaRNH5z3sOTqbDqjjWarGT3BlMb0yyOcyIwygicjna
	jNKSGTtDjnOi1Ig4BMqHXcyUOZaG264CzzE3SzclfSsn1Wv7D6hK0TPTnt5FuuweIN7rOQ
	McVzd0uPhV2uYAZCHFeNwktypkaP/OWMzWs0WzAuBtT8dVmEoESBbLwW+CMJs9GS+0mlEH
	7eT5T5tQkYll/gvlDIyetT023EfHvVEv5g9ZbOrZOgQZpXtDAO9Xbwhlnkbabw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793783557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2R1gNZLN1hJ4LSn6OOKlccVNHzTPuKUuY49NdzVSUgY=;
	b=EGdQKTN8bRNxKFWzFRfYy643yccWI3ajFIjdRa9ExlhJkDdrxDpT8QB7o7hMqVXd+PCPSp
	rrQuvbQHZY2hZHid9B58DJTuWsKLgbfZJNvSmm6wPUR+GzmUvTr/mDHu96Oi3dYh4sgR+o
	YVbesxDeGaZB3Hm34QwViVFj09Fx3RCrxGGKFU++b/ZZ6F0lBymtO1y3oS4xR7lc5ifsRs
	dlWOSVSyxM6Le4klEYwTorMzwhm/e2hNMyYSrMXCr7554YdiMRCp7DGqVIvpiBMZkfE1Ly
	51HKsELD1vnpSV2YJfg/dxt3S3C/02yGiZDxnz/0LKJQgRXM4jHDifx/A0o8wA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793783557; a=rsa-sha256;
	cv=none;
	b=TJp1fiSWScxi9NmfMwQ14hYdLzLfPA0uxwlLNzsS11PBCJ4NL0BilN7btNV7M6YoEBpnEp
	PwQEYQZbzJXNb4vFIpLg+Eo9ag/qAHOfm9wxsGm46SrELqZ/D10aYTANDCgkTPF1vCaXR4
	vzCZXefzOAEW4Y5Xk3ItUHLcHXcW/uihgzekUEYLkdtiGOj+PTwZGrYTxf2ktqoZ6V9BE6
	snD7wei5xk9GsgFTgHZ8gEDTVPeVJ8c2H2Psyhv43s6NHH1XAQoA79EeTwDZL6pGFpIzCv
	U3D2ImjCqhHzo9In9NQJs0NSazqT3LfDhjAx0YZ7lYHb0/Ye8lAz78Yom8+6GQ==
Message-ID: <bd0d89d16c9effa60088131aa81b6d5786738c0c.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] gpio: Add Siflower GPIO controller driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: joseph@telaak.dev, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski	 <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Chuanhong Guo <gch981213@gmail.com>, Qingfang Deng <dqfext@gmail.com>, 
	linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Qingfang Deng
	 <qingfang.deng@siflower.com.cn>
Date: Wed, 04 Nov 2026 10:12:37 +0100
In-Reply-To: <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev>
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
	 <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mi, 2026-11-04 at 02:21 -0500, Joseph Telaak via B4 Relay wrote:
> From: Qingfang Deng <qingfang.deng@siflower.com.cn>
>=20
> Add a driver for the GPIO controller on Siflower SoCs.
> This controller is found on all current Siflower MIPS and RISC-V
> chips including SF19A2890, SF21A6826 and SF21H8898.
>=20
> Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [jt: from Chuanhong's siflower-7.1 branch; depend on MACH_SIFLOWER_MIPS,
>  longer Kconfig help, assert the reset through a devm action instead of i=
n
>  .remove, which ran before the GPIO chip was removed, drop .owner and the
>  unused drvdata, drop the irq_set_affinity callback, which reached the
>  parent through irq_to_desc() (not exported with SPARSE_IRQ), call
>  gpiochip_disable_irq() and gpiochip_enable_irq() from mask and unmask as
>  an immutable irqchip must, find the group by its parent IRQ instead of
>  assuming consecutive numbers, return 0 or 1 from .get, read ngpios with
>  device_property_read_u32(), linux/math64.h and sorted includes, "Siflowe=
r"
>  spelling, subject]
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
>  drivers/gpio/Kconfig         |  11 ++
>  drivers/gpio/Makefile        |   1 +
>  drivers/gpio/gpio-siflower.c | 325 +++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 337 insertions(+)
>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 55e428002..6125a8452 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -721,6 +721,17 @@ config GPIO_SIFIVE
>  	help
>  	  Say yes here to support the GPIO device on SiFive SoCs.
> =20
> +config GPIO_SIFLOWER
> +	tristate "Siflower GPIO support"
> +	depends on OF_GPIO
> +	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST
> +	select GPIOLIB_IRQCHIP
> +	help
> +	  GPIO controller driver for Siflower MIPS and RISC-V SoCs
> +	  including SF19A2890, SF21A6826 and SF21H8898. Each line can be an
> +	  input or an output and raise an interrupt on either edge or level,
> +	  and inputs can be debounced in hardware.
> +
>  config GPIO_SIOX
>  	tristate "SIOX GPIO support"
>  	depends on SIOX
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 88f748846..bde618108 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -171,6 +171,7 @@ obj-$(CONFIG_GPIO_SCH311X)		+=3D gpio-sch311x.o
>  obj-$(CONFIG_GPIO_SCH)			+=3D gpio-sch.o
>  obj-$(CONFIG_GPIO_SHARED_PROXY)		+=3D gpio-shared-proxy.o
>  obj-$(CONFIG_GPIO_SIFIVE)		+=3D gpio-sifive.o
> +obj-$(CONFIG_GPIO_SIFLOWER)		+=3D gpio-siflower.o
>  obj-$(CONFIG_GPIO_SIM)			+=3D gpio-sim.o
>  obj-$(CONFIG_GPIO_SIOX)			+=3D gpio-siox.o
>  obj-$(CONFIG_GPIO_SL28CPLD)		+=3D gpio-sl28cpld.o
> diff --git a/drivers/gpio/gpio-siflower.c b/drivers/gpio/gpio-siflower.c
> new file mode 100644
> index 000000000..6eb560da7
> --- /dev/null
> +++ b/drivers/gpio/gpio-siflower.c
> @@ -0,0 +1,325 @@
[...]
> +struct sf_gpio_priv {
> +	struct gpio_chip gc;
> +	void __iomem *base;
> +	struct clk *clk;
> +	struct reset_control *rstc;

rstc seems to be unused outside of the probe function.

[...]
> +static void sf_gpio_reset_assert(void *data)
> +{
> +	reset_control_assert(data);
> +}
> +
> +static int sf_gpio_probe(struct platform_device *pdev)
> +{
[...]
> +	priv->rstc =3D devm_reset_control_get_optional(&pdev->dev, NULL);
> +	if (IS_ERR(priv->rstc))
> +		return PTR_ERR(priv->rstc);
> +
> +	ret =3D reset_control_deassert(priv->rstc);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_add_action_or_reset(dev, sf_gpio_reset_assert, priv->rstc)=
;
> +	if (ret)
> +		return ret;

Consider replacing this with
devm_reset_control_get_optional_exclusive_deasserted().
rstc can be a local variable then.

Don't use devm_reset_control_get_optional().

regards
Philipp
