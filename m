From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 3/3] pinctrl / gpio: Introduce .set_config() callback
 for GPIO chips
Date: Wed, 25 Jan 2017 12:09:44 +0200
Message-ID: <20170125100944.GR17297@lahna.fi.intel.com>
References: <20170123123434.61972-1-mika.westerberg@linux.intel.com>
 <20170123123434.61972-4-mika.westerberg@linux.intel.com>
 <20170123171107.GC32404@localhost>
 <20170124111130.GE17297@lahna.fi.intel.com>
 <CACRpkdYW9fe39w3KkdLgiiJLr_rQcX2rTrN=54pzP+zqFoLXZQ@mail.gmail.com>
 <20170124125756.GG17297@lahna.fi.intel.com>
 <20170124134504.GA20261@localhost>
 <20170124142220.GK17297@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170124142220.GK17297@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Neil Armstrong <narmstrong@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 24, 2017 at 04:22:20PM +0200, Mika Westerberg wrote:
> On Tue, Jan 24, 2017 at 02:45:04PM +0100, Johan Hovold wrote:
> > Good, that's the one I knew about. But I also got another conflict
> > against pinctrl when applying on top of f9dd6f6cc63c ("Add linux-next
> > specific files for 20170123"):
> > 
> > Applying: pinctrl / gpio: Introduce .set_config() callback for GPIO chips
> > error: patch failed: drivers/pinctrl/pinctrl-amd.c:756
> > error: drivers/pinctrl/pinctrl-amd.c: patch does not apply
> > error: patch failed: drivers/staging/greybus/gpio.c:474
> > error: drivers/staging/greybus/gpio.c: patch does not apply
> > Patch failed at 0001 pinctrl / gpio: Introduce .set_config() callback for GPIO chips
> 
> I tried today's linux-next 766074e7818 ("Add linux-next specific files
> for 20170124") but only saw that GPIO conflict.
> 
> In any case I'm going to rebase my series on top of linux-gpio.git/devel
> and submit it as v3.

That said, it seems this v2 series applies cleanly to
linux-gpio.git/devel. There will be trivial conflict with the staging
tree because of 7f2e9de736e7 ("staging: greybus: fix checkpatch unsigned
warnings") but that's it.

LinusW, can you take the series as is or should I rebase it on top of
something else?

Thanks and sorry about the mess.
