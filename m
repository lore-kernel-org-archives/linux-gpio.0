From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: Do not depend in GPIOLIB, select it
Date: Wed, 11 Oct 2017 21:59:25 +0300
Message-ID: <20171011185925.GP2761@lahna.fi.intel.com>
References: <20171011100742.9912-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:42287 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752308AbdJKS7a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Oct 2017 14:59:30 -0400
Content-Disposition: inline
In-Reply-To: <20171011100742.9912-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Phil Reid <preid@electromag.com.au>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Peter Rosin <peda@axentia.se>, Andrey Smirnov <andrew.smirnov@gmail.com>

On Wed, Oct 11, 2017 at 12:07:42PM +0200, Linus Walleij wrote:
> Instead of depends on GPIOLIB and having to run around in
> Kconfig menus looking for why your device is not available,
> simply select it from the pin control drivers that need it.
> 
> The Kconfig for GPIOLIB is improved, selectable and this
> should "just work".
> 
> Cc: Phil Reid <preid@electromag.com.au>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
