From: "Tan, Jui Nee" <jui.nee.tan@intel.com>
Subject: RE: [PATCH v3 2/3] x86/platform/p2sb: New Primary to Sideband
 bridge support driver for Intel SOC's
Date: Tue, 28 Jun 2016 07:44:37 +0000
Message-ID: <0158A29DB680F54A88142ED28D55B1D0082471DA@PGSMSX107.gar.corp.intel.com>
References: <1465282553-28396-1-git-send-email-jui.nee.tan@intel.com>
 <1465282553-28396-3-git-send-email-jui.nee.tan@intel.com>
 <20160609140538.GL1791@lahna.fi.intel.com>
 <1465826071.30123.18.camel@linux.intel.com>
 <20160613142514.GA1740@lahna.fi.intel.com>
 <1465831152.30123.21.camel@linux.intel.com>
 <20160613155907.GB1740@lahna.fi.intel.com>
 <0158A29DB680F54A88142ED28D55B1D008244AF1@PGSMSX107.gar.corp.intel.com>
 <20160621072339.GT1739@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:55256 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751673AbcF1HpE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2016 03:45:04 -0400
In-Reply-To: <20160621072339.GT1739@lahna.fi.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "ptyser@xes-inc.com" <ptyser@xes-inc.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "Yong, Jonathan" <jonathan.yong@intel.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Voon, Weifeng" <weifeng.voon@intel.com>, "Wan Mohamad, Wan Ahmad Zainie" <wan.ahmad.zainie.wan.mohamad@intel.com>



> -----Original Message-----
> From: Mika Westerberg [mailto:mika.westerberg@linux.intel.com]
> Sent: Tuesday, June 21, 2016 3:24 PM
> To: Tan, Jui Nee <jui.nee.tan@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>;
> heikki.krogerus@linux.intel.com; tglx@linutronix.de; mingo@redhat.com;
> hpa@zytor.com; x86@kernel.org; ptyser@xes-inc.com;
> lee.jones@linaro.org; linux-gpio@vger.kernel.org; linux-
> kernel@vger.kernel.org; Linus Walleij <linus.walleij@linaro.org>; Yong,
> Jonathan <jonathan.yong@intel.com>; Yu, Ong Hock
> <ong.hock.yu@intel.com>; Voon, Weifeng <weifeng.voon@intel.com>; Wan
> Mohamad, Wan Ahmad Zainie
> <wan.ahmad.zainie.wan.mohamad@intel.com>
> Subject: Re: [PATCH v3 2/3] x86/platform/p2sb: New Primary to Sideband
> bridge support driver for Intel SOC's
> 
> On Tue, Jun 21, 2016 at 05:03:20AM +0000, Tan, Jui Nee wrote:
> > > Maybe, or make it modular and use MODULE_DEVICE_TABLE(x86cpu, ...)
> > > to match the corresponding CPUs.
> >
> > We need CONFIG_X86_INTEL_NON_ACPI Kconfig option to select
> CONFIG_PINCTRL.
> > This is to solve kbuidbot complaint about kernel configuration, i.e.
> > CONFIG_PINCTRL=n. Appreciate if you could advise something on this.
> 
> Good point.
> 
> Then I guess you might add similar Kconfig option but can you call it
> something else than CONFIG_X86_INTEL_NON_ACPI. Perhaps something
> that relates to the actual product so distro people can then decide whether
> they want to support it or not. Along the lines of CONFIG_X86_INTEL_CE and
> so on.
Thanks for your suggestion. CONFIG_X86_INTEL_NON_ACPI will be renamed
to CONFIG_X86_INTEL_APL in next patch-set.
