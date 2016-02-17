From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: Rework PFC GPIO support
Date: Wed, 17 Feb 2016 09:36:19 +0100
Message-ID: <CAMuHMdXJL+YHkDLXW50SZhZLAnK0mhZ+P77H1ei6mHnNVvWAgw@mail.gmail.com>
References: <20160217081549.17344.77173.sendpatchset@little-apple>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:35784 "EHLO
	mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756672AbcBQIgU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Feb 2016 03:36:20 -0500
In-Reply-To: <20160217081549.17344.77173.sendpatchset@little-apple>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Hi Magnus,

On Wed, Feb 17, 2016 at 9:15 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> The sh-pfc pinctrl driver is currently handling SoC-specific
> PFC hardware blocks on ARM64, ARM and SH architectures.
>
> For older SoCs using SH cores and some 32-bit ARM SoCs the PFC
> hardware also provides GPIO functionality. On the majority of
> 32-bit ARM SoCs from Renesas and so far all ARM64 SoCs the GPIO
> feature is provided by separate hardware blocks.
>
> So far GPIO support in the PFC driver has been compiled-in for
> the majority of the SoCs, but with this patch applied the SoCs
> with PFC support may select from one of the following:
>  - CONFIG_PINCTRL_SH_PFC - Used if PFC lacks GPIO hardware
>  - CONFIG_PINCTRL_SH_PFC_GPIO - Used if PFC includes GPIO support
>
> This patch results in the following changes:
>  - The GPIO functionality is only compiled-in on relevant SoCs
>  - The number of lines of code is reduced
>
> Build tested using the following configurations:
>  - r8a7795 -> CONFIG_PINCTRL_SH_PFC_GPIO=n -> OK (ARM64)
>  - r8a7790 -> CONFIG_PINCTRL_SH_PFC_GPIO=n -> OK (ARM)
>  - r8a7790 + r8a7740 -> CONFIG_PINCTRL_SH_PFC_GPIO=y -> OK (ARM)
>  - r8a7740 -> CONFIG_PINCTRL_SH_PFC_GPIO=y -> OK (ARM)
>  - sh7751 -> CONFIG_PINCTRL_SH_PFC=n -> OK (SH rts7751r2d1)
>  - sh7724 -> CONFIG_PINCTRL_SH_PFC_GPIO=y -> OK (SH ecovec24)
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thanks, looks fine to me!

I can queue this up in sh-pfc-for-v4.6 if other people like it, too.

> ---
>
>  Changes since V1:
>  - Simplied Makefile bits to remove sh-pfc-objs and use new Kconfig symbol
>
>  drivers/pinctrl/sh-pfc/Kconfig  |   54 ++++++++++++++-------------------------
>  drivers/pinctrl/sh-pfc/Makefile |    7 +----
>  drivers/pinctrl/sh-pfc/core.c   |    4 +-
>  3 files changed, 24 insertions(+), 41 deletions(-)
>
> --- 0001/drivers/pinctrl/sh-pfc/Kconfig
> +++ work/drivers/pinctrl/sh-pfc/Kconfig 2016-02-17 16:23:21.630513000 +0900
> @@ -5,7 +5,6 @@
>  if ARCH_SHMOBILE || SUPERH
>
>  config PINCTRL_SH_PFC
> -       select GPIO_SH_PFC if ARCH_REQUIRE_GPIOLIB
>         select PINMUX
>         select PINCONF
>         select GENERIC_PINCONF
> @@ -13,12 +12,12 @@ config PINCTRL_SH_PFC
>         help
>           This enables pin control drivers for SH and SH Mobile platforms
>
> -config GPIO_SH_PFC
> -       bool "SuperH PFC GPIO support"
> -       depends on PINCTRL_SH_PFC && GPIOLIB
> +config PINCTRL_SH_PFC_GPIO
> +       select GPIOLIB
> +       select PINCTRL_SH_PFC
> +       def_bool n

"n" is the default, so this can be just "bool".
I can easily fix that myself when applying, though...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
