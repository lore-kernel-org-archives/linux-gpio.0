From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 16/21] regulator: wm8994: Pass descriptor instead of GPIO
 number
Date: Tue, 13 Feb 2018 11:52:59 +0000
Message-ID: <20180213115259.wxicurh4rvkp6lwe@localhost.localdomain>
References: <20180212131717.27193-1-linus.walleij@linaro.org>
 <20180212131717.27193-17-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:55888 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S934231AbeBMMA3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Feb 2018 07:00:29 -0500
Content-Disposition: inline
In-Reply-To: <20180212131717.27193-17-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, Lee Jones <lee.jones@linaro.org>

On Mon, Feb 12, 2018 at 02:17:12PM +0100, Linus Walleij wrote:
> Instead of passing a global GPIO number for the enable GPIO, pass
> a descriptor looked up from the device tree node or the board file
> decriptor table for the regulator.
> 
> There is a single board file passing the GPIOs for LDO1 and LDO2
> through platform data, so augment this to pass descriptors
> associated with the i2c device as well.
> 
> Cc: patches@opensource.cirrus.com
> Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> +	/* Look up LDO enable GPIO from the parent device node */
> +	gpiod = devm_gpiod_get_optional(pdev->dev.parent,
> +					id ? "wlf,ldo2ena" : "wlf,ldo1ena",
> +					GPIOD_OUT_LOW);
> +	if (IS_ERR(gpiod))
> +		return PTR_ERR(gpiod);
> +	config.ena_gpiod = gpiod;

Likewise here the DT bindings for these parts have no -gpio
suffix on them so this will break the DT case.

Thanks,
Charles
