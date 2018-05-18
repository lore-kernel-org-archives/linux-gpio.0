From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4] pinctrl: msm: fix gpio-hog related boot issues
Date: Thu, 17 May 2018 22:18:26 -0700
Message-ID: <20180518051826.GO14924@minitux>
References: <20180412190138.12372-1-chunkeey@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180412190138.12372-1-chunkeey@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christian Lamparter <chunkeey@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, David Brown <david.brown@linaro.org>, Sven Eckelmann <sven.eckelmann@openmesh.com>, Andy Gross <andy.gross@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

On Thu 12 Apr 12:01 PDT 2018, Christian Lamparter wrote:
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 0a6f7952bbb1..18511e782cbd 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -530,6 +530,7 @@
>  			reg = <0x01010000 0x300000>;
>  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>  			gpio-controller;
> +			gpio-ranges = <&msmgpio 0 0 150>;

I'm still confused to why this information is in DT at all, it feels
like an implementation detail, not a system configuration thing.

>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index e7abc8ba222b..ed889553f01c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -890,11 +890,24 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>  		return ret;
>  	}
>  
> -	ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev), 0, 0, chip->ngpio);
> -	if (ret) {
> -		dev_err(pctrl->dev, "Failed to add pin range\n");
> -		gpiochip_remove(&pctrl->chip);
> -		return ret;
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
> +		ret = gpiochip_add_pin_range(&pctrl->chip,
> +			dev_name(pctrl->dev), 0, 0, chip->ngpio);
> +		if (ret) {
> +			dev_err(pctrl->dev, "Failed to add pin range\n");
> +			gpiochip_remove(&pctrl->chip);
> +			return ret;
> +		}
>  	}

The patch looks good, but I would like you to split it in DT and pinctrl
parts, to make it less likely to collide and to allow Andy to inject the
missing change of sdm845.dtsi (which is now in linux-next) 


Please split it and add my

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

to both patches.

Regards,
Bjorn
