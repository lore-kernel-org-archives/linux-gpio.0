Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702673F1AD5;
	Thu, 24 Sep 2026 09:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790241468; cv=none; b=q2bOm4IZ7evb4A6SEd+jop+OvebbKHszlBdE4HidQzmfcgzTWY3I1JTstVrn+Nsl07eKrShTFA5fB7rz3wTC9JrxOYogMZA73T00SQ09VrzFnsZvYA+5O1SIWX6txGaMo/HcB+b5cl4ndHxtbcr6lQQgbTCJMnxNXD3Hs70nUxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790241468; c=relaxed/simple;
	bh=CRjsNLJ37lzAdiPrVAuMDoCfQFJGPwJhlUp5dIrR4X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IN7IScsIKxF5ClwESd+8uE7PX1jua2bvJpOUaxxslnATgHMmF8/3cEP8Q02IJJn1RobkmoPj9aKnPj12RQ5zop4ob7aPrHM5XgHVJr/+Lsh9+2do9k8ca9TCO2Dw2tvvAL5AcxOIBBq4xXM4GqD0Y1VT9mMlPt+YiBpJow0bapA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jjTq5r13; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jjTq5r13"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E90C1477;
	Thu, 24 Sep 2026 02:17:41 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 504483F86F;
	Thu, 24 Sep 2026 02:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790241464; bh=CRjsNLJ37lzAdiPrVAuMDoCfQFJGPwJhlUp5dIrR4X0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jjTq5r13ifY7XEYNktDAX6Tvs3XnRUMZ6nS70TtqZZgsceSVqLtzpUJFllwErkkO9
	 9MCwsVKYVj68UDIm76sPQ+ZFMRSTs7+koiObc2wace9I3EqFrkcEUdIDM3JZHlJijC
	 eyzyQymOQ9klPjwFKN77pKRi2fWX6kROKfEiXViY=
Message-ID: <b0861183-54df-48f3-b78b-cc0c1c4dff4c@arm.com>
Date: Thu, 24 Sep 2026 11:17:42 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/11] pinctrl: sunxi: add Allwinner B288 pin
 controller driver
To: Pablo Mazzini <pmazzini@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Linus Walleij
 <linusw@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20260923201701.43391-1-pmazzini@gmail.com>
 <20260923201701.43391-4-pmazzini@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260923201701.43391-4-pmazzini@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

many thanks for going through the task of creating this table - though I 
think you wouldn't need to do this anymore, since we now have another 
way of describing pins, which avoids this lenghty table in the driver:
look at pinctrl-sun55i-a523.c for an example.

This would allow the "driver" to be a mere high level description, and 
leave the mux values to the DT.

That being said: it's good to have that info, for the lack of a manual.
Can you by any chance try to make a table out of it and put it into our 
wiki (https://linux-sunxi.org/B288)? That would then be the replacement 
for the manual. Maybe write a small tool to convert this data struct 
into Wiki table format.

Some general things inline ...

On 9/23/26 22:16, Pablo Mazzini wrote:
> 78 pins across ports B, C, D, F and G. PH0 is BSP FPGA-only and omitted.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>   drivers/pinctrl/sunxi/Kconfig              |  10 +
>   drivers/pinctrl/sunxi/Makefile             |   1 +
>   drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c | 623 +++++++++++++++++++++
>   3 files changed, 634 insertions(+)
>   create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
> 
> diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
> index dc62eba96348..a08186133090 100644
> --- a/drivers/pinctrl/sunxi/Kconfig
> +++ b/drivers/pinctrl/sunxi/Kconfig
> @@ -56,6 +56,16 @@ config PINCTRL_SUN8I_A23_R
>   	default MACH_SUN8I
>   	select PINCTRL_SUNXI
>   
> +config PINCTRL_SUN8I_B288
> +	bool "Support for the Allwinner B288 PIO"
> +	default MACH_SUN8I
> +	select PINCTRL_SUNXI
> +	help
> +	  Say Y here to enable pin controller and GPIO support for the
> +	  Allwinner B288 (sun8iw10p1) SoC, as used in e-book readers such
> +	  as the PocketBook Verse. This covers ports B, C, D, F and G,
> +	  including the four banks of external interrupt capable pins.
> +
>   config PINCTRL_SUN8I_H3
>   	bool "Support for the Allwinner H3 PIO"
>   	default MACH_SUN8I
> diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
> index 951b3f1e4b4f..5129c0f19f3e 100644
> --- a/drivers/pinctrl/sunxi/Makefile
> +++ b/drivers/pinctrl/sunxi/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_PINCTRL_SUN50I_A100)	+= pinctrl-sun50i-a100.o
>   obj-$(CONFIG_PINCTRL_SUN50I_A100_R)	+= pinctrl-sun50i-a100-r.o
>   obj-$(CONFIG_PINCTRL_SUN8I_A83T)	+= pinctrl-sun8i-a83t.o
>   obj-$(CONFIG_PINCTRL_SUN8I_A83T_R)	+= pinctrl-sun8i-a83t-r.o
> +obj-$(CONFIG_PINCTRL_SUN8I_B288)	+= pinctrl-sun8i-b288.o
>   obj-$(CONFIG_PINCTRL_SUN8I_H3)		+= pinctrl-sun8i-h3.o
>   obj-$(CONFIG_PINCTRL_SUN8I_H3_R)	+= pinctrl-sun8i-h3-r.o
>   obj-$(CONFIG_PINCTRL_SUN8I_V3S)		+= pinctrl-sun8i-v3s.o
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
> new file mode 100644
> index 000000000000..ffd7eef68d19
> --- /dev/null
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
> @@ -0,0 +1,623 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Allwinner B288 (sun8iw10p1) SoC pinctrl driver.
> + *
> + * Derived from Allwinner's BSP driver pinctrl-sun8iw10p1.c, which is:
> + * Copyright (C) 2014 Jackie Hwang <huangshr@allwinnertech.com>
> + *
> + * Based on pinctrl-sun8i-a23.c, which is:
> + * Copyright (C) 2014 Chen-Yu Tsai <wens@csie.org>
> + * Copyright (C) 2014 Maxime Ripard <maxime.ripard@free-electrons.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/pinctrl/pinctrl.h>
> +
> +#include "pinctrl-sunxi.h"
> +
> +static const struct sunxi_desc_pin sun8i_b288_pins[] = {
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 0),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart2"),
> +		  SUNXI_FUNCTION(0x3, "jtag0"),
> +		  SUNXI_FUNCTION(0x5, "vdevice"),

What's vdevice? I don't think we used to describe those weird functions.

> +		  SUNXI_FUNCTION(0x7, "io_disabled"),

I know Allwinner does this, but we do not describe the HighZ mux, it's 
all 1's anyway, and the same for all pins.

Those comments are probably irrelevant if you go with the new pinctrl 
driver style. Most of the settings there should be straightforward to 
figure out, just remember to add an IRQ map, to account for the missing 
interrupts on PortC.

Cheers,
Andre

> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 1),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart2"),
> +		  SUNXI_FUNCTION(0x3, "jtag0"),
> +		  SUNXI_FUNCTION(0x4, "spdif0"),
> +		  SUNXI_FUNCTION(0x5, "vdevice"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 1)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 2),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart2"),
> +		  SUNXI_FUNCTION(0x3, "jtag0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 2)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 3),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart2"),
> +		  SUNXI_FUNCTION(0x3, "jtag0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 3)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 4),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart0"),
> +		  SUNXI_FUNCTION(0x3, "pwm0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 4)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 5),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart0"),
> +		  SUNXI_FUNCTION(0x3, "pwm1"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 5)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 6),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "twi0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 6)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 7),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "twi0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 7)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 10),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "spi1"),
> +		  SUNXI_FUNCTION(0x3, "uart4"),
> +		  SUNXI_FUNCTION(0x4, "pwm2"),
> +		  SUNXI_FUNCTION(0x5, "wifi_uart0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 10)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 11),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "spi1"),
> +		  SUNXI_FUNCTION(0x3, "uart4"),
> +		  SUNXI_FUNCTION(0x4, "pwm3"),
> +		  SUNXI_FUNCTION(0x5, "wifi_uart0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 11)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 12),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s1"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 12)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 13),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s1"),
> +		  SUNXI_FUNCTION(0x4, "pwm4"),
> +		  SUNXI_FUNCTION(0x5, "uart3"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 13)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 14),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s1"),
> +		  SUNXI_FUNCTION(0x4, "pwm5"),
> +		  SUNXI_FUNCTION(0x5, "uart3"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 14)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 15),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s1"),
> +		  SUNXI_FUNCTION(0x3, "ac0"),
> +		  SUNXI_FUNCTION(0x4, "twi1"),
> +		  SUNXI_FUNCTION(0x5, "uart3"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 15)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 16),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s1"),
> +		  SUNXI_FUNCTION(0x3, "ac0"),
> +		  SUNXI_FUNCTION(0x4, "twi1"),
> +		  SUNXI_FUNCTION(0x5, "uart3"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 16)),
> +	/*Hole*/
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 0),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),
> +		  SUNXI_FUNCTION(0x4, "spi0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled")),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 1),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),
> +		  SUNXI_FUNCTION(0x3, "sdc2"),
> +		  SUNXI_FUNCTION(0x4, "spi0"),
> +		  SUNXI_FUNCTION(0x5, "sdc3"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled")),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 2),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),
> +		  SUNXI_FUNCTION(0x4, "spi0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled")),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 3),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),
> +		  SUNXI_FUNCTION(0x4, "spi0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled")),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 4),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),
> +		  SUNXI_FUNCTION(0x3, "sdc2"),
> +		  SUNXI_FUNCTION(0x5, "sdc3"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled")),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 5),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),
> +		  SUNXI_FUNCTION(0x3, "sdc2"),
> +		  SUNXI_FUNCTION(0x5, "sdc3"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled")),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 6),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),
> +		  SUNXI_FUNCTION(0x3, "sdc2"),
> +		  SUNXI_FUNCTION(0x4, "uart1"),
> +		  SUNXI_FUNCTION(0x5, "sdc3"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled")),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 7),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),
> +		  SUNXI_FUNCTION(0x3, "sdc2"),
> +		  SUNXI_FUNCTION(0x4, "uart1"),
> +		  SUNXI_FUNCTION(0x5, "sdc3"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled")),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 8),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),
> +		  SUNXI_FUNCTION(0x3, "sdc2"),
> +		  SUNXI_FUNCTION(0x4, "uart1"),
> +		  SUNXI_FUNCTION(0x5, "sdc3"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled")),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 9),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),
> +		  SUNXI_FUNCTION(0x3, "sdc2"),
> +		  SUNXI_FUNCTION(0x4, "uart1"),
> +		  SUNXI_FUNCTION(0x5, "sdc3"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled")),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 10),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),
> +		  SUNXI_FUNCTION(0x3, "sdc2"),
> +		  SUNXI_FUNCTION(0x4, "uart1"),
> +		  SUNXI_FUNCTION(0x5, "sdc3"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled")),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 11),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),
> +		  SUNXI_FUNCTION(0x3, "sdc2"),
> +		  SUNXI_FUNCTION(0x4, "uart1"),
> +		  SUNXI_FUNCTION(0x5, "sdc3"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled")),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 12),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),
> +		  SUNXI_FUNCTION(0x3, "sdc2"),
> +		  SUNXI_FUNCTION(0x4, "uart1"),
> +		  SUNXI_FUNCTION(0x5, "sdc3"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled")),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 13),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),
> +		  SUNXI_FUNCTION(0x3, "sdc2"),
> +		  SUNXI_FUNCTION(0x4, "uart1"),
> +		  SUNXI_FUNCTION(0x5, "sdc3"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled")),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 14),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),
> +		  SUNXI_FUNCTION(0x3, "sdc2"),
> +		  SUNXI_FUNCTION(0x5, "sdc3"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled")),
> +	/* Hole */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 0),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x3, "uart1"),
> +		  SUNXI_FUNCTION(0x4, "csi0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 0)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 1),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x3, "uart1"),
> +		  SUNXI_FUNCTION(0x4, "csi0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 1)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 2),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x3, "uart5"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 2)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 3),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x3, "uart5"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 3)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 4),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x3, "uart5"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 4)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 5),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x3, "uart5"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 5)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 6),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 6)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 7),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 7)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 8),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x3, "uart1"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 8)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 9),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x3, "uart1"),
> +		  SUNXI_FUNCTION(0x4, "csi0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 9)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 10),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 10)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 11),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 11)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 12),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 12)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 13),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x4, "csi0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 13)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 14),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x4, "csi0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 14)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 15),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x4, "csi0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 15)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 16),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x4, "csi0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 16)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 17),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x4, "csi0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 17)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 18),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x4, "csi0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 18)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 19),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x4, "csi0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 19)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 20),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x4, "csi0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 20)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 21),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x4, "csi0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 21)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 22),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x4, "csi0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 22)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 23),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x4, "csi0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 23)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 24),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x3, "spi2"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 24)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 25),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x3, "spi2"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 25)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 26),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x3, "spi2"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 26)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 27),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd0"),
> +		  SUNXI_FUNCTION(0x3, "spi2"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 27)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 28),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "pwm0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 28)),
> +
> +	/* Hole */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 0),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "sdc0"),
> +		  SUNXI_FUNCTION(0x4, "jtag0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 0)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 1),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "sdc0"),
> +		  SUNXI_FUNCTION(0x4, "jtag0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 1)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 2),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "sdc0"),
> +		  SUNXI_FUNCTION(0x4, "uart0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 2)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 3),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "sdc0"),
> +		  SUNXI_FUNCTION(0x4, "jtag0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 3)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 4),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "sdc0"),
> +		  SUNXI_FUNCTION(0x4, "uart0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 4)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 5),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "sdc0"),
> +		  SUNXI_FUNCTION(0x4, "jtag0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 5)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 6),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 6)),
> +
> +	/* Hole */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 0),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "pwm6"),
> +		  SUNXI_FUNCTION(0x3, "dmic0"),
> +		  SUNXI_FUNCTION(0x4, "spi1"),
> +		  SUNXI_FUNCTION(0x5, "sdc1"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 0)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 1),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "pwm7"),
> +		  SUNXI_FUNCTION(0x3, "dmic0"),
> +		  SUNXI_FUNCTION(0x4, "spi1"),
> +		  SUNXI_FUNCTION(0x5, "sdc1"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 1)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 2),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "twi1"),
> +		  SUNXI_FUNCTION(0x3, "dmic0"),
> +		  SUNXI_FUNCTION(0x4, "spi1"),
> +		  SUNXI_FUNCTION(0x5, "sdc1"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 2)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 3),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "twi1"),
> +		  SUNXI_FUNCTION(0x3, "dmic0"),
> +		  SUNXI_FUNCTION(0x4, "spi1"),
> +		  SUNXI_FUNCTION(0x5, "sdc1"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 1)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 4),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "twi2"),
> +		  SUNXI_FUNCTION(0x3, "dmic0"),
> +		  SUNXI_FUNCTION(0x4, "spi1"),
> +		  SUNXI_FUNCTION(0x5, "sdc1"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 4)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 5),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "twi2"),
> +		  SUNXI_FUNCTION(0x4, "ac0"),
> +		  SUNXI_FUNCTION(0x5, "sdc1"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 5)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 6),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 6)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 7),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s0"),
> +		  SUNXI_FUNCTION(0x3, "dsd0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 7)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 8),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s0"),
> +		  SUNXI_FUNCTION(0x3, "dsd0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 8)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 9),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s0"),
> +		  SUNXI_FUNCTION(0x3, "dsd0"),
> +		  SUNXI_FUNCTION(0x4, "bist_result0"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 9)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 10),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s0"),
> +		  SUNXI_FUNCTION(0x3, "dsd0"),
> +		  SUNXI_FUNCTION(0x4, "bist_result1"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 10)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 11),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "spdif0"),
> +		  SUNXI_FUNCTION(0x4, "pll_lock_dbg"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 11)),
> +
> +};
> +
> +static const struct sunxi_pinctrl_desc sun8i_b288_pinctrl_data = {
> +	.pins = sun8i_b288_pins,
> +	.npins = ARRAY_SIZE(sun8i_b288_pins),
> +	.irq_banks = 4,
> +};
> +
> +static int sun8i_b288_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return sunxi_pinctrl_init(pdev,
> +				  &sun8i_b288_pinctrl_data);
> +}
> +
> +static const struct of_device_id sun8i_b288_pinctrl_match[] = {
> +	{ .compatible = "allwinner,sun8i-b288-pinctrl", },
> +	{}
> +};
> +
> +static struct platform_driver sun8i_b288_pinctrl_driver = {
> +	.probe	= sun8i_b288_pinctrl_probe,
> +	.driver	= {
> +		.name		= "sun8i-b288-pinctrl",
> +		.of_match_table	= sun8i_b288_pinctrl_match,
> +	},
> +};
> +builtin_platform_driver(sun8i_b288_pinctrl_driver);

