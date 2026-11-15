Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794740698;
	b=JgPYiWyUcYD97YUVDi1HOJYWNG8tPjeCm/5JfAwwtKTFz+xu7avchBT/RacGyPvLGaSG
	 DFPmjdnGl1kvpJ7E23/rfEuA120RLgz9vLDGjY+gxcGMGzXoiIPx8rz8V+0JsaqSkre/g
	 DCkEszfD6mKU/PQsj1d+WFAU1Hj4/Rh5nkxR7ewUmUoC3m9cPLVC+2MCFiRz3Pe5er8RI
	 sOm15IpWyGrvXloRWNM7kGsHOyWFHzQCuCBaulUk9ebjbg+RnYzfGexGPknWeLK5Nm981
	 IxVTxmAAqh/EOFYmFNdYwVDpMfFrvXVws/DNCAk9VVlj0wGmQ8zhu6WVHdeDvSkn0vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740698;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=e+fjAm1eM/shYvPgdmz2W63QYfmzoBK5AhfyBCIzjZ0=;
	b=1jmdnRn5ApDWT7vQz0wkzKSIPf5B2npSZv5O1rJLuuP71I2l4mcuF1uEnMAoh5ion30E
	 7R9jmJySEMz7+MQjbTLVdMQXvaoQfOZP2gBWP0htyempy4D5Jzc2gggpvffxsEeX8eWyD
	 ApeF3W8mvDsRoRO2gGcV8RuZjsA0w3sDnnCSFASLPyVzpq4h5j2qMfUQaxqTPWTDC+j6g
	 OHxRQYto5ygOFWumMyp2w1viTi/79UYg+e8D85kmNfcUWRBUfaOpU2DuN1zuCxD9uAPL0
	 ryyKQxUxg/Q/JV5c84PowfCUUuVPbyn+0k9bYzfauyAAUqMVvR5hndV7UgyUpACElFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BLQpzywt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDDF606A31F;
	Sun, 15 Nov 2026 11:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BLQpzywt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B371F000C4;
	Sun, 15 Nov 2026 11:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794740697;
	bh=e+fjAm1eM/shYvPgdmz2W63QYfmzoBK5AhfyBCIzjZ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BLQpzywtGIhQB40Fk79aXOT8eu80sIl1lY3Ufq7U8t/djbnGadhI3hI+nY9TdsP29
	 R+0Xnk3XzLNrxL8+1QQ9ctaEPJhaqhGx9zJBsRECqoIseGLXqYgtXSK4XT6jZ/aD1G
	 1BGVBa+tgcofN6wM0Fl3UraLPTeBkghSaKp1Af1SVa0w6holpCem9xWOqyPgbumGzk
	 7aBWzaeJTbFz60eQTBPg6y6SMOxY6LT1dvFbgqw32tKH670RO49u8f1KMKvfE57LXH
	 yAye56QRQQfcvV6a09bGSBIxllFIuCrupm2HEwqYOT2VfUDyTq7bTr3FyTM5AcNDiX
	 skRJj0U4SNM2Q==
Message-ID: <sashiko-outbox-215436@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/13] clk: berlin: add Synaptics SL2610 clocks and
 PLLs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115102401.3520-11-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-11-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 11:04:57 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [Medium] clk: berlin: dereference of dev before NULL check in
  sl2610_pll_register()
- [Medium] clk: berlin: irq lock inversion on sl_sysmgr_gateclk_lock via
  sl2610_sysmgr_clk_setup()
- [Low] clk: berlin: fix apbuart3clk and apbi2c1clk typos in
  sl2610_gates
- [Low] clk: berlin: missing OF and HAS_IOMEM dependencies on SL2610_PLL
- [Low] clk: berlin: unused SL2610_APLL macro and struct forward
  declarations
--

commit 9456f61cc7fffcd42790e27e9671ad341c8cf8cd
Author: Jisheng Zhang <jszhang@kernel.org>

clk: berlin: add Synaptics SL2610 clocks and PLLs

This commit adds clock and PLL drivers for the Synaptics SL2610 SoC,
registering the SoC, CPU, AVIO, and MCU clocks.

> diff --git a/drivers/clk/berlin/Kconfig b/drivers/clk/berlin/Kconfig
> index 8f71d4c7a478b..be7e47e0ff523 100644
> --- a/drivers/clk/berlin/Kconfig
> +++ b/drivers/clk/berlin/Kconfig
> @@ -5,3 +5,30 @@ config SL_COMMON_CLK
> =20
>  config SL_SYSMGR_CLK
>  	bool
> +
> +config SL2610_PLL
> +	tristate "Synaptics SL2610 PLL Driver"
> +	depends on ARCH_BERLIN || COMPILE_TEST
> +	default n
> +	help
> +	  Support the integer and fractional PLL outputs used by the SoC,
> +	  CPU and audio clock controllers on Synaptics SL2610 SoCs.
> +
> +	  To compile this driver as a module, choose M here. The module will
> +	  be called sl2610-pll.
> +
> +config SL2610_CLK
> +	tristate "Synaptics SL2610 Clock Driver"
> +	depends on ARCH_BERLIN || COMPILE_TEST
> +	depends on OF && HAS_IOMEM

[Severity: Low]
Should SL2610_PLL also depend on OF && HAS_IOMEM like SL2610_CLK?
sl2610-pll.c calls readl_relaxed() and of_clk_get().

Also, both symbols allow COMPILE_TEST when ARCH_BERLIN=3Dn, but
drivers/clk/Makefile only descends into berlin/ for CONFIG_ARCH_BERLIN, so
neither driver is built under COMPILE_TEST=3Dy with ARCH_BERLIN=3Dn.

> diff --git a/drivers/clk/berlin/clk-sl2610.c b/drivers/clk/berlin/clk-sl2=
610.c
> new file mode 100644
> index 0000000000000..b51d3523028de
> --- /dev/null
> +++ b/drivers/clk/berlin/clk-sl2610.c

[ ... ]

> +static const struct sl_gateclk_desc sl2610_gates[] =3D {
> +	{ "usb0coreclk",	"perifsysclk",	CLK_USB0CORE,		0 },
> +	{ "sdiosysclk",		"perifsysclk",	CLK_SDIOSYS,		1 },
> +	{ "emmcsysclk",		"perifsysclk",	CLK_EMMCSYS,		2 },
> +	{ "gpuaxiclk",		"hpcclk",	CLK_GPUAXI,		3 },
> +	{ "gethrgmiisysclk",	"perifsysclk",	CLK_GETHRGMIISYS,	4 },
> +	{ "sdio1sysclk",	"perifsysclk",	CLK_SDIO1SYS,		5 },
> +	{ "usb1coreclk",	"perifsysclk",	CLK_USB1CORE,		6 },
> +	{ "gethrgmii1sysclk",	"perifsysclk",	CLK_GETHRGMII1SYS,	7 },
> +	{ "usb0phyrefclk",	"perifsysclk",	CLK_USB0PHYREF,		8 },
> +	{ "usb1phyrefclk",	"perifsysclk",	CLK_USB1PHYREF,		9 },
> +	{ "apbuart0clk",	"apbcoreclk",	CLK_APBUART0,		10 },
> +	{ "apbuart1clk",	"apbcoreclk",	CLK_APBUART1,		11 },
> +	{ "apbuart2clk",	"apbcoreclk",	CLK_APBUART2,		12 },
> +	{ "apbuart3lck",	"apbcoreclk",	CLK_APBUART3,		13 },
> +	{ "apbi2c0clk",		"apbcoreclk",	CLK_APBI2C0,		14 },
> +	{ "apbi2c1lck",		"apbcoreclk",	CLK_APBI2C1,		15 },

[Severity: Low]
Are "apbuart3lck" and "apbi2c1lck" typos for "apbuart3clk" and
"apbi2c1clk"?  Every other entry in sl2610_gates[] ends with "clk", so
these two clocks are registered under misspelled names in clk_summary and
any lookup by name.

[ ... ]

> +static int sl2610_sysmgr_clk_setup(struct platform_device *pdev)
> +{
> +	return sl_sysmgr_clk_setup(pdev, sl2610_sysmgr_fixeds, ARRAY_SIZE(sl261=
0_sysmgr_fixeds),
> +				   sl2610_sysmgr_gates, ARRAY_SIZE(sl2610_sysmgr_gates),
> +				   CLK_GATE_CTRL0,
> +				   sl2610_sysmgr_clks, ARRAY_SIZE(sl2610_sysmgr_clks));
> +}

[Severity: Medium]
Can registering the MCU gate clocks via sl_sysmgr_clk_setup() cause an IRQ
lock inversion or deadlock on sl_sysmgr_gateclk_lock?

In commit "clk: berlin: add Synaptics clock controller helpers",
sl_sysmgr_gateclk_enable() and sl_sysmgr_gateclk_is_enabled() acquire
sl_sysmgr_gateclk_lock with guard(spinlock) instead of
guard(spinlock_irqsave):

drivers/clk/berlin/sl-sysmgr-clk.c:sl_sysmgr_gateclk_is_enabled() {
	struct sl_sysmgr_gateclk *gclk =3D to_sl_sysmgr_gateclk(hw);
	u32 reg;

	guard(spinlock)(&sl_sysmgr_gateclk_lock);
	reg =3D readl_relaxed(gclk->reg);
    ...
}

clk_enable() holds the CCF enable_lock with interrupts disabled (and may
run in hardirq context) before calling .enable, whereas
clk_summary_show_one() and clk_hw_is_enabled() call .is_enabled from
process context without enable_lock and with interrupts enabled:

CPU0                              CPU1
----                              ----
clk_enable()
  clk_enable_lock()
    spin_lock_irqsave(&enable_lock)
                                  clk_summary_show_one()
                                    clk_core_is_enabled()
                                      sl_sysmgr_gateclk_is_enabled()
                                        spin_lock(&sl_sysmgr_gateclk_lock)
  sl_sysmgr_gateclk_enable()
    spin_lock(&sl_sysmgr_gateclk_lock)
                                        <hardirq>
                                          clk_enable()
                                            clk_enable_lock()
                                              spin_lock_irqsave(&enable_loc=
k)

 *** DEADLOCK ***

A single-CPU deadlock also occurs if the interrupt on the same CPU calls
clk_enable() on an MCU gate clock while sl_sysmgr_gateclk_is_enabled()
holds sl_sysmgr_gateclk_lock.  Using guard(spinlock_irqsave) (or reading
gclk->reg locklessly in sl_sysmgr_gateclk_is_enabled() as sl_clk_is_enabled=
()
does) avoids this.

> diff --git a/drivers/clk/berlin/sl2610-pll.c b/drivers/clk/berlin/sl2610-=
pll.c
> new file mode 100644
> index 0000000000000..62c5d2d19c362
> --- /dev/null
> +++ b/drivers/clk/berlin/sl2610-pll.c

[ ... ]

> +#define CTRLG			0x18
> +#define DIVQF_MASK		GENMASK(2, 0)
> +
> +#define SL2610_APLL
> +struct sl2610_pll {
> +	void __iomem *ctrl;
> +	struct clk_hw pllout;
> +	struct clk_hw plloutf;
> +};

[ ... ]

> +int sl2610_pll_register(struct device *dev, void __iomem *ctrl,
> +			const char *out, const char *outf)
> +{
> +	struct device_node *np =3D dev->parent->of_node;
> +	struct clk_parent_data parent =3D {};
> +	struct clk_init_data init =3D {};
> +	struct sl2610_pll *pll;
> +	struct clk *input;
> +	int ret;
> +
> +	if (!dev || !ctrl || !out || !outf)
> +		return -EINVAL;

[Severity: Medium]
Does sl2610_pll_register() dereference dev and dev->parent before the !dev
check?  If dev or dev->parent is NULL, initializing np at the top of the
function causes a NULL pointer dereference instead of returning -EINVAL.
sl2610_soc_clk_setup(), sl2610_cpu_clk_setup(), and sl2610_aio_clk_setup()
in drivers/clk/berlin/clk-sl2610.c also dereference dev->parent->of_node
without checking dev->parent.

> diff --git a/drivers/clk/berlin/sl2610-pll.h b/drivers/clk/berlin/sl2610-=
pll.h
> new file mode 100644
> index 0000000000000..b61a93b28610d
> --- /dev/null
> +++ b/drivers/clk/berlin/sl2610-pll.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __SL2610_PLL_H
> +#define __SL2610_PLL_H
> +
> +#include <linux/io.h>
> +
> +struct clk_hw_onecell_data;
> +struct device;
> +struct device_node;

[Severity: Low]
This isn't a bug, but struct clk_hw_onecell_data and struct device_node in
sl2610-pll.h and the empty SL2610_APLL macro in sl2610-pll.c are unused and
can be dropped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115102401.3520=
-1-jszhang@kernel.org?part=3D10
