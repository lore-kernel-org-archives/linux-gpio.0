From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v1 1/3] pinctrl: baytrail: Rectify debounce support
 (part 2)
Date: Fri, 27 Jan 2017 10:14:05 +0100
Message-ID: <20170127101405.5dd1a40c@endymion>
References: <20170126172409.132136-1-andriy.shevchenko@linux.intel.com>
        <20170126172409.132136-2-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:59173 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754765AbdA0JOO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Jan 2017 04:14:14 -0500
In-Reply-To: <20170126172409.132136-2-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org

Hi Andy,

On Thu, 26 Jan 2017 19:24:07 +0200, Andy Shevchenko wrote:
> The commit 04ff5a095d66 ("pinctrl: baytrail: Rectify debounce support")
> almost fixes the logic of debuonce but missed couple of things, i.e.
> typo in mask when disabling debounce and lack of enabling it back.
> 
> This patch addresses above issues.
> 
> Reported-by: Jean Delvare <jdelvare@suse.de>
> Fixes: 04ff5a095d66 ("pinctrl: baytrail: Rectify debounce support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-baytrail.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
> index e696a01365cb..958db4f5ee9b 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -1243,10 +1243,12 @@ static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
>  			debounce = readl(db_reg);
>  			debounce &= ~BYT_DEBOUNCE_PULSE_MASK;
>  
> +			if (arg)
> +				conf |= BYT_DEBOUNCE_EN;
> +			else
> +				conf &= ~BYT_DEBOUNCE_EN;
> +
>  			switch (arg) {
> -			case 0:
> -				conf &= BYT_DEBOUNCE_EN;
> -				break;
>  			case 375:
>  				debounce |= BYT_DEBOUNCE_PULSE_375US;
>  				break;
> @@ -1269,7 +1271,9 @@ static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
>  				debounce |= BYT_DEBOUNCE_PULSE_24MS;
>  				break;
>  			default:
> -				ret = -EINVAL;
> +				if (arg)
> +					ret = -EINVAL;

Or you could keep the case 0: above. Makes the patch even smaller.

> +				break;

That break isn't needed.

>  			}
>  
>  			if (!ret)

Looks good to me.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
