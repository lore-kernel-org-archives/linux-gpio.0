Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794740196;
	b=KFP7Gg4ZHy4a7rlRqQUagzYGnG7uEOs3s/MpJaGxo0jrnkyPhro4h93OITUhsI/iUfuo
	 DRMQvGLFmspEeR8Oa6FteIua8SeYfm+hTWcEy4E5z1ZTIxyaqL+PuKaCwz6pnnDHhks+S
	 y2zn87T2DHHqetjnFAIOWn4V08hakGysiICmLdM6wIjV3KwTwLcAL+Zl6+KC5yjfa3K/C
	 qj84mDM6JeHfvslSNGE/hO7vjsary/bItWG2ysxXUZi3aQEZX07b3CpAZn2XssaAD+TZD
	 XxcMo7kGnhSuUW82ea8jqW3RXFDQvkDwsmpZ/JpYbhaQUSCYKdu+wPO4IgAyoEo5EHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740196;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CAE74HJLkuBRS+RqP5X5X5MJG2odlkd/S8X0wQBmA7Y=;
	b=NZakVgn8KDM9t4FKhLA2Tb4BH5GVe1WbZEYGlSHjW/woFmoQhB54mbA9UQC64/cPJzBc
	 /GlsE8sKyIF37TeWj+ZOTV5gH+LC5DPwPZGGjAPyuF3mabU9bAfNvRuwWJgQiMIqwwJPy
	 Vkscs8pDuJ6SAd3gZoxDMV3FCqqfRA0bfMAuyFn/ycJto+QWAuHClaQTDzlZDf9gJsyeb
	 o+83guLJE8G9bXCq00wRT9YpfwSfwtLkhRJF4gVoPUR7nNKp/54KW94bghyyFges+LMjT
	 hxEbg/AM/bWlongEg4w4XvubQsr+d5bTgiZBdI2WX1JpLLdnHGyeUE4qdlcnsN/kqjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E73eBrEg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44EF606A31A;
	Sun, 15 Nov 2026 10:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E73eBrEg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7A11F000C4;
	Sun, 15 Nov 2026 10:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794740196;
	bh=CAE74HJLkuBRS+RqP5X5X5MJG2odlkd/S8X0wQBmA7Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E73eBrEgmvm5du7x33L6yZ5fE7nLbZ/rMb7x8ggNZgzYACX2BK45KtJlxr3q7pGl9
	 hqKjnDhptn6hYwNXWws3U0dE9pODZDizEpS2xDEBKcrms632dG0G2UgWWWZ7K42rfV
	 9CXILulDvHRgOlSUXELE/x47rAFQzoirTO4Z57tY5d2A0M9kzl0f4IXkQPfNHn2/9f
	 BAo9Yk2ERiX9bOtqhpfgnb8YK77iv5EX0n8KVTc8Apv6IpxwGu+hgWs8kfXguIJ3KJ
	 2r6kuZBs4N6FYcSuFXaRWgFIsDFUgxL0BUsYO6QWWgHvisoVmP7/UKoDaXbpigQuQ0
	 wBNtXt5AmW8Ig==
Message-ID: <sashiko-outbox-215428@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/13] soc: synaptics: add SL2610 system controller
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115102401.3520-7-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-7-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:56:35 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Low] soc: synaptics: new MFD driver sl2610-syscon placed outside
  drivers/mfd
- [Low] soc: synaptics: MFD used for single-function AVIO and CPU clock
  blocks
- [Low] soc: synaptics: mfd_cell arrays passed via match data in
  sl2610_syscon_probe()
--

commit 13fffaa081530baa348dec7822fd2e447d70af16
Author: Jisheng Zhang <jszhang@kernel.org>

soc: synaptics: add SL2610 system controller support

This commit adds a driver for the Synaptics SL2610 system control blocks to
register their clock, reset, and pin controller child devices via MFD.

> diff --git a/drivers/soc/synaptics/Kconfig b/drivers/soc/synaptics/Kconfig
> new file mode 100644
> index 0000000000000..9f0324a1a3b7a
> --- /dev/null
> +++ b/drivers/soc/synaptics/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config SOC_SL2610_SYSCON
> +	tristate "Synaptics SL2610 system controller"
> +	depends on ARCH_BERLIN || COMPILE_TEST
> +	depends on OF && HAS_IOMEM
> +	select MFD_CORE
> +	select MFD_SYSCON

[Severity: Low]
Should this driver live under drivers/mfd/ instead of drivers/soc/synaptics=
/?

sl2610-syscon.c does not implement any SoC bus or SoC-specific service and
only calls devm_mfd_add_devices() to instantiate MFD child devices.  New co=
re
MFD drivers and new calls to devm_mfd_add_devices() belong in drivers/mfd/.

> diff --git a/drivers/soc/synaptics/sl2610-syscon.c b/drivers/soc/synaptic=
s/sl2610-syscon.c
> new file mode 100644
> index 0000000000000..c6fc2955ac0de
> --- /dev/null
> +++ b/drivers/soc/synaptics/sl2610-syscon.c
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Synaptics Incorporated
> + */
> +
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +struct sl2610_syscon_data {
> +	const struct mfd_cell *cells;
> +	unsigned int num_cells;
> +};
> +
> +static const struct mfd_cell sl2610_soc_cells[] =3D {
> +	MFD_CELL_NAME("sl2610-soc-clk"),
> +	MFD_CELL_NAME("sl2610-soc-reset"),
> +	MFD_CELL_NAME("sl2610-soc-pinctrl"),
> +};
> +
> +static const struct mfd_cell sl2610_mcu_cells[] =3D {
> +	MFD_CELL_NAME("sl2610-mcu-clk"),
> +	MFD_CELL_NAME("sl2610-mcu-reset"),
> +	MFD_CELL_NAME("sl2610-mcu-pinctrl"),
> +};
> +
> +static const struct mfd_cell sl2610_avio_cells[] =3D {
> +	MFD_CELL_NAME("sl2610-avio-clk"),
> +};
> +
> +static const struct mfd_cell sl2610_cpu_cells[] =3D {
> +	MFD_CELL_NAME("sl2610-cpu-clk"),
> +};

[Severity: Low]
Why use MFD for the single-function AVIO and CPU clock blocks?

sl2610_avio_cells and sl2610_cpu_cells each register only a single clock
child device, and per the syna,sl2610-soc-syscon binding neither block
provides reset or pinctrl functions.  MFD is intended for devices that
register multiple children across different subsystems, whereas the clock
driver can bind directly to syna,sl2610-avio-syscon and
syna,sl2610-cpu-syscon while keeping shared regmap access through the
generic syscon compatible.

> +
> +static const struct sl2610_syscon_data sl2610_soc_data =3D {
> +	.cells =3D sl2610_soc_cells,
> +	.num_cells =3D ARRAY_SIZE(sl2610_soc_cells),
> +};
> +
> +static const struct sl2610_syscon_data sl2610_mcu_data =3D {
> +	.cells =3D sl2610_mcu_cells,
> +	.num_cells =3D ARRAY_SIZE(sl2610_mcu_cells),
> +};
> +
> +static const struct sl2610_syscon_data sl2610_avio_data =3D {
> +	.cells =3D sl2610_avio_cells,
> +	.num_cells =3D ARRAY_SIZE(sl2610_avio_cells),
> +};
> +
> +static const struct sl2610_syscon_data sl2610_cpu_data =3D {
> +	.cells =3D sl2610_cpu_cells,
> +	.num_cells =3D ARRAY_SIZE(sl2610_cpu_cells),
> +};
> +
> +static int sl2610_syscon_probe(struct platform_device *pdev)
> +{
> +	const struct sl2610_syscon_data *data =3D device_get_match_data(&pdev->=
dev);
> +
> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> +				    data->cells, data->num_cells, NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id sl2610_syscon_of_match[] =3D {
> +	{ .compatible =3D "syna,sl2610-soc-syscon", .data =3D &sl2610_soc_data =
},
> +	{ .compatible =3D "syna,sl2610-mcu-syscon", .data =3D &sl2610_mcu_data =
},
> +	{ .compatible =3D "syna,sl2610-avio-syscon", .data =3D &sl2610_avio_dat=
a },
> +	{ .compatible =3D "syna,sl2610-cpu-syscon", .data =3D &sl2610_cpu_data =
},
> +	{ }
> +};

[Severity: Low]
This isn't a bug in normal DT probing, but MFD drivers should not pass
mfd_cell arrays through the .data field of of_device_id tables.  In additio=
n,
if the driver is bound without an OF match (such as via sysfs
driver_override), device_get_match_data() returns NULL and
sl2610_syscon_probe() dereferences a NULL data pointer.

Could sl2610_syscon_of_match store an enum or integer ID in .data and select
the static const mfd_cell array with a switch statement (and a default error
return) in sl2610_syscon_probe()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115102401.3520=
-1-jszhang@kernel.org?part=3D6
