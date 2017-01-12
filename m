From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 3/6] pinctrl: Add a possibility to configure pins from
 a gpiolib based drivers
Date: Thu, 12 Jan 2017 11:22:55 +0200
Message-ID: <20170112092255.GX2330@lahna.fi.intel.com>
References: <20170110143201.53539-1-mika.westerberg@linux.intel.com>
 <20170110143201.53539-4-mika.westerberg@linux.intel.com>
 <CACRpkdbFotEknW2dK0ouc2HWLLhL-MERJS_BvCm5ux5hrEsQsg@mail.gmail.com>
 <20170111133304.GQ2330@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170111133304.GQ2330@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 11, 2017 at 03:33:04PM +0200, Mika Westerberg wrote:
> > But let's first pause and discuss this, because I have some stuff on my
> > mind here.
> > 
> > First this kernel-internal ABI from <linux/gpio/driver.h>:
> > 
> > struct gpio_chip {
> > (...)
> >         int                     (*set_debounce)(struct gpio_chip *chip,
> >                                                 unsigned offset,
> >                                                 unsigned debounce);
> >         int                     (*set_single_ended)(struct gpio_chip *chip,
> >                                                 unsigned offset,
> >                                                 enum single_ended_mode mode);
> > (...)
> > 
> > It's not going to scale. We need to replace this with something like
> > 
> > int (*set_config)(struct gpio_chip *chip, unsigned offset, unsigned
> > long config);
> > 
> > Where "config" takes the packed format described in
> > <linux/pinctrl/pinconf-generic.h>
> > and nothing else, anything else is just inviting disaster.
> > 
> > We can also later add:
> > 
> > int (*get_config)(struct gpio_chip *chip, unsigned offset, unsigned
> > long *config);
> > 
> > We can then  set and get arbitrary configs on GPIO lines, and the
> > drivers can simply implement a switch() for the configs they handle
> > else return -ENOTSUPP.
> > 
> > But right now only set_config() would be enough.
> > 
> > Maybe stuff needs to be split out of that header to be shared between
> > GPIO and pinctrl but hopefully you could just include it.
> > 
> > Then we change all in-kernel users of these two APIs over to set_config().
> > 
> > THEN we can think about cross-calling to pin control using the API
> > from this patch. It should be a simple matter of just passing along the
> > same config argument since we're using generic pin config.
> > 
> > It's not like it's impossible to merge this patch first, but I want to get some
> > order here.
> > 
> > Are you convenient with doing the above patch as part of this series, or
> > shall I do it first so you can rebase on it? (Will take some time if I
> > do it...)
> 
> Sure, I can take a look at it.

Hmm, looking at users of .set_debounce() I can see that the debounce
time can be quite large. For example some signals which are connected to
physical push-buttons may need > 64ms debounce time.

However, the current pinconfig value is defined to be unsigned long
which on 32-bit architecture is 32-bits. From that the higher 16-bits
are used as config leaving the value to be 16-bits. This gives maximum
debounce time of 65535us. I don't think it can cover all the uses of
.set_debounce(). This could also be problematic when specifying values
for pull resistors.

One solution is to convert the packed value to be u64 instead, leaving
up to 48-bits for the value. Alternatively we could provide a scale
field with the packed format.

What do you think?
