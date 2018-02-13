From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 05/21] regulator: arizona-ldo1: Look up a descriptor and
 pass to the core
Date: Tue, 13 Feb 2018 11:51:22 +0000
Message-ID: <20180213115122.vihjpyfzx3c52oqx@localhost.localdomain>
References: <20180212131717.27193-1-linus.walleij@linaro.org>
 <20180212131717.27193-6-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:37412 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S934336AbeBMLv1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Feb 2018 06:51:27 -0500
Content-Disposition: inline
In-Reply-To: <20180212131717.27193-6-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>

On Mon, Feb 12, 2018 at 02:17:01PM +0100, Linus Walleij wrote:
> Instead of passing a global GPIO number, pass a descriptor looked
> up with the standard devm_gpiod_get_optional() call.
> 
> We have augmented the GPIO core to look up the regulator special
> GPIO "wlf,ldoena" in a separate patch.
> 
> Cc: patches@opensource.cirrus.com
> Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> -	config.ena_gpio = pdata->ldoena;
> +	/* We assume that high output = regulator off */
> +	config.ena_gpiod = devm_gpiod_get_optional(&pdev->dev, "wlf,ldoena",
> +						   GPIOD_OUT_HIGH);
> +	if (IS_ERR(config.ena_gpiod))
> +		return PTR_ERR(config.ena_gpiod);

Also looking at this more you will need to you
devm_gpio_get_from_of_node here since the device tree binding is
for wlf,ldoena not wlf,ldoena-gpio. So this patch currently
breaks the binding.

Thanks,
Charles
