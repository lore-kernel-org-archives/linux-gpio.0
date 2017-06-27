From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH for 4.12] Revert "pinctrl: rockchip: avoid hardirq-unsafe
 functions in irq_chip"
Date: Tue, 27 Jun 2017 18:35:11 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1706271621530.1798@nanos>
References: <20170517225634.GA11404@google.com> <20170627000622.GA63039@google.com> <alpine.DEB.2.20.1706271357520.1798@nanos> <1674651.7QIPUCEQPh@diego>
Mime-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1454316633-1498578140=:1798"
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1674651.7QIPUCEQPh@diego>
Content-ID: <alpine.DEB.2.20.1706271834500.1798@nanos>
Sender: linux-pm-owner@vger.kernel.org
To: =?ISO-8859-15?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Brian Norris <briannorris@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, linux-rockchip@lists.infradead.org, Julia Cartwright <julia@ni.com>, LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, John Keeping <john@metanate.com>, linux-pm@vger.kernel.org, Doug Anderson <dianders@chromium.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, Tony Lindgren <tony@atomide.com>, "David.Wu" <david.wu@rock-chips.com>, =?ISO-2022-JP?Q?'=1B$B2+Es=1B=28J'?= <huangtao@rock-chips.com>
List-Id: linux-gpio@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1454316633-1498578140=:1798
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.20.1706271834501.1798@nanos>

On Tue, 27 Jun 2017, Heiko Stübner wrote:
> Am Dienstag, 27. Juni 2017, 15:01:32 CEST schrieb Thomas Gleixner:
> > The only irq chip function which uses the regmap magic is the
> > irq_set_type() callback. Now, I have a hard time to understand (though I'm
> > no regmap/pinctrl expert) why that regmap stuff needs to be called in the
> > first place. The level and the polarity are programmed via:
> > 
> >         writel_relaxed(level, gc->reg_base + GPIO_INTTYPE_LEVEL);
> >         writel_relaxed(polarity, gc->reg_base + GPIO_INT_POLARITY);
> > 
> > Why needs the regmap machinery to be invoked there? The GPIO is already
> > muxed and configured as interrupt, otherwise none of the irq functions
> > could be invoked. Hmm?
> 
> That is a safeguard against the pinmux not being set as "gpio" but some other 
> function, if the irq is requested directly without going through the gpio API. 
> 
> But looking at struct irq_chip and also other pinctrl drivers again, it seems
> the new [0] irq_request_resources might be the way saner place for this.
> Especially as it also prevents the mux-setting from being called more than 
> once.

That'll fail on RT as well because irq_request_resources() is called with
irq_desc->lock held and interrupts disabled.

irq_request_resources() can probably be called without holding desc->lock,
though we need some form of protection against concurrent irq
requests/free. I'll have look into that.

Thanks,

	tglx

--8323329-1454316633-1498578140=:1798--
