From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] pinctrl/amd: Use regular interrupt instead of chained
Date: Sun, 4 Jun 2017 15:49:40 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1706041544540.2813@nanos>
References: <alpine.DEB.2.20.1705232307330.2409@nanos> <CACRpkdbkEnLpZtLKz+x6FLQZTdsyxKsFexFa_UQwNxgZJGDExQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:47939 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751186AbdFDNto (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Jun 2017 09:49:44 -0400
In-Reply-To: <CACRpkdbkEnLpZtLKz+x6FLQZTdsyxKsFexFa_UQwNxgZJGDExQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, Ken Xue <Ken.Xue@amd.com>, Marc Zyngier <marc.zyngier@arm.com>

On Mon, 29 May 2017, Linus Walleij wrote:

> On Tue, May 23, 2017 at 11:23 PM, Thomas Gleixner <tglx@linutronix.de> wrote:
> 
> > The AMD pinctrl driver uses a chained interrupt to demultiplex the GPIO
> > interrupts. Kevin Vandeventer reported, that his new AMD Ryzen locks up
> > hard on boot when the AMD pinctrl driver is initialized. The reason is an
> > interrupt storm. It's not clear whether that's caused by hardware or
> > firmware or both.
> >
> > Using chained interrupts on X86 is a dangerous endavour. If a system is
> > misconfigured or the hardware buggy there is no safety net to catch an
> > interrupt storm.
> >
> > Convert the driver to use a regular interrupt for the demultiplex
> > handler. This allows the interrupt storm detector to catch the malfunction
> > and lets the system boot up.
> >
> > This should be backported to stable because it's likely that more users run
> > into this problem as the AMD Ryzen machines are spreading.
> >
> > Reported-by: Kevin Vandeventer
> > Link: https://bugzilla.suse.com/show_bug.cgi?id=1034261
> > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> 
> Patch applied for fixes.
> 
> Hm, I wonder if there is a bunch of other x86 drivers that should just
> request the IRQ?

For sanity reasons I think so. chained interrupts are fine if you have
bootloader, device tree and kernel under control. Once BIOS/UEFI comes into
play the user is helpless against this kind of wreckage. We'll get that
same joy with ARM64 sooner than later.

Thanks,

	tglx




