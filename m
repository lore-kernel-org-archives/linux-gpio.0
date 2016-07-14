From: "Tan, Jui Nee" <jui.nee.tan@intel.com>
Subject: RE: [PATCH v5 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake
 GPIO pinctrl in non-ACPI system
Date: Thu, 14 Jul 2016 08:10:08 +0000
Message-ID: <0158A29DB680F54A88142ED28D55B1D00826E3BF@PGSMSX107.gar.corp.intel.com>
References: <1467100608-11549-1-git-send-email-jui.nee.tan@intel.com>
 <1467100608-11549-4-git-send-email-jui.nee.tan@intel.com>
 <20160628081917.GF1711@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:41241 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751284AbcGNIQg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jul 2016 04:16:36 -0400
In-Reply-To: <20160628081917.GF1711@lahna.fi.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "ptyser@xes-inc.com" <ptyser@xes-inc.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yong, Jonathan" <jonathan.yong@intel.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Voon, Weifeng" <weifeng.voon@intel.com>, "Wan Mohamad, Wan Ahmad Zainie" <wan.ahmad.zainie.wan.mohamad@intel.com>



> -----Original Message-----
> From: Mika Westerberg [mailto:mika.westerberg@linux.intel.com]
> Sent: Tuesday, June 28, 2016 4:19 PM
> To: Tan, Jui Nee <jui.nee.tan@intel.com>
> Cc: heikki.krogerus@linux.intel.com; andriy.shevchenko@linux.intel.com;
> tglx@linutronix.de; mingo@redhat.com; hpa@zytor.com; x86@kernel.org;
> ptyser@xes-inc.com; lee.jones@linaro.org; linus.walleij@linaro.org; linux-
> gpio@vger.kernel.org; linux-kernel@vger.kernel.org; Yong, Jonathan
> <jonathan.yong@intel.com>; Yu, Ong Hock <ong.hock.yu@intel.com>; Voon,
> Weifeng <weifeng.voon@intel.com>; Wan Mohamad, Wan Ahmad Zainie
> <wan.ahmad.zainie.wan.mohamad@intel.com>
> Subject: Re: [PATCH v5 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake
> GPIO pinctrl in non-ACPI system
> 
> On Tue, Jun 28, 2016 at 03:56:48PM +0800, Tan Jui Nee wrote:
> > +config X86_INTEL_APL
> > +	bool "Non-ACPI support for Intel Apollo Lake platforms"
> > +	select PINCTRL
> > +	---help---
> > +	  Select this option to enable MMIO BAR access over the P2SB for
> > +	  non-ACPI Intel Apollo Lake SoC platforms. This driver uses the P2SB
> > +	  hide/unhide mechanism cooperatively to pass the PCI BAR address
> to
> > +	  the platform driver, currently GPIO.
> > +
> 
> Sorry but IMHO this still does not explain the option clearly enough.
> You are using this in some automotive IVI system with specialized
> bootloader, correct? Why not use that here instead?
> 
> Something along the lines of
> 
>   config X86_INTEL_IVI
>       bool "Intel in-vehicle infotainment (IVI) systems used in cars"
Thanks for your comments. The changes will be applied in next patch-set.
