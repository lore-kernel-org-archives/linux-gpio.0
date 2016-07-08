From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/2] gpio: intel-mid: Remove potentially harmful code
Date: Fri, 08 Jul 2016 12:10:54 +0300
Message-ID: <1467969054.30123.503.camel@linux.intel.com>
References: <1467798613-70389-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <20160708082040.GW23527@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:27431 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754517AbcGHJK7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 8 Jul 2016 05:10:59 -0400
In-Reply-To: <20160708082040.GW23527@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, David Cohen <david.a.cohen@linux.intel.com>, stable@vger.kernel.org, #@black.fi.intel.com, v3.13+@black.fi.intel.com

On Fri, 2016-07-08 at 11:20 +0300, Mika Westerberg wrote:
> On Wed, Jul 06, 2016 at 12:50:12PM +0300, Andy Shevchenko wrote:
> > The commit d56d6b3d7d69 ("gpio: langwell: add Intel Merrifield
> > support")
> > doesn't look at all as a proper support for Intel Merrifield and I
> > dare to say
> > that it distorts the behaviour of the hardware.
> > 
> > The register map is different on Intel Merrifield, i.e. only 6 out
> > of 8
> > register have the same purpose but none of them has same location in
> > the
> > address space. The current case potentially harmful to existing
> > hardware since
> > it's poking registers on wrong offsets and may set some pin to be
> > GPIO output
> > when connected hardware doesn't expect such.
> > 
> > Besides the above GPIO and pinctrl on Intel Merrifield have been
> > located in
> > different IP blocks. The functionality has been extended as well,
> > i.e. added
> > support of level interrupts, special registers for wake capable
> > sources and
> > thus, in my opinion, requires a completele separate driver.
> > 
> > 

> If it is truely poking wrong registers, this is certainly right thing
> to
> do.

Yes, you might check it yourself, GPIO registers starts with offset 4,
instead of 0, and there are couple of w/o registers in the area to set
pin state. It means potentially you may find the case where suddenly one
pin not that one user asked for) might change direction followed by
voltage.

> 
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> I take it we are getting a driver which is using the correct registers
> soon ;-)

It should be in your mailbox already.


-- 

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
