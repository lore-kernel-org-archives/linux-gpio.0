From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 3/6] pinctrl: Add a possibility to configure pins from
 a gpiolib based drivers
Date: Wed, 11 Jan 2017 15:33:04 +0200
Message-ID: <20170111133304.GQ2330@lahna.fi.intel.com>
References: <20170110143201.53539-1-mika.westerberg@linux.intel.com>
 <20170110143201.53539-4-mika.westerberg@linux.intel.com>
 <CACRpkdbFotEknW2dK0ouc2HWLLhL-MERJS_BvCm5ux5hrEsQsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:16991 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S937409AbdAKNjk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Jan 2017 08:39:40 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdbFotEknW2dK0ouc2HWLLhL-MERJS_BvCm5ux5hrEsQsg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Jan 11, 2017 at 02:06:56PM +0100, Linus Walleij wrote:
> On Tue, Jan 10, 2017 at 3:31 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> 
> > When a GPIO driver is backed by a pinctrl driver the GPIO driver often
> > needs to call the pinctrl driver to configure certain things, like
> > whether the pin is used as input or output. In addition to this there
> > are other pin configurations applicable to GPIOs such as debounce
> > timeout.
> >
> > To support this we introduce a new function pinctrl_gpio_set_config()
> > that can be used by gpiolib based driver to pass configuration requests
> > to the backing pinctrl driver.
> >
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> OK so this is needed.

The alternative would be to just handle this internally in
pinctrl-intel.c but I thought it is better to make the functionality
available for other drivers as well.

> But let's first pause and discuss this, because I have some stuff on my
> mind here.
> 
> First this kernel-internal ABI from <linux/gpio/driver.h>:
> 
> struct gpio_chip {
> (...)
>         int                     (*set_debounce)(struct gpio_chip *chip,
>                                                 unsigned offset,
>                                                 unsigned debounce);
>         int                     (*set_single_ended)(struct gpio_chip *chip,
>                                                 unsigned offset,
>                                                 enum single_ended_mode mode);
> (...)
> 
> It's not going to scale. We need to replace this with something like
> 
> int (*set_config)(struct gpio_chip *chip, unsigned offset, unsigned
> long config);
> 
> Where "config" takes the packed format described in
> <linux/pinctrl/pinconf-generic.h>
> and nothing else, anything else is just inviting disaster.
> 
> We can also later add:
> 
> int (*get_config)(struct gpio_chip *chip, unsigned offset, unsigned
> long *config);
> 
> We can then  set and get arbitrary configs on GPIO lines, and the
> drivers can simply implement a switch() for the configs they handle
> else return -ENOTSUPP.
> 
> But right now only set_config() would be enough.
> 
> Maybe stuff needs to be split out of that header to be shared between
> GPIO and pinctrl but hopefully you could just include it.
> 
> Then we change all in-kernel users of these two APIs over to set_config().
> 
> THEN we can think about cross-calling to pin control using the API
> from this patch. It should be a simple matter of just passing along the
> same config argument since we're using generic pin config.
> 
> It's not like it's impossible to merge this patch first, but I want to get some
> order here.
> 
> Are you convenient with doing the above patch as part of this series, or
> shall I do it first so you can rebase on it? (Will take some time if I
> do it...)

Sure, I can take a look at it.

> We need this because GPIO is going to need more and more config
> to be done by pinctrl on its behalf, and it will have to go all the
> way to userspace in many cases, so we need this infrastructure in
> place.

OK.
