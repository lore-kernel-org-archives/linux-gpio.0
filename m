From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/3] pinctrl: baytrail: Rectify debounce support (part
 2)
Date: Fri, 27 Jan 2017 11:34:19 +0200
Message-ID: <20170127093419.GR17297@lahna.fi.intel.com>
References: <20170126172409.132136-1-andriy.shevchenko@linux.intel.com>
 <20170126172409.132136-2-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:14701 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932380AbdA0JfE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Jan 2017 04:35:04 -0500
Content-Disposition: inline
In-Reply-To: <20170126172409.132136-2-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Jean Delvare <jdelvare@suse.de>

On Thu, Jan 26, 2017 at 07:24:07PM +0200, Andy Shevchenko wrote:
> The commit 04ff5a095d66 ("pinctrl: baytrail: Rectify debounce support")
> almost fixes the logic of debuonce but missed couple of things, i.e.
                            ^^^^^^^^ debounce

> typo in mask when disabling debounce and lack of enabling it back.
> 
> This patch addresses above issues.
> 
> Reported-by: Jean Delvare <jdelvare@suse.de>
> Fixes: 04ff5a095d66 ("pinctrl: baytrail: Rectify debounce support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
