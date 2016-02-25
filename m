From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 12/50] pinctrl: intel: Use devm_pinctrl_register() for
 pinctrl registration
Date: Thu, 25 Feb 2016 13:44:51 +0200
Message-ID: <20160225114451.GB29434@kuha.fi.intel.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
 <1456319775-3216-13-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:18228 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752554AbcBYLo6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 25 Feb 2016 06:44:58 -0500
Content-Disposition: inline
In-Reply-To: <1456319775-3216-13-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Mika Westerberg <mika.westerberg@linux.intel.com>

On Wed, Feb 24, 2016 at 06:45:37PM +0530, Laxman Dewangan wrote:
> Use devm_pinctrl_register() for pin control registration.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 85536b4..27bb21b 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1014,7 +1014,8 @@ int intel_pinctrl_probe(struct platform_device *pdev,
>  	pctrl->pctldesc.pins = pctrl->soc->pins;
>  	pctrl->pctldesc.npins = pctrl->soc->npins;
>  
> -	pctrl->pctldev = pinctrl_register(&pctrl->pctldesc, &pdev->dev, pctrl);
> +	pctrl->pctldev = devm_pinctrl_register(&pdev->dev, &pctrl->pctldesc,
> +					       pctrl);
>  	if (IS_ERR(pctrl->pctldev)) {
>  		dev_err(&pdev->dev, "failed to register pinctrl driver\n");
>  		return PTR_ERR(pctrl->pctldev);

The same as in pinctrl-cherryview.c. pinctrl_unregister() is also
called here inside intel_pinctrl_probe().

> @@ -1037,7 +1038,6 @@ int intel_pinctrl_remove(struct platform_device *pdev)
>  	struct intel_pinctrl *pctrl = platform_get_drvdata(pdev);
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
