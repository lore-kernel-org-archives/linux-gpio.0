From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/1] pinctrl: baytrail: Rectify debounce support
Date: Tue, 10 Jan 2017 16:12:07 +0200
Message-ID: <20170110141207.GH2330@lahna.fi.intel.com>
References: <20170110140319.26185-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:55052 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755040AbdAJOQe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Jan 2017 09:16:34 -0500
Content-Disposition: inline
In-Reply-To: <20170110140319.26185-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Cristina Ciocan <cristina.ciocan@intel.com>

On Tue, Jan 10, 2017 at 04:03:19PM +0200, Andy Shevchenko wrote:
> The commit 658b476c742f ("pinctrl: baytrail: Add debounce configuration")
> implements debounce for Baytrail pin control, but seems wasn't tested properly.
> 
> Rectify implementation here.

So what was wrong with the implementation?
