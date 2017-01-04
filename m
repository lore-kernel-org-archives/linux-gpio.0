From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/3] gpiolib: Switch to for_each_set_bit()
Date: Wed, 4 Jan 2017 14:58:39 +0200
Message-ID: <20170104125839.GU3353@lahna.fi.intel.com>
References: <20170103170119.35950-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:5812 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753919AbdADNHe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Jan 2017 08:07:34 -0500
Content-Disposition: inline
In-Reply-To: <20170103170119.35950-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

On Tue, Jan 03, 2017 at 07:01:17PM +0200, Andy Shevchenko wrote:
> The macro for_each_set_bit() effectively looks up to the next set bit in array
> of bits.
> 
> Instead of open coding that switch to for_each_set_bit() in
> gpio_chip_set_multiple().
> 
> While here, make gpio_chip_set_multiple() non-destructive against its
> parameters. We are safe since all callers, i.e.
> gpiod_set_array_value_complex(), handle that already.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
