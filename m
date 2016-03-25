From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 01/17] pinctrl: qcom: ipq4019: set ngpios to correct value
Date: Fri, 25 Mar 2016 14:19:43 -0700
Message-ID: <20160325211943.GA8929@tuxbot>
References: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org>
 <1458770712-10880-2-git-send-email-mmcclint@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1458770712-10880-2-git-send-email-mmcclint@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Matthew McClintock <mmcclint@codeaurora.org>
Cc: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org, qca-upstream.external@qca.qualcomm.com, linus.walleij@linaro.org, Sricharan R <sricharan@codeaurora.org>, Mathieu Olivari <mathieu@codeaurora.org>, Varadarajan Narayanan <varada@codeaurora.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed 23 Mar 15:04 PDT 2016, Matthew McClintock wrote:

> This should have been bumped to 100 when the extra pins
> were added in the original pinctrl patch
> 
> CC: linus.walleij@linaro.org

Sorry for missing this in the initial review of this driver.

Acked-by: bjorn.andersson@linaro.org

Regards,
Bjorn

> Signed-off-by: Matthew McClintock <mmcclint@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-ipq4019.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-ipq4019.c b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
> index b5d81ce..cb5f0a8 100644
> --- a/drivers/pinctrl/qcom/pinctrl-ipq4019.c
> +++ b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
> @@ -414,7 +414,7 @@ static const struct msm_pinctrl_soc_data ipq4019_pinctrl = {
>  	.nfunctions = ARRAY_SIZE(ipq4019_functions),
>  	.groups = ipq4019_groups,
>  	.ngroups = ARRAY_SIZE(ipq4019_groups),
> -	.ngpios = 70,
> +	.ngpios = 100,
>  };
>  
>  static int ipq4019_pinctrl_probe(struct platform_device *pdev)
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
