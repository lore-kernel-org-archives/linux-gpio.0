From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Set pin direction properly
Date: Wed, 11 Jan 2017 16:21:26 +0200
Message-ID: <1484144486.2133.62.camel@linux.intel.com>
References: <20170102120722.178343-1-andriy.shevchenko@linux.intel.com>
         <CACRpkdY8fUR6-WE9TE9V3AxsWWjKs-gwQbUG5Afoe9fmYUnkmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:60991 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751398AbdAKOVb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Jan 2017 09:21:31 -0500
In-Reply-To: <CACRpkdY8fUR6-WE9TE9V3AxsWWjKs-gwQbUG5Afoe9fmYUnkmQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>

On Wed, 2017-01-11 at 13:50 +0100, Linus Walleij wrote:
> On Mon, Jan 2, 2017 at 1:07 PM, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > There are two bits in the PADCFG0 register to configure direction,
> > one per
> > TX/RX buffers.
> > 
> > For now we wrongly assume that the GPIO is always requested before
> > it is being
> > used, which is not true when the GPIO is used through irqchip. In
> > this case the
> > GPIO is never requested and we never enable RX buffer for it.
> > 
> > Fix this by setting both bits accordingly.
> > 
> > Reported-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I applied this patch for fixes on top of Mika's pad offset
> fix.
> 
> Hope this is right... There is some noise in the thread but
> AFAICT there are more fixes coming.

Yes, it's self-sufficient and needed independently of the rest.
Thanks!

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
