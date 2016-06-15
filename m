From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] gpio: pca953x: enable driver on Intel Edison
Date: Wed, 15 Jun 2016 12:19:49 +0300
Message-ID: <1465982389.30123.108.camel@linux.intel.com>
References: <1465945076-25517-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <CACRpkdb5-+u89gnarQN-NH_uGRoi1FYb=RmMWjCLVhMSvV4iKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:41248 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753622AbcFOJSe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 15 Jun 2016 05:18:34 -0400
In-Reply-To: <CACRpkdb5-+u89gnarQN-NH_uGRoi1FYb=RmMWjCLVhMSvV4iKQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, 2016-06-15 at 09:11 +0200, Linus Walleij wrote:
> On Wed, Jun 15, 2016 at 12:57 AM, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Intel Edison board has 4 GPIO expanders PCA9555a connected to I2C
> > bus. Add an
> > ID to support them.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> BTW Andy, if you have PCA95x hardware you're playing with, any chance
> you could implement .get_direction() for this driver?
> 
> I'd really like for that to be supported on all major hardware.

I can put it to my TODO list with low priority.

If someone has more time and eagerness I would be okay to review and-or
test it.

-- 

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
