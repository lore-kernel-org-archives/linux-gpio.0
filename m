From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 0/4] gpiolib: clean up messaging part
Date: Mon, 09 Dec 2013 10:49:55 +0200
Message-ID: <1386578995.1871.98.camel@smile>
References: <1386235586-16713-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <52A12AF0.1020406@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:50960 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754336Ab3LIIus (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Dec 2013 03:50:48 -0500
In-Reply-To: <52A12AF0.1020406@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alex Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Fri, 2013-12-06 at 10:40 +0900, Alex Courbot wrote:
> Series looks good to me. Thanks for addressing the issues.

Thank you for review.
Linus, if you have no objections, could you apply this series?

> 
> On 12/05/2013 06:26 PM, Andy Shevchenko wrote:
> > Compile tested and tested on Medfield with SFI.
> >
> > Changes since v2:
> >   - applied Mika's Reviewed tag (except patch 2/4 as it was modified)
> >   - address Alexandre's comments.
> >
> > [1] http://www.spinics.net/lists/kernel/msg1645907.html
> > [2] http://www.spinics.net/lists/linux-acpi/msg47572.html
> >
> > Andy Shevchenko (4):
> >    gpiolib: unify pr_* messages format
> >    gpiolib: introduce chip_* to print with chip->label prefix
> >    gpiolib: convert gpiod_lookup description to kernel-doc
> >    gpiolib: update inline documentation of gpiod_get_index()
> >
> >   drivers/gpio/gpiolib.c      | 117 ++++++++++++++++++++++++--------------------
> >   include/linux/gpio/driver.h |  26 ++++------
> >   2 files changed, 73 insertions(+), 70 deletions(-)
> >
> 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

