From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/1] gpio: intel-mid: Make it depend to X86_INTEL_MID
Date: Fri, 8 Jul 2016 12:31:09 +0300
Message-ID: <20160708093109.GB23527@lahna.fi.intel.com>
References: <1467924308-137452-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:53906 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751836AbcGHJbO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 8 Jul 2016 05:31:14 -0400
Content-Disposition: inline
In-Reply-To: <1467924308-137452-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, David Cohen <david.a.cohen@linux.intel.com>

On Thu, Jul 07, 2016 at 11:45:08PM +0300, Andy Shevchenko wrote:
> This GPIO controller is a part of Intel MID platforms which are somehow
> different to pure PCs. Thus, there is no need that driver is compiled for them.
> 
> Replace dependency to X86_INTEL_MID.
> 
> While here, fix capitalization of MID abbreviation.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Makes sense,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
