From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v5 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake
 GPIO pinctrl in non-ACPI system
Date: Tue, 28 Jun 2016 11:19:17 +0300
Message-ID: <20160628081917.GF1711@lahna.fi.intel.com>
References: <1467100608-11549-1-git-send-email-jui.nee.tan@intel.com>
 <1467100608-11549-4-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1467100608-11549-4-git-send-email-jui.nee.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 28, 2016 at 03:56:48PM +0800, Tan Jui Nee wrote:
> +config X86_INTEL_APL
> +	bool "Non-ACPI support for Intel Apollo Lake platforms"
> +	select PINCTRL
> +	---help---
> +	  Select this option to enable MMIO BAR access over the P2SB for
> +	  non-ACPI Intel Apollo Lake SoC platforms. This driver uses the P2SB
> +	  hide/unhide mechanism cooperatively to pass the PCI BAR address to
> +	  the platform driver, currently GPIO.
> +

Sorry but IMHO this still does not explain the option clearly enough.
You are using this in some automotive IVI system with specialized
bootloader, correct? Why not use that here instead?

Something along the lines of

  config X86_INTEL_IVI
      bool "Intel in-vehicle infotainment (IVI) systems used in cars"
