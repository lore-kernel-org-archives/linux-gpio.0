From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] pinctrl: cherryview: Add a quirk to make Acer Chromebook
 keyboard work again
Date: Mon, 3 Apr 2017 11:52:18 -0700
Message-ID: <20170403185218.GE34530@dtor-ws>
References: <20170329095932.73368-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:33549 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751210AbdDCSwV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Apr 2017 14:52:21 -0400
Received: by mail-pg0-f66.google.com with SMTP id 79so31753224pgf.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Apr 2017 11:52:21 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170329095932.73368-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Adam S Levy <theadamlevy@gmail.com>, linux-gpio@vger.kernel.org

On Wed, Mar 29, 2017 at 12:59:32PM +0300, Mika Westerberg wrote:
> After commit 47c950d10202 ("pinctrl: cherryview: Do not add all
> southwest and north GPIOs to IRQ domain") the driver does not add all
> GPIOs to the irqdomain. The reason for that is that those GPIOs cannot
> generate IRQs at all, only GPEs (General Purpose Events). This causes
> Linux virtual IRQ numbering to change.
> 
> However, it seems some CYAN Chromebooks, including Acer Chromebook
> hardcodes these Linux IRQ numbers in the ACPI tables of the machine.
> Since the numbering is different now, the IRQ meant for keyboard does
> not match the Linux virtual IRQ number anymore making the keyboard
> non-functional.
> 
> Work this around by adding special quirk just for these machines where
> we add back all GPIOs to the irqdomain. Rest of the Cherryview/Braswell
> based machines will not be affected by the change.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=194945
> Fixes: 47c950d10202 ("pinctrl: cherryview: Do not add all southwest and north GPIOs to IRQ domain")
> Reported-by: Adam S Levy <theadamlevy@gmail.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-cherryview.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
> index f80134e3e0b6..bbe9cdf36ca4 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -13,6 +13,7 @@
>   * published by the Free Software Foundation.
>   */
>  
> +#include <linux/dmi.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
> @@ -1524,10 +1525,30 @@ static void chv_gpio_irq_handler(struct irq_desc *desc)
>  	chained_irq_exit(chip, desc);
>  }
>  
> +/*
> + * Certain machines seem to hardcode Linux IRQ numbers in their ACPI
> + * tables. Since we leave GPIOs that are not capable of generating
> + * interrupts out of the irqdomain the numbering will be different and
> + * cause devices using the hardcoded IRQ numbers fail. In order not to
> + * break such machines we will only mask pins from irqdomain if the machine
> + * is not listed below.
> + */
> +static const struct dmi_system_id chv_no_valid_mask[] = {
> +	{
> +		/* See https://bugzilla.kernel.org/show_bug.cgi?id=194945 */
> +		.ident = "Acer Chromebook (CYAN)",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Edgar"),

Is there a BIOS version (I do not have my Cyan with me)? Because if
Intel happens to release a fixes for this hard-coded mapping, we would
not want to continue applying this quirk, would we?

Thanks.

-- 
Dmitry
