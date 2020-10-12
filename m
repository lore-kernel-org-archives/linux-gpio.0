Return-Path: <SRS0=RBsP=DT=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B7EC433DF
	for <linux-gpio@archiver.kernel.org>; Mon, 12 Oct 2020 11:55:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94F672145D
	for <linux-gpio@archiver.kernel.org>; Mon, 12 Oct 2020 11:55:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="IvjD+ZhE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388343AbgJLLzA (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 12 Oct 2020 07:55:00 -0400
Received: from first.geanix.com ([116.203.34.67]:46678 "EHLO first.geanix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388255AbgJLLzA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Oct 2020 07:55:00 -0400
Received: from [192.168.8.20] (unknown [85.184.138.169])
        by first.geanix.com (Postfix) with ESMTPSA id 0457DF411E4;
        Mon, 12 Oct 2020 11:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
        t=1602503698; bh=8KpZ/LqtudnWkL9wT0zNWYXQwli628YNhNK2pWomEPQ=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=IvjD+ZhEAOyEAGwZILlezGsQ4+vC/UdbyfKfUXqMovAzniJqQtmK1YdhhiEB4yNlG
         rLoXMhZtgWbaItkce3DtMJb8rdkE5VMXsBVx77pbFLVqEqcMUSGd9+jOJ5Do1djORU
         v9f4PHnU2VXjMN7CgeEtdsvILDUfNefa/GwWlM8zxrBvBeCTYl6ISl6jNhPWRkV6fw
         eWMig2K+BA4QHddp9RP0GXCHA3MHwIoz+LQjrYmccfH9Qhq0NNUV0AXZFy2fdavyQu
         EVa+t/xVO+pU6aLcswclIIinxOt96bOlJNRpnAVNHtilPsc5iy1W30vYKRbTce4ORQ
         hZuIYb69gVLMA==
Subject: Re: [PATCH v2 1/2] pinctrl: mcp23s08: Use full chunk of memory for
 regmap configuration
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
References: <20201009180856.4738-1-andriy.shevchenko@linux.intel.com>
From:   =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <dadaf399-03cc-1512-8208-76565ab257a7@geanix.com>
Date:   Mon, 12 Oct 2020 13:54:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201009180856.4738-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

You can add my
Tested-by: Martin Hundebøll <martin@geanix.com>

Thanks,
Martin

On 09/10/2020 20.08, Andy Shevchenko wrote:
> It appears that simplification of mcp23s08_spi_regmap_init() made
> a regression due to wrong size calculation for dev_kmemdup() call.
> It mises the fact that config variable is already a pointer, thus
> the sizeof() calculation is wrong and only 4 or 8 bytes were copied.
> 
> Fix the parameters to devm_kmemdup() to copy full chunk of memory.
> 
> Fixes: 0874758ecb2b ("pinctrl: mcp23s08: Refactor mcp23s08_spi_regmap_init()")
> Reported-by: Martin Hundebøll <martin@geanix.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: fixed few typos in the commit message
>   drivers/pinctrl/pinctrl-mcp23s08_spi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08_spi.c b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
> index 1f47a661b0a7..7c72cffe1412 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08_spi.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
> @@ -119,7 +119,7 @@ static int mcp23s08_spi_regmap_init(struct mcp23s08 *mcp, struct device *dev,
>   		return -EINVAL;
>   	}
>   
> -	copy = devm_kmemdup(dev, &config, sizeof(config), GFP_KERNEL);
> +	copy = devm_kmemdup(dev, config, sizeof(*config), GFP_KERNEL);
>   	if (!copy)
>   		return -ENOMEM;
>   
> 
