From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1] pinctrl: intel: merrifield: Correct UART pin lists
Date: Sat, 5 Aug 2017 21:50:55 +0300
Message-ID: <20170805185055.GI2369@lahna.fi.intel.com>
References: <20170804162634.25854-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:20832 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751436AbdHESu7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 5 Aug 2017 14:50:59 -0400
Content-Disposition: inline
In-Reply-To: <20170804162634.25854-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Fri, Aug 04, 2017 at 07:26:34PM +0300, Andy Shevchenko wrote:
> UART pin lists consist GPIO numbers which is simply wrong.
> Replace it by pin numbers.
> 
> Fixes: 4e80c8f50574 ("pinctrl: intel: Add Intel Merrifield pin controller support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
