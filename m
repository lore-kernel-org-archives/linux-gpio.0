From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH][V2] pinctrl: actions: fix unsigned less than zero
 comparison
Date: Mon, 2 Jul 2018 18:32:16 +0530
Message-ID: <20180702130216.GA11085@mani>
References: <20180702124708.7295-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180702124708.7295-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Jul 02, 2018 at 01:47:08PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The check to see if platform_get_irq failed is performed on the
> unsigned value of pctrl->irq[i] and the check is never true because
> an unsigned cannot be less than zero.  Fix this by assinging the
> signed int ret to the return of platform_get_irq and checking ret
> instead.
> 
> Detected by CoverityScan, CID#1470247 ("Unsigned comparison against 0")
> 
> Fixes: 6c5d0736e9c0 ("pinctrl: actions: Add interrupt support for OWL S900 SoC")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks!

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> 

Regards,
Mani

> ---
> 
> V2: move pctrl->irq[i] = ret assignment below the check on ret, thanks
> to Manivannan Sadhasivam for suggesting this change.
> 
> ---
>  drivers/pinctrl/actions/pinctrl-owl.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
> index 4fa9cc377b3b..24dc57fcac51 100644
> --- a/drivers/pinctrl/actions/pinctrl-owl.c
> +++ b/drivers/pinctrl/actions/pinctrl-owl.c
> @@ -1026,11 +1026,10 @@ int owl_pinctrl_probe(struct platform_device *pdev,
>  	}
>  
>  	for (i = 0; i < pctrl->num_irq ; i++) {
> -		pctrl->irq[i] = platform_get_irq(pdev, i);
> -		if (pctrl->irq[i] < 0) {
> -			ret = pctrl->irq[i];
> +		ret = platform_get_irq(pdev, i);
> +		if (ret < 0)
>  			goto err_exit;
> -		}
> +		pctrl->irq[i] = ret;
>  	}
>  
>  	ret = owl_gpio_init(pctrl);
> -- 
> 2.17.1
> 
