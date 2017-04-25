From: Jesper Nilsson <jesper.nilsson@axis.com>
Subject: Re: [PATCH -next] pinctrl: artpec6: Fix return value check in
 artpec6_pmx_probe()
Date: Tue, 25 Apr 2017 10:31:20 +0200
Message-ID: <20170425083120.GI18509@axis.com>
References: <20170425032945.22157-1-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bes.se.axis.com ([195.60.68.10]:47903 "EHLO bes.se.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S980146AbdDYIbb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Apr 2017 04:31:31 -0400
Content-Disposition: inline
In-Reply-To: <20170425032945.22157-1-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Jesper Nilsson <jespern@axis.com>, Lars Persson <larper@axis.com>, Niklas Cassel <niklass@axis.com>, Linus Walleij <linus.walleij@linaro.org>, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@axis.com, linux-gpio@vger.kernel.org

On Tue, Apr 25, 2017 at 03:29:45AM +0000, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> In case of error, the function pinctrl_register() returns
> NULL not ERR_PTR(). The IS_ERR() test in the return value
> check should be replaced with NULL test.

Uh, the comment above reads as the exact opposite
of what the patch does. Your point is valid though,
but the comment needs rephrasing.

> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

/Jesper

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
