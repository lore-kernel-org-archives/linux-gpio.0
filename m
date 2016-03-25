From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 02/17] pinctrl: qcom: ipq4019: fix the function enum for
 gpio mode
Date: Fri, 25 Mar 2016 14:22:59 -0700
Message-ID: <20160325212259.GB8929@tuxbot>
References: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org>
 <1458770712-10880-3-git-send-email-mmcclint@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1458770712-10880-3-git-send-email-mmcclint@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Matthew McClintock <mmcclint@codeaurora.org>, linus.walleij@linaro.org
Cc: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org, qca-upstream.external@qca.qualcomm.com, Rob Herring <robh@kernel.org>, Varadarajan Narayanan <varada@codeaurora.org>, Mathieu Olivari <mathieu@codeaurora.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed 23 Mar 15:04 PDT 2016, Matthew McClintock wrote:

> Without this, we would fail to set the mode to gpio if trying to
> configure for that mode
> 
> CC: linus.walleij@linaro.org

Linus is the maintainer of the pinctrl subsystem, as such you should
have him as recipient of these patches - so that he doesn't miss them
while being only Cc.

Acked-by: bjorn.andersson@linaro.org

Regards,
Bjorn

> Signed-off-by: Matthew McClintock <mmcclint@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-ipq4019.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-ipq4019.c b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
> index cb5f0a8..cb9f16a 100644
> --- a/drivers/pinctrl/qcom/pinctrl-ipq4019.c
> +++ b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
> @@ -237,7 +237,7 @@ DECLARE_QCA_GPIO_PINS(99);
>  		.pins = gpio##id##_pins,		\
>  		.npins = (unsigned)ARRAY_SIZE(gpio##id##_pins),	\
>  		.funcs = (int[]){			\
> -			qca_mux_NA, /* gpio mode */	\
> +			qca_mux_gpio, /* gpio mode */	\
>  			qca_mux_##f1,			\
>  			qca_mux_##f2,			\
>  			qca_mux_##f3,			\
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
