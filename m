From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 1/1] gpio: merrifield: Introduce GPIO driver to
 support Merrifield
Date: Mon, 11 Jul 2016 13:03:14 +0300
Message-ID: <1468231394.30123.537.camel@linux.intel.com>
References: <1468229245-131478-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:46357 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1030560AbcGKKDR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 11 Jul 2016 06:03:17 -0400
In-Reply-To: <1468229245-131478-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@linux.intel.com>

On Mon, 2016-07-11 at 12:27 +0300, Andy Shevchenko wrote:
> Intel Merrifield platform has a special GPIO controller to drive pads
> when they
> are muxed in corresponding mode.
> 
> Intel Merrifield GPIO IP is slightly different here and there in
> comparison to
> the older Intel MID platforms. These differences include in particular
> the
> shaked register offsets, specific support of level triggered
> interrupts and
> wake capable sources, as well as a pinctrl which is a separate IP.
> 
> Instead of uglifying existing driver I decide to provide a new one
> slightly
> based on gpio-intel-mid.c. So, anyone can easily compare what changes
> are
> happened to be here.
> 

Please, discard this since previous is already applied. Moreover this
one has a typo, so, needs to be addressed anyway.

-- 

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
