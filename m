From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH v6 1/3] x86/platform/p2sb: New Primary to Sideband bridge
 support driver for Intel SOC's
Date: Thu, 14 Jul 2016 20:00:59 -0400
Message-ID: <CAP=VYLrAPm--4x=CWMri4o8cvL23q8spM0q5Z9nOXM5YzpgRTA@mail.gmail.com>
References: <1468483919-31258-1-git-send-email-jui.nee.tan@intel.com> <1468483919-31258-2-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:32939 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751224AbcGOABb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jul 2016 20:01:31 -0400
In-Reply-To: <1468483919-31258-2-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, "tglx@linutronix.de" <tglx@linutronix.de>, mingo@redhat.com, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, ptyser@xes-inc.com, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

On Thu, Jul 14, 2016 at 4:11 AM, Tan Jui Nee <jui.nee.tan@intel.com> wrote:
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> There is already one and at least one more user coming which
> require an access to Primary to Sideband bridge (P2SB) in order
> to get IO or MMIO bar hidden by BIOS.
> Create a driver to access P2SB for x86 devices.
>
> Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> Changes in V6:
>         - No change
>
> Changes in V5:
>         - No change
>
> Changes in V4:
>         - Move Kconfig option CONFIG_X86_INTEL_NON_ACPI from
>           [PATCH 2/3] x86/platform/p2sb: New Primary to Sideband bridge support driver for Intel SOC's
>           to
>           [PATCH 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake GPIO pinctrl in non-ACPI system
>           since the config is used in latter patch.
>
> Changes in V3:
>         - No change
>
> Changes in V2:
>         - Add new config option CONFIG_X86_INTEL_NON_ACPI and "select PINCTRL"
>           to fix kbuildbot error
>
>  arch/x86/Kconfig                 |  4 ++
>  arch/x86/include/asm/p2sb.h      | 27 +++++++++++
>  arch/x86/platform/intel/Makefile |  1 +
>  arch/x86/platform/intel/p2sb.c   | 99 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 131 insertions(+)
>  create mode 100644 arch/x86/include/asm/p2sb.h
>  create mode 100644 arch/x86/platform/intel/p2sb.c
>
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index d9a94da..d305d81 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -604,6 +604,10 @@ config IOSF_MBI_DEBUG
>
>           If you don't require the option or are in doubt, say N.
>
> +config P2SB
> +       tristate

OK, this is tristate, but then....

> +       depends on PCI
> +
>  config X86_RDC321X
>         bool "RDC R-321x SoC"
>         depends on X86_32
> diff --git a/arch/x86/include/asm/p2sb.h b/arch/x86/include/asm/p2sb.h
> new file mode 100644
> index 0000000..686e07b
> --- /dev/null
> +++ b/arch/x86/include/asm/p2sb.h
> @@ -0,0 +1,27 @@
> +/*
> + * Primary to Sideband bridge (P2SB) access support
> + */
> +
> +#ifndef P2SB_SYMS_H
> +#define P2SB_SYMS_H
> +
> +#include <linux/ioport.h>
> +#include <linux/pci.h>
> +
> +#if IS_ENABLED(CONFIG_P2SB)
> +
> +int p2sb_bar(struct pci_dev *pdev, unsigned int devfn,
> +       struct resource *res);
> +
> +#else /* CONFIG_P2SB is not set */
> +
> +static inline
> +int p2sb_bar(struct pci_dev *pdev, unsigned int devfn,
> +       struct resource *res)
> +{
> +       return -ENODEV;
> +}
> +
> +#endif /* CONFIG_P2SB */
> +
> +#endif /* P2SB_SYMS_H */
> diff --git a/arch/x86/platform/intel/Makefile b/arch/x86/platform/intel/Makefile
> index b878032..dbf9f10 100644
> --- a/arch/x86/platform/intel/Makefile
> +++ b/arch/x86/platform/intel/Makefile
> @@ -1 +1,2 @@
>  obj-$(CONFIG_IOSF_MBI)                 += iosf_mbi.o
> +obj-$(CONFIG_P2SB)                     += p2sb.o
> diff --git a/arch/x86/platform/intel/p2sb.c b/arch/x86/platform/intel/p2sb.c
> new file mode 100644
> index 0000000..8be47a4
> --- /dev/null
> +++ b/arch/x86/platform/intel/p2sb.c
> @@ -0,0 +1,99 @@
> +/*
> + * Primary to Sideband bridge (P2SB) driver
> + *
> + * Copyright (c) 2016, Intel Corporation.
> + *
> + * Authors: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> + *                     Jonathan Yong <jonathan.yong@intel.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + */
> +
> +#include <linux/ioport.h>
> +#include <linux/module.h>

...and module.h is included, but yet...

> +#include <linux/pci.h>
> +#include <linux/spinlock.h>
> +
> +#include <asm/p2sb.h>
> +
> +#define SBREG_BAR      0x10
> +#define SBREG_HIDE     0xe1
> +
> +static DEFINE_SPINLOCK(p2sb_spinlock);
> +
> +/*
> + * p2sb_bar - Get Primary to Sideband bridge (P2SB) BAR
> + * @pdev:      PCI device to get PCI bus to communicate with
> + * @devfn:     PCI device and function to communicate with
> + * @res:       resources to be filled in
> + *
> + * The BIOS prevents the P2SB device from being enumerated by the PCI
> + * subsystem, so we need to unhide and hide it back to lookup the P2SB BAR.
> + *
> + * Locking is handled by spinlock - cannot sleep.
> + *
> + * Return:
> + * 0 on success or appropriate errno value on error.
> + */
> +int p2sb_bar(struct pci_dev *pdev, unsigned int devfn,
> +       struct resource *res)
> +{
> +       u32 base_addr;
> +       u64 base64_addr;
> +       unsigned long flags;
> +
> +       if (!res)
> +               return -EINVAL;
> +
> +       spin_lock(&p2sb_spinlock);
> +
> +       /* Unhide the P2SB device */
> +       pci_bus_write_config_byte(pdev->bus, devfn, SBREG_HIDE, 0x00);
> +
> +       /* Check if device present */
> +       pci_bus_read_config_dword(pdev->bus, devfn, 0, &base_addr);
> +       if (base_addr == 0xffffffff || base_addr == 0x00000000) {
> +               spin_unlock(&p2sb_spinlock);
> +               dev_warn(&pdev->dev, "P2SB device access disabled by BIOS?\n");
> +               return -ENODEV;
> +       }
> +
> +       /* Get IO or MMIO BAR */
> +       pci_bus_read_config_dword(pdev->bus, devfn, SBREG_BAR, &base_addr);
> +       if ((base_addr & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO) {
> +               flags = IORESOURCE_IO;
> +               base64_addr = base_addr & PCI_BASE_ADDRESS_IO_MASK;
> +       } else {
> +               flags = IORESOURCE_MEM;
> +               base64_addr = base_addr & PCI_BASE_ADDRESS_MEM_MASK;
> +               if (base_addr & PCI_BASE_ADDRESS_MEM_TYPE_64) {
> +                       flags |= IORESOURCE_MEM_64;
> +                       pci_bus_read_config_dword(pdev->bus, devfn,
> +                               SBREG_BAR + 4, &base_addr);
> +                       base64_addr |= (u64)base_addr << 32;
> +               }
> +       }
> +
> +       /* Hide the P2SB device */
> +       pci_bus_write_config_byte(pdev->bus, devfn, SBREG_HIDE, 0x01);
> +
> +       spin_unlock(&p2sb_spinlock);
> +
> +       /* User provides prefilled resources */
> +       res->start += (resource_size_t)base64_addr;
> +       res->end += (resource_size_t)base64_addr;
> +       res->flags = flags;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(p2sb_bar);
> +
> +MODULE_LICENSE("GPL");

...the above is the only modular "use" that I can find.  So is the
tristate bogus?   Without a module_init and a module_exit I am
confused....

I just finished an audit of arch/x86 for bogus uses of module.h
so I'd like to ensure we don't add more.

Thanks,
Paul.
--

> --
> 1.9.1
>
