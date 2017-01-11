From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 2/2] pinctrl: baytrail: Convert to use devm_*()
Date: Wed, 11 Jan 2017 12:30:02 +0200
Message-ID: <20170111103002.GP2330@lahna.fi.intel.com>
References: <20170110201139.129737-1-andriy.shevchenko@linux.intel.com>
 <20170110201139.129737-2-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:6566 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1758622AbdAKKaH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Jan 2017 05:30:07 -0500
Content-Disposition: inline
In-Reply-To: <20170110201139.129737-2-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, "Robert R . Howell" <rhowell@uwyo.edu>

On Tue, Jan 10, 2017 at 10:11:39PM +0200, Andy Shevchenko wrote:
> This simplifies error handling and allows us to drop error path handlers
> completely.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
