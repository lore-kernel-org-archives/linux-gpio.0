From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 3/3] pinctrl: baytrail: Add debounce to debug output
Date: Fri, 27 Jan 2017 11:40:48 +0200
Message-ID: <20170127094048.GT17297@lahna.fi.intel.com>
References: <20170126172409.132136-1-andriy.shevchenko@linux.intel.com>
 <20170126172409.132136-4-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:4273 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932329AbdA0JnB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Jan 2017 04:43:01 -0500
Content-Disposition: inline
In-Reply-To: <20170126172409.132136-4-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Jean Delvare <jdelvare@suse.de>

On Thu, Jan 26, 2017 at 07:24:09PM +0200, Andy Shevchenko wrote:
> When debug pin configuration is printed out debounce setting is missed.
> Add it here.

That information is already made available in pinctrl debugfs files so I
don't see any reason to duplicate it.
