From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3] pinctrl: baytrail: lock IRQs when starting them
Date: Mon, 9 Dec 2013 15:29:15 +0200
Message-ID: <20131209132915.GF2281@intel.com>
References: <1386338592-1088-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:63962 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932698Ab3LINXF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Dec 2013 08:23:05 -0500
Content-Disposition: inline
In-Reply-To: <1386338592-1088-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>

On Fri, Dec 06, 2013 at 03:03:12PM +0100, Linus Walleij wrote:
> This uses the new API for tagging GPIO lines as in use by
> IRQs. This enforces a few semantic checks on how the underlying
> GPIO line is used.
> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Tested-by: Mika Westerberg <mika.westerberg@linux.intel.com>

> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
