From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] pinctrl: msm: fix gpio-hog related boot issues
Date: Mon, 2 Apr 2018 08:04:47 -0700
Message-ID: <20180402150447.GH510@tuxbook-pro>
References: <20180402121005.10080-1-chunkeey@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180402121005.10080-1-chunkeey@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christian Lamparter <chunkeey@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, David Brown <david.brown@linaro.org>, Sven Eckelmann <sven.eckelmann@openmesh.com>, Andy Gross <andy.gross@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

On Mon 02 Apr 05:10 PDT 2018, Christian Lamparter wrote:

[..]
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 0a6f7952bbb1..18511e782cbd 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -530,6 +530,7 @@
>  			reg = <0x01010000 0x300000>;
>  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>  			gpio-controller;
> +			gpio-ranges = <&msmgpio 0 0 150>;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 495432f3341b..258fa357d946 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -831,11 +831,22 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>  		return ret;
>  	}
>  
> -	ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev), 0, 0, chip->ngpio);
> -	if (ret) {
> -		dev_err(pctrl->dev, "Failed to add pin range\n");
> -		gpiochip_remove(&pctrl->chip);
> -		return ret;
> +	if (!is_of_node(pctrl->dev->fwnode)) {

Afaict this still means that if I boot this kernel with yesterday's dtb
(without gpio-ranges) I will not get any gpios. This isn't okay. 

@Linus, I count 24 callers of gpiochip_add_pin_range(). Is this
suggestion reasonable?

Can we make gpiochip_add_pin_range() check if there's already a
gpio-range and return ok in some way?

> +		/*
> +		 * gpiochip_add_pin_range() is meant for platforms that
> +		 * don't support DT. All DT platforms should just add
> +		 * the gpio-ranges property to the pinctrl device node.
> +		 *
> +		 * See Documentation/devicetree/bindings/gpio/gpio.txt .
> +		 */
> +		ret = gpiochip_add_pin_range(&pctrl->chip,
> +			dev_name(pctrl->dev), 0, 0, chip->ngpio);
> +
> +		if (ret) {
> +			dev_err(pctrl->dev, "Failed to add pin range\n");
> +			gpiochip_remove(&pctrl->chip);
> +			return ret;
> +		}

Regards,
Bjorn
