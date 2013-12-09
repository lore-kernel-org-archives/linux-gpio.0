From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v5 0/2] gpiolib, sfi: introduce SFI GPIO helpers
Date: Mon, 9 Dec 2013 17:01:50 +0200
Message-ID: <20131209150150.GG2281@intel.com>
References: <1386600421-16463-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:13952 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932371Ab3LIOzU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Dec 2013 09:55:20 -0500
Content-Disposition: inline
In-Reply-To: <1386600421-16463-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, David Cohen <david.a.cohen@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>

On Mon, Dec 09, 2013 at 04:46:59PM +0200, Andy Shevchenko wrote:
> Here is a fifth [1] version of the SFI GPIO helpers. This series contains SFI
> GPIO helpers along with the update of GPIO library to lookup for SFI resources.
> 
> It has been tested on Medfield device on top of recent linux-gpio/for-next +
> Mika's ACPI gpio patches [2].
> 
> Changes since v4:
>  - fix one compilation warning
> 
> [1] https://lkml.org/lkml/2013/6/5/316
> [2] http://www.spinics.net/lists/linux-acpi/msg47572.html
> 
> Andy Shevchenko (2):
>   SFI: store GPIO table and export lookup function
>   gpiolib: append SFI helpers for GPIO API
> 

Both patches,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
