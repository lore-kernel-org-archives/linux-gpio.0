From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v1 2/3] pinctrl: baytrail: Debounce register is one per
 community
Date: Fri, 27 Jan 2017 10:21:09 +0100
Message-ID: <20170127102109.3fb3d018@endymion>
References: <20170126172409.132136-1-andriy.shevchenko@linux.intel.com>
        <20170126172409.132136-3-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60801 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754570AbdA0JVQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Jan 2017 04:21:16 -0500
In-Reply-To: <20170126172409.132136-3-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, Cristina Ciocan <cristina.ciocan@intel.com>

On Thu, 26 Jan 2017 19:24:08 +0200, Andy Shevchenko wrote:
> Debounce value is set globally per community. Otherwise user will easily
> get a kernel crash when they start using the feature:
> 
> BUG: unable to handle kernel paging request at ffffc900003be000
> IP: byt_gpio_dbg_show+0xa9/0x430
> 
> Make it clear in byt_gpio_reg().
> 
> Note that this fix just prevents kernel to crash, but doesn't make any
> difference to the existing logic. It means the last caller will win the
> trade and debounce value will be configured accordingly. The actual
> logic fix needs to be thought about and it's not as important as crash
> fix. That's why the latter goes separately and right now.
> 
> Fixes: 658b476c742f ("pinctrl: baytrail: Add debounce configuration")
> Cc: Cristina Ciocan <cristina.ciocan@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-baytrail.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
> index 958db4f5ee9b..a1f85a79f186 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -731,16 +731,23 @@ static void __iomem *byt_gpio_reg(struct byt_gpio *vg, unsigned int offset,
>  				  int reg)
>  {
>  	struct byt_community *comm = byt_get_community(vg, offset);
> -	u32 reg_offset = 0;
> +	u32 reg_offset;
>  
>  	if (!comm)
>  		return NULL;
>  
>  	offset -= comm->pin_base;
> -	if (reg == BYT_INT_STAT_REG)
> +	switch (reg) {
> +	case BYT_INT_STAT_REG:
>  		reg_offset = (offset / 32) * 4;
> -	else
> +		break;
> +	case BYT_DEBOUNCE_REG:
> +		reg_offset = 0;
> +		break;
> +	default:
>  		reg_offset = comm->pad_map[offset] * 16;
> +		break;

That break isn't needed ;-)

> +	}
>  
>  	return comm->reg_base + reg_offset + reg;
>  }

The code looks sane to me, although I can't verify its correctness
without a datasheet.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
