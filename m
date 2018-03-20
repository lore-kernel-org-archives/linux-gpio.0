From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] pinctrl: armada-37xx: Add edge both type gpio irq support
Date: Tue, 20 Mar 2018 22:56:15 +0100
Message-ID: <20180320215615.zszlfw5pnecfqhpt@pengutronix.de>
References: <20171019131003.9684-1-gregory.clement@free-electrons.com>
 <CACRpkdbqjh5U5QoE_B+7GfSyDdHW-NCAvogGq-2n8j6L6nG-Gw@mail.gmail.com>
 <20171031131617.GA11647@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171031131617.GA11647@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Hua Jing <jinghua@marvell.com>, Ken Ma <make@marvell.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nadav Haklai <nadavh@marvell.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Victor Gu <xigu@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, =?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@free-electrons.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 31, 2017 at 02:16:17PM +0100, Andrew Lunn wrote:
> > Patch applied.
> > 
> > The discussion here is interesting, it is customary for GPIO drivers
> > to implement double-edge detection emulation by swapping the
> > edge detector around like this.
> 
> Hi Linus
> 
> I was not aware this was customary.
> 
> > It might be possible to collect some generic information about
> > this in the Documentation/gpio/driver.txt document.
> 
> Yes, i think it should be documented somewhere. Even in the use case
> here, detecting an SD card being inserted/removed, you could get some
> bounce on the microswitch, miss an edge, and be in the wrong state.

Maybe I'm wrong, but I wonder if there could be a set of helper
functions provided by the gpio core that helps implementing this
software simulation of IRQ_TYPE_EDGE_BOTH reliably (i.e. as good as
possible in software) to prevent common mistakes.

First draft:

		disable_irq_nosync(...);
		level = gpio_get(...);
	retry:
		if (level)
			configure_for_falling_edge();
		else
			configure_for_raising_edge();
		postlevel = gpio_get(...);

		if (level != postlevel) {
			mark_irq_pending(); /* something like desc->istate |= IRQS_PENDING */
			level = postlevel;
			goto retry;
		}

		enable_irq(...); /* this resends the irq */

I think this only looses an event if there is an edge between gpio_get
and the configure_for_${some}_edge and another before postlevel = ...
that make the two events invisible. But I think this is okish, as a
short spike might also be missed by a hw-edge-detector. And compared to
the current code there should be no way to end in a state where we
configured for raising edge and the level is already high.

When the gpio toggles quickly this might keep the cpu busy in an endless
loop, but such a sequence would also block a controller that can trigger
on both edges in hardware. Not sure if breaking the loop at some point
is sensible anyhow. Also calling the irq handlers would be beneficial,
but I don't know if/how this works without (more) racing.

A similar approach would be great to have to "simulate" level sensitive
irqs if the hardware only implements edge logic (which affects
armada-37xx, too, which annoys me).

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
