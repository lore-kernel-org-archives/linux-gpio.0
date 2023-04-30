Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 421EFC77B60
	for <linux-gpio@archiver.kernel.org>; Sun, 30 Apr 2023 09:43:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjD3Jnx (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 30 Apr 2023 05:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjD3Jnw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Apr 2023 05:43:52 -0400
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A01C199F
        for <linux-gpio@vger.kernel.org>; Sun, 30 Apr 2023 02:43:50 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id 80ddc11b-e73b-11ed-b3cf-005056bd6ce9;
        Sun, 30 Apr 2023 12:43:47 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Sun, 30 Apr 2023 12:43:46 +0300
To:     Lizhe <sensor1010@163.com>
Cc:     linus.walleij@linaro.org, orsonzhai@gmail.com,
        baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
        andriy.shevchenko@linux.intel.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl:sprd: Check if the pinctrl_dev still exists
Message-ID: <ZE44Uj0-UAvQkY6L@surfacebook>
References: <20230430042254.7543-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430042254.7543-1-sensor1010@163.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sun, Apr 30, 2023 at 12:22:54PM +0800, Lizhe kirjoitti:
> to check if the pinctrl_dev still exists before calling
> pinctrl_unregister().

Besides commit message has no explanation (and English grammar
incorrectness)...

...

> +++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
> @@ -1115,7 +1115,9 @@ int sprd_pinctrl_remove(struct platform_device *pdev)
>  {
>  	struct sprd_pinctrl *sprd_pctl = platform_get_drvdata(pdev);
>  
> -	pinctrl_unregister(sprd_pctl->pctl);

> +	if (sprd_pctl->dev)

...this code is not needed.

> +		pinctrl_unregister(sprd_pctl->pctl);
>  	return 0;
>  }

NAK.

-- 
With Best Regards,
Andy Shevchenko


