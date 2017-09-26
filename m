From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 8/8] extcon: gpio: Always check state on resume
Date: Tue, 26 Sep 2017 11:25:44 +0900
Message-ID: <59C9BAA8.5040906@samsung.com>
References: <20170924145622.4031-1-linus.walleij@linaro.org>
        <CGME20170924150247epcas2p337f9a12744c23967dbdc0c79042553b5@epcas2p3.samsung.com>
        <20170924145622.4031-9-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:64684 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965067AbdIZCZq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Sep 2017 22:25:46 -0400
In-reply-to: <20170924145622.4031-9-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, John Stultz <john.stultz@linaro.org>, Guenter Roeck <linux@roeck-us.net>

Hi Linus,

On 2017년 09월 24일 23:56, Linus Walleij wrote:
> It makes most sense to always check the state of the GPIO external
> connector at system resume so just do this by default. Add a TODO
> if people turn out to desire to parameterize this.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/extcon/extcon-gpio.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Looks good to me.
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

> 
> diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
> index b7353f5018b5..4f0ad5ad2722 100644
> --- a/drivers/extcon/extcon-gpio.c
> +++ b/drivers/extcon/extcon-gpio.c
> @@ -83,6 +83,15 @@ static int gpio_extcon_probe(struct platform_device *pdev)
>  	if (!data)
>  		return -ENOMEM;
>  
> +	/*
> +	 * Always checking connector state on resume makes most sense so do this
> +	 * by default.
> +	 *
> +	 * TODO: if parameterization is needed, augment this to use proper device
> +	 * properties or set it up from PM core.
> +	 */
> +	data->check_on_resume = true;
> +
>  	data->gpiod = devm_gpiod_get(dev, "extcon", GPIOD_IN);
>  	if (IS_ERR(data->gpiod))
>  		return PTR_ERR(data->gpiod);
> 

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
