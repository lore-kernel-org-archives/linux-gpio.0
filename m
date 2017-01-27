From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v1 3/3] pinctrl: baytrail: Add debounce to debug output
Date: Fri, 27 Jan 2017 11:07:31 +0100
Message-ID: <20170127110731.4c0dd5c2@endymion>
References: <20170126172409.132136-1-andriy.shevchenko@linux.intel.com>
        <20170126172409.132136-4-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:45581 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754853AbdA0KHm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Jan 2017 05:07:42 -0500
In-Reply-To: <20170126172409.132136-4-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org

Hi Andy,

On Thu, 26 Jan 2017 19:24:09 +0200, Andy Shevchenko wrote:
> When debug pin configuration is printed out debounce setting is missed.
> Add it here.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-baytrail.c | 46 ++++++++++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
> index a1f85a79f186..6bdb6e5879f8 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -1391,11 +1391,12 @@ static int byt_gpio_direction_output(struct gpio_chip *chip,
>  static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
>  {
>  	struct byt_gpio *vg = gpiochip_get_data(chip);
> +	u32 conf0, debounce, val;
>  	int i;
> -	u32 conf0, val;
>  
>  	for (i = 0; i < vg->soc_data->npins; i++) {
>  		const struct byt_community *comm;
> +		const char *db_str = NULL;
>  		const char *pull_str = NULL;
>  		const char *pull = NULL;
>  		void __iomem *reg;
> @@ -1415,6 +1416,16 @@ static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
>  		}
>  		conf0 = readl(reg);
>  
> +		reg = byt_gpio_reg(vg, pin, BYT_DEBOUNCE_REG);
> +		if (!reg) {
> +			seq_printf(s,
> +				   "Could not retrieve pin %i debounce reg\n",
> +				   pin);
> +			raw_spin_unlock_irqrestore(&vg->lock, flags);
> +			continue;
> +		}
> +		debounce = readl(reg);
> +
>  		reg = byt_gpio_reg(vg, pin, BYT_VAL_REG);
>  		if (!reg) {
>  			seq_printf(s,
> @@ -1459,6 +1470,32 @@ static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
>  			break;
>  		}
>  
> +		if (conf0 & BYT_DEBOUNCE_EN) {
> +			switch (debounce & BYT_DEBOUNCE_PULSE_MASK) {
> +			case BYT_DEBOUNCE_PULSE_375US:
> +				db_str = "375us";
> +				break;
> +			case BYT_DEBOUNCE_PULSE_750US:
> +				db_str = "750us";
> +				break;
> +			case BYT_DEBOUNCE_PULSE_1500US:
> +				db_str = "1500us";
> +				break;
> +			case BYT_DEBOUNCE_PULSE_3MS:
> +				db_str = "3ms";
> +				break;
> +			case BYT_DEBOUNCE_PULSE_6MS:
> +				db_str = "6ms";
> +				break;
> +			case BYT_DEBOUNCE_PULSE_12MS:
> +				db_str = "12ms";
> +				break;
> +			case BYT_DEBOUNCE_PULSE_24MS:
> +				db_str = "24ms";
> +				break;
> +			}
> +		}
> +
>  		seq_printf(s,
>  			   " gpio-%-3d (%-20.20s) %s %s %s pad-%-3d offset:0x%03x mux:%d %s%s%s",
>  			   pin,
> @@ -1475,7 +1512,12 @@ static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
>  		if (pull && pull_str)
>  			seq_printf(s, " %-4s %-3s", pull, pull_str);
>  		else
> -			seq_puts(s, "          ");
> +			seq_puts(s, "         ");
> +
> +		if (db_str)
> +			seq_printf(s, " %-6s", db_str);
> +		else
> +			seq_puts(s, "        ");

Isn't that one space too many?

>  
>  		if (conf0 & BYT_IODEN)
>  			seq_puts(s, " open-drain");

Looks good to me.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
