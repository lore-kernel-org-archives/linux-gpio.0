From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v8 3/6] x86/intel-ivi: Add Intel In-Vehicle Infotainment
 (IVI) systems used in cars support
Date: Wed, 12 Oct 2016 13:29:33 +0300
Message-ID: <1476268173.11323.450.camel@linux.intel.com>
References: <1476255066-22653-1-git-send-email-jui.nee.tan@intel.com>
         <1476255066-22653-4-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:10288 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932395AbcJLKci (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Oct 2016 06:32:38 -0400
In-Reply-To: <1476255066-22653-4-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>, mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

On Wed, 2016-10-12 at 14:51 +0800, Tan Jui Nee wrote:
> Add support for non ACPI system, such as system that uses Advanced
> Boot
> Loader (ABL) whereby a platform device has to be created in order to
> bind
> with PINCTRL/GPIO.
> 
> At the moment, Intel Apollo Lake SoC requires P2SB driver to hide and
> unhide P2SB to lookup P2SB BAR and pass the PCI BAR address to GPIO.

I dunno if this patch would go as a last in the series.

> 
> +config X86_INTEL_IVI
> +	bool "Intel In-Vehicle Infotainment (IVI) systems used in
> cars"
> +	---help---
> +	  Select this option to enable MMIO BAR access over the P2SB
> for
> +	  non-ACPI Intel Apollo Lake SoC platforms.

This sounds not what the option is used for.
What I see from the code as simple as "Enable support of Intel IVI
systems. This enables necessary drivers and libraries which are used in
IVI systems."


>  This driver uses the P2SB
> +	  hide/unhide mechanism cooperatively to pass the PCI BAR
> address to
> +	  the platform driver, currently GPIO.


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
