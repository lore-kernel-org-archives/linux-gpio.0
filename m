From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH] gpiolib: fix issue of gpio acpi handler
Date: Mon, 9 Mar 2015 13:12:03 +0200
Message-ID: <20150309111203.GW1758@lahna.fi.intel.com>
References: <1425654518-48935-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:31768 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753994AbbCILMK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Mar 2015 07:12:10 -0400
Content-Disposition: inline
In-Reply-To: <1425654518-48935-1-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "qipeng.zha" <qipeng.zha@intel.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, qi.zheng@intel.com

On Fri, Mar 06, 2015 at 11:08:38PM +0800, qipeng.zha wrote:
> From: "qipeng.zha" <qipeng.zha@intel.com>
> 
> If GPIO driver use pin mapping, need to tranlate pin number
                                          ^^^^^^^^
typo, should be "translate"

> between ACPI table and GPIO driver.
> 
> This issue is found on one platform with Cherryview gpio
> controller, kernel is hang when executed _PS0 method of
> one ACPI device, since without this translation, it access
> invalid gpiodesc array.
> 
> Verified it works again with this patch.
> 
> Signed-off-by: qipeng.zha <qipeng.zha@intel.com>
> ---
>  drivers/gpio/gpiolib-acpi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index c0929d9..661e272 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -551,6 +551,13 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
>  		struct gpio_desc *desc;
>  		bool found;
>  
> +		/*Translate ACPI gpio pin to offset in gpio driver*/

/* Comments look like this */

notice that there is space between /* and beginning of the sentence.

But this comment does not add any new information so I would just drop
it.

Otherwise this patch seems right to me.

BTW, I wonder if we need to do the same in
acpi_gpiochip_request_interrupt()?

> +		pin = acpi_gpiochip_pin_to_gpio_offset(chip, pin);
> +		if (pin < 0) {
> +			status = AE_BAD_PARAMETER;
> +			goto out;
> +		}
> +
>  		mutex_lock(&achip->conn_lock);
>  
>  		found = false;
> -- 
> 1.8.3.2
