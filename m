From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 0/3] gpio: Intel Baytrail support
Date: Mon, 25 Jan 2016 13:49:03 +0200
Message-ID: <20160125114903.GE1790@lahna.fi.intel.com>
References: <1453566729-30220-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453566729-30220-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

On Sat, Jan 23, 2016 at 05:32:06PM +0100, Antoine Tenart wrote:
> This series introduces the GPIO Intel Baytrail support, using both the
> lpc ich and the gpio ich drivers.
> 
> Antoine Tenart (3):
>   gpio: gpio-ich: add support for Intel Baytrail

Intel Baytrail support has been in mainline kernel for quite some time
already. The driver is drivers/pintctrl/intel/pinctrl-baytrail.c.

Also the ICH GPIO block is not compatible to Baytrail which is why there
is a separate driver in the first place. Have you tested this series on
Baytrail?

>   mfd: lpc_ich: use a correct mask for the GPIO base address
>   mfd: lpc_ich: add GPIO support for Baytrail

All Baytrails I've seen expose the GPIO device via ACPI namespace so
there should be no need for the above two patches.
