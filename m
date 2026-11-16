Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794830723;
	b=UOkRt85+XYChrW13uJj2auZ7pWob29ZuV6nR7N7r7AzUhL00hN5PEiTqhmqSKmz906yV
	 6+L248xjahvL7F0RuxUFYPg5hI1rqnLHRQrR6rmba7NGTOL2nHuvCIMT1RJyB/qBkLWi1
	 wUksw4B41zfoYc+VtLyffMJVzNyAGzFWKV5GLGsTfPXCql4fhAIlgw+Q3+AQD+mFVAwgD
	 bl0prtqRYHKfQuX9NDwpDsV/s19/GriSCjjHOJZX9Q3wWxrYAliQMDUNJXdEUQ0/HaaID
	 Vq8iF/ol3qabVIjiQTXsUc+UpKROrOiGyjGs4De65fHSNQMKURjI9VOfsdPWDAJ0XEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830723;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=myLB4OwHBzyw4fpYYsjbE0atdhucZNjAIWIIh+XxrN4=;
	b=PHAJ2B7HFn98khjcqP56hTgs+0PJUjdPjUsoYSYhI54c+lxpiwND+XyFFZ2/Z/fX2Kn3
	 aH5fi7pN67l9OHs8Vj79A03zt2kgXBprJa7uQRS6V5xWos7lxI1FbyQ8ZyYmw2XweMp/y
	 oAnYk+O1bNv94V1A7EyYH60wDa1QF4VMvTJukFOQPgh1PbpRFsi4dRVsIS9aE2kbEDTHy
	 hqImzCUpfHSRonEveQC8wceo1xxb0MR4hQh0P8xrn5KZRXw6ruKZhxYSHCJ8dr0fcr5IN
	 WKS2FlZ5GfDDVK4NHLYQPGMxSpndAryvht6S9HpDhsHZSFxjmvHxCzyACUFLbFnkefA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Ce6XbNuH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B7E606A31C;
	Mon, 16 Nov 2026 12:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23B7E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Ce6XbNuH
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 53F71200563;
	Mon, 16 Nov 2026 13:05:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794830720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=myLB4OwHBzyw4fpYYsjbE0atdhucZNjAIWIIh+XxrN4=;
	b=Ce6XbNuH5brNZhdbUzFVfiOQWZuIors5ZDiGHZbq0H7heC+CJAV03821lq6MmKMKV9XoZD
	BTyf9IhZYlJxqCbCfj9XlRAWZ25crA3wkkrruTuzS45AeOipgjY5dQtNIRhtYHeVgoV/7n
	XnI5zPCkBK/VI/AbcJkZm2uNVq7BbbJWYKiLFyKWmuh4wkYKksrl86rP+pQTceQgZiykWj
	7DpmecXjt1ilPM8a816IguIp1drfqcEEUmQgGsBR2OZTXDZsCJvBotLDRGz//ie1/p8ktC
	Fqu2BM+hQ/dp7KTph2vh5zncXCsFO7V9mfK9M9j3N2ObQh+xQLR/SsqZzXnq3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794830720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=myLB4OwHBzyw4fpYYsjbE0atdhucZNjAIWIIh+XxrN4=;
	b=SMy3PkaQYVUKR3rltjraWfns01w0zxrh9UgoUXYbVER4fulioewJUvI9H7vYBvbQXRz133
	h8OLDsjkvu8BUAsQq5pQ526HlxcQ3eH+Ii4QcIq8wUwH8PlHSHnr6NTzaL9UBqpaecEGwg
	cYFaelKZmN1RSfbtxG0axVPYwDTz3Vgl9Whds07omSbRVx8uojIljS2lfukkqrd+6TtTb1
	IgtoLxJP9UNJIey3UyZmjSC2IQh/RcqkNcVcBfU+8EjNTQAHQAOrNbjCxyQazF0A66JvrE
	7YtIVB7xsnF0TsMZpxdrzNEjix/6/X49PdJcA+Vbj4Q1wMosFZ0vxEz7EjtkxA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794830720; a=rsa-sha256;
	cv=none;
	b=d631/ZkM9Ikmiwd4yVTINxrLF6GTwIFVHvDISAG5stxcDBhx3DcAIr4AojkGqcqbZcKHmd
	ICnxsKWCkTPL1FbddoK8od4Gd+MTDwER6NEHyPxDpxIlS7egWdkCQxSoo+VvSsXAavRymC
	lJSxacXKlycJhl0KgiRrP5VmA/2yjMYTHmOKcbANRhCB5asKesMZiiwjt/E7JvBw7rz1yy
	/Js0i3NVVdlqGwqDOIKMBiMLBDaU2m2yx5hNobeKGGJs9MzxqTa+Egj8bMwle+yWUzZNJW
	4Q2GyXcj6h69uwhjChMx14tONM5vda/T21KFVM79pE7cHpDRLBlIjYGRRuomvw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <782e5c69196cd5618841abeadb1563d67f6e93a7.camel@pengutronix.de>
Subject: Re: [PATCH v2 07/13] reset: add Synaptics SL2610 reset controller
 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Catalin Marinas	 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland	 <mark.rutland@arm.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  Stephen Boyd <sboyd@kernel.org>, Brian
 Masney <bmasney+clk@redhat.com>, Jerome Brunet	 <jbrunet+clk@baylibre.com>,
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Mon, 16 Nov 2026 13:05:20 +0100
In-Reply-To: <20261115102401.3520-8-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
	 <20261115102401.3520-8-jszhang@kernel.org>
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

On So, 2026-11-15 at 18:23 +0800, Jisheng Zhang wrote:
> Support the SoC and MCU reset controls exposed by the SL2610 system
> controllers. Match the MFD-created platform devices, use the parent
> syscon regmap and register each reset provider against the parent DT node=
.
>=20
> Handle both pulse resets and sticky resets with assert/deassert controls.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  MAINTAINERS                  |   1 +
>  drivers/reset/Kconfig        |  13 ++
>  drivers/reset/Makefile       |   1 +
>  drivers/reset/reset-sl2610.c | 224 +++++++++++++++++++++++++++++++++++
>  4 files changed, 239 insertions(+)
>  create mode 100644 drivers/reset/reset-sl2610.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eae1493485ee..1bd3b2f39865 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3812,6 +3812,7 @@ F:	Documentation/devicetree/bindings/soc/synaptics/
>  F:	arch/arm/boot/dts/synaptics/
>  F:	arch/arm/mach-berlin/
>  F:	arch/arm64/boot/dts/synaptics/
> +F:	drivers/reset/reset-sl2610.c
>  F:	drivers/soc/synaptics/
>  F:	include/dt-bindings/clock/syna,sl2610.h
>  F:	include/dt-bindings/reset/syna,sl2610-reset.h
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index eda9c698a95f..98e973a8798c 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -358,6 +358,19 @@ config RESET_SUNXI
>  	help
>  	  This enables the reset driver for Allwinner SoCs.
> =20
> +config RESET_SL2610
> +	tristate "Synaptics SL2610 Reset Driver"
> +	depends on ARCH_BERLIN || COMPILE_TEST
> +	depends on OF && HAS_IOMEM
> +	select SOC_SL2610_SYSCON

Why is this select needed?

> +	help
> +	  Support the reset controllers in the SoC and MCU system control
> +	  blocks of Synaptics SL2610 SoCs. Both pulse and sticky reset lines
> +	  are supported.
> +
> +	  To compile this driver as a module, choose M here. The module will
> +	  be called reset-sl2610.
> +
>  config RESET_TENSTORRENT_ATLANTIS
>  	tristate "Tenstorrent atlantis reset driver"
>  	depends on ARCH_TENSTORRENT || COMPILE_TEST
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 489fafd6bbe3..d28276a4f2ea 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -42,6 +42,7 @@ obj-$(CONFIG_RESET_SCMI) +=3D reset-scmi.o
>  obj-$(CONFIG_RESET_SIMPLE) +=3D reset-simple.o
>  obj-$(CONFIG_RESET_SKY1) +=3D reset-sky1.o
>  obj-$(CONFIG_RESET_SKY1_AUDSS) +=3D reset-sky1-audss.o
> +obj-$(CONFIG_RESET_SL2610) +=3D reset-sl2610.o
>  obj-$(CONFIG_RESET_SOCFPGA) +=3D reset-socfpga.o
>  obj-$(CONFIG_RESET_SUNPLUS) +=3D reset-sunplus.o
>  obj-$(CONFIG_RESET_SUNXI) +=3D reset-sunxi.o
> diff --git a/drivers/reset/reset-sl2610.c b/drivers/reset/reset-sl2610.c
> new file mode 100644
> index 000000000000..1ca58d5a3e71
> --- /dev/null
> +++ b/drivers/reset/reset-sl2610.c
> @@ -0,0 +1,224 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 Synaptics Incorporated
> + *
> + * Synaptics SL2610 reset driver
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +#include <dt-bindings/reset/syna,sl2610-reset.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +
> +/* SL2610 ACPU subsystem */
> +#define SL2610_GBL_PERIFRESET			0x350
> +#define SL2610_GBL_PERIFSTICKYRESET		0x360
> +#define SL2610_GBL_APBPERIFRESET		0x370
> +#define SL2610_GBL_TOPSTICKYRESET		0x378
> +#define SL2610_GBL_AVIOSTICKYRESET		0x37c
> +
> +/* SL2610 system subsystem */
> +#define SL2610_SMGBL_STICKYRST0			0x400
> +
> +#define to_sl2610_reset_priv(p)	container_of((p), struct sl2610_reset_pr=
iv, rcdev)

Turn this into an inline function, please.

> +
> +#define SL2610_RESET(id, reg, bit, sticky)[id] =3D { reg, BIT(bit), stic=
ky }
> +
> +struct sl2610_reset_cfg {
> +	u32 reg;
> +	u32 bit;
> +	bool sticky;
> +};
> +
> +struct sl2610_reset_data {
> +	const struct sl2610_reset_cfg *cfgs;
> +	size_t num;
> +};
> +
> +struct sl2610_reset_priv {
> +	struct regmap *regmap;
> +	const struct sl2610_reset_cfg *cfgs;
> +	struct reset_controller_dev rcdev;
> +};
> +
> +static const struct sl2610_reset_cfg sl2610_reset_cfgs[] =3D {
> +	SL2610_RESET(RST_SOC_SDIO0, SL2610_GBL_PERIFRESET, 2, false),
> +	SL2610_RESET(RST_SOC_USB0, SL2610_GBL_PERIFRESET, 4, false),
> +	SL2610_RESET(RST_SOC_EMMC, SL2610_GBL_PERIFRESET, 5, false),
> +	SL2610_RESET(RST_SOC_GETH0, SL2610_GBL_PERIFRESET, 6, false),
> +	SL2610_RESET(RST_SOC_SDIO1, SL2610_GBL_PERIFRESET, 7, false),
> +	SL2610_RESET(RST_SOC_USB1, SL2610_GBL_PERIFRESET, 8, false),
> +	SL2610_RESET(RST_SOC_GETH1, SL2610_GBL_PERIFRESET, 9, false),
> +	SL2610_RESET(RST_SOC_USB0PHY, SL2610_GBL_PERIFSTICKYRESET, 0, true),
> +	SL2610_RESET(RST_SOC_USB0CORE, SL2610_GBL_PERIFSTICKYRESET, 1, true),
> +	SL2610_RESET(RST_SOC_USB0MAHB, SL2610_GBL_PERIFSTICKYRESET, 2, true),
> +	SL2610_RESET(RST_SOC_USB1PHY, SL2610_GBL_PERIFSTICKYRESET, 3, true),
> +	SL2610_RESET(RST_SOC_USB1CORE, SL2610_GBL_PERIFSTICKYRESET, 4, true),
> +	SL2610_RESET(RST_SOC_USB1MAHB, SL2610_GBL_PERIFSTICKYRESET, 5, true),
> +	SL2610_RESET(RST_SOC_UART0, SL2610_GBL_APBPERIFRESET, 0, false),
> +	SL2610_RESET(RST_SOC_UART1, SL2610_GBL_APBPERIFRESET, 1, false),
> +	SL2610_RESET(RST_SOC_UART2, SL2610_GBL_APBPERIFRESET, 2, false),
> +	SL2610_RESET(RST_SOC_UART3, SL2610_GBL_APBPERIFRESET, 3, false),
> +	SL2610_RESET(RST_SOC_I2C0, SL2610_GBL_APBPERIFRESET, 4, false),
> +	SL2610_RESET(RST_SOC_I2C1, SL2610_GBL_APBPERIFRESET, 5, false),
> +	SL2610_RESET(RST_SOC_SPI0, SL2610_GBL_APBPERIFRESET, 6, false),
> +	SL2610_RESET(RST_SOC_SPI1, SL2610_GBL_APBPERIFRESET, 7, false),
> +	SL2610_RESET(RST_SOC_SPI2, SL2610_GBL_APBPERIFRESET, 8, false),
> +	SL2610_RESET(RST_SOC_SPI3, SL2610_GBL_APBPERIFRESET, 9, false),
> +	SL2610_RESET(RST_SOC_APBTIMERS, SL2610_GBL_APBPERIFRESET, 10, false),
> +	SL2610_RESET(RST_SOC_APBSYSCNT, SL2610_GBL_APBPERIFRESET, 11, false),
> +	SL2610_RESET(RST_SOC_APBWDT, SL2610_GBL_APBPERIFRESET, 12, false),
> +	SL2610_RESET(RST_SOC_APBGPIO, SL2610_GBL_APBPERIFRESET, 13, false),
> +	SL2610_RESET(RST_SOC_APBDMA, SL2610_GBL_APBPERIFRESET, 14, false),
> +	SL2610_RESET(RST_SOC_GPUCORE, SL2610_GBL_TOPSTICKYRESET, 0, true),
> +	SL2610_RESET(RST_SOC_NPUCORE, SL2610_GBL_TOPSTICKYRESET, 1, true),
> +	SL2610_RESET(RST_SOC_AVIOAIOG, SL2610_GBL_AVIOSTICKYRESET, 0, true),
> +	SL2610_RESET(RST_SOC_AVIOVPPG, SL2610_GBL_AVIOSTICKYRESET, 1, true),
> +	SL2610_RESET(RST_SOC_AVIOVIPG, SL2610_GBL_AVIOSTICKYRESET, 2, true),
> +};
> +
> +static const struct sl2610_reset_cfg sl2610_system_reset_cfgs[] =3D {
> +	SL2610_RESET(RST_SM_ADCCORE, SL2610_SMGBL_STICKYRST0, 0, true),
> +	SL2610_RESET(RST_SM_ADCPRST, SL2610_SMGBL_STICKYRST0, 1, true),
> +	SL2610_RESET(RST_SM_CAN0PRST, SL2610_SMGBL_STICKYRST0, 2, true),
> +	SL2610_RESET(RST_SM_CAN0SRST, SL2610_SMGBL_STICKYRST0, 3, true),
> +	SL2610_RESET(RST_SM_CAN1PRST, SL2610_SMGBL_STICKYRST0, 4, true),
> +	SL2610_RESET(RST_SM_CAN1SRST, SL2610_SMGBL_STICKYRST0, 5, true),
> +	SL2610_RESET(RST_SM_GPIOPRST, SL2610_SMGBL_STICKYRST0, 6, true),
> +	SL2610_RESET(RST_SM_GPIOSRST, SL2610_SMGBL_STICKYRST0, 7, true),
> +	SL2610_RESET(RST_SM_I2CM0PRST, SL2610_SMGBL_STICKYRST0, 8, true),
> +	SL2610_RESET(RST_SM_I2CM0SRST, SL2610_SMGBL_STICKYRST0, 9, true),
> +	SL2610_RESET(RST_SM_I2CM1PRST, SL2610_SMGBL_STICKYRST0, 10, true),
> +	SL2610_RESET(RST_SM_I2CM1SRST, SL2610_SMGBL_STICKYRST0, 11, true),
> +	SL2610_RESET(RST_SM_I3CPRST, SL2610_SMGBL_STICKYRST0, 12, true),
> +	SL2610_RESET(RST_SM_I3CSRST, SL2610_SMGBL_STICKYRST0, 13, true),
> +	SL2610_RESET(RST_SM_PDMPRST, SL2610_SMGBL_STICKYRST0, 14, true),
> +	SL2610_RESET(RST_SM_PDMSRST, SL2610_SMGBL_STICKYRST0, 15, true),
> +	SL2610_RESET(RST_SM_PVTHSRST, SL2610_SMGBL_STICKYRST0, 16, true),
> +	SL2610_RESET(RST_SM_PVTPRST, SL2610_SMGBL_STICKYRST0, 17, true),
> +	SL2610_RESET(RST_SM_PWMPERIRST, SL2610_SMGBL_STICKYRST0, 18, true),
> +	SL2610_RESET(RST_SM_PWMPRST, SL2610_SMGBL_STICKYRST0, 19, true),
> +	SL2610_RESET(RST_SM_SPIMPRST, SL2610_SMGBL_STICKYRST0, 20, true),
> +	SL2610_RESET(RST_SM_SPIMSRST, SL2610_SMGBL_STICKYRST0, 21, true),
> +	SL2610_RESET(RST_SM_SPISPRST, SL2610_SMGBL_STICKYRST0, 22, true),
> +	SL2610_RESET(RST_SM_SPISSRST, SL2610_SMGBL_STICKYRST0, 23, true),
> +	SL2610_RESET(RST_SM_UART0PRST, SL2610_SMGBL_STICKYRST0, 24, true),
> +	SL2610_RESET(RST_SM_UART0SRST, SL2610_SMGBL_STICKYRST0, 25, true),
> +	SL2610_RESET(RST_SM_UART1PRST, SL2610_SMGBL_STICKYRST0, 26, true),
> +	SL2610_RESET(RST_SM_UART1SRST, SL2610_SMGBL_STICKYRST0, 27, true),
> +	SL2610_RESET(RST_SM_UART2PRST, SL2610_SMGBL_STICKYRST0, 28, true),
> +	SL2610_RESET(RST_SM_UART2SRST, SL2610_SMGBL_STICKYRST0, 29, true),
> +	SL2610_RESET(RST_SM_UART3PRST, SL2610_SMGBL_STICKYRST0, 30, true),
> +	SL2610_RESET(RST_SM_UART3SRST, SL2610_SMGBL_STICKYRST0, 31, true),
> +};
> +
> +static const struct sl2610_reset_data sl2610_reset_data =3D {
> +	.cfgs =3D sl2610_reset_cfgs,
> +	.num =3D ARRAY_SIZE(sl2610_reset_cfgs),
> +};
> +
> +static const struct sl2610_reset_data sl2610_system_reset_data =3D {
> +	.cfgs =3D sl2610_system_reset_cfgs,
> +	.num =3D ARRAY_SIZE(sl2610_system_reset_cfgs),
> +};
> +
> +static int sl2610_reset_assert(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	struct sl2610_reset_priv *priv =3D to_sl2610_reset_priv(rcdev);
> +	const struct sl2610_reset_cfg *cfg =3D &priv->cfgs[id];
> +
> +	if (!cfg->sticky)
> +		return -EINVAL;

The core uses -ENOTSUPP for this.

> +
> +	return regmap_clear_bits(priv->regmap, cfg->reg, cfg->bit);
> +}
> +
> +static int sl2610_reset_deassert(struct reset_controller_dev *rcdev,
> +				 unsigned long id)
> +{
> +	struct sl2610_reset_priv *priv =3D to_sl2610_reset_priv(rcdev);
> +	const struct sl2610_reset_cfg *cfg =3D &priv->cfgs[id];
> +
> +	if (!cfg->sticky)
> +		return -EINVAL;

This could just return 0.

> +
> +	return regmap_set_bits(priv->regmap, cfg->reg, cfg->bit);
> +}
> +
> +static int sl2610_reset_reset(struct reset_controller_dev *rcdev,
> +			      unsigned long id)
> +{
> +	struct sl2610_reset_priv *priv =3D to_sl2610_reset_priv(rcdev);
> +	const struct sl2610_reset_cfg *cfg =3D &priv->cfgs[id];
> +
> +	if (cfg->sticky) {
> +		regmap_clear_bits(priv->regmap, cfg->reg, cfg->bit);
> +		usleep_range(10, 15);
> +		return regmap_set_bits(priv->regmap, cfg->reg, cfg->bit);
> +	}

Why is this needed? Could you just return -ENOTSUPP?

> +
> +	return regmap_set_bits(priv->regmap, cfg->reg, cfg->bit);
> +}
> +
> +static const struct reset_control_ops sl2610_reset_ops =3D {
> +	.reset	=3D sl2610_reset_reset,
> +	.assert =3D sl2610_reset_assert,
> +	.deassert =3D sl2610_reset_deassert,
> +};
> +
> +static int sl2610_reset_probe(struct platform_device *pdev)
> +{
> +	struct device_node *parent_np =3D pdev->dev.parent->of_node;
> +	struct sl2610_reset_priv *priv;
> +	const struct sl2610_reset_data *data =3D
> +		(void *)platform_get_device_id(pdev)->driver_data;
> +
> +	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->regmap =3D syscon_node_to_regmap(parent_np);
> +	if (IS_ERR(priv->regmap))
> +		return PTR_ERR(priv->regmap);
> +
> +	priv->rcdev.owner =3D THIS_MODULE;
> +	priv->rcdev.ops =3D &sl2610_reset_ops;
> +	priv->rcdev.dev =3D &pdev->dev;
> +	priv->rcdev.of_node =3D parent_np;
> +	priv->rcdev.of_reset_n_cells =3D 1;

Please don't set of_reset_n_cells. This is ignored since of_xlate is
not set. reset_controller_register() already sets fwnode_reset_n_cells
to 1 by default.

regards
Philipp
