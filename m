From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v9 1/6] x86/platform/p2sb: New Primary to Sideband bridge
 support driver for Intel SOC's
Date: Tue, 8 Nov 2016 17:55:20 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1611081753370.3501@nanos>
References: <1478595443-6306-1-git-send-email-jui.nee.tan@intel.com> <1478595443-6306-2-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:55525 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932237AbcKHQ6D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2016 11:58:03 -0500
In-Reply-To: <1478595443-6306-2-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, mingo@redhat.com, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, jonathan.yong@intel.com, ong.hock.yu@intel.com, Tony Luck <tony.luck@intel.com>, wan.ahmad.zainie.wan.mohamad@intel.com, yunying.sun@intel.com, Darren Hart <dvhart@infradead.org>

On Tue, 8 Nov 2016, Tan Jui Nee wrote:
> There is already one and at least one more user coming which
> require an access to Primary to Sideband bridge (P2SB) in order
> to get IO or MMIO bar hidden by BIOS.
> Create a driver to access P2SB for x86 devices.
> 
>  arch/x86/Kconfig                 |  4 ++
>  arch/x86/include/asm/p2sb.h      | 27 +++++++++++
>  arch/x86/platform/intel/Makefile |  1 +
>  arch/x86/platform/intel/p2sb.c   | 98 ++++++++++++++++++++++++++++++++++++++++

This really has nothing to do with architecture. It's a platform enablement
driver and therefor should go into drivers/platform/x86

Cc'ed Darren who is responsible for this.

Thanks,

	tglx
