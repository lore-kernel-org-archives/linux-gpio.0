From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: ssbi-gpio: fix gpio-hog related boot
 issues
Date: Sat, 10 Nov 2018 22:48:50 -0800
Message-ID: <20181111064850.GA10088@minitux>
References: <20181111013411.14153-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181111013411.14153-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: linus.walleij@linaro.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Sat 10 Nov 17:34 PST 2018, Brian Masney wrote:

> When attempting to setup up a gpio hog, device probing will repeatedly
> fail with -EPROBE_DEFERED errors. It is caused by a circular dependency
> between the gpio and pinctrl frameworks. If the gpio-ranges property is
> present in device tree, then the gpio framework will handle the gpio pin
> registration and eliminate the circular dependency.
> 
> See Christian Lamparter's commit a86caa9ba5d7 ("pinctrl: msm: fix
> gpio-hog related boot issues") for a detailed commit message that
> explains the issue in much more detail. The code comment in this commit
> came from Christian's commit.
> 
> I did not test this change against any hardware supported by this
> particular driver, however I was able to validate this same fix works
> for pinctrl-spmi-gpio.c using a LG Nexus 5 (hammerhead) phone.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> For the patch and discussion regarding pinctrl-spmi-gpio.c, see
> https://lore.kernel.org/lkml/20181101001149.13453-6-masneyb@onstation.org/
> 
>  drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
> index 6b30bef829ab..ded7d765af2e 100644
> --- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
> @@ -762,12 +762,23 @@ static int pm8xxx_gpio_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = gpiochip_add_pin_range(&pctrl->chip,
> -				     dev_name(pctrl->dev),
> -				     0, 0, pctrl->chip.ngpio);
> -	if (ret) {
> -		dev_err(pctrl->dev, "failed to add pin range\n");
> -		goto unregister_gpiochip;
> +	/*
> +	 * For DeviceTree-supported systems, the gpio core checks the
> +	 * pinctrl's device node for the "gpio-ranges" property.
> +	 * If it is present, it takes care of adding the pin ranges
> +	 * for the driver. In this case the driver can skip ahead.
> +	 *
> +	 * In order to remain compatible with older, existing DeviceTree
> +	 * files which don't set the "gpio-ranges" property or systems that
> +	 * utilize ACPI the driver has to call gpiochip_add_pin_range().
> +	 */
> +	if (!of_property_read_bool(pctrl->dev->of_node, "gpio-ranges")) {
> +		ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev),
> +					     0, 0, pctrl->chip.ngpio);
> +		if (ret) {
> +			dev_err(pctrl->dev, "failed to add pin range\n");
> +			goto unregister_gpiochip;
> +		}
>  	}
>  
>  	platform_set_drvdata(pdev, pctrl);
> -- 
> 2.17.2
> 
