From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH 04/50] pinctrl: bcm2835: Use devm_pinctrl_register() for
 pinctrl registration
Date: Wed, 24 Feb 2016 10:27:59 -0800
Message-ID: <d3e4a7ae-6c51-1a2f-8344-8f8b2ff3f5ec@broadcom.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
 <1456319775-3216-5-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 5520-maca-inet1-outside.broadcom.com ([216.31.211.11]:59120
	"EHLO mail-irv-18.broadcom.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757300AbcBXS2D (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 24 Feb 2016 13:28:03 -0500
In-Reply-To: <1456319775-3216-5-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Ray Jui <rjui@broadcom.com>



On 2/24/2016 5:15 AM, Laxman Dewangan wrote:
> Use devm_pinctrl_register() for pin control registration.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Ray Jui <rjui@broadcom.com>
> ---
>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> index 0f5997c..25bc4a2 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> @@ -1027,7 +1027,7 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
>  		return err;
>  	}
>
> -	pc->pctl_dev = pinctrl_register(&bcm2835_pinctrl_desc, dev, pc);
> +	pc->pctl_dev = devm_pinctrl_register(dev, &bcm2835_pinctrl_desc, pc);
>  	if (IS_ERR(pc->pctl_dev)) {
>  		gpiochip_remove(&pc->gpio_chip);
>  		return PTR_ERR(pc->pctl_dev);
> @@ -1045,7 +1045,6 @@ static int bcm2835_pinctrl_remove(struct platform_device *pdev)
>  {
>  	struct bcm2835_pinctrl *pc = platform_get_drvdata(pdev);
>
> -	pinctrl_unregister(pc->pctl_dev);
>  	gpiochip_remove(&pc->gpio_chip);
>
>  	return 0;
>

Reviewed-by: Ray Jui <ray.jui@broadcom.com>

Thanks!

Ray
