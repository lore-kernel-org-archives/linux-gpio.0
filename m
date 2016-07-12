From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH -next] pinctrl: ns2: remove redundant dev_err call in
 ns2_pinmux_probe()
Date: Tue, 12 Jul 2016 10:06:38 -0700
Message-ID: <21ef4829-b6b5-6b37-e3b2-ffabcfb0b91d@broadcom.com>
References: <1468333185-8047-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:33747 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754551AbcGLRGw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jul 2016 13:06:52 -0400
Received: by mail-pa0-f48.google.com with SMTP id ks6so8422104pab.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2016 10:06:51 -0700 (PDT)
In-Reply-To: <1468333185-8047-1-git-send-email-weiyj_lk@163.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: weiyj_lk@163.com, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Yongjun <yongjun_wei@trendmicro.com.cn>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org

Hi Wei,

On 7/12/2016 7:19 AM, weiyj_lk@163.com wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
> index 7e5f7b7..ca81789 100644
> --- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
> +++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
> @@ -1044,10 +1044,8 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
>
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	pinctrl->base0 = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(pinctrl->base0)) {
> -		dev_err(&pdev->dev, "unable to map I/O space\n");
> +	if (IS_ERR(pinctrl->base0))
>  		return PTR_ERR(pinctrl->base0);
> -	}
>
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>  	pinctrl->base1 = devm_ioremap_nocache(&pdev->dev, res->start,
> @@ -1059,10 +1057,8 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
>
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
>  	pinctrl->pinconf_base = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(pinctrl->pinconf_base)) {
> -		dev_err(&pdev->dev, "unable to map I/O space\n");
> +	if (IS_ERR(pinctrl->pinconf_base))
>  		return PTR_ERR(pinctrl->pinconf_base);
> -	}
>
>  	ret = ns2_mux_log_init(pinctrl);
>  	if (ret) {
>
>
>
>

Looks good to me! Thanks.

Acked-by: Ray Jui <ray.jui@broadcom.com>
