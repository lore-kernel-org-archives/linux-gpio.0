From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Implement intel_gpio_get_direction
 callback
Date: Tue, 06 Mar 2018 16:59:28 +0200
Message-ID: <1520348368.10722.440.camel@linux.intel.com>
References: <20180306134213.16898-1-javier@emutex.com>
         <3585081b-70af-5c31-08c0-84e96b6055bc@emutex.com>
         <1520348165.10722.438.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520348165.10722.438.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Arteaga <javier@emutex.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, 2018-03-06 at 16:56 +0200, Andy Shevchenko wrote:
> On Tue, 2018-03-06 at 14:31 +0000, Javier Arteaga wrote:

> > > +static int intel_gpio_get_direction(struct gpio_chip *chip,
> > > unsigned int offset)
> > > +{

> > > +	if (padcfg0 & PADCFG0_PMODE_MASK)
> > > +		return -EINVAL;
> 
> Actually we might return direction of GPIO function while pin is in
> some
> other mode, though it would probably make not much sense in practice.

One more though, this is a call back for GPIO function anyway, so, above
condition should never happen. I think it's safe to remove it
completely.

> > > +
> > > +	return !!(padcfg0 & PADCFG0_GPIOTXDIS);
> > > +}


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
