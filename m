From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: set default handler to be
 handle_bad_irq()
Date: Fri, 25 Nov 2016 16:37:40 +0200
Message-ID: <20161125143740.GQ1476@lahna.fi.intel.com>
References: <20161125113116.28193-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:12496 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754870AbcKYOho (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Nov 2016 09:37:44 -0500
Content-Disposition: inline
In-Reply-To: <20161125113116.28193-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Fri, Nov 25, 2016 at 01:31:16PM +0200, Andy Shevchenko wrote:
> We switch the default handler to be handle_bad_irq() instead of
> handle_simple_irq() (which was not correct anyway).
> 
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I wonder if it makes sense to have this split into two patches instead?

In any case,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
