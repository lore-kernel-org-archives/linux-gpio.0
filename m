From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH -next] pinctrl: ti-iodelay: Fix return value check in
 ti_iodelay_probe()
Date: Tue, 17 Jan 2017 15:02:01 -0800
Message-ID: <20170117230201.GH7399@atomide.com>
References: <20170117144147.18540-1-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:58224 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751142AbdAQXCF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 17 Jan 2017 18:02:05 -0500
Content-Disposition: inline
In-Reply-To: <20170117144147.18540-1-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Nishanth Menon <nm@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>, Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org

* Wei Yongjun <weiyj.lk@gmail.com> [170117 06:42]:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> In case of error, the function pinctrl_register() returns
> NULL not ERR_PTR(). The IS_ERR() test in the return value
> check should be replaced with NULL test.
> 
> Fixes: 003910ebc83b ("pinctrl: Introduce TI IOdelay configuration driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Tony Lindgren <tony@atomide.com>

> ---
>  drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> index 3b86d3d..8899f5e 100644
> --- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> +++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> @@ -892,9 +892,9 @@ static int ti_iodelay_probe(struct platform_device *pdev)
>  	iod->desc.owner = THIS_MODULE;
>  
>  	iod->pctl = pinctrl_register(&iod->desc, dev, iod);
> -	if (!iod->pctl) {
> +	if (IS_ERR(iod->pctl)) {
>  		dev_err(dev, "Failed to register pinctrl\n");
> -		ret = -ENODEV;
> +		ret = PTR_ERR(iod->pctl);
>  		goto exit_out;
>  	}
> 
