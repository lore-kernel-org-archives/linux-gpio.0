From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: Re: [PATCH v3] pinctrl: berlin: fix 'pctrl->functions' allocation
 in berlin_pinctrl_build_state
Date: Wed, 1 Aug 2018 13:16:46 +0800
Message-ID: <20180801131646.1fcc19f6@xhacker.debian>
References: <20180801051049.21360-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180801051049.21360-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: linus.walleij@linaro.org, yamada.masahiro@socionext.com, keescook@chromium.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, 1 Aug 2018 13:10:49 +0800 YueHaibing wrote:

> fixes following Smatch static check warning:
> 
>  drivers/pinctrl/berlin/berlin.c:237 berlin_pinctrl_build_state()
>  warn: passing devm_ allocated variable to kfree. 'pctrl->functions'
> 
> As we will be calling krealloc() on pointer 'pctrl->functions', which means
> kfree() will be called in there, devm_kzalloc() shouldn't be used with
> the allocation in the first place.  Fix the warning by calling kcalloc()
> and managing the free procedure in error path on our own.
> 
> Fixes: 3de68d331c24 ("pinctrl: berlin: add the core pinctrl driver for Marvell Berlin SoCs")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>

> ---
> v2: free pctrl->functions instead of function as Jisheng Zhang suggested
> v3: v2 I send a wrong patch,this is the correct patch.
> ---
>  drivers/pinctrl/berlin/berlin.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
> index d6d183e..b5903ff 100644
> --- a/drivers/pinctrl/berlin/berlin.c
> +++ b/drivers/pinctrl/berlin/berlin.c
> @@ -216,10 +216,8 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
>  	}
>  
>  	/* we will reallocate later */
> -	pctrl->functions = devm_kcalloc(&pdev->dev,
> -					max_functions,
> -					sizeof(*pctrl->functions),
> -					GFP_KERNEL);
> +	pctrl->functions = kcalloc(max_functions,
> +				   sizeof(*pctrl->functions), GFP_KERNEL);
>  	if (!pctrl->functions)
>  		return -ENOMEM;
>  
> @@ -257,8 +255,10 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
>  				function++;
>  			}
>  
> -			if (!found)
> +			if (!found) {
> +				kfree(pctrl->functions);
>  				return -EINVAL;
> +			}
>  
>  			if (!function->groups) {
>  				function->groups =
> @@ -267,8 +267,10 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
>  						     sizeof(char *),
>  						     GFP_KERNEL);
>  
> -				if (!function->groups)
> +				if (!function->groups) {
> +					kfree(pctrl->functions);
>  					return -ENOMEM;
> +				}
>  			}
>  
>  			groups = function->groups;
