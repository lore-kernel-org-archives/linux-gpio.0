From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v9 1/6] x86/platform/p2sb: New Primary to Sideband bridge
 support driver for Intel SOC's
Date: Thu, 10 Nov 2016 18:47:30 -0800
Message-ID: <20161111024730.GC16057@f23x64.localdomain>
References: <1478595443-6306-1-git-send-email-jui.nee.tan@intel.com>
 <1478595443-6306-2-git-send-email-jui.nee.tan@intel.com>
 <alpine.DEB.2.20.1611081753370.3501@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:35699 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965736AbcKKCpy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2016 21:45:54 -0500
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1611081753370.3501@nanos>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Tan Jui Nee <jui.nee.tan@intel.com>, mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, mingo@redhat.com, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, jonathan.yong@intel.com, ong.hock.yu@intel.com, Tony Luck <tony.luck@intel.com>, wan.ahmad.zainie.wan.mohamad@intel.com, yunying.sun@intel.com

On Tue, Nov 08, 2016 at 05:55:20PM +0100, Thomas Gleixner wrote:
> On Tue, 8 Nov 2016, Tan Jui Nee wrote:
> > There is already one and at least one more user coming which
> > require an access to Primary to Sideband bridge (P2SB) in order
> > to get IO or MMIO bar hidden by BIOS.
> > Create a driver to access P2SB for x86 devices.
> > 
> >  arch/x86/Kconfig                 |  4 ++
> >  arch/x86/include/asm/p2sb.h      | 27 +++++++++++
> >  arch/x86/platform/intel/Makefile |  1 +
> >  arch/x86/platform/intel/p2sb.c   | 98 ++++++++++++++++++++++++++++++++++++++++
> 
> This really has nothing to do with architecture. It's a platform enablement
> driver and therefor should go into drivers/platform/x86
> 
> Cc'ed Darren who is responsible for this.

Thanks Thomas,

Tan Jui, I'll be on a short medical leave through Nov 28. In the meantime, Andy
Shevchenko (on Cc) will be taking the lead on drivers/platform/x86 patches.

Andy, please work with Tan Jui to update this change to apply to our tree.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
