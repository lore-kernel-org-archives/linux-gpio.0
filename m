From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH V7 4/8] MIPS: Move Loongson GPIO driver to drivers/gpio
Date: Thu, 26 Feb 2015 18:29:36 +0900
Message-ID: <CAAVeFuLgu8W7EaxbZHR9cnJ=jpycYEXZm=ccEN_e-NHFZq-smw@mail.gmail.com>
References: <1422003369-3019-1-git-send-email-chenhc@lemote.com> <1422003369-3019-2-git-send-email-chenhc@lemote.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:34138 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752696AbbBZJ35 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Feb 2015 04:29:57 -0500
Received: by iecrp18 with SMTP id rp18so12453920iec.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2015 01:29:57 -0800 (PST)
In-Reply-To: <1422003369-3019-2-git-send-email-chenhc@lemote.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Huacai Chen <chenhc@lemote.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, John Crispin <john@phrozen.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips <linux-mips@linux-mips.org>, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jan 23, 2015 at 5:56 PM, Huacai Chen <chenhc@lemote.com> wrote:
> Move Loongson-2's GPIO driver to drivers/gpio and add Kconfig options.
>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>

Same here, this patch places GPIO driver code where it should be, but
we need to ensure there is no breakage before taking this code.

> ---
>  arch/mips/configs/lemote2f_defconfig               |    1 +
>  arch/mips/loongson/common/Makefile                 |    1 -
>  drivers/gpio/Kconfig                               |    6 ++++++
>  drivers/gpio/Makefile                              |    1 +
>  .../common/gpio.c => drivers/gpio/gpio-loongson.c  |    0
>  5 files changed, 8 insertions(+), 1 deletions(-)
>  rename arch/mips/loongson/common/gpio.c => drivers/gpio/gpio-loongson.c (100%)
>
> diff --git a/arch/mips/configs/lemote2f_defconfig b/arch/mips/configs/lemote2f_defconfig
> index e51aad9..0cbc986 100644
> --- a/arch/mips/configs/lemote2f_defconfig
> +++ b/arch/mips/configs/lemote2f_defconfig
> @@ -171,6 +171,7 @@ CONFIG_SERIAL_8250_FOURPORT=y
>  CONFIG_LEGACY_PTY_COUNT=16
>  CONFIG_HW_RANDOM=y
>  CONFIG_RTC=y
> +CONFIG_GPIO_LOONGSON=y
>  CONFIG_THERMAL=y
>  CONFIG_MEDIA_SUPPORT=m
>  CONFIG_VIDEO_DEV=m
> diff --git a/arch/mips/loongson/common/Makefile b/arch/mips/loongson/common/Makefile
> index d87e033..e70c33f 100644
> --- a/arch/mips/loongson/common/Makefile
> +++ b/arch/mips/loongson/common/Makefile
> @@ -4,7 +4,6 @@
>
>  obj-y += setup.o init.o cmdline.o env.o time.o reset.o irq.o \
>      bonito-irq.o mem.o machtype.o platform.o
> -obj-$(CONFIG_GPIOLIB) += gpio.o
>  obj-$(CONFIG_PCI) += pci.o
>
>  #
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 633ec21..3ac5473 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -475,6 +475,12 @@ config GPIO_GRGPIO
>           Select this to support Aeroflex Gaisler GRGPIO cores from the GRLIB
>           VHDL IP core library.
>
> +config GPIO_LOONGSON
> +       tristate "Loongson-2 GPIO support"
> +       depends on CPU_LOONGSON2
> +       help
> +         driver for GPIO functionality on Loongson-2F processors.
> +
>  config GPIO_TB10X
>         bool
>         select GENERIC_IRQ_CHIP
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 81755f1..caccfad 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -41,6 +41,7 @@ obj-$(CONFIG_GPIO_JANZ_TTL)   += gpio-janz-ttl.o
>  obj-$(CONFIG_GPIO_KEMPLD)      += gpio-kempld.o
>  obj-$(CONFIG_ARCH_KS8695)      += gpio-ks8695.o
>  obj-$(CONFIG_GPIO_INTEL_MID)   += gpio-intel-mid.o
> +obj-$(CONFIG_GPIO_LOONGSON)    += gpio-loongson.o
>  obj-$(CONFIG_GPIO_LP3943)      += gpio-lp3943.o
>  obj-$(CONFIG_ARCH_LPC32XX)     += gpio-lpc32xx.o
>  obj-$(CONFIG_GPIO_LYNXPOINT)   += gpio-lynxpoint.o
> diff --git a/arch/mips/loongson/common/gpio.c b/drivers/gpio/gpio-loongson.c
> similarity index 100%
> rename from arch/mips/loongson/common/gpio.c
> rename to drivers/gpio/gpio-loongson.c
> --
> 1.7.7.3
>
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
