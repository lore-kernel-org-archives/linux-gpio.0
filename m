From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] pinctrl: baytrail: Do not call WARN_ON for a firmware
 bug
Date: Wed, 12 Jul 2017 15:38:52 +0300
Message-ID: <1499863132.22624.361.camel@linux.intel.com>
References: <20170712123101.26996-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:18286 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756063AbdGLMi5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jul 2017 08:38:57 -0400
In-Reply-To: <20170712123101.26996-1-hdegoede@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

On Wed, 2017-07-12 at 14:31 +0200, Hans de Goede wrote:
> WARN_ON causes a backtrace to get logged which is only useful for
> kernel bugs. For signalling a firmware bug dev_warn(dev, FW_BUG "...")
> should be used.
> 
> This fixes users running userspace software to monitor kernel oopses
> getting a false positive bug-report every boot because of the wrong
> use of WARN_ON.

I'm not against the patch, looks good to me, though can you shed a bit
of light what is the FW bug you are experiencing?

> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/pinctrl/intel/pinctrl-baytrail.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c
> b/drivers/pinctrl/intel/pinctrl-baytrail.c
> index fa3c5758ac67..0f3a02495aeb 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -981,12 +981,12 @@ static int byt_gpio_request_enable(struct
> pinctrl_dev *pctl_dev,
>  	 */
>  	value = readl(reg) & BYT_PIN_MUX;
>  	gpio_mux = byt_get_gpio_mux(vg, offset);
> -	if (WARN_ON(gpio_mux != value)) {
> +	if (gpio_mux != value) {
>  		value = readl(reg) & ~BYT_PIN_MUX;
>  		value |= gpio_mux;
>  		writel(value, reg);
>  
> -		dev_warn(&vg->pdev->dev,
> +		dev_warn(&vg->pdev->dev, FW_BUG
>  			 "pin %u forcibly re-configured as GPIO\n",
> offset);
>  	}
>  

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
