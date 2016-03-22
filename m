From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.4.x
Date: Tue, 22 Mar 2016 17:51:59 +0200
Message-ID: <20160322155159.GC2099@lahna.fi.intel.com>
References: <CACPiFCKv=QJ0t5e=9Wm4cC4Spynx-tVCiabL7AcbcOkp_w47fQ@mail.gmail.com>
 <20160322152218.GA2099@lahna.fi.intel.com>
 <CACPiFC+hDF0+9vPCrhvo079E6RCVVmZXTS1ziS-jHAAZJQ+wNg@mail.gmail.com>
 <20160322154950.GB2099@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:64840 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752213AbcCVPwF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 22 Mar 2016 11:52:05 -0400
Content-Disposition: inline
In-Reply-To: <20160322154950.GB2099@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Langhoff <martin.langhoff@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Tue, Mar 22, 2016 at 05:49:50PM +0200, Mika Westerberg wrote:
> On Tue, Mar 22, 2016 at 11:41:38AM -0400, Martin Langhoff wrote:
> > On Tue, Mar 22, 2016 at 11:22 AM, Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > > I think this is a known issue.
> > >
> > > Please disable dw_dmac from your .config (or blacklist the module):
> > >
> > >   CONFIG_DW_DMAC_CORE=n
> > >   CONFIG_DW_DMAC=n
> > >
> > > You can also enable pinctrl-cherryview.c.
> > 
> > Thanks for the suggestion. Did not complete boot however, got a
> > slightly different call trace, but still no go. As that trace crossed
> > _prepare_cpus I tried adding nosmp, but we still crash in
> > acpi_init->acpi_scan_init->acpi_bus_scan->acpi_bus_attach
> > 
> > Any other suggestion? lspci normal and verbose follow...
> 
> Do you have anything special on the kernel command line? You should not
> do anything else than disable DW_DMAC. That is enough to prevent the
> DMA hang if that's the issue.
> 
> Are you able to get dmesg of the crash?

Also I can see that the LPSS devices are in PCI mode for some reason.
BTW, what laptop this is?
