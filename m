From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 2/3] pinctrl: baytrail: Debounce register is one per
 community
Date: Fri, 27 Jan 2017 11:35:13 +0200
Message-ID: <20170127093513.GS17297@lahna.fi.intel.com>
References: <20170126172409.132136-1-andriy.shevchenko@linux.intel.com>
 <20170126172409.132136-3-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:52545 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932356AbdA0JkE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Jan 2017 04:40:04 -0500
Content-Disposition: inline
In-Reply-To: <20170126172409.132136-3-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Jean Delvare <jdelvare@suse.de>, Cristina Ciocan <cristina.ciocan@intel.com>

On Thu, Jan 26, 2017 at 07:24:08PM +0200, Andy Shevchenko wrote:
> Debounce value is set globally per community. Otherwise user will easily
> get a kernel crash when they start using the feature:
> 
> BUG: unable to handle kernel paging request at ffffc900003be000
> IP: byt_gpio_dbg_show+0xa9/0x430
> 
> Make it clear in byt_gpio_reg().
> 
> Note that this fix just prevents kernel to crash, but doesn't make any
> difference to the existing logic. It means the last caller will win the
> trade and debounce value will be configured accordingly. The actual
> logic fix needs to be thought about and it's not as important as crash
> fix. That's why the latter goes separately and right now.
> 
> Fixes: 658b476c742f ("pinctrl: baytrail: Add debounce configuration")
> Cc: Cristina Ciocan <cristina.ciocan@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
