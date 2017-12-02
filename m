From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: intel: Initialize GPIO properly when used
 through irqchip
Date: Sat, 2 Dec 2017 13:11:30 +0100
Message-ID: <CACRpkdayJH-z2bnZCiJUy6eg1cDgAjUWGM_DiV0fC+DNAhUwHA@mail.gmail.com>
References: <20171129132544.33399-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171129132544.33399-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Daniel Drake <drake@endlessm.com>, Chris Chiu <chiu@endlessm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Nov 29, 2017 at 2:25 PM, Mika Westerberg
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
> Fixes: 7981c0015af2 ("pinctrl: intel: Add Intel Sunrisepoint pin controller and GPIO support")
> Reported-by: Daniel Drake <drake@endlessm.com>
> Reported-and-tested-by: Chris Chiu <chiu@endlessm.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: stable@vger.kernel.org
> ---
> Changes from v1:
>
>   * Renamed __intel_gpio_init_gpio() to intel_gpio_set_gpio_mode()
>   * Added Fixes: and Cc stable@vger.kernel.org
>   * Added Tested-by from Chris Chiu

Patch applied.

Yours,
Linus Walleij
