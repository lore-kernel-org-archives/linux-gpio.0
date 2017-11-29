From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: Initialize GPIO properly when used
 through irqchip
Date: Wed, 29 Nov 2017 13:39:00 +0100
Message-ID: <CACRpkdbkt_=g0TGhPyh+s-oCFQniXEeKMG=Z56_WZHGqkr4nwg@mail.gmail.com>
References: <20171120151936.68726-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171120151936.68726-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Daniel Drake <drake@endlessm.com>, Chris Chiu <chiu@endlessm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Nov 20, 2017 at 4:19 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> When a GPIO is requested using gpiod_get_* APIs the intel pinctrl driver
> switches the pin to GPIO mode and makes sure interrupts are routed to
> the GPIO hardware instead of IOAPIC. However, if the GPIO is used
> directly through irqchip, as is the case with many I2C-HID devices where
> I2C core automatically configures interrupt for the device, the pin is
> not initialized as GPIO. Instead we rely that the BIOS configures the
> pin accordingly which seems not to be the case at least in Asus X540NA
> SKU3 with Focaltech touchpad.
>
> When the pin is not properly configured it might result weird behaviour
> like interrupts suddenly stop firing completely and the touchpad stops
> responding to user input.
>
> Fix this by properly initializing the pin to GPIO mode also when it is
> used directly through irqchip.
>
> Reported-by: Daniel Drake <drake@endlessm.com>
> Reported-by: Chris Chiu <chiu@endlessm.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Should this have a Fixes:?

Should this have a Cc: stable@vger.kernel.org?

> Chris, Daniel,
>
> Could you check that this still solves the issue and maybe provide your
> Tested-by? Thanks!

Pls pick up Tested-by's when resending.

> +static void __intel_gpio_init_gpio(void __iomem *padcfg0)

I just don't like __underscore_means_inner_function() I
strongly prefer function_has_a_proper_name() so please
come up with something that describes what it is really doing
and name it like that.

With that fixes, I'll apply it pronto.

Yours,
Linus Walleij
