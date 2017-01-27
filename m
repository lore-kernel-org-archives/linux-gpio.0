From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v1 2/3] pinctrl: baytrail: Debounce register is one per
 community
Date: Fri, 27 Jan 2017 15:06:06 +0100
Message-ID: <20170127150606.0dcc6c6a@endymion>
References: <20170126172409.132136-1-andriy.shevchenko@linux.intel.com>
        <20170126172409.132136-3-andriy.shevchenko@linux.intel.com>
        <20170127102109.3fb3d018@endymion>
        <1485523639.2133.355.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42846 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754409AbdA0OHb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Jan 2017 09:07:31 -0500
In-Reply-To: <1485523639.2133.355.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, Cristina Ciocan <cristina.ciocan@intel.com>

On Fri, 27 Jan 2017 15:27:19 +0200, Andy Shevchenko wrote:
> On Fri, 2017-01-27 at 10:21 +0100, Jean Delvare wrote:
> > That break isn't needed ;-)
> 
> Would be better to have in my opinion. I already did myself some
> mistakes regarding to missed break.

OK, fine with me.

> > The code looks sane to me, although I can't verify its correctness
> > without a datasheet.
> 
> Datasheet is public.
> 
> Intel® Atom™ Processor Z3600 and Z3700 Series Datasheet (Volume 2 of 2)
> Number: 329518-002

Apparently it was removed in December 2014 and replaced by a more
concise document...

https://communities.intel.com/thread/57313

But no big deal, I trust your fix is correct.

-- 
Jean Delvare
SUSE L3 Support
