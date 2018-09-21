From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Do pin translation in other GPIO
 operations as well
Date: Fri, 21 Sep 2018 10:56:36 +0300
Message-ID: <20180921075636.GD2664@lahna.fi.intel.com>
References: <20180918153621.71984-1-mika.westerberg@linux.intel.com>
 <CACRpkdYhpBYEY0OJA0A15Q7OOM31ogGxeaUbNNqSMpJ9af4hOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYhpBYEY0OJA0A15Q7OOM31ogGxeaUbNNqSMpJ9af4hOA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, rajatja@google.com, casey.g.bowman@intel.com, matthew.s.atwood@intel.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Sep 20, 2018 at 08:26:25AM -0700, Linus Walleij wrote:
> On Tue, Sep 18, 2018 at 8:36 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> 
> > For some reason I thought GPIOLIB handles translation from GPIO ranges
> > to pinctrl pins but it turns out not to be the case. This means that
> > when GPIOs operations are performed for a pin controller having a custom
> > GPIO base such as Cannon Lake and Ice Lake incorrect pin number gets
> > used internally.
> >
> > Fix this in the same way we did for lock/unlock IRQ operations and
> > translate the GPIO number to pin before using it.
> >
> > Fixes: a60eac3239f0 ("pinctrl: intel: Allow custom GPIO base for pad groups")
> > Reported-by: Rajat Jain <rajatja@google.com>
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> I applied this for fixes.
> 
> However when merging with devel I get some a merge conflict,
> probably due to some cleanups from Andy.
> 
> I tried to fix it up (just use your code) but please check the
> result.

Looks good to me. Thanks!
