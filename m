From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 11/50] pinctrl: cherryview: Use devm_pinctrl_register()
 for pinctrl registration
Date: Thu, 25 Feb 2016 13:42:06 +0200
Message-ID: <20160225114206.GA29434@kuha.fi.intel.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
 <1456319775-3216-12-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:20256 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750840AbcBYLmM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 25 Feb 2016 06:42:12 -0500
Content-Disposition: inline
In-Reply-To: <1456319775-3216-12-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Mika Westerberg <mika.westerberg@linux.intel.com>

Hi,

On Wed, Feb 24, 2016 at 06:45:36PM +0530, Laxman Dewangan wrote:
> Use devm_pinctrl_register() for pin control registration.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-cherryview.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
> index 4251e07..1152b8a 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -1526,7 +1526,8 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
>  	pctrl->pctldesc.pins = pctrl->community->pins;
>  	pctrl->pctldesc.npins = pctrl->community->npins;
>  
> -	pctrl->pctldev = pinctrl_register(&pctrl->pctldesc, &pdev->dev, pctrl);
> +	pctrl->pctldev = devm_pinctrl_register(&pdev->dev, &pctrl->pctldesc,
> +					       pctrl);
>  	if (IS_ERR(pctrl->pctldev)) {
>  		dev_err(&pdev->dev, "failed to register pinctrl driver\n");
>  		return PTR_ERR(pctrl->pctldev);

You missed one pinctrl_unregister() call inside chv_pinctrl_probe().
Check right below this point where chv_gpio_probe() is called.

> @@ -1548,7 +1549,6 @@ static int chv_pinctrl_remove(struct platform_device *pdev)
>  	struct chv_pinctrl *pctrl = platform_get_drvdata(pdev);
>  
>  	gpiochip_remove(&pctrl->chip);
> -	pinctrl_unregister(pctrl->pctldev);
>  
>  	return 0;
>  }
> -- 
> 2.1.4

Thanks,

-- 
heikki
