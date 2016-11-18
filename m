From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v11 1/6] drivers/platform/x86/p2sb: New Primary to
 Sideband bridge support driver for Intel SOC's
Date: Fri, 18 Nov 2016 11:07:53 +0200
Message-ID: <20161118090753.GV1446@lahna.fi.intel.com>
References: <1479446550-28677-1-git-send-email-jui.nee.tan@intel.com>
 <1479446550-28677-2-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1479446550-28677-2-git-send-email-jui.nee.tan@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, dvhart@infradead.org, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com, yunying.sun@intel.com
List-Id: linux-gpio@vger.kernel.org

On Fri, Nov 18, 2016 at 01:22:25PM +0800, Tan Jui Nee wrote:
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
