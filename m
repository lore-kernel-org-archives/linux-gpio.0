From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 3/3] gpiolib: Convert fwnode_get_named_gpiod() to
 configure GPIO
Date: Mon, 9 Jan 2017 15:59:52 +0200
Message-ID: <20170109135952.GB2330@lahna.fi.intel.com>
References: <20170103170119.35950-1-andriy.shevchenko@linux.intel.com>
 <20170103170119.35950-3-andriy.shevchenko@linux.intel.com>
 <20170104125209.GT3353@lahna.fi.intel.com>
 <1483969772.26691.33.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:25086 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934979AbdAIN74 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Jan 2017 08:59:56 -0500
Content-Disposition: inline
In-Reply-To: <1483969772.26691.33.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

On Mon, Jan 09, 2017 at 03:49:32PM +0200, Andy Shevchenko wrote:
> > Please call this 'dflags' as it is called elsewhere as well.
> 
> Elsewhere in this file it's called 'flags'. I would stick with that
> (btw, my internal first version used to have 'dflags').

Fair enough :)
