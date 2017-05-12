From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ARM: dts: imx28: add gpio-ranges for internal gpio
 controller
Date: Fri, 12 May 2017 10:01:50 +0200
Message-ID: <20170512080150.uh5qmwu2tctpd6jk@pengutronix.de>
References: <20170508085925.18342-1-u.kleine-koenig@pengutronix.de>
 <20170511075135.GF5833@dragon>
 <20170511080916.gim5pyhj5jarzf4r@pengutronix.de>
 <20170512030536.GC8471@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:34737 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750922AbdELIBy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 May 2017 04:01:54 -0400
Content-Disposition: inline
In-Reply-To: <20170512030536.GC8471@dragon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de

On Fri, May 12, 2017 at 11:05:38AM +0800, Shawn Guo wrote:
> On Thu, May 11, 2017 at 10:09:16AM +0200, Uwe Kleine-König wrote:
> > On Thu, May 11, 2017 at 03:51:36PM +0800, Shawn Guo wrote:
> > > On Mon, May 08, 2017 at 10:59:25AM +0200, Uwe Kleine-König wrote:
> > > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > > ---
> > > > Hello,
> > > > 
> > > > with this patch applied I get the following lines in dmesg which looks
> > > > fine:
> > > > 
> > > > 	[    0.227913] gpio gpiochip0: (80018000.pinctrl:gpio@0): created GPIO range 0->31 ==> 80018000.pinctrl PIN 0->31
> > > > 	[    0.236100] gpio gpiochip1: (80018000.pinctrl:gpio@1): created GPIO range 0->31 ==> 80018000.pinctrl PIN 32->63
> > > > 	[    0.244463] gpio gpiochip2: (80018000.pinctrl:gpio@2): created GPIO range 0->31 ==> 80018000.pinctrl PIN 64->95
> > > > 	[    0.253020] gpio gpiochip3: (80018000.pinctrl:gpio@3): created GPIO range 0->31 ==> 80018000.pinctrl PIN 96->127
> > > > 	[    0.261639] gpio gpiochip4: (80018000.pinctrl:gpio@4): created GPIO range 0->31 ==> 80018000.pinctrl PIN 128->159
> > > > 
> > > > But when looking at a used gpio
> > > > 
> > > > 	# cat /sys/kernel/debug/gpio
> > > > 	gpiochip0: GPIOs 0-31, parent: platform/80018000.pinctrl:gpio@0, 80018000.pinctrl:gpio@0:
> > > > 	...
> > > > 	 gpio-20  (LED4                |?                   ) out hi
> > > > 	...
> > > > 
> > > > 	# grep "pin 20 " /sys/kernel/debug/pinctrl/80018000.pinctrl/pinmux-pins
> > > > 	pin 20 (GPMI_RDY0): leds (GPIO UNCLAIMED) function leds group leds.0
> > > > 
> > > > I wonder why there is still "GPIO UNCLAIMED". I would have expected that
> > > > this disappears and somehow references the gpio_request issued by the
> > > > led-gpio driver after my patch.
> > > > 
> > > > What am I missing?
> > > 
> > > It seems that's only the case where @strict of struct pinmux_ops is
> > > true.  We should set it true for pinctrl-mxs, I guess?
> > 
> > The description is:
> > 
> >  * @strict: do not allow simultaneous use of the same pin for GPIO and another
> >  *      function. Check both gpio_owner and mux_owner strictly before approving
> >  *      the pin request.
> 
> Sorry, I misread the 'strict' code and my comment about it is
> completely a noise.
> 
> I went through the code around requesting a pin, and found that we need
> to call pinctrl_request_gpio() from gpio driver to get the result you
> want.  In that case, pin_request() will be called with a valid
> gpio_range as below.
> 
>     pinctrl_request_gpio()
>         pinmux_request_gpio()
>             pin_request(..., gpio_range)
> 
> Right now, pin_request() is being called with a NULL gpio_range from
> pinmux_enable_setting().  That gets us the mux_owner rather than
> gpio_owner for the pin.

But then again I cannot mux a pin to a different function when the gpio
is requested, right?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
