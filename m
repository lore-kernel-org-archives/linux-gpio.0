From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3 2/3] x86/platform/p2sb: New Primary to Sideband bridge
 support driver for Intel SOC's
Date: Thu, 9 Jun 2016 17:05:38 +0300
Message-ID: <20160609140538.GL1791@lahna.fi.intel.com>
References: <1465282553-28396-1-git-send-email-jui.nee.tan@intel.com>
 <1465282553-28396-3-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:56328 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751212AbcFIOGm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 9 Jun 2016 10:06:42 -0400
Content-Disposition: inline
In-Reply-To: <1465282553-28396-3-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

On Tue, Jun 07, 2016 at 02:55:52PM +0800, Tan Jui Nee wrote:
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
>  arch/x86/Kconfig                 | 14 ++++++
>  arch/x86/include/asm/p2sb.h      | 27 +++++++++++
>  arch/x86/platform/intel/Makefile |  1 +
>  arch/x86/platform/intel/p2sb.c   | 99 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 141 insertions(+)
>  create mode 100644 arch/x86/include/asm/p2sb.h
>  create mode 100644 arch/x86/platform/intel/p2sb.c
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 2dc18605..589045e 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -606,6 +606,20 @@ config IOSF_MBI_DEBUG
>  
>  	  If you don't require the option or are in doubt, say N.
>  
> +config X86_INTEL_NON_ACPI
> +	bool "Enable support non-ACPI Intel platforms"
> +	select PINCTRL
> +	---help---
> +	  Select this option to enables MMIO BAR access over the P2SB for
> +	  non-ACPI Intel SoC platforms. This driver uses the P2SB hide/unhide
> +	  mechanism cooperatively to pass the PCI BAR address to the platform
> +	  driver, currently GPIO on the following SoC products.
> +	   - Apollo Lake

Why do we need Kconfig option for this?

I think better is to make P2SB available on CPUs which have one, and
that can be detected runtime. If P2SB is not available then p2sb_bar()
returns -ENODEV.
