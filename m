From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] pinctrl: baytrail: Rectify debounce support
Date: Tue, 10 Jan 2017 16:35:36 +0200
Message-ID: <1484058936.2133.23.camel@linux.intel.com>
References: <20170110140319.26185-1-andriy.shevchenko@linux.intel.com>
         <20170110141207.GH2330@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:58850 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752301AbdAJOfk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Jan 2017 09:35:40 -0500
In-Reply-To: <20170110141207.GH2330@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Cristina Ciocan <cristina.ciocan@intel.com>

On Tue, 2017-01-10 at 16:12 +0200, Mika Westerberg wrote:
> On Tue, Jan 10, 2017 at 04:03:19PM +0200, Andy Shevchenko wrote:
> > The commit 658b476c742f ("pinctrl: baytrail: Add debounce
> > configuration")
> > implements debounce for Baytrail pin control, but seems wasn't
> > tested properly.
> > 
> > Rectify implementation here.
> 
> So what was wrong with the implementation?

It writes the wrong register.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
