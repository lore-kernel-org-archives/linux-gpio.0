From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/2] pinctrl: intel: merrifield: Add missed check in
 mrfld_config_set()
Date: Tue, 24 Jan 2017 15:28:08 +0200
Message-ID: <20170124132808.GH17297@lahna.fi.intel.com>
References: <20170124104432.16477-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:14761 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750886AbdAXNaW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Jan 2017 08:30:22 -0500
Content-Disposition: inline
In-Reply-To: <20170124104432.16477-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Tue, Jan 24, 2017 at 12:44:31PM +0200, Andy Shevchenko wrote:
> Not every pin can be configured. Add missed check to prevent access
> violation.
> 
> Fixes: 4e80c8f50574 ("pinctrl: intel: Add Intel Merrifield pin controller support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
