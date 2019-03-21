From: Jesper Nilsson <jesper.nilsson@axis.com>
Subject: Re: [PATCH -next] pinctrl: artpec6: Make two functions static
Date: Thu, 21 Mar 2019 16:59:23 +0100
Message-ID: <20190321155923.z4jbelggbqp2vjio@axis.com>
References: <20190321150909.3576-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190321150909.3576-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yue Haibing <yuehaibing@huawei.com>
Cc: jespern@axis.com, larper@axis.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@axis.com
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 21, 2019 at 11:09:09PM +0800, Yue Haibing wrote:
> From: YueHaibing <yuehaibing@huawei.com>
> 
> Fix sparse warnings:
> 
> drivers/pinctrl/pinctrl-artpec6.c:691:5: warning:
>  symbol 'artpec6_pmx_enable' was not declared. Should it be static?
> drivers/pinctrl/pinctrl-artpec6.c:705:6: warning:
>  symbol 'artpec6_pmx_disable' was not declared. Should it be static?
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

> ---
>  drivers/pinctrl/pinctrl-artpec6.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-artpec6.c b/drivers/pinctrl/pinctrl-artpec6.c
> index d89dc43..e836850 100644
> --- a/drivers/pinctrl/pinctrl-artpec6.c
> +++ b/drivers/pinctrl/pinctrl-artpec6.c
> @@ -688,8 +688,9 @@ static void artpec6_pmx_select_func(struct pinctrl_dev *pctldev,
>  	}
>  }
>  
> -int artpec6_pmx_enable(struct pinctrl_dev *pctldev, unsigned int function,
> -		       unsigned int group)
> +static int artpec6_pmx_enable(struct pinctrl_dev *pctldev,
> +			      unsigned int function,
> +			      unsigned int group)
>  {
>  	struct artpec6_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
>  
> @@ -702,8 +703,9 @@ int artpec6_pmx_enable(struct pinctrl_dev *pctldev, unsigned int function,
>  	return 0;
>  }
>  
> -void artpec6_pmx_disable(struct pinctrl_dev *pctldev, unsigned int function,
> -			 unsigned int group)
> +static void artpec6_pmx_disable(struct pinctrl_dev *pctldev,
> +				unsigned int function,
> +				unsigned int group)
>  {
>  	struct artpec6_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
>  
> -- 
> 2.7.0

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
