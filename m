From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 3/3] pinctrl / gpio: Introduce .set_config() callback
 for GPIO chips
Date: Tue, 24 Jan 2017 13:11:30 +0200
Message-ID: <20170124111130.GE17297@lahna.fi.intel.com>
References: <20170123123434.61972-1-mika.westerberg@linux.intel.com>
 <20170123123434.61972-4-mika.westerberg@linux.intel.com>
 <20170123171107.GC32404@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170123171107.GC32404@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 23, 2017 at 06:11:07PM +0100, Johan Hovold wrote:
> On Mon, Jan 23, 2017 at 03:34:34PM +0300, Mika Westerberg wrote:
> > Currently we already have two pin configuration related callbacks
> > available for GPIO chips .set_single_ended() and .set_debounce(). In
> > future we expect to have even more, which does not scale well if we need
> > to add yet another callback to the GPIO chip structure for each possible
> > configuration parameter.
> > 
> > Better solution is to reuse what we already have available in the
> > generic pinconf.
> > 
> > To support this, we introduce a new .set_config() callback for GPIO
> > chips. The callback takes a single packed pin configuration value as
> > parameter. This can then be extended easily beyond what is currently
> > supported by just adding new types to the generic pinconf enum.
> > 
> > If the GPIO driver is backed up by a pinctrl driver the GPIO driver can
> > just assign gpiochip_generic_config() (introduced in this patch) to
> > .set_config and that will take care configuration requests are directed
> > to the pinctrl driver.
> > 
> > We then convert the existing drivers over .set_config() and finally
> > remove the .set_single_ended() and .set_debounce() callbacks.
> > 
> > Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  Documentation/gpio/driver.txt                 |  9 +++--
> >  drivers/gpio/gpio-bcm-kona.c                  | 14 ++++++-
> >  drivers/gpio/gpio-dln2.c                      | 12 ++++--
> >  drivers/gpio/gpio-dwapb.c                     | 14 ++++++-
> >  drivers/gpio/gpio-ep93xx.c                    | 11 ++++--
> >  drivers/gpio/gpio-f7188x.c                    | 19 +++++----
> >  drivers/gpio/gpio-lp873x.c                    | 14 +++----
> >  drivers/gpio/gpio-max77620.c                  | 20 +++++-----
> >  drivers/gpio/gpio-menz127.c                   | 34 +++++++++++-----
> >  drivers/gpio/gpio-merrifield.c                | 14 ++++++-
> >  drivers/gpio/gpio-omap.c                      | 14 ++++++-
> >  drivers/gpio/gpio-tc3589x.c                   | 15 ++++---
> >  drivers/gpio/gpio-tegra.c                     | 14 ++++++-
> >  drivers/gpio/gpio-tps65218.c                  | 14 +++----
> >  drivers/gpio/gpio-vx855.c                     | 13 ++++---
> >  drivers/gpio/gpio-wcove.c                     | 13 +++----
> >  drivers/gpio/gpio-wm831x.c                    | 21 +++++-----
> >  drivers/gpio/gpio-wm8994.c                    | 13 +++----
> >  drivers/gpio/gpiolib.c                        | 56 +++++++++++++++++----------
> >  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 14 ++++++-
> >  drivers/pinctrl/pinctrl-amd.c                 | 14 ++++++-
> >  drivers/pinctrl/pinctrl-sx150x.c              | 55 +++++++-------------------
> >  drivers/staging/greybus/gpio.c                | 15 ++++---
> >  drivers/usb/serial/cp210x.c                   | 13 ++++---
> 
> For greybus and USB serial:
> 
> Acked-by: Johan Hovold <johan@kernel.org>

Thanks!

> Note however that this patch fails to apply to linux-next (conflicts in
> pinctrl as well as staging).

Indeed, it does. I did the series on top of v4.10-rc5 but looks like
there are some changes in linux-next that I missed.

I'll rebase the series on top of linux-next and resend.
