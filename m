From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 3/3] gpiolib: Convert fwnode_get_named_gpiod() to
 configure GPIO
Date: Wed, 4 Jan 2017 14:52:09 +0200
Message-ID: <20170104125209.GT3353@lahna.fi.intel.com>
References: <20170103170119.35950-1-andriy.shevchenko@linux.intel.com>
 <20170103170119.35950-3-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:4252 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S936022AbdADMzh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Jan 2017 07:55:37 -0500
Content-Disposition: inline
In-Reply-To: <20170103170119.35950-3-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

On Tue, Jan 03, 2017 at 07:01:19PM +0200, Andy Shevchenko wrote:
> Make fwnode_get_named_gpiod() consistent with the rest of gpiod_get() like API,
> i.e. configure GPIO pin immediately after request.
> 
> Besides obvious clean up it will help to configure pins based on firmware
> provided resources.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/devres.c                     |  9 +++++++--
>  drivers/gpio/gpiolib.c                    | 20 ++++++++++++++++----
>  drivers/input/keyboard/gpio_keys.c        |  9 +--------
>  drivers/input/keyboard/gpio_keys_polled.c | 11 ++---------
>  drivers/leds/leds-gpio.c                  |  2 +-
>  drivers/video/fbdev/amba-clcd-nomadik.c   | 15 +++++----------
>  include/linux/gpio/consumer.h             | 19 +++++++++++++------
>  7 files changed, 45 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpio/devres.c b/drivers/gpio/devres.c
> index 54da61112752..3da9c39fed04 100644
> --- a/drivers/gpio/devres.c
> +++ b/drivers/gpio/devres.c
> @@ -129,13 +129,18 @@ EXPORT_SYMBOL(devm_gpiod_get_index);
>   * @dev:	GPIO consumer
>   * @con_id:	function within the GPIO consumer
>   * @child:	firmware node (child of @dev)
> + * @flags:	GPIO initialization flags

Please call this 'dflags' as it is called elsewhere as well.

Otherwise looks reasonable to me.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
