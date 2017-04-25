From: Jesper Nilsson <jesper.nilsson@axis.com>
Subject: Re: [PATCH -next v2] pinctrl: artpec6: Fix return value check in
 artpec6_pmx_probe()
Date: Tue, 25 Apr 2017 15:40:00 +0200
Message-ID: <20170425134000.GN18509@axis.com>
References: <20170425032945.22157-1-weiyj.lk@gmail.com>
 <20170425112930.19555-1-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bes.se.axis.com ([195.60.68.10]:41529 "EHLO bes.se.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S946043AbdDYNkH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Apr 2017 09:40:07 -0400
Content-Disposition: inline
In-Reply-To: <20170425112930.19555-1-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Jesper Nilsson <jespern@axis.com>, Lars Persson <larper@axis.com>, Niklas Cassel <niklass@axis.com>, Linus Walleij <linus.walleij@linaro.org>, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@axis.com, linux-gpio@vger.kernel.org

On Tue, Apr 25, 2017 at 11:29:30AM +0000, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> In case of error, the function pinctrl_register() returns
> ERR_PTR() not NULL. The NULL test in the return value check
> should be replaced with IS_ERR().
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

Although I'm wondering if moving to pinctrl_register_and_init()
would sense here. Linus?

/Jesper

> ---
> v1 -> v2: fix comment
> ---
>  drivers/pinctrl/pinctrl-artpec6.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-artpec6.c b/drivers/pinctrl/pinctrl-artpec6.c
> index b5a2eff..6a16019 100644
> --- a/drivers/pinctrl/pinctrl-artpec6.c
> +++ b/drivers/pinctrl/pinctrl-artpec6.c
> @@ -938,9 +938,9 @@ static int artpec6_pmx_probe(struct platform_device *pdev)
>  	pmx->num_pin_groups = ARRAY_SIZE(artpec6_pin_groups);
>  	pmx->pctl	    = pinctrl_register(&artpec6_desc, &pdev->dev, pmx);
>  
> -	if (!pmx->pctl) {
> +	if (IS_ERR(pmx->pctl)) {
>  		dev_err(&pdev->dev, "could not register pinctrl driver\n");
> -		return -EINVAL;
> +		return PTR_ERR(pmx->pctl);
>  	}
>  
>  	platform_set_drvdata(pdev, pmx);

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
