From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: [BUG] pinctrl: sunxi: sunxi-pinctrl fail to load with
 CONFIG_DEBUG_TEST_DRIVER_REMOVE
Date: Mon, 7 Nov 2016 11:28:15 +0100
Message-ID: <20161107102815.GA505@Red>
References: <20161107081832.GA23580@Red>
 <CAGb2v65MHBUwWzcqwPYDtFNxgGnMECUMjHdZNOv6YPP4HVzwTw@mail.gmail.com>
 <20161107095612.ih5ns24m2qiwujy5@lukather>
 <20161107095953.GB20037@Red>
 <20161107101500.ostb5auj2fpxcqe6@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161107101500.ostb5auj2fpxcqe6@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Nov 07, 2016 at 11:15:00AM +0100, Maxime Ripard wrote:
> On Mon, Nov 07, 2016 at 10:59:53AM +0100, Corentin Labbe wrote:
> > On Mon, Nov 07, 2016 at 10:56:12AM +0100, Maxime Ripard wrote:
> > > On Mon, Nov 07, 2016 at 05:48:43PM +0800, Chen-Yu Tsai wrote:
> > > > Hi,
> > > > 
> > > > On Mon, Nov 7, 2016 at 4:18 PM, LABBE Corentin
> > > > <clabbe.montjoie@gmail.com> wrote:
> > > > > Hello
> > > > >
> > > > > With CONFIG_DEBUG_TEST_DRIVER_REMOVE=y pinctrl-sunxi fail to load on the second try.
> > > > >
> > > > > [    3.900061] sun8i-h3-pinctrl 1c20800.pinctrl: initialized sunXi PIO driver
> > > > > [    3.916251] gpio gpiochip1: GPIO integer space overlap, cannot add chip
> > > > > [    3.923016] gpiochip_add_data: GPIOs 0..223 (1c20800.pinctrl) failed to register
> > > > > [    3.931099] sun8i-h3-pinctrl: probe of 1c20800.pinctrl failed with error -16
> > > > > [    3.944709] sun8i-h3-r-pinctrl 1f02c00.pinctrl: initialized sunXi PIO driver
> > > > > [    3.960796] gpio gpiochip2: GPIO integer space overlap, cannot add chip
> > > > > [    3.967594] gpiochip_add_data: GPIOs 352..383 (1f02c00.pinctrl) failed to register
> > > > > [    3.975633] sun8i-h3-r-pinctrl: probe of 1f02c00.pinctrl failed with error -16
> > > > >
> > > > > Without it, all subsequent drivers fail to load.
> > > > > Tested on Orange PI PC board.
> > > > 
> > > > I don't think the pinctrl drivers were designed to be removed.
> > > > And I thought the lack of a .remove callback in the driver blocks
> > > > the core from removing the device? Maybe I remember wrong...
> > > 
> > > Using a builtin_platform_driver should be enough to prevent it to be
> > > removed.
> > > 
> > 
> > The problem is that it is already builtin_platform_driver()
> 
> Then there's no way it can be removed in the first place.
> 

I will send a patch for fixing CONFIG_DEBUG_TEST_DRIVER_REMOVE
