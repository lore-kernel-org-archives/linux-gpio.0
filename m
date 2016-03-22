From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.4.x
Date: Tue, 22 Mar 2016 19:36:05 +0200
Message-ID: <1458668165.5907.28.camel@linux.intel.com>
References: <CACPiFCKv=QJ0t5e=9Wm4cC4Spynx-tVCiabL7AcbcOkp_w47fQ@mail.gmail.com>
	 <20160322152218.GA2099@lahna.fi.intel.com>
	 <CACPiFC+hDF0+9vPCrhvo079E6RCVVmZXTS1ziS-jHAAZJQ+wNg@mail.gmail.com>
	 <20160322154950.GB2099@lahna.fi.intel.com>
	 <CACPiFCKS-8re6g1Zbhs8N9D_tDMENqXPeNGRS_0dU6tzz50T8A@mail.gmail.com>
	 <20160322162222.GF2099@lahna.fi.intel.com>
	 <CACPiFCKD_Nwut=GL-xOU5gN2k8Na7pFWdhsms85QsDTvvREJLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:62065 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752666AbcCVRfN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 22 Mar 2016 13:35:13 -0400
In-Reply-To: <CACPiFCKD_Nwut=GL-xOU5gN2k8Na7pFWdhsms85QsDTvvREJLw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Langhoff <martin.langhoff@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Tue, 2016-03-22 at 12:59 -0400, Martin Langhoff wrote:
> On Tue, Mar 22, 2016 at 12:22 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > 
> > Can you also disable sdhci:
> > 
> > CONFIG_MMC_SDHCI=n
> > CONFIG_MMC_SDHCI_PCI=n
> > CONFIG_MMC_SDHCI_ACPI=n
> > 
> > and see if that changes anything.
> I blacklisted those, and the call trace changed and shortened, but
> we're still panicking.

If you able to recompile kernel, please do instead

# CONFIG_X86_INTEL_LPSS is not set

> 
> setup_IO_APIC
> clear_IO_APIC
> apic_bsp_setup
> native_mp_prepare_cpus
> 
> > 
> > If not, please blacklist pinctrl-cherryview.c and send me full
> > dmesg of
> > the boot and acpidump if possible.
> Working on that...
> 
> > 
> > > 
> > > This is an Acer Aspire One 11 Cloudbook Series AO1-131-C1G9 Model
> > > N15V1 .
> > Thanks, I'll try if I can purchase similar machine here and debug
> > it
> > further.
> it's an alright device for a nephew who wants to start coding in
> python. If you get it to boot, that is :-)
> 
> cheers,
> 
> 
> 
> martin

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

