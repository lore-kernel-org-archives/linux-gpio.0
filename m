Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794006107;
	b=nIk7W0tdc5Z6v8krPribnOc01OolhrjTNjkhobcc5VxUZLjtc2xwa/SbLQTXYYzU8mjJ
	 3CAmq+pSyksY6Uph4lMIX0335/JvbL0WCe43JjQTZD/P9Nma2iuBZvKKe9Q/nvfzPwqCr
	 KElbbAfv8cn8wqAgK3x+ep43Wkuv/f03nrajfiXbWlWOr+grKl/TQ0MLvu/crBjgJAzhA
	 +znWu4wwNOh0JR8OcExYeEYcx1gl0L7Q2NYOq8Ka2bl0UDqadPm5donSi/TdRv7sQUEhP
	 v/jK/qGjn0GPXGY7GdI+pMED9JQ0wWrxmCtN/d0+uwuPmITXKP4Isjh1d50EI2sm6YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794006107;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+WLW8LR9a7m1YlHZ+zZ84FTJgrDPlJ3AdbbFpi33+Wg=;
	b=hrzdRKGgSTOsPOqOD56AC80PHxFxCOrNSOPzdESuFc3J7nUkw2B8d1wwoorg1h1WPC+4
	 ojkSmp1np01Q5OSXD+PWmekY8Cx2ZVgk9TO/l/qcaWRS+TurfCZUq3rm24dbq+a0WQRqc
	 c0kPTkgLxdy8pH2cih2YQYQnd00ATmqluzUu9n+WzhmLD8h++l19mM0/B4WqIL8l5tzcV
	 ZxY35NFE/ejS6WdTiZRgUePgwkfU0QPXPYO8o2d0sv5QCCW3Qks0psyuAIEm9CCPtUIRT
	 e8wQW/yoUEU/1GkTnXD9dLjN7EzKNT0YG+FuoIZd+4YMvzotI5jcweB7U0BT8vifluQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IO1lsZCm;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF71606A326;
	Fri,  6 Nov 2026 23:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF71606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IO1lsZCm
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEB2F1650;
	Fri,  6 Nov 2026 15:01:41 -0800 (PST)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A3293F673;
	Fri,  6 Nov 2026 15:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794006104; bh=3S8qesdRfNmQe0ma5COPvlu/f0WMqm4btvUmh8g5L3c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IO1lsZCmgH0zr1zduBecEsrscwlQTwAWtBDwmXVhSMCAMyWcQuADAw84WvG/9cepr
	 4eVatyJsrsWDBCGLNg9bISE/bzVgZqD1aG9o0o1n4JoBLVtuQGQ47jkeSdt/DVuuW9
	 JCY6/RoWRoixluU8nKsVMnCJTB4HFzCGqHWbMRyE=
Date: Sat, 7 Nov 2026 00:01:35 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: linusw@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: sunxi: preserve A733 firmware voltage modes
Message-ID: <20261107000135.6b684277@ryzen.lan>
In-Reply-To: <20261104-a733-pinctrl-v2@gmail.com>
References: <20261104-a733-pinctrl-v2@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  4 Nov 2026 15:56:39 -0500
Enzo Adriano <enzo.adriano.code@gmail.com> wrote:

Hi,

> The A733 GPIO_POW_MOD_SEL voltage-mode fields are two bits wide on
> both controllers (A733 User Manual v1.00, sections 18.14.6.1 and
> 18.14.7.20). On the main controller, the one-bit
> BIAS_VOLTAGE_PIO_POW_MODE_SEL handler writes bit N for bank N, which
> is reserved or half of another bank's field.
> 
> Starting from the vendor firmware value 0x01155550, a request for PF
> with a 1.8 V supply sets bit 5, changing PC from auto (01) to 1.8 V
> (11). A request for PK with a 3.3 V supply clears bit 10, changing PF
> from auto to 3.3 V. PB is supplied from VCC-IO (A733 Datasheet v1.01,
> table 4-5), whose field is at bits 25:24, but a PB request writes
> reserved bit 1 instead.

I guess this has been written by an agent who like to talk? There is
really little point in explaining in multiple lines that
two-bits-per-bank is not compatible with one-bit-per-bank.

> A733 R-PIO has SEL at 0x340 and VAL at 0x348 and nothing at 0x344
> (section 18.14.5.2), where the BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV
> handler it shares with A523-R writes the A523 control register. That
> handler also writes bit N of SEL inverted: for PL with a 3.3 V supply
> it sets bit 0, changing PL from 3.3 V (10) to 1.8 V (11).
> 
> v7.4-rc1 added A733 support with these handlers, so the writes happen
> on the first request of a pin in a bank with a vcc-pX-supply in the
> devicetree.
> 
> Select BIAS_VOLTAGE_NONE for both A733 controllers and give A733-R its
> own descriptor, keeping the A523-R descriptor and behaviour. This
> leaves the firmware voltage modes in place, including any that do not
> match their supplies. It does not implement voltage switching.

So I am not really happy with that. Given that we have existing
problems with the banks not all lining up (PortB and VCC-IO and
friends), just skipping the setup might be a pragmatic solution.
But then the kernel should engage the auto setting, as we generally
don't want to rely on firmware if we can help it.

So as I suggested before: please introduce a symbol like
BIAS_VOLTAGE_PIO_POW_AUTO or so, which also skips the explicit bank setup, like 
BIAS_VOLTAGE_NONE does, but then triggers setting all banks to auto, somewhere in the
generic pinctrl code. Just writing "01" to all banks should do it,
don't get hung up on banks that the manual doesn't describe: mostly
those bits either don't exist at all, or they belong to ports only
exposed on other packages. PortI looks like such a candidate, reading
the respective region tells me that there are 17 PortI pins implemented.
Same thing we saw on the A523/T527 and also on H616/H700.

> 
> Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
> Fixes: 31d68e10381c ("pinctrl: sunxi: a523-r: add a733-r compatible string")
> Link: https://lore.kernel.org/all/20261014183516.172060-1-vinicius.eduardo.pedrosa@gmail.com/
> Suggested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
> Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Cubie A7Z
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
> Changes in v2:
> - Rebased on v7.4-rc1, which added the A733 pinctrl driver. Only the
>   context of the A733 hunk changed.
> - Dropped the old base and its prerequisite-patch-id lines.
> - Dropped the AI assistance and Assisted-by lines.
> - Added Vinicius' Tested-by, from a Cubie A7Z on Linux 7.3-rc6 with his
>   local A733 patches, applied with a context adjustment: warm boots
>   only, no cold boot, 1.8 V switching or A523.
> - Added Fixes tags, manual references and examples of the bits the old
>   handlers write.
> 
> Andre's RFT [1] fixes the same bug with a two-bit handler and changes
> the same A733 line, so only one of the two can be applied. This patch
> uses BIAS_VOLTAGE_NONE, as Vinicius recommended in that thread, rather
> than an AUTO variant: manual section 18.14.4.6 gives auto as 01, but
> as 10 for PC/PE/PK, which the 18.14.6.1 table lists as 3.3 V, and
> there is no evidence that 01 is right on every silicon revision. The
> cost is that firmware modes that do not match a bank's supply stay as
> they are. Andre, if you prefer the AUTO variant, I can rework it.

As mentioned above: Yes, please do. And don't read too much into
silicon revisions or the manual not mentioning everything.

Cheers,
Andre

> 
> [1] https://lore.kernel.org/r/20261013142351.771229-1-andre.przywara@arm.com
> 
> Tested on v7.4-rc1 on a Cubie A7S with vendor boot firmware (one RAM
> boot from cold, then a warm reboot), with A733 CCU v6, AXP318W PMIC v8,
> the sunxi IRQ-bank v3 series, the 8250_dw changes, my A733
> firmware-clock patch and A7S DT v2 on top. The main and R-PIO
> GPIO_POW_MOD_SEL registers (0x02000040, 0x07025340) read 0x01155550
> and 0x000aaaaa in both U-Boot and Linux, and the PF selector
> (0x02000070) read 1. The PMIC regulators registered over R-I2C0 and
> MMC0 reads worked. The readback was taken before the unused-regulator
> cleanup.
> 
> The main-controller value distinguishes the handlers: MMC0 requests
> PF, and this DT gives PF a 1.8 V supply, so the old handler would have
> set bit 5 (0x01155570). An unpatched kernel was not booted. The R-PIO
> value does not: PL has no vcc-pl-supply in this DT, because PL carries
> the PMIC bus, so the R-I2C0 request returns before writing, and the
> old handler's write for PM (3.3 V) would set bit 1, which is already
> set. Vinicius' test covers R-PIO: he added 3.3 V vcc-pl and vcc-pm
> supplies, and also read the registers after the unused-regulator
> cleanup.
> 
> Also built arm64 defconfig with W=1 (GCC) and the changed objects with
> Clang. Not tested: 1.8 V switching, A523.
> 
> v1: https://lore.kernel.org/r/20261031020640-263f7b05-a7s-pinctrl@gmail.com
> 
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 20 +++++++++++++++----
>  drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c   |  3 ++-
>  2 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> index cffc1e53eef1..1cfd81184350 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> @@ -30,17 +30,29 @@ static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
>  	.pin_base = PL_BASE,
>  };
>  
> +static struct sunxi_pinctrl_desc a733_r_pinctrl_data = {
> +	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
> +	.irq_bank_map = a523_r_irq_bank_map,
> +	/* A733 has two-bit voltage modes, without the A523 control register. */
> +	.io_bias_cfg_variant = BIAS_VOLTAGE_NONE,
> +	.pin_base = PL_BASE,
> +};
> +
>  static int a523_r_pinctrl_probe(struct platform_device *pdev)
>  {
> +	struct sunxi_pinctrl_desc *desc;
> +
> +	desc = (struct sunxi_pinctrl_desc *)of_device_get_match_data(&pdev->dev);
>  	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
> -					   a523_r_irq_bank_muxes,
> -					   &a523_r_pinctrl_data,
> +					   a523_r_irq_bank_muxes, desc,
>  					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
>  }
>  
>  static const struct of_device_id a523_r_pinctrl_match[] = {
> -	{ .compatible = "allwinner,sun55i-a523-r-pinctrl", },
> -	{ .compatible = "allwinner,sun60i-a733-r-pinctrl", },
> +	{ .compatible = "allwinner,sun55i-a523-r-pinctrl",
> +	  .data = &a523_r_pinctrl_data },
> +	{ .compatible = "allwinner,sun60i-a733-r-pinctrl",
> +	  .data = &a733_r_pinctrl_data },
>  	{}
>  };
>  
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> index ca82f08a3a65..d4b0a40525f9 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> @@ -24,7 +24,8 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
>  static struct sunxi_pinctrl_desc a733_pinctrl_data = {
>  	.irq_banks = 10,
>  	.irq_read_needs_mux = true,
> -	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> +	/* Preserve the firmware-configured two-bit voltage modes. */
> +	.io_bias_cfg_variant = BIAS_VOLTAGE_NONE,
>  };
>  
>  static int a733_pinctrl_probe(struct platform_device *pdev)
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

