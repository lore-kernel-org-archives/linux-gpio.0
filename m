From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ARM: dts: imx28: add gpio-ranges for internal gpio
 controller
Date: Mon, 15 May 2017 09:16:08 +0200
Message-ID: <20170515071608.auju66dhylzaexkw@pengutronix.de>
References: <20170508085925.18342-1-u.kleine-koenig@pengutronix.de>
 <20170511075135.GF5833@dragon>
 <20170511080916.gim5pyhj5jarzf4r@pengutronix.de>
 <20170512030536.GC8471@dragon>
 <20170512080150.uh5qmwu2tctpd6jk@pengutronix.de>
 <20170515022129.GJ8471@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:38467 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752505AbdEOHQM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 May 2017 03:16:12 -0400
Content-Disposition: inline
In-Reply-To: <20170515022129.GJ8471@dragon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de

Hello Shawn,

On Mon, May 15, 2017 at 10:21:30AM +0800, Shawn Guo wrote:
> On Fri, May 12, 2017 at 10:01:50AM +0200, Uwe Kleine-König wrote:
> > On Fri, May 12, 2017 at 11:05:38AM +0800, Shawn Guo wrote:
> > > I went through the code around requesting a pin, and found that we need
> > > to call pinctrl_request_gpio() from gpio driver to get the result you
> > > want.  In that case, pin_request() will be called with a valid
> > > gpio_range as below.
> > > 
> > >     pinctrl_request_gpio()
> > >         pinmux_request_gpio()
> > >             pin_request(..., gpio_range)
> > > 
> > > Right now, pin_request() is being called with a NULL gpio_range from
> > > pinmux_enable_setting().  That gets us the mux_owner rather than
> > > gpio_owner for the pin.
> > 
> > But then again I cannot mux a pin to a different function when the gpio
> > is requested, right?

(Actually I intended to postpone this mail, but sent it instead by
accident.)
 
> You will need to free the GPIO before muxing it to a different function,
> I think.

IMHO this is a bad concept. This makes GPIOs more special than for
example PWMs or LEDs. And it breaks some configurations (for example the
make-pins-highz-on-idle setup in my previous mails).

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
