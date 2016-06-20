From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/1] gpio: lynxpoint: avoid potential warning on error
 path
Date: Mon, 20 Jun 2016 12:05:16 +0300
Message-ID: <20160620090516.GA1739@lahna.fi.intel.com>
References: <1466352404-23685-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:22799 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751959AbcFTJGD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 20 Jun 2016 05:06:03 -0400
Content-Disposition: inline
In-Reply-To: <1466352404-23685-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

On Sun, Jun 19, 2016 at 07:06:44PM +0300, Andy Shevchenko wrote:
> When devres API is in use we are not supposed to call plain gpiochip_remove().
> Remove redundant call to gpiochip_remove().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Good catch!

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
