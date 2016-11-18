From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v11 3/6] x86/intel-ivi: Add Intel In-Vehicle Infotainment
 (IVI) systems used in cars support
Date: Fri, 18 Nov 2016 10:20:39 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1611181019030.3615@nanos>
References: <1479446550-28677-1-git-send-email-jui.nee.tan@intel.com> <1479446550-28677-4-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:51259 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752627AbcKRJYa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2016 04:24:30 -0500
In-Reply-To: <1479446550-28677-4-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, dvhart@infradead.org, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com, yunying.sun@intel.com

On Fri, 18 Nov 2016, Tan Jui Nee wrote:
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index bada636..6019755 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -512,6 +512,16 @@ config X86_INTEL_CE
>  	  This option compiles in support for the CE4100 SOC for settop
>  	  boxes and media devices.
>  
> +config X86_INTEL_IVI
> +	bool "Intel In-Vehicle Infotainment (IVI) systems used in cars"
> +	depends on X86 && PCI
> +	select P2SB
> +	---help---
> +	  Select this option to enable MMIO BAR access over the P2SB for
> +	  non-ACPI Intel Apollo Lake SoC platforms. This driver uses the P2SB
> +	  hide/unhide mechanism cooperatively to pass the PCI BAR address to
> +	  the platform driver, currently GPIO.

Errm. INTEL_IVI does not enable MMIO BAR access over P2SB, CONFIG_P2SB does.

Thanks,

	tglx
