From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v7 1/6] x86/platform/p2sb: New Primary to Sideband bridge
 support driver for Intel SOC's
Date: Thu, 29 Sep 2016 13:34:33 -0400 (EDT)
Message-ID: <alpine.DEB.2.20.1609291333050.4825@nanos>
References: <1475056343-31907-1-git-send-email-jui.nee.tan@intel.com> <1475056343-31907-2-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:56047 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933853AbcI2RhW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2016 13:37:22 -0400
In-Reply-To: <1475056343-31907-2-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, mingo@redhat.com, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, jonathan.yong@intel.com, ong.hock.yu@intel.com, Tony Luck <tony.luck@intel.com>, wan.ahmad.zainie.wan.mohamad@intel.com, Darren Hart <dvhart@infradead.org>


On Wed, 28 Sep 2016, Tan Jui Nee wrote:
>  arch/x86/Kconfig                 |  4 ++
>  arch/x86/include/asm/p2sb.h      | 27 +++++++++++
>  arch/x86/platform/intel/Makefile |  1 +
>  arch/x86/platform/intel/p2sb.c   | 98 ++++++++++++++++++++++++++++++++++++++++

I think this should go into drivers/platform/x86

Thanks,

	tglx
