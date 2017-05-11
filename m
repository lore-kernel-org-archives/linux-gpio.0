From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] pinctrl: when claiming hog, skip maps not served by same
 device
Date: Thu, 11 May 2017 14:44:45 -0700
Message-ID: <20170511214444.GB3489@atomide.com>
References: <20170511200211.20985-1-nikita.yoush@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:47290 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755594AbdEKVou (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 May 2017 17:44:50 -0400
Content-Disposition: inline
In-Reply-To: <20170511200211.20985-1-nikita.yoush@cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jon Hunter <jonathanh@nvidia.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Healy <Chris.Healy@zii.aero>, Jeff.White@zii.aero

* Nikita Yushchenko <nikita.yoush@cogentembedded.com> [170511 13:05]:
> When pinctrl device registers, it automatically claims hogs, that is,
> maps that pinctrl device serves for itself.
> 
> It is possible that in addition to SoC's pinctrl device, other pinctrl
> devices get registered. E.g. some gpio expander devies are registered
> as pinctrl devices. For such devices, pinctrl maps could be defined
> that set up SoC's pins (e.g. interrupt pin for gpio expander). Such
> a map will have target device set to gpio expander.
> 
> Here is device tree snippet that causes this scenario:
> 
> &i2c0 {
> 	sx1503@20 {
> 		compatible = "semtech,sx1503q";
> 		pinctrl-names = "default";
> 		pinctrl-0 = <&pinctrl_sx1503_20>;
> 		...
> 	};
> };
> ...
> &iomuxc {
> 	pinctrl_sx1503_20: pinctrl-sx1503-20 {
> 		fsl,pins = <
> 			VF610_PAD_PTB1__GPIO_23         0x219d
> 		>;
> 	};
> };
> 
> Such a map will have target device set to gpio expander. However is not
> a hog, it is a regular map that is claimed by core before gpio expander
> device is probed.
> 
> Thus when looking for hogs, it is not enough to check that map's target
> device is set to pinctrl device being registered. Need also check that
> map's control device is also set to the same.
> 
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
>  drivers/pinctrl/core.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 1653cbda6a82..682ebd360030 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -1038,6 +1038,16 @@ static struct pinctrl *create_pinctrl(struct device *dev,
>  		/* Map must be for this device */
>  		if (strcmp(map->dev_name, devname))
>  			continue;
> +		/*
> +		 * If pctldev is not null, we are claiming hog for it,
> +		 * that means, setting that is served by pctldev by itself.
> +		 *
> +		 * Thus we must skip map that is for this device but is served
> +		 * by other device.
> +		 */
> +		if (pctldev &&
> +		    strcmp(dev_name(pctldev->dev), map->ctrl_dev_name))
> +			continue;
>  
>  		ret = add_setting(p, pctldev, map);
>  		/*
> -- 

Maybe add a comment saying pctldev is NULL in the regular case
and only exists in the hog case?

Other than that:

Acked-by: Tony Lindgren <tony@atomide.com>
