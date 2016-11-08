From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v9 3/6] x86/intel-ivi: Add Intel In-Vehicle Infotainment
 (IVI) systems used in cars support
Date: Tue, 8 Nov 2016 13:03:09 +0200
Message-ID: <20161108110309.GP1447@lahna.fi.intel.com>
References: <1478595443-6306-1-git-send-email-jui.nee.tan@intel.com>
 <1478595443-6306-4-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:26023 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932219AbcKHLDZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Nov 2016 06:03:25 -0500
Content-Disposition: inline
In-Reply-To: <1478595443-6306-4-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com, yunying.sun@intel.com

On Tue, Nov 08, 2016 at 04:57:20PM +0800, Tan Jui Nee wrote:
> Add support for non ACPI system, such as system that uses Advanced Boot
> Loader (ABL) whereby a platform device has to be created in order to bind
> with PINCTRL/GPIO.
> 
> At the moment, Intel Apollo Lake SoC requires P2SB driver to hide and
> unhide P2SB to lookup P2SB BAR and pass the PCI BAR address to GPIO.
> 
> Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
