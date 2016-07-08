From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 1/1] gpio: merrifield: Introduce GPIO driver to
 support Merrifield
Date: Fri, 8 Jul 2016 16:16:14 +0300
Message-ID: <20160708131614.GE1716@lahna.fi.intel.com>
References: <1467976103-133151-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:15439 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754911AbcGHNQS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 8 Jul 2016 09:16:18 -0400
Content-Disposition: inline
In-Reply-To: <1467976103-133151-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, David Cohen <david.a.cohen@linux.intel.com>, "Wood, Brian J" <brian.j.wood@intel.com>

On Fri, Jul 08, 2016 at 02:08:23PM +0300, Andy Shevchenko wrote:
> Intel Merrifield platform has a special GPIO controller to drive pads when they
> are muxed in corresponding mode.
> 
> Intel Merrifield GPIO IP is slightly different here and there in comparison to
> the older Intel MID platforms. These differences include in particular the
> shaked register offsets, specific support of level triggered interrupts and
> wake capable sources, as well as a pinctrl which is a separate IP.
> 
> Instead of uglifying existing driver I decide to provide a new one slightly
> based on gpio-intel-mid.c. So, anyone can easily compare what changes are
> happened to be here.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks good now, thanks.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
