From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH] pinctrl: update direction_output function of cherryview
 driver
Date: Mon, 9 Mar 2015 12:29:30 +0200
Message-ID: <20150309102930.GT1758@lahna.fi.intel.com>
References: <1425377602-6649-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:4395 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754069AbbCIK3e (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Mar 2015 06:29:34 -0400
Content-Disposition: inline
In-Reply-To: <1425377602-6649-1-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "qipeng.zha" <qipeng.zha@intel.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, "jason.cj.chen" <jason.cj.chen@intel.com>, David Cohen <david.a.cohen@linux.intel.com>

On Tue, Mar 03, 2015 at 06:13:22PM +0800, qipeng.zha wrote:
> From: "qipeng.zha" <qipeng.zha@intel.com>
> 
> >From the comments of gpiod_direction_output(), need to set @value
> as initial output, so update the lowlevel routine to make it work.
> 
> Signed-off-by: jason.cj.chen<jason.cj.chen@intel.com>
> Signed-off-by: qipeng.zha <qipeng.zha@intel.com>

Thanks for the fix.

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

> ---
>  drivers/pinctrl/intel/pinctrl-cherryview.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
> index e9f8b39..ee6a6de 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -1206,6 +1206,7 @@ static int chv_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
>  static int chv_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
>  				     int value)
>  {
> +	chv_gpio_set(chip, offset, value);
>  	return pinctrl_gpio_direction_output(chip->base + offset);
>  }
>  
> -- 
> 1.8.3.2
