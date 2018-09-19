From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Do pin translation in other GPIO
 operations as well
Date: Wed, 19 Sep 2018 11:36:12 +0300
Message-ID: <20180919083612.GQ14465@lahna.fi.intel.com>
References: <20180918153621.71984-1-mika.westerberg@linux.intel.com>
 <CACK8Z6F4+N1paQTSWcomnwLpLEHoospSOT3M9bqFQZHHfWmahA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACK8Z6F4+N1paQTSWcomnwLpLEHoospSOT3M9bqFQZHHfWmahA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajat Jain <rajatja@google.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, casey.g.bowman@intel.com, "Atwood, Matthew S" <matthew.s.atwood@intel.com>, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 18, 2018 at 03:04:23PM -0700, Rajat Jain wrote:
> On Tue, Sep 18, 2018 at 8:36 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
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
> Tested-by: Rajat Jain <rajatja@google.com>
> 
> This has fixed the issue for me.

Thanks for testing!

> One question, may not be related: I see this line in my logs everytime
> I export a pin (GPIO40 = pin 16 in this case). Is that an indication
> of a problem?
> 
> "gpio gpiochip0: Persistence not supported for GPIO 40"

It seems to be debug print if the underlying GPIO chip does not support
PIN_CONFIG_PERSIST_STATE (pinctrl-intel.c does not). I would not worry
about it.
