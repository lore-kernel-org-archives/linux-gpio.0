From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v9 6/6] mfd: lpc_ich: Add support for Intel Apollo Lake
 GPIO pinctrl in non-ACPI system
Date: Tue, 8 Nov 2016 13:07:23 +0200
Message-ID: <20161108110723.GS1447@lahna.fi.intel.com>
References: <1478595443-6306-1-git-send-email-jui.nee.tan@intel.com>
 <1478595443-6306-7-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1478595443-6306-7-git-send-email-jui.nee.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com, yunying.sun@intel.com
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 08, 2016 at 04:57:23PM +0800, Tan Jui Nee wrote:
> This driver uses the P2SB hide/unhide mechanism cooperatively
> to pass the PCI BAR address to the gpio platform driver.
> 
> Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
