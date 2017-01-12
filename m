From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 3/3] gpiolib: Convert fwnode_get_named_gpiod() to
 configure GPIO
Date: Thu, 12 Jan 2017 14:15:12 +0200
Message-ID: <1484223312.2133.78.camel@linux.intel.com>
References: <20170109140228.47613-1-andriy.shevchenko@linux.intel.com>
         <1484141740.2133.57.camel@linux.intel.com>
         <1484144097.2133.60.camel@linux.intel.com> <1633853.HOlbG3UopE@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:6292 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750815AbdALMTd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Jan 2017 07:19:33 -0500
In-Reply-To: <1633853.HOlbG3UopE@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Thu, 2017-01-12 at 08:27 +0100, Alexander Stein wrote:
> On Wednesday 11 January 2017 16:14:57, Andy Shevchenko wrote:
> > On Wed, 2017-01-11 at 15:35 +0200, Andy Shevchenko wrote:
> > > On Wed, 2017-01-11 at 13:21 +0100, Linus Walleij wrote:
> > > > On Mon, Jan 9, 2017 at 3:02 PM, Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > 

> > Alas, it doesn't apply clearly. gpio_keys_polled.c has been changed
> > a
> > lot from that time. So, would you like to fix it yourself?
> > 
> > Since mine is applied clearly I may do other way around, rebase and
> > fix
> > that patch on top of mine.
> > How does it sound?
> 
> Yeah, I noticed that gpio_keys_polled.c has changed meanwhile, so my
> patch has 
> to be modifed anyway. If your patch is applied somewhere I can rebase
> my 
> change on that and resubmit.

First of all, how do you feel if Linus applies my change first?

Please, keep me in Cc list for new version if you are going to re-
base/re-send.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
