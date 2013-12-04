From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 0/5] gpiolib: clean up and potential bug fix
Date: Wed, 4 Dec 2013 17:18:07 +0200
Message-ID: <20131204151807.GX2281@intel.com>
References: <1386164580-32288-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:9209 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932178Ab3LDPLe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 4 Dec 2013 10:11:34 -0500
Content-Disposition: inline
In-Reply-To: <1386164580-32288-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

On Wed, Dec 04, 2013 at 03:42:55PM +0200, Andy Shevchenko wrote:
> The patch series mostly addressing messaging format and fix for one potential
> bug. It depends on recent Alex's patch [1] and Mika's patchset [2].
> 
> Compile tested and tested on Medfield with SFI.
> 
> Changes since v1:
>  - applied Acked and Reviewed tags
>  - instead of patch 4/4 create patch 4/5 and 5/5 that don't change
>    functionality, and indentation things moved to patch 1/5
> 
> [1] http://www.spinics.net/lists/kernel/msg1645907.html
> [2] http://www.spinics.net/lists/linux-acpi/msg47572.html
> 
> Andy Shevchenko (5):
>   gpiolib: unify pr_* messages format
>   gpiolib: introduce chip_* to print with chip->label prefix
>   gpiolib: convert gpiod_lookup description to kernel-doc
>   gpiolib: update commentary at gpiod_get_index()
>   gpiolib: uniform messages in gpiod_find()

For the series,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
