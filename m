From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Protect set wake flow by spin lock
Date: Fri, 8 Jul 2016 14:59:45 +0300
Message-ID: <20160708115945.GD1716@lahna.fi.intel.com>
References: <1467977446-73452-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:13261 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754475AbcGHL7t (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 8 Jul 2016 07:59:49 -0400
Content-Disposition: inline
In-Reply-To: <1467977446-73452-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

On Fri, Jul 08, 2016 at 02:30:46PM +0300, Andy Shevchenko wrote:
> It seems intel_gpio_irq_wake() misses lock protection against I/O flow.
> Use spin lock here as well.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
