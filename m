From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v9 1/6] x86/platform/p2sb: New Primary to Sideband bridge
 support driver for Intel SOC's
Date: Tue, 8 Nov 2016 13:01:48 +0200
Message-ID: <20161108110148.GN1447@lahna.fi.intel.com>
References: <1478595443-6306-1-git-send-email-jui.nee.tan@intel.com>
 <1478595443-6306-2-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1478595443-6306-2-git-send-email-jui.nee.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com, yunying.sun@intel.com
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 08, 2016 at 04:57:18PM +0800, Tan Jui Nee wrote:
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> There is already one and at least one more user coming which
> require an access to Primary to Sideband bridge (P2SB) in order
> to get IO or MMIO bar hidden by BIOS.
> Create a driver to access P2SB for x86 devices.
> 
> Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
