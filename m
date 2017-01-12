From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 3/3] gpiolib: Convert fwnode_get_named_gpiod() to
 configure GPIO
Date: Thu, 12 Jan 2017 16:27:09 +0200
Message-ID: <1484231229.2133.80.camel@linux.intel.com>
References: <20170109140228.47613-1-andriy.shevchenko@linux.intel.com>
         <1633853.HOlbG3UopE@ws-stein> <1484223312.2133.78.camel@linux.intel.com>
         <1830263.uPIogjsk2v@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:25521 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750730AbdALO1N (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Jan 2017 09:27:13 -0500
In-Reply-To: <1830263.uPIogjsk2v@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Thu, 2017-01-12 at 13:51 +0100, Alexander Stein wrote:
> On Thursday 12 January 2017 14:15:12, Andy Shevchenko wrote:
> > On Thu, 2017-01-12 at 08:27 +0100, Alexander Stein wrote:
> > > On Wednesday 11 January 2017 16:14:57, Andy Shevchenko wrote:
> > > > On Wed, 2017-01-11 at 15:35 +0200, Andy Shevchenko wrote:
> > > > > On Wed, 2017-01-11 at 13:21 +0100, Linus Walleij wrote:
> > > > > > On Mon, Jan 9, 2017 at 3:02 PM, Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:

> > > > Alas, it doesn't apply clearly. gpio_keys_polled.c has been
> > > > changed
> > > > a
> > > > lot from that time. So, would you like to fix it yourself?
> > > > 
> > > > Since mine is applied clearly I may do other way around, rebase
> > > > and
> > > > fix
> > > > that patch on top of mine.
> > > > How does it sound?

> > > Yeah, I noticed that gpio_keys_polled.c has changed meanwhile, so
> > > my
> > > patch has 
> > > to be modifed anyway. If your patch is applied somewhere I can
> > > rebase
> > > my 
> > > change on that and resubmit.

> > First of all, how do you feel if Linus applies my change first?

> I don't mind. Just go ahead and point me somewhere I can base on.

For now the only my topic/uart/rpm branch [1] on bitbucket contains it.
(It also has many other patches, meaning you need to base your branch on
top of gpio-next + cherry-picked the only one from my branch)

[1] https://bitbucket.org/andy-shev/linux/branch/topic%2Fuart%2frpm

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
