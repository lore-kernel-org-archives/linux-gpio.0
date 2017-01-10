From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 1/1] pinctrl: baytrail: Rectify debounce support
Date: Tue, 10 Jan 2017 16:44:05 +0200
Message-ID: <20170110144405.GI2330@lahna.fi.intel.com>
References: <20170110143852.93880-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:29257 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755323AbdAJOoJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Jan 2017 09:44:09 -0500
Content-Disposition: inline
In-Reply-To: <20170110143852.93880-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Cristina Ciocan <cristina.ciocan@intel.com>

On Tue, Jan 10, 2017 at 04:38:52PM +0200, Andy Shevchenko wrote:
> The commit 658b476c742f ("pinctrl: baytrail: Add debounce configuration")
> implements debounce for Baytrail pin control, but seems wasn't tested properly.
> 
> The register which keeps debounce value is separated from the configuration
> one. Writing wrong values to the latter will guarantee wrong behaviour of the
> driver and even might break something physically.
> 
> Besides above there is missed case how to disable it, which is actually done
> through the bit in configuration register.
> 
> Rectify implementation here by using proper register for debounce value.
> 
> Fixes: 658b476c742f ("pinctrl: baytrail: Add debounce configuration")
> Cc: Cristina Ciocan <cristina.ciocan@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Now it looks perfect, thanks!

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
